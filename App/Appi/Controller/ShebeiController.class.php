<?php
// 单个设备巡检在此计划的巡检详情接口
// 2016.10.10  焦军

namespace Appi\Controller;
use Common\Controller\BaseController;
use Think\Auth;
class ShebeiController extends ComController {
    public function View(){

    	$id = $_GET['id'];
    	//$jlid = $_GET['jlid'];
    	$keshi =  $_GET['keshi'];
    	$shebei= M('projectjl')->field('id')->where("zhixingsbid = '{$id}' and keshi = '{$keshi}'")->order('id desc')->select(); 
    	//echo M('projectjl')->getLastsql(); 

		$m = M();
			foreach ($shebei as $key=>$value) {
				$userinfo = "";
				$userinfo = $m->query("SELECT a.*
							FROM qw_projectjl a 
							left join qw_shebei b on a.shebeiid = b.id 
							left join qw_attribute c on a.projectid = c.prid 
							where a.id = ".$value['id']." and c.keshi = ".$keshi); 
				if(!$userinfo){
						$shebei[$key]['shebei'] = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = ".$value['id']." and c.keshi = 36");

				}else{
						$shebei[$key]['shebei'] = $m->query("SELECT a.*,b.name as shebeiname,c.name as shuxingname,d.zt as zhengchang,f.name as zhuangtai,e.*,g.user FROM qw_projectjl a left join qw_shebei b on a.shebeiid = b.id left join qw_attribute c on a.projectid = c.prid left join qw_attjl d on c.id = d.attributeid and d.shebeiid = a.shebeiid and d.prid = a.id left join qw_jl e on d.id = e.attid left join qw_patrolzt f on f.pid = a.zt left join qw_member g on g.uid = a.name where a.id = ".$value['id']." and c.keshi = ".$keshi);					
				}

				


			}	//	print_r($shebei);
		if($shebei){
			$this -> json(210,'成功',$shebei);
		}else{
			$this -> json(410,'无数据');
		}
	


    }
	

}
