<?php
/**
*
* 
* 作    者：七宝<jiaoaixin@126.com>
* 日    期：2016-12-21
* 版    本：1.0.0
* 功能说明：个人中心控制器。
*
**/

namespace Appi\Controller;
use Appi\Controller\ComsController;
use Org\Util\GeTui;
class PushController extends ComsController {

	public function dayremind(){   //提醒
		$xunjianday = C('XUNJIANDAY');	
		$Model = M();
		$gt = new GeTui();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and b.success = 0 and a.zhouqi = '.$xunjianday;//查找计划执行表 状态为开始中  zt=1
		$voList = $Model->query($sql);
		foreach ($voList as $key => $value) {
			# code...
			$q = M('member')->where("o_id like '%{$value['xiaozu']}%'")->select();

			$xiaozuname = $this -> xiaozuname($value['xiaozu']);
			foreach ($q as $k => $v) {
				# code...
				//var_dump($v['cid']);

				$title = $xiaozuname['name'] . "巡检计划提醒";
				$content = "您所在的".$xiaozuname['name']."有未完成的日巡检计划，请尽快完成.";
				$rep = $gt->pushToAndroidApp($v['cid'],$title,$content);
				var_dump($rep);
				echo $v['cid'];
				echo "<pre>";
			}
			
		}
		
/*		$gt = new GeTui();
		$cid = array('2258bfbb1d1d86f3f69c2fa2e1c89482','10c92d2d06f0b567be0c1934e5ce2f75','130930a597331f0df9434d2d8fcd9fae');
		foreach ($cid as $key => $value) {
			# code...
			$rep = $gt->pushToAndroidApp($value);
		}
		

var_dump($rep);*/
// echo ("<br><br>");

	}

	public function dayalert(){  //警报
		$xunjianday = C('XUNJIANDAY');	
		$Model = M();
		$gt = new GeTui();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and b.success = 0 and a.zhouqi = '.$xunjianday;//查找计划执行表 状态为开始中  zt=1
		$voList = $Model->query($sql);
		foreach ($voList as $key => $value) {
			# code...
			$q = M('member')->where("o_id like '%{$value['xiaozu']}%'")->select();

			$xiaozuname = $this -> xiaozuname($value['xiaozu']);
			foreach ($q as $k => $v) {
				# code...
				//var_dump($v['cid']);

				$title = $xiaozuname['name'] . "巡检计划提醒";
				$content = "您所在的".$xiaozuname['name']."有未完成的日巡检计划，马上过期，请抓紧完成.";
				$rep = $gt->pushToAndroidApp($v['cid'],$title,$content);
				var_dump($rep);
			}		
		}
	}


	public function weekremind(){
		$xunjianday = C('XUNJIANWEEK');	
		$Model = M();
		$gt = new GeTui();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and b.success = 0 and a.zhouqi = '.$xunjianweek;//查找计划执行表 状态为开始中  zt=1
		$voList = $Model->query($sql);
		foreach ($voList as $key => $value) {
			# code...
			$q = M('member')->where("o_id like '%{$value['xiaozu']}%'")->select();

			$xiaozuname = $this -> xiaozuname($value['xiaozu']);
			foreach ($q as $k => $v) {
				# code...
				//var_dump($v['cid']);

				$title = $xiaozuname['name'] . "巡检计划提醒";
				$content = "您所在的".$xiaozuname['name']."有未完成的周巡检计划，请尽快完成.";
				$rep = $gt->pushToAndroidApp($v['cid'],$title,$content);
				var_dump($rep);
			}			
		}
	}
	public function weekalert(){
		$xunjianday = C('XUNJIANWEEK');	
		$Model = M();
		$gt = new GeTui();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and b.success = 0 and a.zhouqi = '.$xunjianweek;//查找计划执行表 状态为开始中  zt=1
		$voList = $Model->query($sql);
		foreach ($voList as $key => $value) {
			# code...
			$q = M('member')->where("o_id like '%{$value['xiaozu']}%'")->select();

			$xiaozuname = $this -> xiaozuname($value['xiaozu']);
			foreach ($q as $k => $v) {
				# code...
				//var_dump($v['cid']);

				$title = $xiaozuname['name'] . "巡检计划提醒";
				$content = "您所在的".$xiaozuname['name']."有未完成的周巡检计划，马上过期，请抓紧完成.";
				$rep = $gt->pushToAndroidApp($v['cid'],$title,$content);
				var_dump($rep);
			}			
		}
	}



	public function monthremind(){
		$xunjianmonth = C('XUNJIANMONTH');	
		$Model = M();
		$gt = new GeTui();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and b.success = 0 and a.zhouqi = '.$xunjianmonth;//查找计划执行表 状态为开始中  zt=1
		$voList = $Model->query($sql);
		foreach ($voList as $key => $value) {
			# code...
			$q = M('member')->where("o_id like '%{$value['xiaozu']}%'")->select();

			$xiaozuname = $this -> xiaozuname($value['xiaozu']);
			foreach ($q as $k => $v) {
				# code...
				//var_dump($v['cid']);

				$title = $xiaozuname['name'] . "巡检计划提醒";
				$content = "您所在的".$xiaozuname['name']."有未完成的月巡检计划，请尽快完成.";
				$rep = $gt->pushToAndroidApp($v['cid'],$title,$content);
				var_dump($rep);
			}			
		}
	}
	public function monthalert(){
		$xunjianmonth = C('XUNJIANMONTH');	
		$Model = M();
		$gt = new GeTui();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and b.success = 0 and a.zhouqi = '.$xunjianmonth;//查找计划执行表 状态为开始中  zt=1
		$voList = $Model->query($sql);
		foreach ($voList as $key => $value) {
			# code...
			$q = M('member')->where("o_id like '%{$value['xiaozu']}%'")->select();

			$xiaozuname = $this -> xiaozuname($value['xiaozu']);
			foreach ($q as $k => $v) {
				# code...
				//var_dump($v['cid']);

				$title = $xiaozuname['name'] . "巡检计划提醒";
				$content = "您所在的".$xiaozuname['name']."有未完成的月巡检计划，马上过期，请抓紧完成.";
				$rep = $gt->pushToAndroidApp($v['cid'],$title,$content);
				var_dump($rep);
			}			
		}
	}

}
