<?php


namespace Home\Controller;
use Think\Controller;
class ComController extends Controller {

	public function _initialize(){

    }
	
		public function json($code, $message = '', $data = array()) {
		
			if(!is_numeric($code)) {
				return '';
			}
			//$message = iconv("GB2312","UTF-8",$message) ;
			$result = array(
				'code' => $code,
				'message' => $message,
				'data' => $data
			);

			echo json_encode($result);
			exit;
		}
	

}