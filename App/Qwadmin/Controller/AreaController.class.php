<?php

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class AreaController extends ComController {

	public function index(){

		$area = M('area')->field('id,pid,name,o')->where('pid = 0')->order('o asc')->select();
		    foreach ($area as $key=>$value) {
				$me = M('area')->where("pid='{$area[$key][id]}'")->order('o asc')->select();
            	$area[$key][pname] = $me;
        }
		//var_dump($area);

		//$category = M('area')->field('id,pid,name,o')->order('o asc')->select();
		//$category = $this->getMenu($category);
		$this->assign('area',$area);
		$this -> display();
	}
	
	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('category');
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
		$currentcategory = M('area')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);

		$category = M('area')->field('id,pid,name')->order('o asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		$category = M('area')->field('id,pid,name')->order('o asc')->select();
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
			M('area')->data(array('o'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}
		
		$id = I('post.id',false,'intval');

		$data['pid'] = I('post.pid',0,'intval');
		$data['name'] = I('post.name');

		$data['o'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('area')->data($data)->where('id='.$id)->save()){
				addlog('文章分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，分类修改成功！');
				die(0);
			}
		}else{
			$id = M('area')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增分类成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
