<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
class IndexController extends ComController {
    public function index(){
		
		$model = new \Think\Model();
		$mysql = $model ->query( "select VERSION() as mysql" );
		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$t = time()-3600*24*60;
		$log = M('log');
		$log->where("t < $t")->delete();//删除60天前的日志
		$pagesize = 25;#每页数量
		$offset = $pagesize*($p-1);//计算记录偏移量
		$count = $log->count();
		$list = $log->order('id desc')->limit($offset.','.$pagesize)->select();
		$page	=	new \Think\Page($count,$pagesize); 
		$page = $page->show();
        $this->assign('list',$list);	
        $this->assign('page',$page);

        $this->assign('mysql',$mysql[0]['mysql']);
        $this->assign('nav',array('','',''));//导航				$counts = M('shebei')->field('count(*) as count')->find();


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
		$this->assign('counted',$counted);
		
		
		
		$this -> display(index);
    }

    public function demo(){
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
			$this->assign('counted',$counted);
			$this -> display();

}
    public function demo1(){
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
			$this->assign('counted',$counted);
			$this -> display();

}
    public function biaoge(){
		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$pagesize = 10;#每页数量
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



    public function caozuo(){
		$model = new \Think\Model();
		$mysql = $model ->query( "select VERSION() as mysql" );
		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$t = time()-3600*24*60;
		$log = M('log');
		$log->where("t < $t")->delete();//删除60天前的日志
		$pagesize = 25;#每页数量
		$offset = $pagesize*($p-1);//计算记录偏移量
		$count = $log->count();
		$list = $log->order('id desc')->limit($offset.','.$pagesize)->select();
		$page	=	new \Think\Page($count,$pagesize); 
		$page = $page->show();
        $this->assign('list',$list);	
        $this->assign('page',$page);

        $this->assign('mysql',$mysql[0]['mysql']);
        $this->assign('nav',array('','',''));//导航				$counts = M('shebei')->field('count(*) as count')->find();


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
			$this->assign('counted',$counted);
			$this -> display();

}






}