<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-11-7
* 版    本：1.0.0
* 功能说明：文章控制器。
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class XgprojectController extends ComController {

	public function index(){
	
		
		

		$category = M('xgproject')->field('id,pid,name,orderid')->where('pid = 0')->order('orderid asc')->select();

		//var_dump($category);
		$category = $this->getMenu($category);
		$this->assign('category',$category);
		$this -> display();
	}
	public function didian(){
	
		$id = $_GET['pid'];
	
		

		$category = M('xgshebei')->field('id,projectid,name,orderid,jingdu,weidu')->where("projectid = $id")->order('orderid asc')->select();

		//var_dump($category);
		$category = $this->getMenu($category);
		$this->assign('category',$category);
		$this -> display();
	}

	public function view(){


		$id = $_GET['id'];
		$me = M('patrol')->where("id= $id")->find();
		$funame = $me['name'];
		
		$categorys = M('project')->field('id,pid,name,zhouqi,orderid')->where("pid = $id")->order('pid asc')->select();

       

		$this->assign('funame',$funame);
		$this->assign('categorys',$categorys);
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
		$currentcategory = M('xgproject')->where('id='.$id)->find();
		$currentcategory['zhouqis'] = $currentcategory['zhouqi']/60/60/24;
		$this->assign('currentcategory',$currentcategory);

		$category = M('xgproject')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}

	public function editdidian(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$currentcategory = M('xgshebei')->where('id='.$id)->find();
		$currentcategory['zhouqis'] = $currentcategory['zhouqi']/60/60/24;
		$this->assign('currentcategory',$currentcategory);

		$category = M('xgproject')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['projectid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('xgproject')->field('id,name')->order('orderid asc')->select();
		
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}
	public function adddidian(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('xgproject')->field('id,name')->order('orderid asc')->select();
		
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function update($act=null){
		if($act=='order'){
			$id = I('post.id',0,'intval');
			if(!$id){
				die('0');
			}
			$o = I('post.o',0,'intval');
			M('project')->data(array('orderid'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}
		
		$id = I('post.id',false,'intval');


		$data['name'] = I('post.name');
		//$data['pid'] = I('post.pid');
		/*$data['erweima'] = I('post.erweima');
		$data['tiaoma'] = I('post.tiaoma');
		$data['bz'] = I('post.bz');
		$data['zhouqi'] = I('post.zhouqi')*60*60*24;*/

		$data['orderid'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('xgproject')->data($data)->where('id='.$id)->save()){
				addlog('巡检分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，修改成功！');
				die(0);
			}
		}else{
			$id = M('xgproject')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}

public function updatedidian($act=null){

		
		$id = I('post.id',false,'intval');


		$data['name'] = I('post.name');
		$data['projectid'] = I('post.pid');
		$data['jingdu'] = I('post.jingdu');
		$data['weidu'] = I('post.weidu');
		

		$data['orderid'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('xgshebei')->data($data)->where('id='.$id)->save()){
			//	addlog('巡检分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，修改成功！');
				die(0);
			}
		}else{
			$id = M('xgshebei')->data($data)->add();
			if($id){
			//	addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
