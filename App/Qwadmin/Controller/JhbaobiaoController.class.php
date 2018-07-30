<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
use Vendor\Tree;
use Think\Auth;
class JhbaobiaoController extends ComController {

	public function index(){
		$m = M();
		$uid = $this->USER['uid'];
		$Auth = new Auth();
		$userauth = $Auth->getGroups($uid);
		
		if($userauth[0]['group_id'] == 1 ||$userauth[0]['group_id'] == 10){
			$jihua = $m->query("SELECT count(a.xiaozu) as jihuacount,a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id group by a.xiaozu");
			//var_dump($jihua);
			// echo "<pre>";
			// print_r($jihua);
			// echo "</pre>";

			
			$xunjianday = C('XUNJIANDAY');		
			$xunjianweek = C('XUNJIANWEEK');		
			$xunjianmonth = C('XUNJIANMONTH');		
			$xunjianjd= C('XUNJIANJD');		
			$xunjianyear = C('XUNJIANYEAR');
			//统计全部已结束日计划的总数 完成总数
			$daysumf = $this -> sumf($xunjianday);
			$daysumc = $this -> sumc($xunjianday);
			//统计全部已结束周计划的总数 完成总数
			$weeksumf = $this -> sumf($xunjianweek);
			$weeksumc = $this -> sumc($xunjianweek);
			//统计全部已结束月计划的总数 完成总数
			$monthsumf = $this -> sumf($xunjianmonth);
			$monthsumc = $this -> sumc($xunjianmonth);
			//统计全部已结束季计划的总数 完成总数
			$jdsumf = $this -> sumf($xunjianjd);
			$jdsumc = $this -> sumc($xunjianjd);
			//统计全部已结束年计划的总数 完成总数
			$yearsumf = $this -> sumf($xunjianyear);
			$yearsumc = $this -> sumc($xunjianyear);

			//var_dump($yearsumf);
			
			//赋值模板柱形图
			$this->assign('daysumf',$daysumf);
			$this->assign('daysumc',$daysumc);
			$this->assign('weeksumf',$weeksumf);
			$this->assign('weeksumc',$weeksumc);
			$this->assign('monthsumf',$monthsumf);
			$this->assign('monthsumc',$monthsumc);
			$this->assign('jdsumf',$jdsumf);
			$this->assign('jdsumc',$jdsumc);
			$this->assign('yearsumf',$yearsumf);
			$this->assign('yearsumc',$yearsumc);


			$this->assign('jihua',$jihua);
			$this -> display('tindex');
		}else{

			//var_dump($uid);
			$userinfo = M('member')->field('uid,o_id')->where(" uid = '{$uid}'")->find(); 	
			if($userinfo['o_id']!=null){
				$oids = explode(',', $userinfo['o_id']);
				foreach ($oids as $key=>$value) {
					//$jihua[$key] = M('jihuas')->where("xiaozu='{$value}'")->select();
					$keshi = M('organization')->field()->where(" id = '{$value}'")->find(); 
					$jihua[$key]['xiaozu'] = $keshi['name'] ;
					$jihua[$key]['datas']  = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu = $value");

					// zhixingid


					foreach ($jihua[$key]['datas'] as $k=>$v) {
						//$id = $v['id'];
                        $xiaozusumf =M('jihuazhixing')->where("success = '1' and jihuasid = ".$v['id'])->count();
                        $xiaozusum =M('jihuazhixing')->where("jihuasid = ".$v['id'])->count();

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
						$jihua[$key]['datas'][$k]['xiaozusum'] = $xiaozusum;
						$jihua[$key]['datas'][$k]['xiaozusumf'] = $xiaozusumf;

					}
					//print_r($jihua[$key]);
					//echo "<br>";echo "<br>";echo "<br>";echo "<br>";
					// 					echo "<pre>";
					// var_dump($jihua[$key]['datas']);
				}
				$this->assign('jihua',$jihua);

			}else{
				$jihuas = "无计划";
				$this->assign('jihuas',$jihuas);
			}
			//var_dump($jihua);
		 	$this -> display();
		}
		
	}

	public function viewxiaozu(){
		$xiaozu = $_GET['xiaozu'];
		$m = M();
		$xiaozujihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu = $xiaozu");
					foreach ($xiaozujihua as $k=>$v) {
						$shebei =  explode(',', $v['shebeiids']);
						//print_r($shebei);echo "<br>";
						$she = array();
						foreach ($shebei as $keys=>$values) {
							$name = $this -> shebei($values['shebeiid']); 
							//print_r($name);echo "<br>";
							$she[$keys]= $name['name'];
							
							//echo "<br>";
						}
						//$shebei = $she;
						//print_r($shebei);
						//echo "<br>";echo "<br>";
						//$jihua[$k]['shebeiname'] = $shebei[$keys];
						$xiaozujihua[$k]['shebeiname'] = $she;

					}
			// echo "<pre>";
			// print_r($xiaozujihua);
			// echo "</pre>";
			$this->assign('name',$xiaozujihua[0]['xiaozuname']);
			$this->assign('jihua',$xiaozujihua);
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

			$jihua[$key]['finishnum'] = $b;
			$jihua[$key]['unfinishnum'] = $a;
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
			$jihuas= M('jihuazhixing')->field()->where(" jihuasid = '{$id}' and zt = '1'")->find(); 
			$zhixingid = $jihuas['id'];
			$zt = 1;

	   	}else{
			$zt = 2;
	   	}
		//巡检完成 正常 and zt = '{$zt}'
		$shebeifinish= M('zhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and success = '1' and type='0'")->select(); 
		//循环输出每个执行计划的设备名称
		//赋值给json
		if(!$shebeifinish){
			$shebeifinish = "无设备";
		}else{
			foreach ($shebeifinish as $key=>$value) {
				
				$name = $this -> shebei($value['shebeiid']); 
				$areaid = $this -> shebeiarea($value['shebeiid']); 
				$area = $this -> area($areaid); 				//巡检人 
				$zhixinguser= M('projectjl')->field()->where(" zhixingsbid = '{$value['sid']}' ")->order('id desc')->find(); 

			    $usern = $this -> username($zhixinguser['name']); 
			    $shebeifinish[$key]['shebeiname'] = $name['name'];
			    $shebeifinish[$key]['zhixinguser'] = $usern['user'];
			    $shebeifinish[$key]['area'] = $area;

			}
			$jihuas['shebeifinish'] = $shebeifinish;
		}
		//巡检完成 不正常and zt = '{$zt}' 
		$shebeifinishu= M('zhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and success = '1' and type='1'")->select(); 
		//循环输出每个执行计划的设备名称
		//赋值给json
		if(!$shebeifinishu){
			$shebeifinishu = "无设备";
		}else{

			foreach ($shebeifinishu as $key=>$value) {
				
				$name = $this -> shebei($value['shebeiid']);
				$areaid = $this -> shebeiarea($value['shebeiid']); 
				$area = $this -> area($areaid); 
				$zhixinguser= M('projectjl')->field()->where(" zhixingsbid = '{$value['sid']}' ")->order('id desc')->find(); 

			    $usern = $this -> username($zhixinguser['name']); 
			    $shebeifinishu[$key]['shebeiname'] = $name['name'];
			    $shebeifinishu[$key]['zhixinguser'] = $usern['user'];
			    $shebeifinishu[$key]['area'] = $area;

			}
			$jihuas['shebeifinishu'] = $shebeifinishu;
		}
 //and zt = '{$zt}'
		$shebeiunfinish= M('zhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and success = '0'")->select(); 
		if(!$shebeiunfinish){
			$shebeiunfinish = "无设备";
		}else{

			foreach ($shebeiunfinish as $key=>$value) {
				
				$name = $this -> shebei($value['shebeiid']); 
				
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
				$user = "";
					$user = $m->query("SELECT a.*
							FROM qw_projectjl a 
							left join qw_shebei b on a.shebeiid = b.id 
							left join qw_attribute c on a.projectid = c.prid 
							where a.id = ".$value['id']." and c.keshi = ".$xiaozu); 	
				if(!$user){
					$userinfo[$key]['shebei'] = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = ".$value['id']." and c.keshi = 36");
				}else{
					$userinfo[$key]['shebei'] = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = ".$value['id']." and c.keshi =".$xiaozu);										
				}		



			}

		//$this -> json(209,'成功',$userinfo);
        //var_dump($shebei);
		$this->assign('category',$userinfo);

		$this -> display();
	}




}
