<?php


namespace Appi\Controller;
use Appi\Controller\ComController;
use Vendor\Tree;

class SettingController extends ComController {

	public function img(){
				
		$vars = M('setting')->field('v')->where("k='indeximg'")->find();

		$this -> json(202,'请求成功',$vars);
	}
	
	public function banner(){
		
		$vars = M('banner')->order('o')->select();

		$this -> json(202,'请求成功',$vars);
	}

	public function connect(){
		
		$vars = M('connect')->order('o')->select();
		$img = M('setting')->field('v')->where("k='connectimg'")->find();
		$data['connect'] = $vars;
		$data['img'] = $img;

		$this -> json(202,'请求成功',$data);
	}


	public function color(){
		
		$vars = M('setting')->field('v')->where("k='color'")->find();

		$this -> json(202,'请求成功',$vars);
	}

	public function test(){
		# code...
		//可扩展接口。。。
	}



}
