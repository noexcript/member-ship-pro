<?php
   /**
    * form
    *
    * @package Wojo Framework
    * @author wojoscripts.com
    * @copyright 2023
    * @version 5.00: form.tpl.php, v1.00 7/18/2023 8:21 AM Gewa Exp $
    *
    */
   
   use Mollie\Api\Exceptions\ApiException;
   use Mollie\Api\MollieApiClient;
   use Mollie\Api\Types\PaymentMethod;
   
   if (!defined('_WOJO')) {
      die('Direct access to this location is not allowed.');
   }
   
   require 'vendor/autoload.php';
   
   $mollie = new MollieApiClient();
   try {
      $mollie->setApiKey($this->gateway->extra);
      $order_id = 'MEMB_' . md5(time());
      $payment = $mollie->payments->create(array(
        'amount' => array(
          'currency' => $this->gateway->extra2,
          'value' => $this->cart->totalprice, // You must send the correct number of decimals, thus we enforce the use of strings
        ),
        'method' => PaymentMethod::IDEAL,
        'description' => $this->row->title,
        'redirectUrl' => Url::url('/validate', '?ideal=1&order_id=' . $order_id),
        'metadata' => array('order_id' => $order_id, 'user_id' => App::Auth()->uid),
      ));
      Database::Go()->update(Membership::cTable, array('cart_id' => $payment->id, 'order_id' => $order_id))->where('user_id', App::Auth()->uid, '=')->run();
      
      echo '
         <a href="' . $payment->getPaymentUrl() . '" class="wojo white shadow icon button">
            <img class="wojo medium image" src="' . SITEURL . '/gateways/ideal/ideal_logo.svg" alt="' . $this->gateway->displayname . '">
         </a>
      ';
   } catch (ApiException $e) {
      Debug::addMessage('errors', 'API call failed:', $e->getMessage(), 'session');
   }