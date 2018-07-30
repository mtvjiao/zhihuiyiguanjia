<?php
//智慧医管家2.0 二维码扫描上传接口  10.12 焦军
// #34% 注释度
namespace Appi\Controller;
class FileController extends ComController
{
    public function indexa()
    {
        // $cid = $_GET['cid'];       //是否是大类（消防箱001）
        $type        = $_GET['type']; //正常不正常   0 正常  1 不正常
        $user        = $_GET['userid']; // 用户id
        $zhixingsbid = $_GET['zhixingsbid']; // 执行sid
        // $zhixingid = $_GET['zhixingid'];   // 执行jihuaid
        $keshi = $_GET['xiaozuid']; // 小组id
        $projectid = isset($_GET['projectid']) ? intval($_GET['projectid']) : 1;
        $shebeiid   = isset($_GET['shebeiid']) ? intval($_GET['shebeiid']) : 1; //消防箱001  id  qw_shebei表
        $scanningid = isset($_GET['scanningid']) ? intval($_GET['scanningid']) : 1;
        $shuxingid  = $_GET['shuxingid']; //属性ID
        //改变执行设备的success状态   已执行 success =1  type  0 正常  1 不正常
        $zhixingdata['success'] = 1;
        $zhixingdata['type']    = $type;
        $zhixingdata['time']    = time();
        M('zhixingshebei')->data($zhixingdata)->where('sid=' . $zhixingsbid)->save();
        $zhixing   = M('zhixingshebei')->field()->where('sid=' . $zhixingsbid)->find();
        $zhixingid = $zhixing['zhixingid'];
        //var_dump($zhixingid);
        //循环执行
        $shebeifinish = M('zhixingshebei')->field('success')->where(" zhixingid = '{$zhixingid}' ")->select();
        $flag         = 0;
        foreach ($shebeifinish as $key => $value) {
            if ($value['success'] == "0") {
                $flag = 0;
                //echo "test break ";
                break;
            } else {
                $flag = 1;
                //echo "test continue";
            }
        }
        //如果计划下所有的设备都巡检完毕  更新此巡检执行id的success为巡检完成
        if ($flag == "1") {
            $datazx['success'] = 1;
            M('jihuazhixing')->data($datazx)->where('id=' . $zhixingid)->save();
            // echo $flag ;
        }
        $path       = 'upfile';
        $time       = time();
        $upload_dir = 'upfile/'; //保存上传文件的目录
        //if($cong == '0'){   //如果是主设备   走1.1版相同路径
        //$data['jlid'] = 1;
        $data['projectid']   = $projectid;
        $data['zt']          = 1;
        $data['time']        = $time;
        $data['shebeiid']    = $shebeiid;
        $data['name']        = $user;
        $data['ztid']        = $type;
        $data['zhixingsbid'] = $zhixingsbid;
        $data['keshi']       = $keshi;
        $data['danhao']      = intval($time) . intval($user) . intval($shebeiid); //单号是唯一值
        // 2017/3/21  记录经纬度
        $data['lng'] = $_GET['lng']; //经度
        $data['lat'] = $_GET['lat']; //纬度
        M('projectjl')->data($data)->add();
        //$cc=M('projectjl')->order('id desc')->limit(1)->find();
        $cc = M('projectjl')->where("danhao='{$data['danhao']}'")->find();
		//2017 - 4- 13 添加返回节拍器ID关联设备执行id
        $scanning['submittime']  = date('y-m-d H:i:s', time());
        $scanning['zhixingsbid'] = $zhixingsbid;
        $scanning['lat']         = $_GET['lat'];
        $scanning['lng']         = $_GET['lng'];
        M('scanning')->data($scanning)->where('id=' . $scanningid)->save();
        if ($type == '1') {
            // 2016.11.2 如果巡检不正常 直接建立报修单  ----------------------------------------------------
            $article['xunjian'] = 1;
            //联合查询  通过设备id 查询所属故障的分类id
            $m = M();
            //var_dump("SELECT a.* FROM qw_category a left join qw_shebei b on a.projectid = b.projectid  where b.id = $shebeiid limit 1");
            $sids = $m->query("SELECT a.id,b.area FROM qw_category a left join qw_shebei b on a.projectid = b.projectid  where b.id = $shebeiid limit 1");
            //var_dump($sids);
            $article['sid']         = $sids[0]['id']; //故障分类id
            $article['title']       = $sids[0]['area']; //故障发生地
            $article['t']           = $time;
            $article['zhixingsbid'] = $zhixingsbid;
            $article['jlid']        = $cc['id'];
            $article['shebeiid']    = $shebeiid;
            M('article')->data($article)->add();
            ///2017/3/15 自动分配
            // $url = C('autofenpei');
            // $ch = curl_init(); //初始化curl
            // curl_setopt($ch, CURLOPT_URL, $url); //抓取指定网页
            // curl_setopt($ch, CURLOPT_HEADER, 0); //设置header
            // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //要求结果为字符串且输出到屏幕上
            // curl_setopt($ch, CURLOPT_POST, 1); //post提交方式
            // //curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
            // curl_exec($ch); //运行curl
            // curl_close($ch);
            R('Autobxfenpei/index');
        }
        $datas['prid'] = $cc['id'];
        $datas['jlid']        = 1;
        $datas['projectid']   = $projectid;
        $datas['attributeid'] = $shuxingid;
        $datas['zt']          = $type;
        $datas['shebeiid']    = $shebeiid;
        M('attjl')->data($datas)->add();
        $a = M('attjl')->where("prid='{$cc['id']}'")->find();
        $datajl['attid'] = $a['id'];
        M('jl')->data($datajl)->add();
        $b = M('jl')->where("attid='{$a['id']}'")->order('id desc')->limit(1)->find();
        //var_dump($a);
        if (isset($_FILES['file1'])) {
            $fileArray = $_FILES['file1']; //获取多个文件的信息，注意：这里的键名不包含[]
            if (!@file_exists($upload_dir)) {
                @mkdir($upload_dir);
            }
            $i = 0;
            $j = 0;
            foreach ($fileArray['error'] as $key => $error) {
                if ($error == UPLOAD_ERR_OK) {
                    //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
                    $temp_name = $fileArray['tmp_name'][$key];
                    $file_name = $upload_dir . $fileArray['name'][$key];
                    move_uploaded_file($temp_name, $file_name);
                    $siname = end(explode('.', $file_name));
                    if ($siname == 'jpg') {
                        $datajls['img' . $i] = $file_name;
                        M('jl')->data($datajls)->where('id=' . $b['id'])->save();
                        M('article')->data($datajls)->where('t=' . $time)->save();
                        $i++;
                    }
                    if ($siname == 'amr' || $siname == 'wav') {
                        $datajls['sound' . $j] = $file_name;
                        M('jl')->data($datajls)->where('id=' . $b['id'])->save();
                        M('article')->data($datajls)->where('t=' . $time)->save();
                        $j++;
                    }
                    echo '上传[文件' . $key . ']成功!<br/>';
                } else {
                    echo '上传[文件' . $key . ']失败!<br/>';
                }
            }
        }
        $this->json(211, '返回', $shebeiid);
    }
    public function index()
    {
        $path       = 'upfile';
        $time       = time();
        $upload_dir = 'upfile/'; //保存上传文件的目录
        //var_dump($a);
        if (isset($_FILES['file1'])) {
            $fileArray = $_FILES['file1']; //获取多个文件的信息，注意：这里的键名不包含[]
            if (!@file_exists($upload_dir)) {
                @mkdir($upload_dir);
            }
            file_put_contents("test.txt", "1\r\n", FILE_APPEND);
            foreach ($fileArray['error'] as $key => $error) {
                file_put_contents("test.txt", $key, FILE_APPEND);
                if ($error == UPLOAD_ERR_OK) {
                    //PHP常量UPLOAD_ERR_OK=0，表示上传没有出错
                    $temp_name = $fileArray['tmp_name'][$key];
                    $file_name = $upload_dir . $fileArray['name'][$key];
                    move_uploaded_file($temp_name, $file_name);
                    echo '上传[文件' . $key . ']成功!<br/>';
                } else {
                    echo '上传[文件' . $key . ']失败!<br/>';
                }
            }
        }
        $this->json(211, '返回', $shebeiid);
    }
}