<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-12-21
* 版    本：1.0.0
* 功能说明：安卓自动更新控制器。
*
**/

namespace Appi\Controller;
use Appi\Controller\ComController;

class UpdateController extends ComController {

	public function index(){
		//index方法通过判断当前版本号与系统录入的最新版本号的对比来判断是否推送更新URL，完成更新
		//$appid = $_GET['appid'];
		$data['version'] = $version = $_GET['version'];
		$uid = $_GET['uid'];
		if (isset($version)) {
		        $content = file_get_contents('update.json');
		        $info = json_decode($content);
		        if($version !== $info->{'version'}){
		        	M('member')->data($data)->where('uid='.$uid)->save();
					$this -> json(299,'需要更新',$info);
		        }else{
					$this -> json(300,'已是最新版本');
		        }

		}else{
					$this -> json(499,'请求错误');
		}	
		
	}

	public function finish(){

		$data['version'] =  $_GET['version'];
		$uid = $_GET['uid'];
		if (isset($_GET['version']) && isset($uid)) {		        
		   M('member')->data($data)->where('uid='.$uid)->save();
		}else{
		   $this -> json(499,'请求错误');
		}	
		
	}


}