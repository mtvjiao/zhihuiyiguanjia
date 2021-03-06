<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-09-20
* 版    本：1.0.0
* 功能说明：文章控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class XunjianzhouqiController extends ComController {

	public function index(){
	
		
		$category = M('xunjianzhouqi')->field('id,o,name')->order('o asc')->select();
		$category = $this->getMenu($category);
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('xunjianzhouqi');
			if($category->where('pid='.$id)->count()){
				die('2');//存在子类，严禁删除。
			}else{
				$category->where('id='.$id)->delete();
				addlog('删除分类，ID：'.$id);
			}
			die('1');
		}else{
			die('0');
		}

	}
	
	public function edit(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$currentcategory = M('xunjianzhouqi')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);

		$category = M('category')->field('id,o,name')->order('id asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		$category = M('xunjianzhouqi')->field('id,pid,name')->order('id asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function update($act=null){

		
		$id = I('post.id',false,'intval');
		$data['o'] = I('post.o',0,'intval');
		$data['name'] = I('post.name');

		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('xunjianzhouqi')->data($data)->where('id='.$id)->save()){
				addlog('文章分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，分类修改成功！');
				die(0);
			}
		}else{
			$id = M('xunjianzhouqi')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增分类成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
