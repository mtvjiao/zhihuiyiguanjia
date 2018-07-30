<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-01-20
* 版    本：1.0.0
* 功能说明：网站设置控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;

class ContectController extends ComController {
    public function index(){		
		$vars = M('connect')->order('o ASC')->select();
		$this->assign('list',$vars);	
		$this -> display();
    }

    public function update(){
    	$id = $_POST['id'];
		$data['o'] = isset($_POST['o'])?$_POST['o']:'0';
		$data['name'] = isset($_POST['name'])?$_POST['name']:'';
		$data['value'] = $_POST['value'];


		if($id){
			M('connect')->data($data)->where('id='.$id)->save();
			addlog('编辑联系方式，ID：'.$id);
			$this->success('恭喜！联系方式编辑成功！');
		}else{
			$id = M('connect')->data($data)->add();
			if($id){
				addlog('新增联系方式，AID：'.$id);
				$this->success('恭喜！联系方式新增成功！');
			}else{
				$this->error('抱歉，未知错误！');
			}
			
		}
    }

	public function add(){
		
		$this -> display();
	}
	public function edit(){
		$id = $_GET['id'];
		$vars = M('connect')->where('id='.$id)->find();
		$this->assign('list',$vars);
		$this -> display();
	}
	public function del(){
		
		$id = isset($_REQUEST['id'])?$_REQUEST['id']:false;
		if($id){

				$map = 'id='.$id;

			if(M('connect')->where($map)->delete()){
				addlog('删除联系方式，ID：'.$id);
				$this->success('恭喜，联系方式删除成功！');
			}else{
				$this->error('参数错误！');
			}
		}else{
			$this->error('参数错误！');
		}

	}

}