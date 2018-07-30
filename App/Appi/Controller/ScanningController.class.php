<?php

//七宝 5.26 智慧医管家节拍器控制器
namespace Appi\Controller;

use Appi\Controller\ComsController;

class ScanningController extends ComsController
{

    public function index()
    {
        //$shebei= M('scanning')->where("zhixingsbid = '{$id}'")->order('id desc')->select();
        $sql = 'SELECT uid, COUNT(uid) AS count FROM qw_scanning GROUP BY uid ORDER BY COUNT(uid) DESC';
        $ret = M()->query($sql);
        //dump($ret);

        foreach ($ret as $key => $value) {
            $shebei = M('scanning')->where("uid = '{$value['uid']}'")->order('id asc')->select();
            foreach ($shebei as $k => $v) {
                $data[$key][$k] = $v;
                # code...
            }
            # code...

        }
        //dump($data);
        $i = 0;
        foreach ($data as $timekey => $timevalue) {
            //dump($timevalue);
            $current = 0;
            $next    = $current + 1;
            while (isset($timevalue[$next]['time'])) {

                $timediff                             = strtotime($timevalue[$next]['time']) - strtotime($timevalue[$current]['time']);
                $date[$timekey][$current]['timediff'] = $timediff;
                $date[$timekey][$current]['id']       = $timevalue[$current]['id'];
                if ($timediff < 60) {
                    $problem[$i]['timediff'] = $timediff;
                    $problem[$i]['id']       = $timevalue[$current]['id'];
                    $data                    = M('scanning')->field('uid,name')->where("id='{$timevalue[$current][id]}' ")->find();
                    $user                    = $this->username($data['uid']);
                    $problem[$i]['user']     = $user['user'];
                    $problem[$i]['shebei']   = $data['name'];
                    $i++;
                }
                $current++;
                $next = $current + 1;
            }
        }

        $sort = array(
            'direction' => 'SORT_DESC', //排序顺序标志 SORT_DESC 降序；SORT_ASC 升序
            'field'     => 'id', //排序字段
        );
        $arrSort = array();
        foreach ($problem as $uniqid => $row) {
            foreach ($row as $key => $value) {
                $arrSort[$key][$uniqid] = $value;
            }
        }
        if ($sort['direction']) {
            array_multisort($arrSort[$sort['field']], constant($sort['direction']), $problem);
        }
        dump($problem);
    }

    public function day()
    {

        $y = date("Y");

        //获取当天的月份
        $m = date("m");

        //获取当天的号数
        $d = date("d");

        //将今天开始的年月日时分秒，转换成unix时间戳(开始示例：2015-10-12 00:00:00)
        $todaystart = mktime(0, 0, 0, $m, $d, $y);
        $todaystop  = mktime(23, 59, 59, $m, $d, $y);

        $sql = 'SELECT uid, COUNT(uid) AS count FROM qw_scanning GROUP BY uid ORDER BY COUNT(uid) DESC LIMIT 3';
        $ret = M()->query($sql);
        foreach ($ret as $key => $value) {
            $shebei = M('scanning')->where("uid = '{$value['uid']}' and unix_timestamp(time) < '{$todaystop}' and unix_timestamp(time) > '{$todaystart}' ")->order('id asc')->select();
            //echo M('scanning')->getLastsql();
            foreach ($shebei as $k => $v) {
                $data[$key][$k] = $v;
                # code...
            }
            # code...

        }
        //dump($data);
        $i = 0;
        foreach ($data as $timekey => $timevalue) {

            //dump($timevalue);
            $current = 0;
            $next    = $current + 1;

            while (isset($timevalue[$next]['time'])) {

                $timediff                             = strtotime($timevalue[$next]['time']) - strtotime($timevalue[$current]['time']);
                $date[$timekey][$current]['timediff'] = $timediff;
                $date[$timekey][$current]['id']       = $timevalue[$current]['id'];
                if ($timediff < 60) {
                    $problem[$i]['timediff'] = $timediff;
                    $problem[$i]['id']       = $timevalue[$current]['id'];
                    $data                    = M('scanning')->field('uid,name')->where("id='{$timevalue[$current][id]}' ")->find();
                    $user                    = $this->username($data['uid']);
                    $problem[$i]['user']     = $user['user'];
                    $problem[$i]['shebei']   = $data['name'];
                    $i++;
                }
                $current++;
                $next = $current + 1;

            }

        }
        $sort = array(
            'direction' => 'SORT_DESC', //排序顺序标志 SORT_DESC 降序；SORT_ASC 升序
            'field'     => 'id', //排序字段
        );
        $arrSort = array();
        foreach ($problem as $uniqid => $row) {
            foreach ($row as $key => $value) {
                $arrSort[$key][$uniqid] = $value;
            }
        }
        if ($sort['direction']) {
            array_multisort($arrSort[$sort['field']], constant($sort['direction']), $problem);
        }
        dump($problem);
    }

}
