<?php


namespace Appi\Controller;
use Appi\Controller\ComController;
use Vendor\Tree;

class LogtestController extends ComController {
 
    public function index(){
		
				\Think\Log::write('测试日志信息，这是警告级别，并且实时写入','WARN');

	}
	
}