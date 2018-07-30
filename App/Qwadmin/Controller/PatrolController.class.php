<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class PatrolController extends ComController {

	public function index(){		
		$category = M('patrol')->field('id,name,orderid')->order('orderid asc')->select();
		$category = $this->getMenu($category);
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function del(){
		
		$id = isset($_GET['id'])?intval($_GET['id']):false;
		if($id){
			$data['id'] = $id;
			$category = M('patrol');
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
		$currentcategory = M('patrol')->where('id='.$id)->find();
		$this->assign('currentcategory',$currentcategory);

		$category = M('patrol')->field('id,name')->where('pid = 0')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('patrol')->field('id,name,orderid')->where('pid = 0')->order('orderid asc')->select();
		
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}


	public function view(){
	
		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$pagesize = 25;#每页数量
		$offset = $pagesize*($p-1);//计算记录偏移量
	
		$categorys = M('projectjl')->field('id,projectid,time,zt,shebeiid,name,ztid,danhao')->where('parentid = 0')->order('id desc')->limit($offset.','.$pagesize)->select();
        foreach ($categorys as $key=>$value) {
				$me = M('member')->where("uid='{$categorys[$key][name]}'")->find();
				$me1 = M('project')->where("id='{$categorys[$key][projectid]}'")->find();
				$me2 = M('shebei')->where("id='{$categorys[$key][shebeiid]}'")->find();
				$me3 = M('patrolzt')->where("pid='{$categorys[$key][zt]}'")->find();
            $categorys[$key][user] = $me[user];
            $categorys[$key][yename] = $me1[name];
            $categorys[$key][shebeiname] = $me2[name];
            $categorys[$key][zhuangtai] = $me3[name];
        }
		$count = M('projectjl')->where('parentid = 0')->count();
		$page	=	new \Think\Page($count,$pagesize); 
		$page = $page->show();
        $this->assign('page',$page);
		
		$this->assign('categorys',$categorys);
		$this -> display();
	}
	
	public function viewshebei(){
	    $id = $_GET['id'];

			$m = M();
	
			$userinfo = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = $id");


			$userinfos = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,e.* FROM qw_projectjl a left join qw_project b on a.projectid = b.id left join qw_attribute c on c.prid = b.id LEFT JOIN qw_attjl d on d.prid = a.id LEFT JOIN qw_jl e on e.attid = d.id  where a.parentid= $id  order by b.id desc");


//var_dump($userinfos);
		$this->assign('category',$userinfo);
		$this->assign('categorys',$userinfos);
		$this -> display();
	}
	
	
	public function baogao(){

				$counts = M('shebei')->field('count(*) as count')->find();
				$count = M('projectjl')->count('DISTINCT shebeiid');
			//	select number from dbo.A group by number having count(*) = 1
             //   print_r($counts);

                $shes = intval($counts['count'])-intval($count);
 				// print_r($shes);
		$this->assign('counts',$counts);
		$this->assign('count',$count);
		$this->assign('shes',$shes);
		$this -> display();
	}
	
	
	public function views(){
	    $id = $_GET['id'];
		
	   	$categorys = M('projectjl')->where('jlid='.$id)->select();
		  foreach ($categorys as $key=>$value) {
			  $me = M('project')->where('id='.$categorys[$key][projectid])->find();
              $categorys[$key][pname] = $me[name];
        }
		//var_dump($categorys);
		  

		//$list=array("name"=>"11");
		echo json_encode($categorys);
	}

	
	public function update($act=null){
		if($act=='order'){
			$id = I('post.id',0,'intval');
			if(!$id){
				die('0');
			}
			$o = I('post.o',0,'intval');
			M('patrol')->data(array('orderid'=>$o))->where("id='{$id}'")->save();
			addlog('分类修改排序，ID：'.$id);
			die('1');
		}
		
		$id = I('post.id',false,'intval');

		$data['pid'] = I('post.pid',0,'intval');
		$data['name'] = I('post.name');
		$data['erweima'] = I('post.erweima');
		$data['tiaoma'] = I('post.tiaoma');
		$data['bz'] = I('post.bz');
		$data['img'] = I('post.thumbnail','','strip_tags');
		$data['orderid'] = I('post.o',0,'intval');
		if($data['name']==''){
			$this->error('分类名称不能为空！');
		}
		if($id){
			if(M('patrol')->data($data)->where('id='.$id)->save()){
				addlog('巡检分类修改，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，分类修改成功！');
				die(0);
			}
		}else{
			$id = M('patrol')->data($data)->add();
			if($id){
				addlog('新增分类，ID：'.$id.'，名称：'.$data['name']);
				$this->success('恭喜，新增分类成功！');
				die(0);
			}
		}
		$this->success('恭喜，操作成功！');
	}
}
