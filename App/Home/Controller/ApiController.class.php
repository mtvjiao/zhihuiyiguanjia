<?php

namespace Home\Controller;
use Think\Controller;

class ApiController extends ComController {
    public function index(){

		$con = mysql_connect("localhost","root","root");
		  if (!$con){
		  	die('Could not connect: ' . mysql_error());
		  }
		$id = isset($_GET['id'])?$_GET['id']:'2';
		mysql_select_db("hospital");
		$sql ="select * from hospital where id = ".$id." LIMIT 1"; //SQL语句
	 	
		$result = mysql_query($sql,$con); //查询
		$row = mysql_fetch_assoc($result);
		$_SESSION['apidatabase']=$row["database"];
			//define('apidatabase',$row["database"]);
			//$post_data = array ("apidatabase" => $row["database"]);

 		$this->success('正在跳转你所选取的医院', 'index.php');
    }
	
    public function api(){

		$con = mysql_connect("localhost","root","root");
		  if (!$con){
		  	die('Could not connect: ' . mysql_error());
		  }
		$id = isset($_GET['id'])?$_GET['id']:'2';
		mysql_select_db("hospital");
		$sql ="select * from hospital where id = ".$id." LIMIT 1"; //SQL语句
	 	
		$result = mysql_query($sql,$con); //查询
		$row = mysql_fetch_assoc($result);
		$_SESSION['apidatabase']=$row["database"];


 		$this->json(200, '已选定您的医院',$row["database"]);
    }
	
}