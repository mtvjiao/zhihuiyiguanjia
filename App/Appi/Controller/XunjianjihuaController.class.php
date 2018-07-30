<?php

// 巡检计划列表app接口
// 2016.10.9  焦军
namespace Appi\Controller;
use Common\Controller\BaseController;
use Think\Auth;
class XunjianjihuaController extends ComController {
    public function View(){

    	$uid = $_GET['uid'];
		$m = M();	
		//XunjianjihuaController控制器 报修view方法的接口调用中显示设备名称shebeiname 完成度的错误bug修复
		$userinfo = M('member')->field('uid,o_id')->where(" uid = '{$uid}'")->find(); 
		

		//dump($userinfo['o_id']);
		if($userinfo['o_id'] == null){
			$this -> json(404,'成功','此用户没有小组');
			break ;
		}
		$oids = explode(',', $userinfo['o_id']);
		foreach ($oids as $key=>$value) {
			//$jihua[$key] = M('jihuas')->where("xiaozu='{$value}'")->select();
			$keshi = M('organization')->field()->where(" id = '{$value}'")->find(); 
			$jihua[$key]['xiaozu'] = $keshi['name'] ;
			$jihua[$key]['datas']  = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success,d.id as zhixing_id FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu = $value");
			foreach ($jihua[$key]['datas'] as $k=>$v) {
				$shebei =  explode(',', $v['shebeiids']);
				$she = array();
				//print_r($shebei);echo "<br>";

				$i=0;
				$j=0;
				foreach ($shebei as $keys=>$values) {
					$name = $this -> shebei($values); 
					//print_r($values);echo "<br>";
					$she[$keys]= $name['name'];
					$i++;
					$a = $v['zhixing_id'];
					$b = $values;
					$zhixingresult = M('zhixingshebei')->field('success')->where(" zhixingid = '{$a}' and shebeiid= '{$b}'")->find(); 
					if($zhixingresult){
						if ($zhixingresult['success'] == 1) {
						# code...
							$j++;
						}
					}
					// echo "<pre>";
					// echo $a;
					// echo '<br>';
					// echo $b;
					// echo "</pre>";


					//echo "<br>";
				}
				//$shebei = $she;
				//print_r($shebei);
				//echo "<br>";echo "<br>";
				//$jihua[$k]['shebeiname'] = $shebei[$keys];
				$jihua[$key]['datas'][$k]['shebeiname'] = $she;
				$jihua[$key]['datas'][$k]['shebei'] = $i;
				$jihua[$key]['datas'][$k]['fshebei'] = $j;

			}
			//print_r($jihua[$key]);
			//echo "<br>";echo "<br>";echo "<br>";echo "<br>";
		}
		
			//print_r($jihua);
		$this -> json(208,'成功',$jihua);
		

    }
	

}
