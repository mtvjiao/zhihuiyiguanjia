<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-12-21
* 版    本：1.0.0
* 功能说明：个人中心控制器。
*
**/

namespace Appi\Controller;
use Appi\Controller\ComController;

class UserController extends ComController {

	public function profile(){

		$uid = $_GET['uid'];
		
		$member = M('member')->field('user,phone,sex,head,birthday,qq,email')->where('uid='.$uid)->find();

		$this -> json(269,'成功',$member);
		
	}
	
	public function update(){
		
		$uid = $_GET['uid'];
		$Model = M('member');
		$member = $Model ->field('password')->where('uid='.$uid)->find();


		$password = isset($_POST['password'])?trim($_POST['password']):false;
		$data['password'] = isset($_POST[
			'newpassword'])?trim($_POST['newpassword']):false;
		if ($password == false) {
			$this -> json(414,'密码不能为空');
			exit();
		}
		if($password != $member['password']) {
			$this -> json(415,'原密码不正确');
			exit();
		}

		
		$Model->data($data)->where("uid=$uid")->save();
			$this -> json(226,'密码修改成功');

		
	}

	public function head(){
		
		$uid = $_GET['uid'];
		$path = 'head/';


		if (isset ( $_FILES ['headfile'] )) {
		    $upfile = $path . $_FILES ['headfile'] ['name'];
		    if (! @file_exists ( $path )) {
		        @mkdir ( $path );
		    }
		    $result = @move_uploaded_file ( $_FILES ['headfile'] ['tmp_name'], $upfile );
		    if (!$result) {

				$this -> json(408,'上传失败');
				exit();
		    }
			$Model = M('member');
			//$file_name = $upfile.$_FILES ['headfile'] ['name'];
			$data['head'] = $upfile;
			$Model->data($data)->where("uid=$uid")->save();
			$this -> json(200,'头像修改成功');
		}else{
			$this -> json(409,'无新头像');
		}




	}


}