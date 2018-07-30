<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-01-24
* 版    本：1.0.0
* 功能说明：菜单控制器。
*
**/
//苹果端上传wav格式音频无法上传的bug修复
namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class XunjianController extends ComController {
    public function index(){
		$p = isset($_GET['p'])?intval($_GET['p']):'1';
	
		$m = M('jihuas');
		$pagesize = 10;#每页数量
		$offset = $pagesize*($p-1);//计算记录偏移量
		$count = $m->count();
		
		$list  = $m->order('xiaozu asc')->select();
		
			foreach($list as $k=>$v){
				$xiaozu  = M('organization')->where('id = ' .$list[$k]['xiaozu'])->find();
				$zhouqi  = M('xunjianzhouqi')->where('id = ' .$list[$k]['zhouqi'])->find();
				$list[$k]['xiaozuname'] = $xiaozu['name'];
				$list[$k]['zhouqiname'] = $zhouqi['name'];
			}
		
		
		$list = $this->getMenu($list);
		
		$page	=	new \Think\Page($count,$pagesize); 
        $this->assign('list',$list);	

		$this -> display();
    }
	
	public function del(){
		
		$ids = isset($_REQUEST['ids'])?$_REQUEST['ids']:false;

		$map['id']  = $ids;
		if(M('jihuas')->where($map)->delete()){
			
			$this->success('恭喜，删除成功！');
		}else{
			$this->error('参数错误！');
		}
	}
	
	public function edit($id=0){
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$jihuaone = M('jihuas')->where("id='$id'")->find();
        //var_dump(intval($jihuaone['xiaozu']));
		$xiaozu = intval($jihuaone['xiaozu']);
		$this->assign('id',$id);
		$this->assign('xiaozu',$xiaozu);
		$option = M('organization')->order('id ASC')->select();
		$option = $this->getMenu($option);
		
		$areaoption = M('area')->order('o ASC')->select();
		$areaoption = $this->getMenu($optionarea);
		$this->assign('optionarea',$optionarea);

		//var_dump($option);
		$this->assign('option',$option);
		
		$categorys = M('project')->field('id,name')->order('orderid asc')->select();
		$treec = new Tree($categorys);
		$strc = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$categorys = $treec->get_tree(0,$strc, intval($jihuaone['project']));
		//var_dump($categorys);
		$this->assign('categorys',$categorys);
		
		
		$projectid = intval($jihuaone['project']);
		$project =  M('project')->where("id='$projectid'")->find();
		//$patrol =  M('patrol')->where("id='$project['pid']'")->find();

		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, intval($project['pid']));
		
		$this->assign('category',$category);

		$shebeiids = $jihuaone['shebeiids']; // 转换为tree样式
		$shebei = explode(',',$shebeiids);
		$shebeilb = array() ;
			foreach($shebei as $k=>$v){
			    //var_dump($v);
				$shebeilei  = M('shebei')->where('id = ' .intval($v))->find();
				//var_dump($shebeilei['id']);
				if(!$shebeilei){
					
				}else{
					$shebeilb[$k]['id'] = $shebeilei['id'];
					//var_dump($shebeilb);
					$shebeilb[$k]['name'] = $shebeilei['name'];
					# code...
				}
			}
		//var_dump($shebeilb);
		$treeshebei = new Tree($shebeilb);
		$strshebei = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$treeshebei = $treeshebei->get_tree(0,$strshebei);
		$this->assign('treeshebei',$treeshebei);




		$zhouqi = M('xunjianzhouqi')->field('id,name')->order('o asc')->select();
		$trees = new Tree($zhouqi);
		$strs = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$zhouqi = $trees->get_tree(0,$strs, intval($jihuaone['zhouqi']));
		
		$this->assign('zhouqi',$zhouqi);

		$this -> display();
	}
	
	public function view($id=0){
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		$jihuaone = M('jihuas')->where("id='$id'")->find();
//var_dump(intval($jihuaone['xiaozu']));
		$xiaozu = intval($jihuaone['xiaozu']);
		$this->assign('id',$id);
		$this->assign('xiaozu',$xiaozu);
		$option = M('organization')->order('id ASC')->select();
		$option = $this->getMenu($option);
		
		$areaoption = M('area')->order('o ASC')->select();
		$areaoption = $this->getMenu($optionarea);
		$this->assign('optionarea',$optionarea);

		//var_dump($option);
		$this->assign('option',$option);
		
		$categorys = M('project')->field('id,name')->order('orderid asc')->select();
		$treec = new Tree($categorys);
		$strc = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$categorys = $treec->get_tree(0,$strc, intval($jihuaone['project']));
		//var_dump($categorys);
		$this->assign('categorys',$categorys);
		
		
		$projectid = intval($jihuaone['project']);
		$project =  M('project')->where("id='$projectid'")->find();
		//$patrol =  M('patrol')->where("id='$project['pid']'")->find();

		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, intval($project['pid']));
		
		$this->assign('category',$category);

		$shebeiids = $jihuaone['shebeiids']; // 转换为tree样式
		$shebei = explode(',',$shebeiids);
		$shebeilb = array() ;
			foreach($shebei as $k=>$v){
			    //var_dump($v);
				$shebeilei  = M('shebei')->where('id = ' .intval($v))->find();
				//var_dump($shebeilei['id']);
				$shebeilb[$k]['id'] = $shebeilei['id'];
				//var_dump($shebeilb);
				$shebeilb[$k]['name'] = $shebeilei['name'];
			}
		//var_dump($shebeilb);
		$treeshebei = new Tree($shebeilb);
		$strshebei = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$treeshebei = $treeshebei->get_tree(0,$strshebei);
		$this->assign('treeshebei',$treeshebei);




		$zhouqi = M('xunjianzhouqi')->field('id,name')->order('o asc')->select();
		$trees = new Tree($zhouqi);
		$strs = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$zhouqi = $trees->get_tree(0,$strs, intval($jihuaone['zhouqi']));
		
		$this->assign('zhouqi',$zhouqi);

		$this -> display();
	}
	
	
	
	public function add(){

		$option = M('organization')->order('id ASC')->select();
		$option = $this->getMenu($option);
		
		$areaoption = M('area')->order('o ASC')->select();
		$areaoption = $this->getMenu($optionarea);
		$this->assign('optionarea',$optionarea);

		//var_dump($option);
		$this->assign('option',$option);
		
		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);

		$zhouqi = M('xunjianzhouqi')->field('id,name')->order('o asc')->select();
		$trees = new Tree($zhouqi);
		$strs = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$zhouqi = $trees->get_tree(0,$strs, $pid);
		
		$this->assign('zhouqi',$zhouqi);

		$this -> display();
	}
	
		public function select(){
		
			$pid = $_GET['pid'];
			//var_dump($pid);
			if(isset($pid)){
			
			$q = M('member')->where("o_id like '%{$pid}%'")->select();
			//$q=mysql_query("select * from qw_project where pid = $pid");
			//var_dump($q);
			echo urldecode(json_encode($q));
			} 
		}


		public function getproject(){
		
			$prid = $_GET['prid'];
			//var_dump($pid);
			if($prid != "0"){
			
				$q = M('project')->where("pid = '{$prid}'")->select();
				echo urldecode(json_encode($q));
			} else{
				$q="";
				echo urldecode(json_encode($q));
			}

		}


		public function getshebei(){
		
			$prid = $_GET['projectid'];
			//var_dump($pid);
			if($prid != "0"){
			
				$q = M('shebei')->where("projectid = '{$prid}'")->select();
				echo urldecode(json_encode($q));
			} else{
				$q="";
				echo urldecode(json_encode($q));
			}

		}
		public function remove(){
		
			$pid = $_POST['pid'];
			$uid = $_POST['uid']['0'];
			//print_r($_POST);
			//exit();
			//$uid = $_GET['uid'];
			//$pid = 41 ;
			//$uid = 4 ;
 			$q = M('member')->where("uid = '{$uid}'")->find();
			//echo  M('member')->getLastSql();
			$o_id = $q['o_id'];
			
			//echo json_encode($o_id);

			$o_id = explode(',',$o_id);
			$guanli = $q['guanli'];
			$guanli = explode(',',$guanli);
			foreach ($o_id as $key=>$value) {
				if($value = $pid){
					$a = $key ;
				}
				
			}
			//var_dump($a);
			array_splice($o_id,$a,1); 
			array_splice($guanli,$a,1);
			$data['o_id'] = implode(',',$o_id); 
			$data['guanli'] = implode(',',$guanli);
			M('member')->data($data)->where("uid = '$uid'")->save();
 			//var_dump($o_id);
			//echo urldecode(json_encode($q));
	}

	
		public function jiaren(){
		
			$jiaren = $_POST['jiaren'];
			$pid = $_POST['pid'];
 			$q = M('member')->where("user = '{$jiaren}'")->find();
			$uid = $q['uid'];
			if(!$uid){
				echo urldecode(json_encode("对不起，无此账号"));
			}else{
			
				//var_dump($o_ids);
				if($q['o_id']==""){
				$data['o_id'] = $pid;
				$data['guanli'] = '0';
				}else{
				$data['o_id'] = $q['o_id'].','.$pid;
				$data['guanli'] = $q['guanli'].',0';
				}
				//$map['uid']  = array('in',$uids);
				 M('member')->data($data)->where("user='{$jiaren}'")->save();
				echo urldecode(json_encode("添加成功"));
				
			}

	}

	
		public function jiasb(){
		
			$jiasb = $_POST['jiasb'];
			$projectid = $_POST['projectid'];
			$where['name'] = $jiasb ;
			$where['projectid'] = $projectid ;
			
 			$q = M('shebei')->where($where)->find();
			$uid = $q['id'];
			if(!$uid){
				echo "1";
			}else{
				//echo urldecode(json_encode("添加设备成功"));
		     	echo urldecode(json_encode($q));
			}

	}
	
	
	
		public function update(){
		
		$id = I('post.id',false,'intval');
	 	$data['patrol'] = I('post.prid');
	 	$data['xiaozu'] = I('post.pid');
	 	//$data['project'] = I('post.projectid');
	 	$data['shebeiids'] = I('post.allshebei');
	 	$data['zhouqi'] = I('post.zhouqi');
		$data['time'] = time();
		$currentcategory = M('organization')->where('id='.$data['xiaozu'])->find();
		//$prname = M('project')->where('id='.$data['project'])->find();
		$data['jihuaming'] = $currentcategory['name']."巡检计划";
		
		if($id){
			if(M('jihuas')->data($data)->where('id='.$id)->save()){
				$this->success('恭喜，计划修改成功！');
				die(0);
			}
		}else{

				$id = M('jihuas')->data($data)->add(); 
				if($id){
					$this->success('恭喜，新增计划成功！');
					die(0);
				}
		}
		$this->success('恭喜，操作成功！');
	}
	
	
	
	
	
	
	
	
	
	
	
	
}