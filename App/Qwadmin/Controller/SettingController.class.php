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

class SettingController extends ComController {
    public function setting(){
		
		$vars = M('setting')->where("k='indeximg'")->find();
		$this->assign('vars',$vars);
		
		$this -> display();


    }
    
	public function updates(){
		$uploaddir = 'banner/';

		$time = time();
		$fileParts = pathinfo($_FILES['file']['name']);
		$data['imgurl'] = $name = $uploaddir . $time . rand(1000,10000). '.' . $fileParts['extension'] ;

		move_uploaded_file($_FILES['file']['tmp_name'],  $name);

		$aid = M('banner')->data($data)->add();

	}
    public function update(){

		$data = $_POST;
		$data['indeximg'] = I('post.thumbnail','','strip_tags');
		//var_dump($data['indeximg']);
		$Model = M('setting');
		foreach($data as $k=>$v){
			$Model->data(array('v'=>$v))->where("k='{$k}'")->save();
		}
						
		addlog('修改软件配置。');
		$this->success('恭喜，软件配置成功！');
    }
    public function banner(){

		$vars = M('banner')->order('o ASC')->select();
		$this->assign('list',$vars);
		
		$this -> display();

    }
	public function add(){
		
		$this -> display();
	}
	public function edit(){
		$id = $_GET['id'];
		$vars = M('banner')->where('id='.$id)->find();
		$this->assign('list',$vars);
		$this -> display();
	}
	public function del(){
		
		$id = isset($_REQUEST['id'])?$_REQUEST['id']:false;
		if($id){

				$map = 'id='.$id;

			if(M('banner')->where($map)->delete()){
				addlog('删除banner，ID：'.$id);
				$this->success('恭喜，banner删除成功！');
			}else{
				$this->error('参数错误！');
			}
		}else{
			$this->error('参数错误！');
		}

	}
    public function updatebanner(){
		$id = $_POST['id'];
		
		$data['imgurl'] = I('post.thumbnail','','strip_tags');
		$data['o'] = $_POST['o'];
		//var_dump($data['indeximg']);

						
		if($id){
			M('banner')->data($data)->where('id='.$id)->save();
			addlog('编辑banner，ID：'.$id);
			$this->success('恭喜！banner编辑成功！');
		}else{
			$aid = M('banner')->data($data)->add();
			if($aid){
				addlog('新增banner，ID：'.$id);
				$this->success('恭喜！banner新增成功！');
			}else{
				$this->error('抱歉，未知错误！');
			}
			
		}
    }




    public function pcimg(){
		
		$vars = M('setting')->where("k='pcimg'")->find();
		$this->assign('vars',$vars);
		
		$this -> display();
    }


    public function uppcimg(){

		$data = $_POST;
		$data['pcimg'] = I('post.thumbnail','','strip_tags');
		//var_dump($data['indeximg']);
		$Model = M('setting');
		foreach($data as $k=>$v){
			$Model->data(array('v'=>$v))->where("k='{$k}'")->save();
		}
						
		addlog('修改软件配置。');
		$this->success('恭喜，软件配置成功！');
    }

    public function pclogo(){
		
		$vars = M('setting')->where("k='pclogo'")->find();
		$this->assign('vars',$vars);
		
		$this -> display();
    }


    public function uppclogo(){

		$data = $_POST;
		$data['pclogo'] = I('post.thumbnail','','strip_tags');
		//var_dump($data['indeximg']);
		$Model = M('setting');
		foreach($data as $k=>$v){
			$Model->data(array('v'=>$v))->where("k='{$k}'")->save();
		}
						
		addlog('修改软件配置。');
		$this->success('恭喜，软件配置成功！');
    }




}