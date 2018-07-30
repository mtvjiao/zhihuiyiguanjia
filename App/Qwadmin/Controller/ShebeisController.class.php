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

class ShebeisController extends ComController {

	public function index(){
	
		
		$category = M('project')->field('id,parentid,name,orderid')->order('orderid asc')->select();
		$category = $this->getMenus($category);
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('project');
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
		$currentcategory = M('project')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);

		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	
	public function select(){
		
		$pid = $_GET['pid'];
		//var_dump($pid);
		if(isset($pid)){
		
		$q = M('project')->where("pid='{$pid}'")->select();
		//$q=mysql_query("select * from qw_project where pid = $pid");
		//var_dump($q);
		
		
		echo urldecode(json_encode($q));
		} 

	}
	
	public function update($act=null){
		if($act=='order'){
			$id = I('post.id',0,'intval');
			if(!$id){
				die('0');
			}
			$o = I('post.o',0,'intval');
			M('project')->data(array('o'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}
		
		$id = I('post.id',false,'intval');

		$data['pid'] = 0;
		$data['name'] = I('post.name');
		$data['parentid'] = I('post.prid');

		$data['bianhao'] = I('post.bianhao');
		$data['bz'] = I('post.bz');
		$data['orderid'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('project')->data($data)->where('id='.$id)->save()){
				addlog('文章分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，设备修改成功！');
				die(0);
			}
		}else{
			$id = M('project')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增设备成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
