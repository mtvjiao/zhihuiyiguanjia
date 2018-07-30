<?php


namespace Appi\Controller;
use Appi\Controller\ComController;
use Vendor\Tree;

class ProjectController extends ComController {

	public function index(){
		$pid = isset($_GET['pid'])?trim($_GET['pid']):'';

		$categorys = M('project')->field('id,pid,name,orderid')->where("pid='{$pid}'")->order('orderid asc')->select();

		$this -> json(202,'分类项目请求成功',$categorys);
	}
	

}
