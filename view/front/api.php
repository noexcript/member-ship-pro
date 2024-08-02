<?php


use Mpdf\Mpdf;
use Mpdf\MpdfException;

const _Devxjs = true;
require_once('../../init.php');



function sendJson($data = null, $message = null, $httpCode = 200)
{
    header('Content-Type: application/json');
    http_response_code($httpCode);
    $response = [
        'object' => $data,
        'message' => $message
    ];
    echo json_encode($response);
    exit;
}

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Responder às requisições OPTIONS antes de prosseguir
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header('HTTP/1.1 200 OK');
    exit;
}
header('Content-Type: application/json');

if ($_POST && $_FILES) :
    $data = $_POST;
else :
    $data = json_decode(file_get_contents("php://input"), true);
endif;

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $pAction = $data['action'];
} else if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $gAction = $data['action'];
}

$title = Validator::post('title') ? Validator::sanitize($_POST['title']) : null;

/* == Post Actions == */
switch ($pAction):
        //Login
    case 'userLogin':
    case 'adminLogin':
        App::Auth()->login($data['username'], $data['password']);
        break;

        //Password Reset
    case 'uResetPass':
    case 'aResetPass':
        App::Front()->passReset();
        break;

        //Register
    case 'register':
        App::Front()->Registration($data);
        break;
        //Pass Change
    case 'password':
        App::Front()->passwordChange();
        break;

        //Update Profile
    case 'profile':
        App::Front()->updateProfile($data);
        break;

    case 'member':
        App::Front()->createMember($data);
        break;

        //Select Membership
    case 'buy':
        if (!App::Auth()->is_User()) {
            exit;
        }
        App::Front()->buyMembership();
        break;

        //Select Gateway
    case 'gateway':
        if (!App::Auth()->is_User()) {
            exit;
        }
        App::Front()->selectGateway();
        break;

        //Apply Coupon
    case 'coupon':
        if (!App::Auth()->is_User()) {
            exit;
        }
        App::Front()->getCoupon();
        break;

    case 'activateCoupon':
        if (!App::Auth()->is_User()) {
            exit;
        }
        App::Front()->activateCoupon();
        break;

        //Contact
    case 'contact':
        App::Front()->processContact();
        break;

        //Login Check
    case 'checkLogin':
        if (!App::Auth()->is_User()) {
            exit;
        }
        $json['type'] = (Database::Go()->select(User::mTable, array('id'))->where('sesid', App::Auth()->sesid, '=')->first()->run()) ? 'success' : 'error';
        print json_encode($json);
        break;

        //Clear Session Temp Queries
    case 'session':
        Session::remove('debug-queries');
        Session::remove('debug-warnings');
        Session::remove('debug-errors');
        print 'ok';
        break;
endswitch;

/* == Get Actions == */
switch ($gAction):
    case '/':
        sendJson(null, 'Hello World');
        break;
        //Invoice
    case 'members':
        $row = Database::Go()->select(Membership::mTable, array('id', 'title', 'price', 'days', 'period', 'thumb', 'description', 'private', 'active', 'body'))->where('active', true, '=')->orderBy('title', 'ASC')->run();
        if ($row) :
            sendJson($row);
        else :
            sendJson(null, 'Sem tipo de membro encontrado', 400);
        endif;
        break;
    case 'profile':
        App::Auth()->profile($data);
        break;
    case 'invoice':
        if (!App::Auth()->is_User()) {
            exit;
        }
        if ($row = User::getInvoice(Filter::$id)) {
            $tpl = App::View(BASEPATH . 'view/front/snippets/');
            $tpl->row = $row;
            $tpl->user = Auth::$userdata;
            $tpl->core = App::Core();
            $tpl->template = 'invoice';

            $title = Validator::sanitize($row->title, 'alpha');

            require_once(BASEPATH . 'lib/mPdf/vendor/autoload.php');
            try {
                $mpdf = new Mpdf(['mode' => 'utf-8']);
                $mpdf->SetTitle($title);
                $mpdf->WriteHTML($tpl->render());
                $mpdf->Output($title . '.pdf', 'D');
            } catch (MpdfException $e) {
            }
        }
        exit;
        break;

        //Download
    case 'download':
        if (!App::Auth()->is_User()) {
            exit;
        }
        $token = 0;
        if (Validator::get('token')) {
            $token = Validator::sanitize($_GET['token'], 'alphanumeric', 16);
        }

        if ($row = Database::Go()->select(Content::fTable)->where('token', $token, '=')->first()->run()) {
            if (!file_exists(App::Core()->file_dir . $row->name) || !is_file(App::Core()->file_dir . $row->name)) {
                Debug::addMessage('errors', 'file error', 'File does not exist. Make sure you specified correct file name.', 'session');
                Url::redirect(Url::url('/dashboard/downloads', '?msg=' . urlencode(Language::$word->FU_ERROR5)));
                exit;
            } else {
                File::download(App::Core()->file_dir . $row->name, $row->name);
            }
        } else {
            Url::redirect(Url::url('/dashboard/downloads', '?msg=' . urlencode(Language::$word->FU_ERROR6)));
        }
        break;
endswitch;
