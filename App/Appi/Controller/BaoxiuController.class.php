<?php
// 单个设备巡检在此计划的巡检详情接口
// 2016.10.10  焦军
namespace Appi\Controller;
use Appi\Controller\ComsController;
use Org\Util\GeTui;
use Think\Auth;
class BaoxiuController extends ComsController
{
    public function View()
    {
        $area = M('area')->where('pid = 0')->order('o ASC')->select();
        foreach ($area as $key => $value) {
            # code...
            $arealou           = M('area')->where('pid = ' . $value['id'])->order('o ASC')->select();
            $area[$key]['lou'] = $arealou;
        }
        $category = M('category')->where('pid = 0')->field('id,pid,name')->order('o asc')->select();
        foreach ($category as $k => $v) {
            # code...
            $categorys             = M('category')->where('pid = ' . $v['id'])->order('o ASC')->select();
            $category[$k]['zilei'] = $categorys;
        }
        //var_dump($area);
        $data['area']     = $area;
        $data['category'] = $category;
        if ($data) {
            $this->json(210, '成功', $data);
        } else {
            $this->json(410, '无数据');
        }
    }
//          http://127.0.0.1/qwadmin825/index.php?m=Appi&c=Baoxiu&a=add&sid=故障分类&area=楼层id&uid=用户id&description=描述
    public function add()
    {
        //$aid = intval($aid);
        $data['sid'] = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
        //$data['chengdu'] = isset($_GET['chengdu'])?intval($_GET['chengdu']):0;
        $data['title'] = isset($_GET['area']) ? $_GET['area'] : 0;
        $uid                 = $_GET['uid'];
        $user                = M('member')->where('uid = ' . $uid)->find();
        $data['seotitle']    = $user['user'];
        $data['keywords']    = isset($user['phone']) ? $user['phone'] : 0;
        $data['xunjian']     = 2;
        $o_id                = explode(',', $user['o_id']);
        $data['bumen']       = $o_id[0];
        $data['description'] = $_GET['description'];
        $data['t'] = $time = time();
        M('article')->data($data)->add();
        $upload_dir = 'baoxiuupfile/'; //保存上传文件的目录
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
                        //M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
                        M('article')->data($datajls)->where('t=' . $time)->save();
                        $i++;
                    }
                    if ($siname == 'amr' || $siname == 'wav') {
                        $datajls['sound' . $j] = $file_name;
                        //M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
                        M('article')->data($datajls)->where('t=' . $time)->save();
                        $j++;
                    }
                    echo '上传[文件' . $key . ']成功!<br/>';
                } else {
                    echo '上传[文件' . $key . ']失败!<br/>';
                }
            }
        }
        if ($data) {
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
            $this->json(210, '成功', $data);
        } else {
            $this->json(410, '无数据');
        }
    }
    public function Viewfenpei()
    {
        //报修单分配权限bug 比如用户不属于本小组 如果没有数据返回411错误码
        $userid  = $_GET['userid'];
        $article = M('articlefenpei')->field('aid,xtime,fenpeioid')->where('userids = "0" and fenpeistates = "0" and xuserid = ' . $userid)->order('xtime desc')->select();
        //var_dump($article);
        if (!$article) {
            # code...
            $this->json(411, '无数据');
        } else {
            foreach ($article as $k => $v) {
                # code...
                $categorys = M('article')->where('aid = ' . $v['aid'])->find();
                //echo "<pre>";
                //var_dump($categorys);
                if (!$categorys) {
                    $article[$k]['baoxiudan'] = "";
                } else {
                    $article[$k]['baoxiudan'] = $this->bxname($categorys['title'], $categorys['sid']);
                }
            }
            $this->json(211, '成功', $article);
        }
    }
    public function Viewfenpeied()
    {
        //组长
        $userid  = $_GET['userid'];
        $article = M('articlefenpei')->field('aid,xtime,userid,userids,utime,time,successt')->where('userids != "0" and fenpeistates ="1" and xuserid = ' . $userid)->order(array('successt' => 'desc', 'id' => 'desc'))->select();
        foreach ($article as $k => $v) {
            # code...
            $fuser                = $this->username($v['userid']);
            $article[$k]['fuser'] = $fuser;
            $categorys            = M('article')->where('aid = ' . $v['aid'])->find();
            //$v['userids'];
            $user = explode(",", $v['userids']);
            foreach ($user as $key => $value) {
                $username                  = M('member')->field('uid,user')->where('uid=' . $value)->find();
                $article[$k]['username'][] = $username;
            }
            if (!$categorys) {
                $article[$k]['baoxiudan'] = "";
            } else {
                $area = M('area')->field('id,pid,name')->where('id=' . $categorys['title'])->find();
                $areas = M('area')->field('id,name')->where('id=' . $area['pid'])->find();
                $categorys['areaname'] = $areas['name'] . $area['name'];
                $cate = M('category')->field('name')->where('id=' . $categorys['sid'])->find();
                $categorys['catename'] = $cate['name'];
                $article[$k]['baoxiudan'] = $categorys;
            }
        }
        $this->json(216, '成功', $article);
    }
    public function Viewzuyuan()
    {
        $fenpeioid = $_GET['fenpeioid'];
        if (!$fenpeioid) {
            $this->json(412, '不成功');
            exit;
        }
        //$cate = M('category')->field('xiaozu')->where('id='.$sid)->find();
        //var_dump($cate);
        //echo "<pre>";
        //"o_id like '%{$pid}%'"
        //$pid = $cate['xiaozu'];
        $chengyuan = M('member')->field('user,uid')->where("o_id like '%{$fenpeioid}%'")->select();
        $this->json(212, '成功', $chengyuan);
    }
    public function updatebaoxiu()
    {
        $fenpeioid            = $_POST['fenpeioid'];
        $xuserid              = $_POST['uid'];
        $aid                  = $_POST['aid'];
        $data['utime']        = time();
        $ids                  = $data['userids']                  = $_POST['uids'];
        $data['fenpeistates'] = '1';
        //$date['fenpeistates'] = '2';
        //M('articlefenpei')->data($date)->where("aid='{$aid}' and fenpeioid = '{$fenpeioid}'")->save();
        $cate = M('articlefenpei')->data($data)->where("aid='{$aid}' and fenpeioid = '{$fenpeioid}' and xuserid = '{$xuserid}'")->save();
        //$datas['zt'] = 2;
        //修改保修单状态为已分配
        $title   = "维修任务提醒";
        $content = "您的队长给您安排了新的维修任务，请尽快完成.";
        $gt  = new GeTui();
        $oid = explode(',', $ids);
        foreach ($oid as $key => $value) {
            $q   = M('member')->where("uid=" . $value)->find();
            $rep = $gt->pushToAndroidApp($q['cid'], $title, $content, 'weixiu_main.html');
        }
        //M('article')->data($datas)->where('aid='.$aid)->save();
        if (!$cate) {
            $this->json(415, '失敗');
        } else {
            $this->json(215, '成功');
        }
    }
//查看保修单详情
    public function Viewbaoxiudan()
    {
        $aid = $_GET['aid'];
        $data = M('article')->where('aid=' . $aid)->find();
        $this->json(213, '成功', $data);
    }
//查看维修单详情 2017/3/8新加接口
    public function Viewweixiudan()
    {
        $aid = $_GET['aid'];
        $data = M('article')->where('aid=' . $aid)->find();
        $this->json(213, '成功', $data);
    }
//上传维修前接口
    public function addbefore()
    {
        $datas['userid'] = $userid = $_GET['userid'];
        $aid              = $_GET['aid'];
        $data['beforebz'] = $beforebz = $_GET['bz'];
        $datas['time']    = time();
        M('articlefenpei')->data($datas)->where('fenpeistates = "1" and aid=' . $aid)->save();
        M('article')->data($data)->where('aid=' . $aid)->save();
        $upload_dir = 'beforeupfile/'; //保存上传文件的目录
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
                        $datajls['simg' . $i] = $file_name;
                        //M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
                        M('article')->data($datajls)->where('aid=' . $aid)->save();
                        $i++;
                    }
                    if ($siname == 'amr' || $siname == 'wav') {
                        $datajls['ssound' . $j] = $file_name;
                        //M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
                        M('article')->data($datajls)->where('aid=' . $aid)->save();
                        $j++;
                    }
                    //echo '上传[文件'.$key.']成功!<br/>';
                } else {
                    //echo '上传[文件'.$key.']失败!<br/>';
                }
            }
        }
        if ($data) {
            $this->json(220, '成功', $data);
        } else {
            $this->json(420, '失败');
        }
    }
//上传维修后接口
    public function addafter()
    {
        $userid = $_GET['userid'];
        $aid               = $_GET['aid'];
        $data['afterbz']   = $_GET['bz'];
        $datas['successt'] = time();
        $after             = M('articlefenpei')->where('fenpeistates = "1" and aid=' . $aid)->find();
        if ($after['userid'] != $userid) {
            $name = M('member')->where('uid=' . $after['userid'])->find();
            $this->json(430, '正在维修', $name['user']);
            //exit;
        } else {
            M('articlefenpei')->data($datas)->where('fenpeistates = "1" and aid=' . $aid)->save();
            M('article')->data($data)->where('aid=' . $aid)->save();
            $upload_dir = 'afterupfile/'; //保存上传文件的目录
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
                            $datajls['cimg' . $i] = $file_name;
                            //M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
                            M('article')->data($datajls)->where('aid=' . $aid)->save();
                            $i++;
                        }
                        if ($siname == 'amr' || $siname == 'wav') {
                            $datajls['csound' . $j] = $file_name;
                            //M('jl')->data($datajls)->where('id='.$b['id'])->save() ;
                            M('article')->data($datajls)->where('aid=' . $aid)->save();
                            $j++;
                        }
                    } else {
                    }
                }
            }
            if ($data) {
                //成功上传维修后照片时更新维修单状态为已完成维修
                $xname = M('member')->where('uid=' . $after['xuserid'])->find();
                $gt      = new GeTui();
                $title   = "维修完成提醒";
                $content = "您的组员完成了维修任务，请查看.";
                $rep     = $gt->pushToAndroidApp($xname['cid'], $title, $content, 'weixiuDan.html');
                $datazt['zt'] = 1;
                M('article')->data($datazt)->where('aid=' . $aid)->save();
                M('articlefenpei')->data($datazt)->where('aid=' . $aid)->save();
                $this->json(220, '成功', $data);
            } else {
                $this->json(420, '失败');
            }
        }
    }
    //查看所属报修单
    public function Viewlist()
    {
        $userid = $_GET['userid'];
        $m = M();
        //$data = M('articlefenpei')->where("userids in '{$userid}'")->select();
        $data = $m->query("SELECT * FROM qw_articlefenpei where FIND_IN_SET('{$userid}',userids) order by  'successt' desc, 'id' desc");
        //$data = $m->query("SELECT * FROM qw_articlefenpei where '{$userid}' in userids ");
        if (!$data) {
            # code...
            $this->json(217, '暂无数据');
        } else {
            foreach ($data as $key => $value) {
                # code...
                $fuser               = $this->username($value['userid']);
                $data[$key]['fuser'] = $fuser;
                $datas                 = M('article')->where("aid = '{$value["aid"]}'")->find();
                $data[$key]['article'] = $datas;
                //人名
                $user = explode(",", $value['userids']);
                foreach ($user as $k => $v) {
                    $username                   = M('member')->field('uid,user')->where('uid=' . $v)->find();
                    $data[$key]['username'][$k] = $username;
                }
                // dump($datas['title']);
                //dump($datas['sid']);
                if ($datas['title'] == null || $datas['sid'] == null) {
                    $data[$key]['guzhang'] == "";
                } else {
                    $data[$key]['guzhang'] = $this->bxname($datas['title'], $datas['sid']);
                }
            }
            $this->json(218, '成功', $data);
        }
    }
    public function baobiao()
    {
        //$m = M();
        $uid      = $_GET['uid'];
        $Auth     = new Auth();
        $userauth = $Auth->getGroups($uid);
        $prefix   = C('DB_PREFIX');
        $article = M('article');
        // var_dump($userauth);
        if ($userauth[0]['group_id'] == 1 || $userauth[0]['group_id'] == 10) {
            # code...
            $b = date('Y'); //月份时间戳
            for ($i = 1; $i < 13; $i++) {
                if ($i < 12) {
                    $a[$i]      = strtotime("$b-$i-1 00:00:00");
                    $c[$i]      = strtotime("$b-$i-31 00:00:00");
                    $count[$i]  = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i]")->count();
                    $counts[$i] = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and {$prefix}article.zt = 1")->count();
                } else {
                    $a[$i]      = strtotime("$b-$i-1 00:00:00");
                    $d          = date('Y') + 1;
                    $c[$i]      = strtotime("$d-1-31 00:00:00");
                    $count[$i]  = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i]")->count();
                    $counts[$i] = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and {$prefix}article.zt = 1")->count();
                }
            }
            $count  = array_values($count);
            $counts = array_values($counts);
            //echo "<pre>";
            //var_dump($count);
            $data['count']  = $count;
            $data['counts'] = $counts;
            $this->json(241, '成功', $data);
        } elseif ($userauth[0]['group_id'] == 6) {
            //维修员
            # code...
            $b = date('Y'); //月份时间戳
            $userinfo = M('member')->field('uid,o_id')->where(" uid = '{$uid}'")->find();
            if ($userinfo['o_id'] != null) {
                $oids = explode(',', $userinfo['o_id']);
                foreach ($oids as $key => $value) {
                    $organization = M('organization')->field('name')->where(" id = '{$value}'")->find();
                    $cate         = M('category')->where(" xiaozu = '{$value}' and pid != 0 ")->select();
                    if ($cate != null) {
                        $r  = array();
                        $rs = array();
                        foreach ($cate as $k => $v) {
                            # code...
                            for ($i = 1; $i < 13; $i++) {
                                if ($i < 12) {
                                    $a[$i]      = strtotime("$b-$i-1 00:00:00");
                                    $c[$i]      = strtotime("$b-$i-31 00:00:00");
                                    $count[$i]  = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and sid = {$v['id']}")->count();
                                    $counts[$i] = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and {$prefix}article.zt = 1  and sid = {$v['id']}")->count();
                                } else {
                                    $a[$i]      = strtotime("$b-$i-1 00:00:00");
                                    $d          = date('Y') + 1;
                                    $c[$i]      = strtotime("$d-1-31 00:00:00");
                                    $count[$i]  = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i]  and sid = {$v['id']}")->count();
                                    $counts[$i] = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and {$prefix}article.zt = 1  and sid = {$v['id']}")->count();
                                }
                            }
                            $datas[$k]['count']  = $count;
                            $datas[$k]['counts'] = $counts;
                            foreach ($datas[$k]['count'] as $ke => $va) {
                                // echo "<pre>";
                                // var_dump($datas[$k]['count'][$ke]);
                                $r[$ke] += $va;
                            }
                            $arr_click['count'] = array_values($r);
                            foreach ($datas[$k]['counts'] as $kes => $vas) {
                                //echo "<pre>";
                                //var_dump($datas[$k]['count'][$ke]);
                                $rs[$kes] += $vas;
                            }
                            $arr_click['counts'] = array_values($rs);
                            //echo "<pre>";
                            //var_dump($arr_click[$k]);
                        }
                    } else {
                    }
                    //var_dump($cate);
                    //exit;
                    $data[$key]['xiaozu'] = $organization['name'];
                    $data[$key]['data']   = $arr_click;
                }
                //var_dump($data);
                $this->json(228, '成功', $data);
            }
        } else {
            # code...
            $this->json(428, '无权限');
        }
    }
}