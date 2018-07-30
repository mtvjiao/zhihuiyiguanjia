<?php


namespace Appi\Controller;
use Common\Controller\BaseController;
use Think\Auth;
class FileController extends ComController {
   
   
   
    public function index(){


		$path = 'upfile';
		$time=time();
		
			if (isset ( $_FILES['file1'] )) {
				
			$fileArray = $_FILES['file1'];//获取多个文件的信息，注意：这里的键名不包含[]
			
			$upload_dir = 'upfile/'; //保存上传文件的目录
			    if (! @file_exists ( $upload_dir )) {
					@mkdir ( $upload_dir );
				}

			    foreach ( $fileArray['error'] as $key => $error) {
					if ( $error == UPLOAD_ERR_OK ) { //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
					
						$temp_name = $fileArray['tmp_name'][$key];
						$file_name = $fileArray['name'][$key];
						move_uploaded_file($temp_name, $upload_dir.$file_name);
						echo '上传[文件'.$key.']成功!<br/>';
					}else {
						echo '上传[文件'.$key.']失败!<br/>';
					}


				}	
		    }
		  }
	













    public function indexs(){

	  // $cid = $_GET['cid'];       //是否是大类（消防箱001）
	   $type = $_GET['type'];       //正常不正常   0 正常  1 不正常
	   $user = $_GET['userid'];   // 用户id
	   
	   $shebeiid = $_GET['shebeiid']; //消防箱001  id  qw_shebei表
	   $shuxingid = $_GET['shuxingid'];  //属性ID
	  // $shuxingtype = $_GET['shuxingtype'];  //属性正不正常

		$path = 'upfile';
		$time=time();
		$upload_dir = 'upfile/'; //保存上传文件的目录

		$data['jlid'] = 1;
		$data['projectid'] = 1;
		$data['zt'] = 1;
		$data['time'] = $time;
		$data['shebeiid'] = $shebeiid;
		$data['name'] = $user;
		$data['ztid'] = $type;
   
		M('projectjl')->data($data)->add();
		$cc=M('projectjl')->order('id desc')->limit(1)->find();


		$datas['prid'] =$cc['id'];

		$datas['jlid'] = 1;
		$datas['projectid'] = 1;
		$datas['attributeid'] = $shuxingid;
		$datas['zt'] = $type;
		$datas['shebeiid'] = $shebeiid;
		
		M('attjl')->data($datas)->add();
		
		$a=M('attjl')->order('id desc')->limit(1)->find();
		
		$datajl['attid'] = $a['id'];
				    	M('jl')->data($datajl)->add();
						$b=M('jl')->order('id desc')->limit(1)->find();
		//var_dump($a);
		
			if (isset ( $_FILES['file1'] )) {
			    $fileArray = $_FILES['file1'];//获取多个文件的信息，注意：这里的键名不包含[]
			    if (! @file_exists ( $upload_dir )) {
					@mkdir ( $upload_dir );
				}
			    foreach ( $fileArray['error'] as $key => $error) {
					if ( $error == UPLOAD_ERR_OK ) { //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
					    
						$temp_name = $fileArray['tmp_name'][$key];
						$file_name = $upload_dir.$fileArray['name'][$key];
						move_uploaded_file($temp_name, $file_name);
						
						$siname = end(explode('.', $file_name));
						
						if($siname == 'jpg'){
						    $datajls['img'] = $file_name ;
							M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
						}
						if($siname == 'mp3'){
						    $datajls['sound'] = $file_name ;
							M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
						}
						
						
						echo '上传[文件'.$key.']成功!<br/>';
					}else {
						echo '上传[文件'.$key.']失败!<br/>';
					}
				}	
		      $this -> json(211,'返回',$id);
		    }
		}















    public function indexa(){

	  // $cid = $_GET['cid'];       //是否是大类（消防箱001）
	   $type = $_GET['type'];       //正常不正常   0 正常  1 不正常
	   $user = $_GET['userid'];   // 用户id

	  // $projectid = $_GET['projectid']; //项目id    8.15 接口新加
	   $projectid = isset($_GET['projectid'])?intval($_GET['projectid']):1;
	   $shebeihao = $_GET['shebeima'];

	   $shebeiid = isset($_GET['shebeiid'])?intval($_GET['shebeiid']):1;
   
	   //$shebeiid = $_GET['shebeiid']; //消防箱001  id  qw_shebei表
	   $shuxingid = $_GET['shuxingid'];  //属性ID
	   $cong = $_GET['cong'];  //// 是否是主设备 0 = 是     1= 不是
	  // $shuxingtype = $_GET['shuxingtype'];  //属性正不正常

		$path = 'upfile';
		$time=time();
		$upload_dir = 'upfile/'; //保存上传文件的目录

		if($cong == '0'){   //如果是主设备   走1.1版相同路径 13553093137
				$data['jlid'] = 1;
				$data['projectid'] = $projectid;
				$data['zt'] = 1;
				$data['time'] = $time;
				$data['shebeiid'] = $shebeiid;
				$data['name'] = $user;
				$data['ztid'] = $type;
				$data['danhao'] =intval($time).intval($user).intval($shebeiid); //单号是唯一值 
		   
				M('projectjl')->data($data)->add();
				//$cc=M('projectjl')->order('id desc')->limit(1)->find();
				$cc=M('projectjl')->where("danhao='{$data['danhao']}'")->find();
		
		
				$datas['prid'] =$cc['id'];
		
				$datas['jlid'] = 1;
				$datas['projectid'] = $projectid;
				$datas['attributeid'] = $shuxingid;
				$datas['zt'] = $type;
				$datas['shebeiid'] = $shebeiid;
				
				M('attjl')->data($datas)->add();
				
				$a=M('attjl')->where("prid='{$cc['id']}'")->find();
				
				$datajl['attid'] = $a['id'];
				M('jl')->data($datajl)->add();
				$b=M('jl')->where("attid='{$a['id']}'")->order('id desc')->limit(1)->find();
				//var_dump($a);
				
					if (isset ( $_FILES['file1'] )) {
						$fileArray = $_FILES['file1'];//获取多个文件的信息，注意：这里的键名不包含[]
						if (! @file_exists ( $upload_dir )) {
							@mkdir ( $upload_dir );
						}
						
						$i=0;
						$j=0;
						foreach ( $fileArray['error'] as $key => $error) {
							if ( $error == UPLOAD_ERR_OK ) { //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
								
								$temp_name = $fileArray['tmp_name'][$key];
								$file_name = $upload_dir.$fileArray['name'][$key];
								move_uploaded_file($temp_name, $file_name);
								
								$siname = end(explode('.', $file_name));
								
								if($siname == 'jpg'){
									$datajls['img'.$i] = $file_name ;
									M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
									$i++;
								}
								if($siname == 'mp3'){
									$datajls['sound'.$j] = $file_name ;
									M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
									$j++;
								}
								
								
								echo '上传[文件'.$key.']成功!<br/>';
							}else {
								echo '上传[文件'.$key.']失败!<br/>';
							}
						}	
					}
					  $this -> json(211,'返回',$shebeiid);

				}else{   //如果是子设备  新路径
				

		$xunjian=M('projectjl')->where("shebeiid='{$shebeiid}' and parentid = 0")->order('id desc')->limit(1)->find(); //查找巡检设备最新记录值
		//var_dump($xunjian);
		if($xunjian['zt'] != "0"){
				$datazi['jlid']=$data['jlid'] = 1;
				$data['projectid'] = $projectid;
				$datazi['zt']=$data['zt'] = 0;
				$datazi['time']=$data['time'] = $time;
				$datazi['shebeiid']=$data['shebeiid'] = $shebeiid;
				$datazi['name']=$data['name'] = $user;
				$data['ztid'] = $type;
				$data['danhao'] =intval($time).intval($user).intval($shebeiid); //单号是唯一值 
				
				
				$zidanhao =intval($time).intval($user).intval($shebeiid).intval($shebeihao); //子单号是唯一值 
				M('projectjl')->data($data)->add();
				$cc=M('projectjl')->where("danhao='{$data['danhao']}'")->find();
				$project=M('project')->where("parentid='{$projectid}'")->select();
				//var_dump($project);
				foreach ($project as $key=>$value) {
					//$me = M('attribute')->where("prid='{$categoryse[$key][id]}'")->find();
					$datazi['parentid'] = $cc['id'];
					$datazi['shebeihao'] = $value['bz'];
					$datazi['danhao'] = $data['danhao'].intval($value['bz']);
					$datazi['projectid']=$value['id'];
					if($value['bz']==$shebeihao){
					     $datazi['zt'] = 1 ;
					     $datazi['ztid'] = $type ;
					}else{
					     $datazi['zt'] = 2 ;
					     $datazi['ztid'] = 2 ;
					}
					//var_dump($value['bz']);
					//var_dump($shebeihao);
			        M('projectjl')->data($datazi)->add();

				}
				
				$zishebei=M('projectjl')->where("danhao='{$zidanhao}'")->find();
				//var_dump($zidanhao);
          		$datas['prid'] = $zishebei['id'];
		
				$datas['jlid'] = 1;
				$datas['projectid'] = $zishebei['projectid'];
				$datas['attributeid'] = $shuxingid;
				$datas['zt'] = $type;
				$datas['shebeiid'] = $shebeiid;
				M('attjl')->data($datas)->add();
				$a=M('attjl')->where("prid='{$zishebei['id']}'")->find();
				$datajl['attid'] = $a['id'];
				M('jl')->data($datajl)->add();
		        $b=M('jl')->where("attid='{$a['id']}'")->order('id desc')->limit(1)->find();
					if (isset ( $_FILES['file1'] )) {
						$fileArray = $_FILES['file1'];//获取多个文件的信息，注意：这里的键名不包含[]
						if (! @file_exists ( $upload_dir )) {
							@mkdir ( $upload_dir );
						}
						$i=0;
						$j=0;
						foreach ( $fileArray['error'] as $key => $error) {
							if ( $error == UPLOAD_ERR_OK ) { //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
								
								$temp_name = $fileArray['tmp_name'][$key];
								$file_name = $upload_dir.$fileArray['name'][$key];
								move_uploaded_file($temp_name, $file_name);
								
								$siname = end(explode('.', $file_name));
								
								if($siname == 'jpg'){
									$datajls['img'.$i] = $file_name ;
									M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
									$i++;
								}
								if($siname == 'mp3'){
									$datajls['sound'.$j] = $file_name ;
									M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
									$j++;
								}
								
								
								echo '上传[文件'.$key.']成功!<br/>';
							}else {
								echo '上传[文件'.$key.']失败!<br/>';
							}
						}	
					 // $this -> json(211,'返回',$id);
					}
					  $this -> json(211,'返回',$shebeiid);
				}

		if($xunjian['zt'] == "0"){
               //如果之前已经扫描过
				$project=M('project')->where("parentid='{$projectid}'")->select();
				foreach ($project as $key=>$value) {
					$ziid[] = $value['id'];

				}
				$new= implode(',',$ziid); 
				//print_r($new);
				$zishebei=M('projectjl')->where("shebeihao='{$shebeihao}' and  projectid in ({$new}) ")->order('id desc')->limit(1)->find();
			    //var_dump($zishebei);
				
				
				//$zishebei['danhao'];
				
				if($zishebei['zt'] == 1){   //如果子设备已经扫描过  更新所有图片 音频
					$a=M('attjl')->where("prid='{$zishebei['id']}'")->order('id desc')->limit(1)->find();
		        	//$b=M('jl')->where("attid='{$a['id']}'")->find();
					
			        //var_dump($a);
					
					$datajl['attid'] = $a['id'];

				    //M('jl')->data($datajl)->add();
					$kong=M('jl')->where("attid='{$a['id']}'")->order('id desc')->limit(1)->find();
//var_dump($kong);
					if(!$kong){   // 如果第一次正常没有上传   第二次重新上传
					    M('jl')->data($datajl)->add();
					}else{
					    $datakong['img0'] = "";
					    $datakong['img1'] = "";
					    $datakong['img2'] = "";
					    $datakong['sound0'] = "";
					    $datakong['sound1'] = "";
					    $datakong['sound2'] = "";
						M('jl')->data($datakong)->where('id='.$kong['id'])->save() ;
					}
						$b=M('jl')->where("attid='{$a['id']}'")->order('id desc')->limit(1)->find();
				}else{
				    $datajj['zt'] = 1;
				    $datajj['ztid'] = $type;
					M('projectjl')->data($datajj)->where("shebeihao='{$shebeihao}' and  projectid in ({$new}) ")->save();
				
					$datas['prid'] =$zishebei['id'];
			
					$datas['jlid'] = 1;
					$datas['projectid'] = $zishebei['projectid'];
					$datas['attributeid'] = $shuxingid;
					$datas['zt'] = $type;
					$datas['shebeiid'] = $shebeiid;
					M('attjl')->data($datas)->add();
					$a=M('attjl')->where("prid='{$zishebei['id']}'")->find();
					$datajl['attid'] = $a['id'];
					M('jl')->data($datajl)->add();
					$b=M('jl')->where("attid='{$a['id']}'")->order('id desc')->limit(1)->find();

					
				}
					 $shebeizt=M('projectjl')->where(" parentid = '{$zishebei['parentid']}'")->select();
					
					//var_dump($shebeizt);
					//如果所有的子设备 巡检zt 都是1  把 巡检记录 的巡检zt变成 1
					$flag = 1 ;
					foreach ($shebeizt as $key=>$value) {
					//var_dump($value['zt']);
						if($value['zt'] !='1'){
							$flag = 0;
							break;
						}
					}
					  //  var_dump($flag);
					    if($flag == 1){
							M('projectjl')->data("zt=1")->where("id='{$zishebei['parentid']}'")->save();
						}

                    $flags = 0 ;

					foreach ($shebeizt as $key=>$value) {
					//var_dump($value['zt']);
						if($value['ztid'] =='1'){
							$flags = 1;
						}
					}
					    if($flags == 1){
							M('projectjl')->data("ztid=1")->where("id='{$zishebei['parentid']}'")->save();
						}

					if (isset ( $_FILES['file1'] )) {
						$fileArray = $_FILES['file1'];//获取多个文件的信息，注意：这里的键名不包含[]
						if (! @file_exists ( $upload_dir )) {
							@mkdir ( $upload_dir );
						}
						$i=0;
						$j=0;

						foreach ( $fileArray['error'] as $key => $error) {
							if ( $error == UPLOAD_ERR_OK ) { //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
								
								$temp_name = $fileArray['tmp_name'][$key];
								$file_name = $upload_dir.$fileArray['name'][$key];
								move_uploaded_file($temp_name, $file_name);
								
								$siname = end(explode('.', $file_name));
								
								if($siname == 'jpg'){
									$datajls['img'.$i] = $file_name ;
									M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
									$i++;
								}
								if($siname == 'mp3'){
									$datajls['sound'.$j] = $file_name ;
									M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
									$j++;
								}
								
								
								echo '上传[文件'.$key.']成功!<br/>';
							}else {
								echo '上传[文件'.$key.']失败!<br/>';
							}
						}
					
	
					//  $this -> json(211,'返回',$id);
					}
					  $this -> json(211,'返回',$shebeiid);
	
					
		        //M('article')->data($data)->where('aid='.$aid)->save();
		}
								










		}

		}








    public function indexas(){
						$b=M('jl')->order('id desc')->limit(1)->find();
		
		
		
		//var_dump($b['id']);



}












}
