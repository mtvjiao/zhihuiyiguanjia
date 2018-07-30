<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class ShebeiController extends ComController {

	public function index(){
	
		
		//$category = M('project')->field('id,name,orderid')->order('orderid asc')->select();
		//	$category = $this->getMenu($category);
		//$funame = M('patrol')->where("id='{$categorys[pid]}'")->select();
		$categorys = M('shebei')->field('id,projectid,name,orderid,area')->order('projectid asc')->select();

        foreach ($categorys as $key=>$value) {
		
			$me = M('project')->where("id='{$categorys[$key][projectid]}'")->find();
            $categorys[$key][funame] = $me[name];
			
        }
       

		//var_dump($categorys);
		//$categorys = M('patrol')->field('name')->order('orderid asc')->select();
		////$this->assign('category',$category);
		$this->assign('categorys',$categorys);
		$this -> display();
	}

	public function indexs(){
	
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$me = M('project')->where("id='{$id}'")->find();

		$categorys = M('shebei')->field('id,projectid,name,orderid,area')->where("projectid='{$id}'")->order('name asc')->select();


		$this->assign('categorys',$categorys);
		$this->assign('me',$me);
		$this -> display();
	}


	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('shebei');

				$category->where('id='.$id)->delete();
				addlog('删除分类，ID：'.$id);

			die('1');
		}else{
			die('0');
		}

	}
	
	public function edit(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$currentcategory = M('shebei')->where('id='.$id)->find();
		//var_dump($currentcategory);
		$this->assign('currentcategory',$currentcategory);

		$category = M('project')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['projectid']);

		$area = $currentcategory['area'];
		if(!$area){
			$area = "1";
			$apid = M('area')->where('id='.$area)->order('o ASC')->find();
			$pid = 1;			

		}else{
			$apid = M('area')->where('id='.$area)->find();
			//var_dump($apid);
			if(!$apid){
				$pid = 1;
			}else{
				$pid = $apid['pid'];
			}		
		}
		$option = M('area')->where("pid='0'")->order('o ASC')->select();
		$option = $this->getMenu($option);
		$this->assign('option',$option);
		$this->assign('apid',$apid);
		$options = M('area')->where("pid=".$pid)->order('o ASC')->select();
		$options = $this->getMenu($options);
		$this->assign('options',$options);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('project')->field('id,name')->where("pid!='0'")->order('orderid asc')->select();
		
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		$option = M('area')->where("pid='0'")->order('o ASC')->select();
		$option = $this->getMenu($option);
		$this->assign('option',$option);
		$this->assign('category',$category);
		$this -> display();
	}

	public function select(){
		
		$pid = $_GET['pid'];

		if(isset($pid)){
		
		$q = M('area')->where("pid = '{$pid}'")->order('o ASC')->select();
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
			M('shebei')->data(array('orderid'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}
		
		$id = I('post.id',false,'intval');



		$data['projectid'] = I('post.projectid');
		
		
		
		$data['area'] = I('post.areas');
		$data['erweima'] = I('post.erweima');
		$data['bz'] = I('post.bz');
		$data['name'] = I('post.name');

		$data['orderid'] = I('post.orderid',0,'intval');
		
		if($data['name'] == ""){
				$currentcategory = M('project')->where('id='.$data['projectid'])->find();
				$data['name'] = $currentcategory['name'].$data['bz'].$data['erweima'];
		}

		
		//if($data['name']==''){
		//	$this->error('分类名称不能为空！');
		//}
		if($id){
			if(M('shebei')->data($data)->where('id='.$id)->save()){
				addlog('巡检分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，设备修改成功！');
				die(0);
				echo "<script  type='text/javascript'>location.href=history.go(-2);</script>";
			}
		}else{

				$id = M('shebei')->data($data)->add();
				if($id){
					addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
					$this->success('恭喜，新增设备成功！');
					die(0);
				}
		}
		$this->success('恭喜，操作成功！');
	}
}
