<?php


namespace Appi\Controller;
use Appi\Controller\ComController;
use Vendor\Tree;

class ErweiController extends ComController {

	public function index(){

		$erwei = $_GET['erwei'];
		$jihuasid = $_GET['id'];
		$zhixingid = $_GET['zhixingid'];
		$keshi = $_GET['xiaozu'];
		$uid = $_GET['uid'];
		if (!$uid) {
			# code...
			$uid = 0 ;
		}
		
		$str=explode('-',$erwei);//四个分段  
		$patrol=substr($str[0],3,3);
		$project=substr($str[0],6,3);
		$geshu = count($str);
		$categorys = M('patrol')->field('id,name')->where("erweima='{$patrol}'")->find();//大类 名称  消防器材
		$categorysst = M('project')->field('id,name,bz')->where("bz='{$project}' and pid != '0'")->find(); //项目名  消防箱
		$categoryss = M('shebei')->field('id,name,area,bz')->where("erweima='{$str[2]}' and projectid = '{$categorysst[id]}'")->find(); //项目名  消防箱

		$categoryst = M('attribute')->field('id,name')->where("prid='{$categorysst[id]}' and keshi = '{$keshi}'")->find();			
		if(!$categoryst){
			$categoryst = M('attribute')->field('id,name')->where("prid='{$categorysst[id]}' and keshi = '36'")->find();			
		}
		//$categorys['cong'] = "0";// 是否是主设备 0 = 是     1= 不是
		$categoryss['areas'] = $this -> area($categoryss['area']);
		$categorys['xiangmu'] = $categoryss;
		$categorys['project'] = $categorysst;
		//$categorys['xiangmu']['bz'] = "";
		$categorys['xiangmushuxing'] = $categoryst;		
		$shebeiid = $categoryss['id'];
		
		$m = M();
		//$shebeiid = 1111 ;
		$jihuas= M('jihuas')->field()->where(" id = '{$jihuasid}' and zhixingid = '{$zhixingid}'")->find(); 
		$zhixing= M('zhixingshebei')->field()->where(" shebeiid = '{$shebeiid}' and zhixingid = '{$zhixingid}'")->find(); 
		$categorys['sid'] = $zhixing['sid'];
		//var_dump($jihuas['shebeiids']);
		//var_dump($shebeiid);
		if($jihuas){
			$shebeiids = $jihuas['shebeiids'];
			$shebeiids = explode(",", $shebeiids);
			if(in_array($shebeiid,$shebeiids)){
							//2017/3/20 添加扫描间隔时间功能
							$data['time'] = date('y-m-d H:i:s',time());
							$data['uid'] = $uid ;
							$data['erweima'] = $erwei;
							$data['shebeiid'] = $shebeiid;
							$data['name'] = $categoryss['name'];
							//2017 - 4- 13 添加返回节拍器ID  提交时再次确认
							$scanning = M('scanning')->data($data)->add();
							$categorys['scanningid'] = $scanning ;
							//----------------------------------------------------
				$this -> json(201,'二维码扫描成功',$categorys);
			}else{
				$this -> json(404,'此设备不属于本巡检计划');
				//$this -> json(201,'二维码扫描成功',$categorys);
	
			}
		}else{
				$this -> json(404,'此设备不属于本巡检计划');
		}
				
	}
	

}
