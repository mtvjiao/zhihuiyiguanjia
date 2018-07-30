<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;

class XgbaobiaoController extends ComController {

	public function index(){
		$uid = $this->USER['uid'];
		$m = M();
		//var_dump($uid);
		$userinfo = M('member')->field('uid,o_id')->where(" uid = '{$uid}'")->find(); 
		if($userinfo['o_id']!=null){
			$oids = explode(',', $userinfo['o_id']);
			foreach ($oids as $key=>$value) {
				//$jihua[$key] = M('jihuas')->where("xiaozu='{$value}'")->select();
				$keshi = M('organization')->field()->where(" id = '{$value}'")->find(); 
				$jihua[$key]['xiaozu'] = $keshi['name'] ;
				$jihua[$key]['datas']  = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_xgjihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_xgjihuazhixing d on a.zhixingid = d.id where a.xiaozu = $value");
				foreach ($jihua[$key]['datas'] as $k=>$v) {
					$shebei =  explode(',', $v['shebeiids']);
					//print_r($shebei);echo "<br>";
					$she = array();
					foreach ($shebei as $keys=>$values) {
						$name = $this -> shebei($values['shebeiid']); 
						//print_r($name);echo "<br>";
						$she[$keys]= $name['name'];
						
						//echo "<br>";
					}
					$shebei = $she;
					//print_r($shebei);
					//echo "<br>";echo "<br>";
					//$jihua[$k]['shebeiname'] = $shebei[$keys];
					$jihua[$key]['datas'][$k]['shebeiname'] = $shebei;

				}
				//print_r($jihua[$key]);
				//echo "<br>";echo "<br>";echo "<br>";echo "<br>";
			}
			$this->assign('jihua',$jihua);

		}else{
			$jihuas = "无计划";
			$this->assign('jihuas',$jihuas);
		}
		//var_dump($jihua);
		$this -> display();
	}

	
	public function chaxun(){
		$st =  $_POST['st'];
		$et =  $_POST['et'];

		$this->assign('kaishit',$st);
		$this->assign('jieshut',$et);

		//var_dump($st);
		$st =  date_create($st);
		$st =  date_format($st,"Y-m-d H:i:s");
		$et =  date_create($et);
		$et =  date_format($et,"Y-m-d H:i:s");
		//$stime = gmdate($this->PHPTimeFormatFromCommon('yyyy-mm-dd'), $st);
		//var_dump($stime);
		$st = strtotime($st);
		$et = strtotime($et);
		if($st >= $et){
		//	int(1480435200) int(1478361600)
			//int(1479571200) int(1478361600)
			// var_dump($st);
			// var_dump($et);
			$this->error('抱歉，时间选择错误！');
		}
		//$this->assign('st',$st);

		$uid = $this->USER['uid'];
		$m = M();
		//var_dump($uid);
		$userinfo = M('member')->field('uid,o_id')->where(" uid = '{$uid}'")->find(); 
		if($userinfo['o_id']!=null){
			$oids = explode(',', $userinfo['o_id']);
			foreach ($oids as $key=>$value) {
				//$jihua[$key] = M('jihuas')->where("xiaozu='{$value}'")->select();
				$keshi = M('organization')->field()->where(" id = '{$value}'")->find(); 
				$jihua[$key]['xiaozu'] = $keshi['name'] ;
				$jihua[$key]['datas']  = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.id as zhixingid,d.starttime,d.stoptime,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.id = d.jihuasid  where a.xiaozu = $value and $st < d.starttime and $et > d.stoptime");
				
				//$jihua[$key]['finishnum'] = 1;
				$a=0;
				$b=0;
				foreach ($jihua[$key]['datas'] as $k=>$v) {
					if($v['success'] == 0){
						$a = $a+1;
					}else{
						$b = $b+1;
					}
					
					//print_r($shebei);echo "<br>";

				}

			$jihua[$key]['finishnum'] = $a;
			$jihua[$key]['unfinishnum'] = $b;
				//success = 0 取未完成数量数量  success = 1  取完成数量

				//print_r($jihua[$key]);
				//echo "<br>";echo "<br>";echo "<br>";echo "<br>";
			}
			$this->assign('jihua',$jihua);

		}else{
			$jihuas = "无计划";
			$this->assign('jihuas',$jihuas);
		}
		//var_dump($jihua);
		$this -> display();
	}



	public function view(){
	   	$id = $_GET['id'];
	   	$xiaozu = $_GET['xiaozu'];
	   	$zhixingid = $_GET['zhixingid'];
	   	//var_dump($zhixingid);
	   	if(!$zhixingid){
			$jihuas= M('xgjihuazhixing')->field()->where(" jihuasid = '{$id}' and zt = '1'")->find(); 
			$zhixingid = $jihuas['id'];
			$zt = 1;

	   	}else{
			$zt = 2;
	   	}
		
	   	//var_dump($zhixingid);
		//巡更完成 正常
		$shebeifinish= M('xgzhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and zt = '{$zt}' and success = '1'")->select(); 
		//循环输出每个执行计划的设备名称
		//赋值给json
		if(!$shebeifinish){
			$shebeifinish = "无设备";
		}else{
			foreach ($shebeifinish as $key=>$value) {
				$shebeiids = M('xgshebei')->where("projectid='{$value[project]}'")->select();
				
				$name = $this -> xgshebei($value['shebeiid']); 
				//巡更人 
				//$zhixinguser= M('projectjl')->field()->where(" zhixingsbid = '{$value['sid']}' ")->order('id desc')->find(); 

			    $usern = $this -> username($value['user']); 
			    $shebeifinish[$key]['shebeiname'] = $name['name'];
			    $shebeifinish[$key]['zhixinguser'] = $usern['user'];

			}
			$jihuas['shebeifinish'] = $shebeifinish;
		}



		$shebeiunfinish= M('xgzhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and zt = '{$zt}' and success = '0'")->select(); 
		//var_dump($shebeiunfinish);
		if(!$shebeiunfinish){
			$shebeiunfinish = "无设备";
		}else{

			foreach ($shebeiunfinish as $key=>$value) {
				
				$name = $this -> xgshebei($value['shebeiid']); 
				
			    $shebeiunfinish[$key]['shebeiname'] = $name['name'];

			}
			$jihuas['shebeiunfinish'] = $shebeiunfinish;
		}
		$this->assign('shebeifinish',$jihuas['shebeifinish']);
		$this->assign('shebeifinishu',$jihuas['shebeifinishu']);
		$this->assign('shebeiunfinish',$jihuas['shebeiunfinish']);
		$this->assign('xiaozu',$xiaozu);



		//var_dump($jihuas);
		$this -> display();
	}




	public function viewshebei(){
	    $id = $_GET['id'];
	    $xiaozu = $_GET['xiaozu'];
		$shebei= M('projectjl')->field('id')->where(" zhixingsbid = '{$id}' ")->order('id desc')->select(); 
			$m = M();
		    //var_dump($shebei);
	
			foreach ($shebei as $key=>$value) {
				
				$userinfo[$key]['shebei'] = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = ".$value['id']." and c.keshi =".$xiaozu);


			}

		//$this -> json(209,'成功',$userinfo);
        //var_dump($userinfo);
		$this->assign('category',$userinfo);

		$this -> display();
	}




}
