<?php
    /**
     * ipn
     *
     * @package Wojo Framework
     * @author wojoscripts.com
     * @copyright 2023
     * @version 5.00: ipn.php, v1.00 7/18/2023 6:36 PM Gewa Exp $
     *
     */
    const _WOJO = true;
    
    ini_set('log_errors', true);
    ini_set('error_log', dirname(__file__) . '/ipn_errors.log');
    
    require_once 'initialize.php';
    
    if (isset($_POST['payment_status'])) {
        require_once '../../init.php';
        
        $pf = Database::Go()->select(Core::gTable, array('live', 'extra3'))->where('name', 'payfast', '=')->first()->run();
        $pfHost = ($pf->live) ? 'https://www.payfast.co.za' : 'https://sandbox.payfast.co.za';
        $error = false;
        
        pflog('ITN received from payfast.co.za');
        if (!pfValidIP($_SERVER['REMOTE_ADDR'])) {
            pflog('REMOTE_IP mismatch: ');
            $error = true;
            return false;
        }
        $data = pfGetData();
        
        pflog('POST received from payfast.co.za: ' . print_r($data, true));
        
        if ($data === false) {
            pflog('POST is empty');
            $error = true;
            return false;
        }
        
        if (!pfValidSignature($data, $pf->extra3)) {
            pflog('Signature mismatch on POST');
            $error = true;
            return false;
        }
        
        pflog('Signature OK');
        
        $itnPostData = array();
        $itnPostDataValuePairs = array();
        
        foreach ($_POST as $key => $value) {
            if ($key == 'signature') {
                continue;
            }
            
            $value = urlencode(stripslashes($value));
            $value = preg_replace('/(.*[^%^0^D])(%0A)(.*)/i', '${1}%0D%0A${3}', $value);
            $itnPostDataValuePairs[] = "$key=$value";
        }
        
        $itnVerifyRequest = implode('&', $itnPostDataValuePairs);
        if (!pfValidData($pfHost, $itnVerifyRequest, "$pfHost/eng/query/validate")) {
            pflog("ITN mismatch for $itnVerifyRequest\n");
            pflog('ITN not OK');
            $error = true;
            return false;
        }
        
        pflog('ITN OK');
        pflog("ITN verified for $itnVerifyRequest\n");
        
        if (!$error and $_POST['payment_status'] == 'COMPLETE') {
            $user_id = intval($_POST['custom_int1']);
            $mc_gross = $_POST['amount_gross'];
            $membership_id = $_POST['m_payment_id'];
            $txn_id = Validator::sanitize($_POST['pf_payment_id']);
            
            $row = Database::Go()->select(Membership::mTable)->where('id', intval($membership_id), '=')->first()->run();
            $usr = Database::Go()->select(User::mTable)->where('id', $user_id, '=')->first()->run();
            $cart = Membership::getCart($usr->id);
            
            if ($cart) {
                $v1 = Validator::compareNumbers($mc_gross, $cart->totalprice);
            } else {
                $cart = new stdClass;
                $tax = Membership::calculateTax();
                $v1 = Validator::compareNumbers($mc_gross, $row->price, 'gte');
                
                $cart->originalprice = $row->price;
                $cart->total = $row->price;
                $cart->totaltax = Validator::sanitize($row->price * $tax, 'float');
                $cart->totalprice = Validator::sanitize($tax * $row->price + $row->price, 'float');
            }
            
            if ($v1) {
                $data = array(
                    'txn_id' => $txn_id,
                    'membership_id' => $row->id,
                    'user_id' => $usr->id,
                    'rate_amount' => $cart->total,
                    'coupon' => $cart->coupon,
                    'total' => $cart->totalprice,
                    'tax' => $cart->totaltax,
                    'currency' => 'ZAR',
                    'ip' => Url::getIP(),
                    'pp' => 'PayFast',
                    'status' => 1,
                );
                
                $last_id = Database::Go()->insert(Membership::pTable, $data)->run();
                
                //insert user membership
                $u_data = array(
                    'transaction_id' => $last_id,
                    'user_id' => $usr->id,
                    'membership_id' => $row->id,
                    'expire' => Membership::calculateDays($row->id),
                    'recurring' => $row->recurring,
                    'active' => 1,
                );
                
                //update user record
                $x_data = array(
                    'membership_id' => $row->id,
                    'mem_expire' => $u_data['expire'],
                );
                
                Database::Go()->insert(Membership::umTable, $u_data)->run();
                Database::Go()->update(User::mTable, $x_data)->where('id', $usr->id, '=')->run();
                Database::Go()->delete(Membership::cTable)->where('user_id', $usr->id, '=')->run();
                
                /* == Notify Administrator == */
                $mailer = Mailer::sendMail();
                $tpl = Database::Go()->select(Content::eTable, array('body', 'subject'))->where('typeid', 'payComplete', '=')->first()->run();
                $core = App::Core();
                
                $body = str_replace(array(
                    '[LOGO]',
                    '[COMPANY]',
                    '[SITE_NAME]',
                    '[DATE]',
                    '[SITEURL]',
                    '[NAME]',
                    '[ITEMNAME]',
                    '[PRICE]',
                    '[STATUS]',
                    '[PP]',
                    '[IP]',
                    '[CEMAIL]',
                    '[FB]',
                    '[TW]'
                ), array(
                    $core->plogo,
                    $core->company,
                    $core->site_name,
                    date('Y'),
                    SITEURL,
                    $usr->fname . ' ' . $usr->lname,
                    $row->{'title' . Language::$lang},
                    $data['total'],
                    'Completed',
                    'PayFast',
                    Url::getIP(),
                    $core->site_email,
                    $core->social->facebook,
                    $core->social->twitter
                ), $tpl->body);
                
                $mailer->Subject = $tpl->subject;
                $mailer->Body = $body;
                try {
                    $mailer->setFrom($core->site_email, $core->company);
                    $mailer->addAddress($core->site_email, $core->company);
                    $mailer->isHTML();
                    $mailer->send();
                } catch (\PHPMailer\PHPMailer\Exception) {
                }
                
                /* == Notify User == */
                $tpl2 = Database::Go()->select(Content::eTable, array('body', 'subject'))->where('typeid', 'payCompleteUser', '=')->first()->run();
                
                $body = str_replace(array(
                    '[LOGO]',
                    '[COMPANY]',
                    '[SITE_NAME]',
                    '[DATE]',
                    '[SITEURL]',
                    '[NAME]',
                    '[ITEMNAME]',
                    '[PRICE]',
                    '[COUPON]',
                    '[TAX]',
                    '[TYPE]',
                    '[PP]',
                    '[CEMAIL]',
                    '[FB]',
                    '[TW]'
                ), array(
                    $core->plogo,
                    $core->company,
                    $core->site_name,
                    date('Y'),
                    SITEURL,
                    $usr->fname . ' ' . $usr->lname,
                    $row->{'title' . Language::$lang},
                    $data['total'],
                    $data['coupon'],
                    $data['tax'],
                    Language::$word->MEMBERSHIP,
                    'PayFast',
                    Url::getIP(),
                    $core->site_email,
                    $core->social->facebook,
                    $core->social->twitter
                ), $tpl->body);
                
				$umailer = Mailer::sendMail();
				
                $umailer->Subject = $tpl->subject;
                $umailer->Body = $body;
                try {
                    $umailer->setFrom($core->site_email, $core->company);
                    $umailer->addAddress($usr->email, $usr->fname . ' ' . $usr->lname);
                    $umailer->isHTML();
                    $umailer->send();
                } catch (\PHPMailer\PHPMailer\Exception) {
                }
            }
        }
    }