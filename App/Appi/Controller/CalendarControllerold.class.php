<?php

//日历接口

namespace Appi\Controller;

use Appi\Controller\ComController;

class CalendarController extends ComController
{

    public function index()
    {
        //$stime = microtime(true);
        $year  = date("Y", time());
        $begin = $year . "-01-01";
        // $end   = $year . "-12-31";
        $end      = date("Y-m-d");
        $zhouqi   = C('XUNJIANDAY');
        $dayjihua = M('jihuas')->field()->where("zhouqi='{$zhouqi}'")->select();
        foreach ($dayjihua as $key => $value) {
            // $data_id[$key] = $value['id'];
             $sids[$key] = $value['id'];    
        }
        $sids = implode(',', $sids);
        $begintime = strtotime($begin);
        $endtime   = strtotime($end);
        for ($start = $begintime; $start <= $endtime; $start += 24 * 3600) {
            $i    = date("Y-m-d", $start);
            $time = strtotime($i);
            $flag = 0;

                # code...
                $dayjihuas = M('jihuazhixing')->field('id')->where("jihuasid in ('{$sids}') and starttime <= '{$time}' and stoptime > '{$time}' and success = 0")->select();

                if ($dayjihuas) {
                    $flag = 1;
                }
            

            $data[$i] = $flag;
        }
        //  dump($data);
        // $etime = microtime(true); //获取程序执行结束的时间
        // $total = $etime - $stime; //计算差值

        // echo "<br />[页面执行时间：{$total} ]秒";
        $this->json(211, '返回', $data);

    }

    public function week()
    {
        $thisyear = date('Y');
        $weeks    = $this->get_week($thisyear);
        //echo '第1周开始日期：'.$weeks[1][0].'';
        //echo '第1周结束日期：'.$weeks[52][1];
        $zhouqi    = C('XUNJIANWEEK');
        $weekjihua = M('jihuas')->field()->where("zhouqi='{$zhouqi}'")->select();
        foreach ($weekjihua as $key => $value) {
             $sids[$key] = $value['id'];
        }

        $sids = implode(',', $sids);
        $begin     = $weeks[1][0];
        $end       = $weeks[52][1];
        $begintime = strtotime($begin);
        $endtime   = strtotime($end);
        //var_dump($begintime);
        for ($start = $begintime; $start <= $endtime; $start += 24 * 3600 * 7) {
            $i    = date("Y-m-d", $start);
            $time = strtotime($i);

            $flag = 0;

                $weekjihuas = M('jihuazhixing')->field()->where("jihuasid in ('{$sids}') and  starttime <= '{$time}' and stoptime > '{$time}' and success = 0")->select();

                if ($weekjihuas) {
                    $flag = 1;

                }


            $data[$i] = $flag;
        }
        $this->json(211, '返回', $data);
    }

    public function indexs()
    {

        $year  = date("Y", time());
        $begin = $year . "-01-01";
        $end   = $year . "-12-31";

        //$begin = "2015-08-01";$end = "2015-10-01";
        $begintime = strtotime($begin);
        $endtime   = strtotime($end);
        for ($start = $begintime; $start <= $endtime; $start += 24 * 3600) {
            $i = date("Y-m-d", $start);
            //rand(0,1)

            $data[$i] = rand(0, 1);
        }
        $this->json(211, '返回', $data);

    }

}
