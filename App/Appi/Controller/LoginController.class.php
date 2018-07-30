<?php


namespace Appi\Controller;
use Common\Controller\BaseController;
use Think\Auth;
class LoginController extends BaseController {
    public function login(){
		$username = isset($_GET['user'])?trim($_GET['user']):'';
		$password = isset($_GET['password'])?trim($_GET['password']):'';
		if ($username=='') {
			$this -> json(501,'用户名不能为空！');
		} elseif ($password=='') {
			$this -> json(502,'密码不能为空！');
		}

		$model = M("Member");
		$user = $model ->field('uid,user')-> where(array('user'=>$username,'password'=>$password)) -> find();
		//var_dump($user);

		if($user) {
			$uid = $user['uid'];
			$m = M();
			$token = password(uniqid(rand(), TRUE));
			$salt = random(10);
			$identifier = password($user['uid'].md5($user['user'].$salt));
			$auth = $identifier.','.$token;
			
			M('member')->data(array('identifier'=>$identifier,'token'=>$token,'salt'=>$salt))->where(array('uid'=>$uid))->save();
			cookie('auth',$auth);

			$userinfo = $m->query("SELECT a.group_id,g.uid,g.version,g.cid FROM qw_member g left join qw_auth_group_access a on g.uid=a.uid where a.uid=$uid");
			//登陆统计  2017/3/9
			$name = M('member')->field('user')->where(" uid = ". $uid)->find(); 
			$data['logintime'] = date('y-m-d H:i:s',time());
			$data['uid'] = $uid ;
			$data['name'] = $name['user'];
			M('login')->data($data)->add();
			$this -> json(200,'登陆成功',$userinfo);
		}else{
			$this -> json(503,'登陆失败');
		}

    }
	
    public function loginout(){
		cookie('auth',null);
		//$url = U("login/index");
		$this -> json(201,'注销成功');
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
}
