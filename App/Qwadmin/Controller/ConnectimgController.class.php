<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-03-30
* 版    本：1.0.0
* 功能说明：软件联系方式页面顶图控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;

class ConnectimgController extends ComController {
    public function setting(){
		
		$vars = M('setting')->where("k='connectimg'")->find();
		//var_dump($vars['v']);
		$this->assign('vars',$vars);
		
		$this -> display();
    }

    public function update(){

		$data = $_POST;
		$data['connectimg'] = I('post.thumbnail','','strip_tags');
		//var_dump($data['indeximg']);
		$Model = M('setting');
		foreach($data as $k=>$v){
			$Model->data(array('v'=>$v))->where("k='{$k}'")->save();
		}
						
		addlog('修改联系方式顶图设置。');
		$this->success('恭喜，联系方式顶图设置成功！');
    }


}