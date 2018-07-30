<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
class LogoutController extends ComController {
    public function index(){
		cookie('auth',null);
		$url = U("login/index");
		header("Location: {$url}");
		exit(0);
    }
}