<?php
/**
*
*
**/

namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class AttributeController extends ComController {

	public function index(){
	
		
		//$category = M('project')->field('id,name,orderid')->order('orderid asc')->select();
	//	$category = $this->getMenu($category);
					//$funame = M('patrol')->where("id='{$categorys[pid]}'")->select();
		$categorys = M('attribute')->field('id,pid,prid,name,orderid')->where("shebei='0'")->order('pid asc')->select();

        foreach ($categorys as $key=>$value) {
		
				$me = M('project')->where("id='{$categorys[$key][prid]}'")->find();
				$me1 = M('patrol')->where("id='{$categorys[$key][pid]}'")->find();
				$me2 = M('patrolzt')->where("pid='{$categorys[$key][zt]}'")->find();
            $categorys[$key][funame] = $me[name];
            $categorys[$key][yename] = $me1[name];
            $categorys[$key][ztname] = $me2[name];
			
        }
       

//var_dump($categorys);
		//$categorys = M('patrol')->field('name')->order('orderid asc')->select();
		////$this->assign('category',$category);
		$this->assign('categorys',$categorys);
		$this -> display();
	}
	
	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('attribute');
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
		$currentcategory = M('attribute')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);

		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);


		$categorys = M('project')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($categorys);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$categorys = $tree->get_tree(0,$str, $currentcategory['prid']);
		
		$this->assign('categorys',$categorys);


		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		$this->assign('category',$category);



		$option = M('organization')->order('id ASC')->select();
		$option = $this->getMenu($option);
		
		$this->assign('option',$option);


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
			M('project')->data(array('orderid'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}
		
		$id = I('post.id',false,'intval');


		$data['name'] = I('post.name');
		$data['pid'] = I('post.pid');
		$data['prid'] = I('post.prid');

		$data['keshi'] = I('post.keshi');

		$data['orderid'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('attribute')->data($data)->where('id='.$id)->save()){
				addlog('巡检分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，项目属性修改成功！');
				die(0);
			}
		}else{
			$id = M('attribute')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增项目属性成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
