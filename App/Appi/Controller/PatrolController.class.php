<?php


namespace Appi\Controller;
use Appi\Controller\ComController;
use Vendor\Tree;

class PatrolController extends ComController {

	public function index(){
		$category = M('patrol')->field('id,name,orderid,img')->order('orderid asc')->select();
			$this -> json(201,'分类请求成功',$category);
	}
	

}
