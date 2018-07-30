<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2017-04-20
 * 版    本：1.0.0
 * 功能说明：红黄绿灯控制器。
 *
 **/

namespace Qwadmin\Controller;

use Qwadmin\Controller\ComController;
use Think\Auth;

class LampController extends ComController
{

    public function index()
    {
        $uid      = $this->USER['uid'];
        $Auth     = new Auth();
        $userauth = $Auth->getGroups($uid);
        $user     = M('member')->where('uid=' . $uid)->find();
        $m        = M();

        $st = $_POST['st'];
        $et = $_POST['et'];

        if (!$st || !$et) {
            if ($userauth[0]['group_id'] == 1 || $userauth[0]['group_id'] == 10) {
                 $jihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id order by a.xiaozu asc , a.zhouqi asc");
            }else{
                 $jihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu in (".$user['o_id'].") order by a.xiaozu asc , a.zhouqi asc");
            }

            //dump($jihua);
            foreach ($jihua as $key => $value) {
                # code...
                //未完成 红灯
                $redlamp = M('jihuazhixing')->where('success = 0 and jihuasid=' . $value['id'])->count();

                $jihua[$key]['redlamp'] = $redlamp;

                $yellowlamp = $m->query("SELECT count(*) as yellowcount from (SELECT  a.id FROM qw_jihuazhixing a left join qw_zhixingshebei b on a.id = b.zhixingid where a.jihuasid=" . $value['id'] . " and b.type = 1  and a.success = 1 group by a.id)  as yellowcount");

                $jihua[$key]['yellowlamp'] = (int) $yellowlamp[0]['yellowcount'];

                $finishcount = M('jihuazhixing')->where('success = 1 and jihuasid=' . $value['id'])->count();

                $jihua[$key]['greenlamp'] = (int) $finishcount - $jihua[$key]['yellowlamp'];
            }

            $this->assign('jihua', $jihua); //导航
            $this->display();

        } else {
            $this->assign('kaishit', $st);
            $this->assign('jieshut', $et);
            $st = date_create($st);
            $st = date_format($st, "Y-m-d H:i:s");
            $et = date_create($et);
            $et = date_format($et, "Y-m-d H:i:s");
            $st = strtotime($st);
            $et = strtotime($et);
            if ($st >= $et) {

                $this->error('抱歉，时间选择错误！');
            }

            if ($userauth[0]['group_id'] == 1 || $userauth[0]['group_id'] == 10) {
                 $jihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id order by a.xiaozu asc , a.zhouqi asc");
            }else{
                 $jihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu in (".$user['o_id'].") order by a.xiaozu asc , a.zhouqi asc");
            }


            // dump("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where $st < d.starttime and $et > d.stoptime order by a.xiaozu asc , a.zhouqi asc");
            foreach ($jihua as $key => $value) {
                # code...
                //未完成 红灯
                $redlamp = M('jihuazhixing')->where($st . '< starttime and ' . $et . '> stoptime and success = 0 and jihuasid=' . $value['id'])->count();

                $jihua[$key]['redlamp'] = $redlamp;

                $yellowlamp = $m->query("SELECT count(*) as yellowcount from (SELECT  a.id FROM qw_jihuazhixing a left join qw_zhixingshebei b on a.id = b.zhixingid where a.jihuasid=" . $value['id'] . " and b.type = 1 and  $st < a.starttime and $et > a.stoptime and a.success = 1 group by a.id)  as yellowcount");

                $jihua[$key]['yellowlamp'] = (int) $yellowlamp[0]['yellowcount'];

                $finishcount = M('jihuazhixing')->where($st . '< starttime and ' . $et . '> stoptime and success = 1 and jihuasid=' . $value['id'])->count();

                $jihua[$key]['greenlamp'] = (int) $finishcount - $jihua[$key]['yellowlamp'];
            }

            $this->assign('jihua', $jihua); //导航
            $this->display();
        }

    }

    public function viewlamp()
    {
        $id    = $_GET['id'];
        $color = $_GET['color'];

        $st = $_GET['st'];
        $et = $_GET['et'];
        if (!$st || !$et) {
            $m     = M();
            $jihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.id = " . $id);

            if ($color == 'red') {
                $lamp  = M('jihuazhixing')->where('success = 0 and jihuasid=' . $id)->select();
                $lamps = "未完成";
            }

            if ($color == 'yellow') {
                $lamp = $m->query("SELECT  a.* FROM qw_jihuazhixing a left join qw_zhixingshebei b on a.id = b.zhixingid where a.jihuasid=" . $id . " and b.type = 1 and a.success = 1 group by a.id ");

                $lamps = "已完成有故障";
            }

            if ($color == 'green') {
                $l = M('jihuazhixing')->where('success = 1 and jihuasid=' . $id)->select();

                foreach ($l as $key => $value) {
                    # code...
                    $s    = M('zhixingshebei')->where('zhixingid=' . $value['id'])->select();
                    $flag = 0;
                    foreach ($s as $k => $v) {
                        # code...

                        if ($v['type'] == '1') {
                            $flag = 1;
                            break;
                        }
                    }
                    if ($flag == 0) {
                        $lamp[$key] = M('jihuazhixing')->where('id=' . $value['id'])->find();

                    }

                }
                $lamps = "已完成正常";
            }
        } else {
            $this->assign('kaishit', $st);
            $this->assign('jieshut', $et);

            $st = date_create($st);
            $st = date_format($st, "Y-m-d H:i:s");
            $et = date_create($et);
            $et = date_format($et, "Y-m-d H:i:s");
            $st = strtotime($st);
            $et = strtotime($et);

            $m     = M();
            $jihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.id = " . $id);

            if ($color == 'red') {
                $lamp  = M('jihuazhixing')->where($st . '< starttime and ' . $et . '> stoptime and success = 0 and jihuasid=' . $id)->select();
                $lamps = "未完成";
            }

            if ($color == 'yellow') {
                $lamp = $m->query("SELECT  a.* FROM qw_jihuazhixing a left join qw_zhixingshebei b on a.id = b.zhixingid where a.jihuasid=" . $id . " and b.type = 1  and  $st < a.starttime and $et > a.stoptime and a.success = 1 group by a.id ");

                $lamps = "已完成有故障";
            }

            if ($color == 'green') {
                $l = M('jihuazhixing')->where($st . '< starttime and ' . $et . '> stoptime and success = 1 and jihuasid=' . $id)->select();

                foreach ($l as $key => $value) {
                    # code...
                    $s    = M('zhixingshebei')->where('zhixingid=' . $value['id'])->select();
                    $flag = 0;
                    foreach ($s as $k => $v) {
                        # code...

                        if ($v['type'] == '1') {
                            $flag = 1;
                            break;
                        }
                    }
                    if ($flag == 0) {
                        $lamp[$key] = M('jihuazhixing')->where('id=' . $value['id'])->find();

                    }

                }
                $lamps = "已完成正常";
            }
        }

        $this->assign('lamp', $lamp);
        $this->assign('lamps', $lamps);
        $this->assign('jihua', $jihua);
        $this->display();

    }

}
