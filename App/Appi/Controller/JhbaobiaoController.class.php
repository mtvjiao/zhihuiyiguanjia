<?php

namespace Appi\Controller;

use Appi\Controller\ComController;
use Think\Auth;

class JhbaobiaoController extends ComController
{

    public function index()
    {
        $m        = M();
        $uid      = $_GET['uid'];
        $Auth     = new Auth();
        $userauth = $Auth->getGroups($uid);

        if ($userauth[0]['group_id'] == 1) {
            $jihua = $m->query("SELECT count(a.xiaozu) as jihuacount,a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id group by a.xiaozu");

            $xunjianday   = C('XUNJIANDAY');
            $xunjianweek  = C('XUNJIANWEEK');
            $xunjianmonth = C('XUNJIANMONTH');
            $xunjianjd    = C('XUNJIANJD');
            $xunjianyear  = C('XUNJIANYEAR');
            //统计全部已结束日计划的总数 完成总数
            $data['daysumf'] = $daysumf = $this->sumf($xunjianday);
            $data['daysumc'] = $daysumc = $this->sumc($xunjianday);
            //统计全部已结束周计划的总数 完成总数
            $data['weeksumf'] = $weeksumf = $this->sumf($xunjianweek);
            $data['weeksumc'] = $weeksumc = $this->sumc($xunjianweek);
            //统计全部已结束月计划的总数 完成总数
            $data['monthsumf'] = $monthsumf = $this->sumf($xunjianmonth);
            $data['monthsumc'] = $monthsumc = $this->sumc($xunjianmonth);
            //统计全部已结束季计划的总数 完成总数
            $data['jdsumf'] = $jdsumf = $this->sumf($xunjianjd);
            $data['jdsumc'] = $jdsumc = $this->sumc($xunjianjd);
            //统计全部已结束年计划的总数 完成总数
            $data['yearsumf'] = $yearsumf = $this->sumf($xunjianyear);
            $data['yearsumc'] = $yearsumc = $this->sumc($xunjianyear);
            $data['jihuas']   = $jihua;

            $this->json(229, '成功', $data); // 管理员组统一返回229
            //$this -> json(210,'失败')
        } else {

            //var_dump($uid);
            $userinfo = M('member')->field('uid,o_id')->where(" uid = '{$uid}'")->find();
            if ($userinfo['o_id'] != null) {
                $oids = explode(',', $userinfo['o_id']);
                foreach ($oids as $key => $value) {
                    //$jihua[$key] = M('jihuas')->where("xiaozu='{$value}'")->select();
                    $keshi                 = M('organization')->field()->where(" id = '{$value}'")->find();
                    $jihua[$key]['xiaozu'] = $keshi['name'];
                    $jihua[$key]['datas']  = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu = $value");
                    foreach ($jihua[$key]['datas'] as $k => $v) {
                        //$id = $v['id'];
                        $xiaozusumf = M('jihuazhixing')->where("success = '1' and jihuasid = " . $v['id'])->count();
                        $xiaozusum  = M('jihuazhixing')->where("jihuasid = " . $v['id'])->count();

                        $shebei = explode(',', $v['shebeiids']);
                        //print_r($shebei);echo "<br>";
                        $she = array();
                        foreach ($shebei as $keys => $values) {
                            $name = $this->shebei($values['shebeiid']);
                            //print_r($name);echo "<br>";
                            $she[$keys] = $name['name'];

                            //echo "<br>";
                        }
                        $shebei = $she;
                        //print_r($shebei);
                        //echo "<br>";echo "<br>";
                        //$jihua[$k]['shebeiname'] = $shebei[$keys];
                        $jihua[$key]['datas'][$k]['shebeiname'] = $shebei;
                        $jihua[$key]['datas'][$k]['xiaozusum']  = $xiaozusum;
                        $jihua[$key]['datas'][$k]['xiaozusumf'] = $xiaozusumf;

                    }
                    //print_r($jihua[$key]);
                    //echo "<br>";echo "<br>";echo "<br>";echo "<br>";
                }
                $this->json(210, '成功', $jihua);
                //
            }
            var_dump($jihua);
           

        }

    }

//1230报表中    JhbaobiaoController接口 viewxiaozu方法shebeiname显示错乱bug修复
    public function viewxiaozu()
    {
        $xiaozu      = $_GET['xiaozu'];
        $m           = M();
        $xiaozujihua = $m->query("SELECT a.*,b.name as xiaozuname,c.name as zhouqiname,d.success FROM qw_jihuas a left join qw_organization b on a.xiaozu = b.id left join qw_xunjianzhouqi c on a.zhouqi = c.id left join qw_jihuazhixing d on a.zhixingid = d.id where a.xiaozu = $xiaozu");
        foreach ($xiaozujihua as $k => $v) {
            //$array = explode('cc', $shebei);
            $shebei = explode(',', $v['shebeiids']);
            $she    = array();
            foreach ($shebei as $keys => $values) {
                $name       = $this->shebei($values);
                $she[$keys] = $name['name'];
            }
            $xiaozujihua[$k]['shebeiname'] = $she;

        }

        $this->json(210, '成功', $xiaozujihua);

    }

}
