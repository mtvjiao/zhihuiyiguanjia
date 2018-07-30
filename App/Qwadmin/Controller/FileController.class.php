<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2017-04-12
* 版    本：1.0.0
* 功能说明：文件上传控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;
use Think\Upload;

class FileController extends ComController {

	public function index(){

		$this -> display();
	}
    Public function upload(){
	   
	    $upload = new Upload();// 实例化上传类
	    $upload->maxSize  = 3145728 ;// 设置附件上传大小
	    $upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg' ,'txt','doc' ,'pdf'.'docx');// 设置附件上传类型
	    $upload->savePath =  './Public/Uploads/';// 设置附件上传目录
	    $upload->saveName =  '';// 设置附件上传目录
	    if(!$upload->upload()) {// 上传错误提示错误信息
	   		$this->error($upload->getError());
	    }else{// 上传成功 获取上传文件信息
	    	//$info =  $upload->getUploadFileInfo();
	    }
	    // 保存表单数据 包括附件数据
/*	    $User = M("User"); // 实例化User对象
	    $User->create(); // 创建数据对象
	    $User->photo = $info[0]['savename']; // 保存上传的照片根据需要自行组装
	    $User->add(); // 写入用户数据到数据库*/
	    $this->success('数据保存成功！');
    }		

}