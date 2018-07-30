<?php


namespace Qwadmin\Controller;
use Common\Controller\BaseController;
use Think\Auth;


class WapController extends BaseController {

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

		$category = M('patrol')->field('id,name')->order('orderid asc')->select();
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $currentcategory['pid']);
		
		$this->assign('category',$category);
		$this -> display();
	}
	
	public function add(){
		
		$pid = isset($_GET['pid'])?intval($_GET['pid']):0;
		
		$category = M('patrol')->field('id,name,orderid')->order('orderid asc')->select();
		
		$tree = new Tree($category);
		$str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
		$category = $tree->get_tree(0,$str, $pid);
		
		$this->assign('category',$category);
		$this -> display();
	}


	public function view(){
		$categorys = M('projectjl')->field('id,projectid,time,zt,shebeiid,name,ztid')->where('parentid = 0')->order('id desc')->select();
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
		
		
		$this->assign('categorys',$categorys);
		$this -> display();
	}
	
	public function viewshebei(){
	    $id = $_GET['id'];

			$m = M();
	
			$userinfo = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = $id");


			$userinfos = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,e.* FROM qw_projectjl a left join qw_project b on a.projectid = b.id left join qw_attribute c on c.prid = b.id LEFT JOIN qw_attjl d on d.prid = a.id LEFT JOIN qw_jl e on e.attid = d.id  where a.parentid= $id  order by b.id desc");

		        $categorys = M('projectjl')->field('id,projectid,time,zt,shebeiid,name,ztid')->where("id='{$id}'")->order('id desc')->find();
				$me = M('member')->where("uid='{$categorys[name]}'")->find();
				$me1 = M('project')->where("id='{$categorys[projectid]}'")->find();
				$me2 = M('shebei')->where("id='{$categorys[shebeiid]}'")->find();
				$me3 = M('patrolzt')->where("pid='{$categorys[zt]}'")->find();
				$categorys[user] = $me[user];
				$categorys[yename] = $me1[name];
				$categorys[shebeiname] = $me2[name];
				$categorys[zhuangtai] = $me3[name];
		
		
		$this->assign('cate',$categorys);
		$this->assign('category',$userinfo);
		$this->assign('categorys',$userinfos);
		$this -> display();
	}
	
	
	
	
	public function baogao(){

				$counts = M('shebei')->field('count(*) as count')->find();
				$count = M('projectjl')->where('parentid = 0')->count('DISTINCT shebeiid'); // 已巡检的记录  数量
				$counting = M('projectjl')->where('zt = 0 and parentid = 0')->count('DISTINCT shebeiid');//巡检中的记录数量
				//$countz = M('projectjl')->where('zt = 1 and ztid = 0 and parentid = 0')->order('id asc')->count('DISTINCT shebeiid');//巡检中的记录数量 正常
				$counted = M('projectjl')->field('MAX(id) as id')->order('id desc')->group("shebeiid")->select();//巡检中的记录数量 不正常
				//var_dump($counted);
				foreach($counted as $value){
				    $a =  $value['id'].','.$a ;
				}
				$a = $a . "10000";
				
				$counteds = M('projectjl')->where(array('id'=>array('in',"'.$a.'"),'zt'=>1,'ztid'=>1,'parentid'=>0))->field('count(*) as count')->find(); // 已巡检的记录  数量
				$counted = $counteds['count']; //巡检中的记录数量 不正常
                $countz = intval($count)-intval($counting)-intval($counted); // 已完成巡检记录 正常
                $shes = intval($counts['count'])-intval($count);
 				// print_r($shes);
				
				$baifened = round((intval($counted)/intval($counts))*100,2);
				$baifenz = round((intval($countz)/intval($counts))*100,2);
				$baifening= round((intval($counting)/intval($counts))*100,2);
				$baifenshes= round((intval($shes)/intval($counts))*100,2);
				
				
				$this->assign('baifenz',$baifenz);
				$this->assign('baifened',$baifened);
				$this->assign('baifening',$baifening);
				$this->assign('baifenshes',$baifenshes);
				$this->assign('countz',$countz);
				$this->assign('counts',$counts);
				$this->assign('count',$count);
				$this->assign('shes',$shes);
				$this->assign('counting',$counting);
				$this->assign('counted',$counted);		$this -> display();
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
