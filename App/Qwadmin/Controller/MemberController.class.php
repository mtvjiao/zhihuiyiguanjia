<?php


namespace Qwadmin\Controller;
use Qwadmin\Controller\ComController;
class MemberController extends ComController {
    public function index(){
		

		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$field = isset($_POST['field'])?$_POST['field']:'';
		$keyword = isset($_POST['keyword'])?htmlentities($_POST['keyword']):'';
		$order = isset($_POST['order'])?$_POST['order']:'DESC';
		$where = '';
		
		$prefix = C('DB_PREFIX');
		if($order == 'asc'){
			$order = "{$prefix}member.t asc";
		}elseif(($order == 'desc')){
			$order = "{$prefix}member.t desc";
		}else{
			$order = "{$prefix}member.uid asc";
		}
		if($keyword <>''){
			if($field=='user'){
				$where = "{$prefix}member.user LIKE '%$keyword%'";
			}
			if($field=='phone'){
				$where = "{$prefix}member.phone LIKE '%$keyword%'";
			}
			if($field=='qq'){
				$where = "{$prefix}member.qq LIKE '%$keyword%'";
			}
			if($field=='email'){
				$where = "{$prefix}member.email LIKE '%$keyword%'";
			}
		}
		
		$user = M('member');
		$pagesize =20;#每页数量
		$offset = $pagesize*($p-1);//计算记录偏移量
		$count = $user->count();
		
		$list  = $user->field("{$prefix}member.*,{$prefix}auth_group.id as gid,{$prefix}auth_group.title")->order($order)->join("{$prefix}auth_group_access ON {$prefix}member.uid = {$prefix}auth_group_access.uid")->join("{$prefix}auth_group ON {$prefix}auth_group.id = {$prefix}auth_group_access.group_id")->where($where)->limit($offset.','.$pagesize)->select();
		foreach ($list as $key => $value) {
			# code...
			if (!$value['o_id']) {
				# code...
				$list[$key]['name'] = '';
			}else{
				$oid = explode(',', $value['o_id']);
				$name = '';
				foreach ($oid as $keys=>$values) {
					$oname = M('organization')->field('name')->where('id='.$values)->find();
					//var_dump($oname);
					$name .= '&nbsp'.$oname['name']; 							
				}
				$list[$key]['name'] =$name;

			}
		}
		
		//$user->getLastSql();
		$page	=	new \Think\Page($count,$pagesize); 
		$page = $page->show();
        $this->assign('list',$list);	
        $this->assign('page',$page);
		$group = M('auth_group')->field('id,title')->select();
		$this->assign('group',$group);
		$this -> display();
    }


//2016.9.5  新增view查看指定科室下的用户	
    public function view(){
		

		$id = intval($_GET['id']);
		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$field = isset($_POST['field'])?$_POST['field']:'';
		$keyword = isset($_POST['keyword'])?htmlentities($_POST['keyword']):'';
		$order = isset($_POST['order'])?$_POST['order']:'DESC';
		$where = '';
		
		$prefix = C('DB_PREFIX');
		if($order == 'asc'){
			$order = "{$prefix}member.t asc";
		}elseif(($order == 'desc')){
			$order = "{$prefix}member.t desc";
		}else{
			$order = "{$prefix}member.uid asc";
		}
		if($keyword <>''){
			if($field=='user'){
				$where = "{$prefix}member.user LIKE '%$keyword%'";
			}
			if($field=='phone'){
				$where = "{$prefix}member.phone LIKE '%$keyword%'";
			}
			if($field=='qq'){
				$where = "{$prefix}member.qq LIKE '%$keyword%'";
			}
			if($field=='email'){
				$where = "{$prefix}member.email LIKE '%$keyword%'";
			}
		}
		
		
		$user = M('member');
		if(!$field){
		$bumenname =  M('organization') ->field("name") ->where("id = {$id}")->find();	
		//var_dump($bumenname);
		$this->assign('bumenname',$bumenname);	
		
		$list  = $user->field("{$prefix}member.*,{$prefix}auth_group.id as gid,{$prefix}auth_group.title,{$prefix}organization.name")->order($order)->join("{$prefix}auth_group_access ON {$prefix}member.uid = {$prefix}auth_group_access.uid")->join("{$prefix}auth_group ON {$prefix}auth_group.id = {$prefix}auth_group_access.group_id")->join("{$prefix}organization ON {$prefix}organization.id = {$prefix}member.o_id and {$prefix}member.o_id like '%{$id}%'")->where($where)->select();	
		//var_dump($list);
		foreach ($list as $key=>$value) {
			$oid = explode(',',$value['o_id']);
			$a = 0;
			foreach ($oid as $keys=>$values) {
				
		        //echo intval($values).'<br>';
				if(intval($values) == $id){
				//$j = $i ;
				break;
				}
				//var_dump($values);
				//var_dump($i);
				
				$a++;
				
			}
				//var_dump($i);
			$oguanli = explode(',',$value['guanli']);
				//var_dump($oguanli[$a]);
			$list[$key]['guanliid'] = intval($oguanli[$a]) ;
				//var_dump($list[$key]);
		}
//var_dump($list);





		}else{
		//$where .= "and {$prefix}member.o_id != '{$id}'";

		$list  = $user->field("{$prefix}member.*,{$prefix}auth_group.id as gid,{$prefix}auth_group.title,{$prefix}organization.name")->order($order)->join("{$prefix}auth_group_access ON {$prefix}member.uid = {$prefix}auth_group_access.uid")->join("{$prefix}auth_group ON {$prefix}auth_group.id = {$prefix}auth_group_access.group_id")->join("{$prefix}organization ON {$prefix}organization.id = {$prefix}member.o_id and {$prefix}member.o_id not LIKE '%{$id}%'")->where($where)->select();

}
		
		//$user->getLastSql();

        $this->assign('cid',$id);	
        $this->assign('list',$list);	
        $this->assign('page',$page);
		$group = M('auth_group')->field('id,title')->select();
		$this->assign('group',$group);
		$this -> display();
    }
	



	public function del(){
		
		$uids = isset($_REQUEST['uids'])?$_REQUEST['uids']:false;
		//uid为1的禁止删除
		if($uids==1 or !$uids){
			$this->error('参数错误！');
		}
		if(is_array($uids)) 
		{
			foreach($uids as $k=>$v){
				if($v==1){//uid为1的禁止删除
					unset($uids[$k]);
				}
				$uids[$k] = intval($v);
			}
			if(!$uids){
				$this->error('参数错误！');
				$uids = implode(',',$uids);
			}
		}

		$map['uid']  = array('in',$uids);
		if(M('member')->where($map)->delete()){
			M('auth_group_access')->where($map)->delete();
			addlog('删除会员UID：'.$uids);
			$this->success('恭喜，用户删除成功！');
		}else{
			$this->error('参数错误！');
		}
	}
	public function yichu(){
		
		//$uids = isset($_REQUEST['uids'])?$_REQUEST['uids']:false;
		//uid为1的禁止删除
			$cid = $_REQUEST['cid'];
			$uid = isset($_REQUEST['uids'])?$_REQUEST['uids']:false;
			//print_r($_POST);
			//exit();
			//$uid = $_GET['uid'];
			//$pid = 41 ;
			//$uid = 4 ;
 			$q = M('member')->where("uid = '{$uid}'")->find();
			//echo  M('member')->getLastSql();
			$o_id = $q['o_id'];
			
			//echo json_encode($o_id);

			$o_id = explode(',',$o_id);
			$guanli = $q['guanli'];
			$guanli = explode(',',$guanli);
			foreach ($o_id as $key=>$value) {
				if($value = $cid){
					$a = $key ;
				}
				
			}
			//var_dump($a);
			array_splice($o_id,$a,1); 
			array_splice($guanli,$a,1);
			$data['o_id'] = implode(',',$o_id); 
			$data['guanli'] = implode(',',$guanli);
			//M('member')->data($data)->where("uid = '$uid'")->save();
		if(M('member')->data($data)->where("uid = '$uid'")->save()){
			
			$this->success('恭喜，用户移除小组成功！');
		}else{
			$this->error('参数错误！');
		}
	}
	public function guanli(){  //9.6   小组管理员设置
		
		$uid = isset($_REQUEST['uid'])?$_REQUEST['uid']:false;
		$cid = isset($_REQUEST['cid'])?$_REQUEST['cid']:false;
		//uid为1的禁止删除
		if($uid==1 or !$uid){
			$this->error('参数错误！');
		}
		$o =  M('member')->field('o_id,guanli')->where("uid=$uid")->find();
		
			$oid = explode(',',$o['o_id']);
			$i = 0;
			foreach ($oid as $key=>$values) {
				if($values == $cid){
				break;
				}
				$i++;
			}
			$oguanli = explode(',',$o['guanli']);
			$oguanli[$i] = 1 ;
			$data['guanli'] = implode(",",$oguanli); 


		//$data['guanli'] = 1;
		//$map['uid']  = array('in',$uids);
		 M('member')->data($data)->where("uid=$uid")->save();
			$this->success('恭喜，设置成功！');
	}
	public function qguanli(){  //9.6   取消小组管理员设置
		
		$uid = isset($_REQUEST['uid'])?$_REQUEST['uid']:false;
		$cid = isset($_REQUEST['cid'])?$_REQUEST['cid']:false;
		//uid为1的禁止删除
		if($uid==1 or !$uid){
			$this->error('参数错误！');
		}
		//uid为1的禁止删除
		$o =  M('member')->field('o_id,guanli')->where("uid=$uid")->find();
		
			$oid = explode(',',$o['o_id']);
			$i = 0;
			foreach ($oid as $key=>$values) {
				if($values == $cid){
				break;
				}
				$i++;
			}
			$oguanli = explode(',',$o['guanli']);
			$oguanli[$i] = 0 ;
			$data['guanli'] = implode(",",$oguanli); 

		//$map['uid']  = array('in',$uids);
		 M('member')->data($data)->where("uid=$uid")->save();
			$this->success('恭喜，设置成功！');
	}
	public function jinru(){  //9.8   拉入小组设置
		
		$uid = isset($_REQUEST['uid'])?$_REQUEST['uid']:false;
		$cid = isset($_REQUEST['cid'])?$_REQUEST['cid']:false;
		//uid为1的禁止删除
		if($uid==1 or !$uid){
			$this->error('参数错误！');
		}
		$o =  M('member')->field('o_id,guanli')->where("uid=$uid")->find();
		//var_dump($o_ids);
		$data['o_id'] = $o['o_id'].','.$cid;
		$data['guanli'] = $o['guanli'].',0';
		//$map['uid']  = array('in',$uids);
		 M('member')->data($data)->where("uid=$uid")->save();
			$this->success('恭喜，设置成功！');
	}
	
	public function edit(){
		
		$uid = isset($_GET['uid'])?intval($_GET['uid']):false;
		if($uid){	
			//$member = M('member')->where("uid='$uid'")->find();
			$prefix = C('DB_PREFIX');
			$user = M('member');
			$member  = $user->field("{$prefix}member.*,{$prefix}auth_group_access.group_id")->join("{$prefix}auth_group_access ON {$prefix}member.uid = {$prefix}auth_group_access.uid")->where("{$prefix}member.uid=$uid")->find();

		}else{
			$this->error('参数错误！');
		}
		
		$usergroup = M('auth_group')->field('id,title')->select();
		$this->assign('usergroup',$usergroup);

		$usergroups = M('organization')->field('id,name')->order('id asc')->select();
	//var_dump($usergroups);
		$this->assign('usergroups',$usergroups);

		$this->assign('member',$member);
		$this -> display();
	}
	
	public function update($ajax=''){
		if($ajax=='yes'){
			$uid = I('get.uid',0,'intval');
			$gid = I('get.gid',0,'intval');
			M('auth_group_access')->data(array('group_id'=>$gid))->where("uid='$uid'")->save();
			die('1');
		}
		
		$uid = isset($_POST['uid'])?intval($_POST['uid']):false;
		$user = isset($_POST['user'])?htmlspecialchars($_POST['user'], ENT_QUOTES):'';
		$group_id = isset($_POST['group_id'])?intval($_POST['group_id']):0;
		$o_id = isset($_POST['o_id'])?intval($_POST['o_id']):0;
		if(!$group_id){
			$this->error('请选择用户组！');
		}
		$password = isset($_POST['password'])?trim($_POST['password']):false;
		if($password) {
			$data['password'] = password($password);
		}
		$head = I('post.head','','strip_tags');
		$token = password(uniqid(rand(), TRUE));
		$salt = random(10);
		$identifier = password($user['uid'].md5($user['user'].$salt));
		$auth = $identifier.','.$token;
		$data['sex'] = isset($_POST['sex'])?intval($_POST['sex']):0;
		$data['head'] = $head?$head:'';
		$data['birthday'] = isset($_POST['birthday'])?strtotime($_POST['birthday']):0;
		$data['phone'] = isset($_POST['phone'])?trim($_POST['phone']):'';
		$data['qq'] = isset($_POST['qq'])?trim($_POST['qq']):'';
		$data['email'] = isset($_POST['email'])?trim($_POST['email']):'';
		$data['identifier'] =$identifier;	
		$data['token'] = $token;
		$data['salt'] =$salt;
		$data['o_id'] =$o_id;
		$data['t'] = time();
		if(!$uid){
			if($user==''){
				$this->error('用户名称不能为空！');
			}
			if(!$password){
				$this->error('用户密码不能为空！');
			}
			if(M('member')->where("user='$user}'")->count()){
				$this->error('用户名已被占用！');
			}
			$data['user'] = $user;
			$uid = M('member')->data($data)->add();
			M('auth_group_access')->data(array('group_id'=>$group_id,'uid'=>$uid))->add();
			addlog('新增会员，会员UID：'.$uid);
		}else{
			M('auth_group_access')->data(array('group_id'=>$group_id))->where("uid=$uid")->save();
			M('member')->data($data)->where("uid=$uid")->save();
			addlog('编辑会员信息，会员UID：'.$uid);
		}
		$this->success('操作成功！');
	}
	
	
	public function add(){

		$usergroup = M('auth_group')->field('id,title')->select();
		$this->assign('usergroup',$usergroup);
	//     $usergroups = M('organization')->field('id,name')->order('id asc')->select();
	// //var_dump($usergroups);
	// 	$this->assign('usergroups',$usergroups);

		$option = M('organization')->order('id ASC')->select();
		$option = $this->getMenu($option);
		$this->assign('option',$option);
		$this -> display();
	}
	
	
	
	
	//用户登陆统计 后台显示 2017/3/9
	    public function loginlist(){

			$p = isset($_GET['p'])?intval($_GET['p']):'1';
			$t = time()-3600*24*60;
			$log = M('login');
			// $log->where("t < $t")->delete();//删除60天前的日志
			$pagesize = 25;#每页数量
			$offset = $pagesize*($p-1);//计算记录偏移量
			$count = $log->count();
			$list = $log->order('id desc')->limit($offset.','.$pagesize)->select();
			$page	=	new \Think\Page($count,$pagesize); 
			$page = $page->show();
	        $this->assign('list',$list);	
	        $this->assign('page',$page);	        
	        $this -> display();
	    }
	
	
	    public function search(){
		

		$p = isset($_GET['p'])?intval($_GET['p']):'1';
		$field = isset($_GET['field'])?$_GET['field']:'';
		$keyword = isset($_GET['keyword'])?htmlentities($_GET['keyword']):'';
		$order = isset($_GET['order'])?$_GET['order']:'DESC';
		$where = '';
		
		$prefix = C('DB_PREFIX');
		if($order == 'asc'){
			$order = "{$prefix}member.t asc";
		}elseif(($order == 'desc')){
			$order = "{$prefix}member.t desc";
		}else{
			$order = "{$prefix}member.uid asc";
		}
		if($keyword <>''){
			if($field=='user'){
				$where = "{$prefix}member.user LIKE '%$keyword%'";
			}
			if($field=='phone'){
				$where = "{$prefix}member.phone LIKE '%$keyword%'";
			}
			if($field=='qq'){
				$where = "{$prefix}member.qq LIKE '%$keyword%'";
			}
			if($field=='email'){
				$where = "{$prefix}member.email LIKE '%$keyword%'";
			}
		}
		
		$user = M('member');
		$pagesize =10;#每页数量
		$offset = $pagesize*($p-1);//计算记录偏移量
		$count = $user->count();
		
		$list  = $user->field("{$prefix}member.*,{$prefix}auth_group.id as gid,{$prefix}auth_group.title,{$prefix}organization.name")->order($order)->join("{$prefix}auth_group_access ON {$prefix}member.uid = {$prefix}auth_group_access.uid")->join("{$prefix}auth_group ON {$prefix}auth_group.id = {$prefix}auth_group_access.group_id")->join("{$prefix}organization ON {$prefix}organization.id = {$prefix}member.o_id")->where($where)->limit($offset.','.$pagesize)->select();
		
		//$user->getLastSql();
		$page	=	new \Think\Page($count,$pagesize); 
		$page = $page->show();
        $this->assign('list',$list);	
        $this->assign('page',$page);
		$group = M('auth_group')->field('id,title')->select();
		$this->assign('group',$group);
		$this -> display(index);
    }


	
	
	
}