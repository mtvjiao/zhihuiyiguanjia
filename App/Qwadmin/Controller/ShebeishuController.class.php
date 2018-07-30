<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class ShebeishuController extends ComController {

	public function index(){
	
		$id = $_GET['id'];
		$me = M('project')->where("id='{$id}'")->find();
		$this->assign('shebei',$me);
		
		$categorys = M('attribute')->field('id,pid,prid,name,orderid,keshi')->where("prid='{$id}'")->order('pid asc')->select();
		
        foreach ($categorys as $key=>$value) {
		
			$me = M('organization')->where("id='{$categorys[$key][keshi]}'")->find();
            $categorys[$key][keshiname] = $me[name];
			
        }
		
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
	
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('project')->field('id,name,parentid')->where("id='{$pid}'")->order('orderid asc')->find();
		
//var_dump($category);		
		$this->assign('category',$category);
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$currentcategory = M('attribute')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);
		
		$organization = M('organization')->field('id,name')->order('id asc')->select();
		$tree = new Tree($organization);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$categorys = $tree->get_tree(0,$str, $currentcategory['keshi']);
		
		$this->assign('categorys',$categorys);

		
		
		$this -> display();
	}
	
	public function add(){
		
		$id = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('project')->field('id,name,parentid')->where("id='{$id}'")->order('orderid asc')->find();
		
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
		$data['prid'] = I('post.prid');

		$data['keshi'] = I('post.keshi');
		$data['shebei'] = 1;

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
