<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-01-20
* 版    本：1.0.0
* 功能说明：网站主题色设置控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;

class ColorController extends ComController {
    public function index(){		
		$vars = M('setting')->field('v')->where("k='color'")->find();
		//var_dump($vars['v']);
		$this->assign('list',$vars['v']);	
		$this -> display();
    }

    public function update(){

		$data['color'] = $_POST['color'];

		//var_dump($data['indeximg']);
		$Model = M('setting');
		foreach($data as $k=>$v){
			$Model->data(array('v'=>$v))->where("k='{$k}'")->save();
		}
						
		addlog('修改软件主题色配置。');
		$this->success('恭喜，软件主题色配置成功！');
    }


}