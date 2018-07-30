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

class ProjectController extends ComController {

	public function index(){
	
		
		//$category = M('project')->field('id,name,orderid')->order('orderid asc')->select();
		//	$category = $this->getMenu($category);
		//$funame = M('patrol')->where("id='{$categorys[pid]}'")->select();
		$categorys = M('project')->field('id,pid,name,orderid')->where("pid!='0'")->order('pid asc')->select();

        foreach ($categorys as $key=>$value) {
		
				$me = M('patrol')->where("id='{$categorys[$key][pid]}'")->find();
			//var_dump($me[name]);
            $categorys[$key][funame] = $me[name];
			
        }
       

		//var_dump($categorys);
		//$categorys = M('patrol')->field('name')->order('orderid asc')->select();
		////$this->assign('category',$category);
		$this->assign('categorys',$categorys);
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
		$currentcategory = M('project')->where('id='.$id)->find();
		$currentcategory['zhouqis'] = $currentcategory['zhouqi']/60/60/24;
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
		$data['pid'] = I('post.pid');
		$data['erweima'] = I('post.erweima');
		$data['tiaoma'] = I('post.tiaoma');
		$data['bz'] = I('post.bz');
		$data['zhouqi'] = I('post.zhouqi')*60*60*24;

		$data['orderid'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('project')->data($data)->where('id='.$id)->save()){
				addlog('巡检分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，项目修改成功！');
				die(0);
			}
		}else{
			$id = M('project')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增项目成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
