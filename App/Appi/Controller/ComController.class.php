<?php


namespace Appi\Controller;
use Think\Controller;
use Think\Auth;

class ComController extends Controller {

	public function _initialize(){
		C(setting());
		$flag = false;
        $auth = cookie('auth');
      //  echo "1";
        if($auth){
	 		list($identifier, $token) = explode(',', $auth);
			if (ctype_alnum($identifier) && ctype_alnum($token)) {
				$user = M('member')->field('uid,user,identifier,token,salt')->where(array('identifier'=>$identifier))->find();
				
				if($user) {
					if($token == $user['token'] && $user['identifier'] == password($user['uid'].md5($user['user'].$user['salt']))){
						$flag = true;
						$this->USER = $user;
					}
				}
			}
	        //var_dump($user['token']);

      	
        }
       
    //     	if (!$flag) {
				// $result = array(
				// 	'code' => 111,
				// 	'message' => ""
				// );

				// echo json_encode($result);
				// exit();
	   //      }else{
    //    		 //echo "1";

	   //      }

        $m                     = M();
        $prefix                = C('DB_PREFIX');
        $UID                   = $user['uid'];
        $userinfo              = $m->query("SELECT * FROM {$prefix}auth_group g left join {$prefix}auth_group_access a on g.id=a.group_id where a.uid=$UID");
        $Auth                  = new Auth();
        $allow_controller_name = array('Upload'); //放行控制器名称
        $allow_action_name     = array(); //放行函数名称
        // $name = strtolower(CONTROLLER_NAME . '/' . ACTION_NAME);
        // $authList = $Auth->getAuthList($UID,1);
        //  dump($authList);
       
        // dump($Auth->check(CONTROLLER_NAME . '/' . ACTION_NAME, $UID));
        if ($userinfo[0]['group_id'] != 1 && !$Auth->check(CONTROLLER_NAME . '/' . ACTION_NAME, $UID) ) {
            exit();
        }      
        
    }
	

		public function json($code, $message = '', $data = array()) {
		
			if(!is_numeric($code)) {
				return '';
			}
			//$message = iconv("GB2312","UTF-8",$message) ;
			$result = array(
				'code' => $code,
				'message' => $message,
				'data' => $data
			);

			echo json_encode($result);
			exit;
		}
		
		public function shebeibz($shebeiid) {  
			$name = M('shebei')->field('bz')->where(" id = '{$shebeiid}'")->find(); 
			return $name['bz'];
		}


		public function shebei($shebeiid) {  
			$name = M('shebei')->field('name')->where(" id = '{$shebeiid}'")->find(); 
			return $name;
		}
		public function shebeiarea($shebeiid) {   
			$name = M('shebei')->field('area')->where(" id = '{$shebeiid}'")->find(); 
			return $name['area'];
		}
		public function area($areaid) {   //»ñÈ¡Éè±¸Â¥²ã·½·¨
			$areaname = M('area')->where(" id = '{$areaid}'")->find();
			$ceng = $areaname['name'];
			if ($areaname['pid'] != 0) {
				# code...
				$pid = $areaname['pid'];
				$lou = M('area')->where(" id = '{$pid}'")->find(); 
				$name = $lou['name'].$ceng ;
			}else{
				$name = $ceng ;
			}

			return $name;
		}
		    public function sumf($day) { 
        $risum = M('jihuas') -> field('id') ->where("zhouqi = ".$day)->select();
        if (!$risum) {
            # code...
            $xiaozusums = 0;
        }else {
            # code...
            foreach ($risum as $k=>$v) {
            $xiaozusum = M('jihuazhixing') ->where("jihuasid = ".$v['id'])->count();
            $xiaozusums += $xiaozusum;

            }
        }
       
        return $xiaozusums;
    }
    public function sumc($day) { 
        $risum = M('jihuas') -> field('id') ->where("zhouqi = ".$day)->select();
        if (!$risum) {
            # code...
            $xiaozusumfs = 0;
        }else {
            foreach ($risum as $k=>$v) {
                $xiaozusumf = M('jihuazhixing') ->where("success = '1' and jihuasid = ".$v['id'])->count();
                $xiaozusumfs += $xiaozusumf;
            }
        }
        return $xiaozusumfs;
    }
	    public function username($userid) {   //»ñÈ¡ÓÃ»§Ãû
	        $name = M('member')->field('user')->where(" uid = '{$userid}'")->find(); 
	        return $name;
	    }
	    public function xiaozuname($xiaozu) {   //»ñÈ¡ÓÃ»§Ãû
	        $name = M('organization')->field('name')->where(" id = '{$xiaozu}'")->find(); 
	        return $name;
	    }

		public function getCurMonthFirstDay($date) {   //Ò»¸öÈÕÆÚ£¬»ñÈ¡Æä±¾ÔÂµÄµÚÒ»Ìì
			return date('Y-m-01', strtotime($date));
		}
		
		public function getCurMonthLastDay($date) {    //Ò»¸öÈÕÆÚ£¬»ñÈ¡Æä±¾ÔÂµÄ×îºóÒ»Ìì
			return date('Y-m-d', strtotime(date('Y-m-01', strtotime($date)) . ' +1 month -1 day'));
		}
		public function getCurjiduFirstDay($date) {   //Ò»¸öÈÕÆÚ£¬»ñÈ¡Æä±¾ÔÂµÄµÚÒ»Ìì
			//$date = getdate();
			$season = ceil((date('n'))/3);
			return date('Y-m-d H:i:s', mktime(0, 0, 0,$season*3-3+1,1,date('Y')));
			//$end = mktime(0,0,0,$start+3,1,$year); //µ±¼¾×îºóÒ»ÌìµÄÊ±¼ä´Á		
		}
		
		public function getCurjiduLastDay() {    //Ò»¸öÈÕÆÚ£¬»ñÈ¡Æä±¾ÔÂµÄ×îºóÒ»Ìì
			$season = ceil((date('n'))/3);//µ±ÔÂÊÇµÚ¼¸¼¾¶È
			return date('Y-m-d H:i:s', mktime(23,59,59,$season*3,date('t',mktime(0, 0 , 0,$season*3,1,date("Y"))),date('Y')));
		}
		
	//ÓÅ»¯Ñ²¼ì¼Æ»®×Ô¶¯Ö´ÐÐµÄcomÀà  2016.12.29	
		public function makejihua($day,$y,$m,$d,$type) {   
		
		$Model = M();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and a.zhouqi = '.$day;//²éÕÒ¼Æ»®Ö´ÐÐ±í ×´Ì¬Îª¿ªÊ¼ÖÐ  zt=1

		$voList = $Model->query($sql);		 // $rijihua=M('jihuazhixing')->where("zt=1")->select(); // 

		if($voList){
			echo "ÓÐ¼Æ»®"; //ÓÐÈÕ¼Æ»®Çé¿ö Í¬Ê±ÐÞ¸Ä3¸ö±í ¼Æ»®±í×´Ì¬ ¸Ä±äÎªÒÑ¼Æ»®¹Ø±Õ   ¼Æ»®Ö´ÐÐ±í×´Ì¬¸Ä±äÎª¼Æ»®¹Ø±Õ 
			               // ¼Æ»®Éè±¸±í×´Ì¬¸Ä±äÎª¼Æ»®¹Ø±Õ   ´ËÈý±í²Ù×÷ ÓÃµ½sql ÊÂÎñ
						   // Ö´ÐÐÍê±ÏÉÏÊö²Ù×÷  ¼ÌÐøÖ´ÐÐ 3±í²Ù×÷ ¼Æ»®±í×´Ì¬ ¸Ä±äÎªÒÑ¼Æ»®Æô¶¯ ÐÂÔö¼Æ»®Ö´ÐÐ±í                              ÐÂÔö¼Æ»®Éè±¸±í£¬Í¬Ê±Òª×¢Òâ£¬´Ë²Ù×÷ÔÚÒ»¸ö´óÑ­»·ÏÂÑ­»·Ö´ÐÐ
		   
			foreach ($voList as $key=>$value) {
				
				
				$Model->startTrans();	 //ÊÂÎñ¿ªÊ¼
				$flag=false;
							
				$data['zt'] = 2;
				if(M('jihuazhixing')->data($data)->where("id='{$value[zhixingids]}'")->save()){
					$flag=true;
				}else{
					$flag=false;
				}
				
				//¸Ä±ä´ËÖ´ÐÐ¼ÇÂ¼µÄ×´Ì¬
				//\Think\Log::write("²»Í¨¹ý",'WARN');
				//\Think\Log::write('²âÊÔÈÕÖ¾ÐÅÏ¢£¬ÕâÊÇ¾¯¸æ¼¶±ð£¬²¢ÇÒÊµÊ±Ð´Èë','WARN');

				$xinzhixing['jihuasid'] = $value['id'];
				$xinzhixing['zt'] = 1;
				$xinzhixing['success'] = 0;


				$zero1 = strtotime(date("y-m-d h:i:s"));//µ±Ç°Ê±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È ÒÔ·ÀÖ´ÐÐ³ÌÐòÊ±¼äÌ«³¤ ¿çÌì
				$zero = mktime(23,59,59,$m,$d,$y);//Ö´ÐÐÊ±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È
				if($zero1 < $zero){
					$dday = $d+1;
				}else{
					$dday = $d;
				}
				$allday = date("t");
				//date("Y-m-d H:i:s",strtotime("+7 days"));
				$xinzhixing['starttime'] = mktime(0,0,0,$m,$dday,$y);
				if ($type==1) {
					# code...
					$xinzhixing['stoptime'] = mktime(23,59,59,$m,$dday,$y);
				}elseif ($type==2) {
					$xinzhixing['stoptime'] = mktime(23,59,59,$m,$dday+7,$y);
				}elseif ($type==3) {

					$xinzhixing['stoptime'] = mktime(23,59,59,$m+1,$allday,$y);
				}elseif ($type==4) {
					$xinzhixing['stoptime'] = mktime(23,59,59,$m+3,$allday,$y);
				}elseif ($type==5) {
					$xinzhixing['stoptime'] = mktime(23,59,59,$m,$allday,$y+1);
				}
				
				if($id = M('jihuazhixing')->data($xinzhixing)->add()){
					$flag=true;
				}else{
					$flag=false;
				}
				//var_dump($id);


				$shebeiids = $value['shebeiids'] ;
				$shebeiarray = explode(',',$shebeiids);
					foreach ($shebeiarray as $k=>$v) {
						$shebei['zt'] = 2;
						M('zhixingshebei')->data($shebei)->where("shebeiid='{$v}' and zhixingid='{$value[zhixingids]}' and zt = '1'")->save(); //¸Ä±ä´ËÖ´ÐÐÉè±¸×´Ì¬
						$xinshebei['zhixingid'] = $id ;
						$xinshebei['shebeiid'] = $v ;
						$xinshebei['zt'] = 1 ;
						
						
						
						M('zhixingshebei')->data($xinshebei)->add();
					}
				$jihuas['cishu'] = $value['cishu'] + 1;
				$jihuas['zhixingid'] = $id;
				if(M('jihuas')->data($jihuas)->where("id='{$value[id]}'")->save()){ //Ñ²¼ì¼ÇÂ¼Æô¶¯+1
					$flag=true;
				}else{
					$flag=false;
				}
				
			   if(!$flag){ 
					 $Model->rollback();
				}else{
					 $Model->commit();
			   }
				
			}
			
			
		}else{
		
			echo "ÎÞÈÕ¼Æ»®";
		}
		
		$sqls = 'SELECT *  FROM qw_jihuas  where zt = 0 and zhouqi = '.$day;//²éÕÒ¼Æ»®Ö´ÐÐ±í ×´Ì¬Îª¿ªÊ¼ÖÐ  zt=1
		var_dump($voList);
		$voLists = $Model->query($sqls);		
		
				if($voLists){
					foreach ($voLists as $key=>$value) {
					$data['zt'] = 1;
					M('jihuas')->data($data)->where("id='{$value[id]}'")->save(); //¸Ä±ä´ËÖ´ÐÐ¼ÇÂ¼µÄ×´Ì¬
					$xinzhixing['jihuasid'] = $value['id'];
					$xinzhixing['zt'] = 1;
					$xinzhixing['success'] = 0;
	
	
					$zero1 = strtotime(date("y-m-d h:i:s"));//µ±Ç°Ê±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È ÒÔ·ÀÖ´ÐÐ³ÌÐòÊ±¼äÌ«³¤ ¿çÌì
					$zero = mktime(23,59,59,$m,$d,$y);//Ö´ÐÐÊ±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È
					if($zero1 < $zero){
						$dday = $d+1;
					}else{
						$dday = $d;
					}
					
					$xinzhixing['starttime'] = mktime(0,0,0,$m,$dday,$y);
					$xinzhixing['stoptime'] = mktime(23,59,59,$m,$dday,$y);
					$id = M('jihuazhixing')->data($xinzhixing)->add();
					$shebeiids = $value['shebeiids'] ;
					$shebeiarray = explode(',',$shebeiids);
						foreach ($shebeiarray as $k=>$v) {

							$xinshebei['zhixingid'] = $id ;
							$xinshebei['shebeiid'] = $v ;
							$xinshebei['zt'] = 1 ;
							
							M('zhixingshebei')->data($xinshebei)->add();
						}
					$jihuas['cishu'] = $value['cishu'] + 1;
					$jihuas['zhixingid'] = $id;
					M('jihuas')->data($jihuas)->where("id='{$value[id]}'")->save(); //Ñ²¼ì¼ÇÂ¼Æô¶¯+1
				}
				
				}


		}
		










		public function makexgjihua($day,$y,$m,$d) {   
		
		$Model = M();
		$sql = 'SELECT a.*,b.id as zhixingids  FROM qw_xgjihuas a left join qw_xgjihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and a.zhouqi = '.$day;//²éÕÒ¼Æ»®Ö´ÐÐ±í ×´Ì¬Îª¿ªÊ¼ÖÐ  zt=1
		$voList = $Model->query($sql);		 // $rijihua=M('jihuazhixing')->where("zt=1")->select(); // 

		if($voList){
			echo "ÓÐ¼Æ»®"; //ÓÐÈÕ¼Æ»®Çé¿ö Í¬Ê±ÐÞ¸Ä3¸ö±í ¼Æ»®±í×´Ì¬ ¸Ä±äÎªÒÑ¼Æ»®¹Ø±Õ   ¼Æ»®Ö´ÐÐ±í×´Ì¬¸Ä±äÎª¼Æ»®¹Ø±Õ 
			               // ¼Æ»®Éè±¸±í×´Ì¬¸Ä±äÎª¼Æ»®¹Ø±Õ   ´ËÈý±í²Ù×÷ ÓÃµ½sql ÊÂÎñ
						   // Ö´ÐÐÍê±ÏÉÏÊö²Ù×÷  ¼ÌÐøÖ´ÐÐ 3±í²Ù×÷ ¼Æ»®±í×´Ì¬ ¸Ä±äÎªÒÑ¼Æ»®Æô¶¯ ÐÂÔö¼Æ»®Ö´ÐÐ±í                              ÐÂÔö¼Æ»®Éè±¸±í£¬Í¬Ê±Òª×¢Òâ£¬´Ë²Ù×÷ÔÚÒ»¸ö´óÑ­»·ÏÂÑ­»·Ö´ÐÐ
		   
			foreach ($voList as $key=>$value) {
				
				
				$Model->startTrans();	 //ÊÂÎñ¿ªÊ¼
				$flag=false;
							
				$data['zt'] = 2;
				if(M('xgjihuazhixing')->data($data)->where("id='{$value[zhixingids]}'")->save()){
					$flag=true;
				}else{
					$flag=false;
				}
				//¸Ä±ä´ËÖ´ÐÐ¼ÇÂ¼µÄ×´Ì¬
				//\Think\Log::write("²»Í¨¹ý",'WARN');
				//\Think\Log::write('²âÊÔÈÕÖ¾ÐÅÏ¢£¬ÕâÊÇ¾¯¸æ¼¶±ð£¬²¢ÇÒÊµÊ±Ð´Èë','WARN');
				$xinzhixing['jihuasid'] = $value['id'];
				$xinzhixing['zt'] = 1;
				$xinzhixing['success'] = 0;


				$zero1 = strtotime(date("y-m-d h:i:s"));//µ±Ç°Ê±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È ÒÔ·ÀÖ´ÐÐ³ÌÐòÊ±¼äÌ«³¤ ¿çÌì
				$zero = mktime(23,59,59,$m,$d,$y);//Ö´ÐÐÊ±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È
				if($zero1 < $zero){
					$dday = $d+1;
				}else{
					$dday = $d;
				}
				
				$xinzhixing['starttime'] = mktime(0,0,0,$m,$dday,$y);
				$xinzhixing['stoptime'] = mktime(23,59,59,$m,$dday,$y);
				if($id = M('xgjihuazhixing')->data($xinzhixing)->add()){
					$flag=true;
				}else{
					$flag=false;
				}
				//var_dump($id);

				//$project = $value['project'] ;  //Ñ²¸üÏîÄ¿
				$shebeiids = M('xgshebei')->where("projectid='{$value[project]}'")->select();

				// var_dump($id);
				/*$shebeiids = $value['shebeiids'] ;
				$shebeiarray = explode(',',$shebeiids);*/
					foreach ($shebeiids as $k=>$v) {
						//var_dump($v['id']);
						$shebei['zt'] = 2;
						M('xgzhixingshebei')->data($shebei)->where("shebeiid='{$v[id]}' and zhixingid='{$value[zhixingids]}' and zt = '1'")->save(); //¸Ä±ä´ËÖ´ÐÐÉè±¸×´Ì¬
						$xinshebei['zhixingid'] = $id ;
						$xinshebei['shebeiid'] = $v['id'];
						$xinshebei['zt'] = 1 ;
						
						
						
						M('xgzhixingshebei')->data($xinshebei)->add();
					}
				$jihuas['cishu'] = $value['cishu'] + 1;
				$jihuas['zhixingid'] = $id;
				if(M('xgjihuas')->data($jihuas)->where("id='{$value[id]}'")->save()){ //Ñ²¼ì¼ÇÂ¼Æô¶¯+1
					$flag=true;
				}else{
					$flag=false;
				}
				
			   if(!$flag){ 
					 $Model->rollback();
				}else{
					 $Model->commit();
			   }
				
			}
			
			
		}else{
		
			echo "ÎÞÈÕ¼Æ»®";
		}
		
		$sqls = 'SELECT *  FROM qw_xgjihuas  where zt = 0 and zhouqi = '.$day;//²éÕÒ¼Æ»®Ö´ÐÐ±í ×´Ì¬Îª¿ªÊ¼ÖÐ  zt=0
		$voLists = $Model->query($sqls);		
		
				if($voLists){
					foreach ($voLists as $key=>$value) {
					$data['zt'] = 1;
					M('xgjihuas')->data($data)->where("id='{$value[id]}'")->save(); //¸Ä±ä´ËÖ´ÐÐ¼ÇÂ¼µÄ×´Ì¬
					$xinzhixing['jihuasid'] = $value['id'];
					$xinzhixing['zt'] = 1;
					$xinzhixing['success'] = 0;
	
	
					$zero1 = strtotime(date("y-m-d h:i:s"));//µ±Ç°Ê±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È ÒÔ·ÀÖ´ÐÐ³ÌÐòÊ±¼äÌ«³¤ ¿çÌì
					$zero = mktime(23,59,59,$m,$d,$y);//Ö´ÐÐÊ±¼ä ÒªºÍÖ¸¶¨Ê±¼ä¶Ô±È
					if($zero1 < $zero){
						$dday = $d+1;
					}else{
						$dday = $d;
					}
					
					$xinzhixing['starttime'] = mktime(0,0,0,$m,$dday,$y);
					$xinzhixing['stoptime'] = mktime(23,59,59,$m,$dday,$y);
					$id = M('xgjihuazhixing')->data($xinzhixing)->add();

					$shebeiids = $M('xgshebei')->where("projectid='{$value[project]}'")->select();

					var_dump($id);
					var_dump($shebeiids);

					$shebeiids = $value['shebeiids'] ;
					$shebeiarray = explode(',',$shebeiids);
						foreach ($shebeiarray as $k=>$v) {

							$xinshebei['zhixingid'] = $id ;
							$xinshebei['shebeiid'] = $v ;
							$xinshebei['zt'] = 1 ;
							
							M('xgzhixingshebei')->data($xinshebei)->add();
						}
					$jihuas['cishu'] = $value['cishu'] + 1;
					$jihuas['zhixingid'] = $id;
					M('xgjihuas')->data($jihuas)->where("id='{$value[id]}'")->save(); //Ñ²¼ì¼ÇÂ¼Æô¶¯+1
				}
				
				}


		}

		public function bxname($title,$sid){



				$area = M('area')->field('id,pid,name')->where('id='.$title)->find();
				if (!$area) {
					# code...
					$categorys['areaname'] = null;
				}else{
					$areas = M('area')->field('id,name')->where('id='.$area['pid'])->find();

					$categorys['areaname'] = $areas['name'] . $area['name'];
				}				


	    		$cate = M('category')->field('name')->where('id='.$sid)->find();

	    		$categorys['catename'] = $cate['name'];

	    		return $categorys;
		}







/**
 * 获取某年的每周第一天和最后一天
 * @param  [int] $year [年份]
 * @return [arr]       [每周的周一和周日]
 */
public function get_week($year) {
    $year_start = $year . "-01-01";
    $year_end = $year . "-12-31";
    $startday = strtotime($year_start);
    if (intval(date('N', $startday)) != '1') {
        $startday = strtotime("next monday", strtotime($year_start)); //获取年第一周的日期
    }
    $year_mondy = date("Y-m-d", $startday); //获取年第一周的日期

    $endday = strtotime($year_end);
    if (intval(date('W', $endday)) == '7') {
        $endday = strtotime("last sunday", strtotime($year_end));
    }

    $num = intval(date('W', $endday));
    for ($i = 1; $i <= $num; $i++) {
        $j = $i -1;
        $start_date = date("Y-m-d", strtotime("$year_mondy $j week "));

        $end_day = date("Y-m-d", strtotime("$start_date +6 day"));

        $week_array[$i] = array (
            str_replace("-",
            "-",
            $start_date
        ), str_replace("-", "-", $end_day));
    }
    return $week_array;
}








}