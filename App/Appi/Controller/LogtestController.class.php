<?php


namespace Appi\Controller;
use Appi\Controller\ComController;
use Vendor\Tree;

class LogtestController extends ComController {
 
    public function index(){
		
				\Think\Log::write('������־��Ϣ�����Ǿ��漶�𣬲���ʵʱд��','WARN');

	}
	
}