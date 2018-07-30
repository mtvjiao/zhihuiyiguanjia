<?php

//七宝 9.26 智慧医管家自动执行控制器

namespace Appi\Controller;

use Appi\Controller\ComsController;

class AutoxjController extends ComsController
{

    public function index()
    {

        $y = date("Y");
        $m = date("m");
        $d = date("d");
        //$day_start = mktime(0,0,0,$m,$d,$y);
        //$day_end= mktime(23,59,59,$m,$d,$y);
        $time     = time();
        $riqi     = date("d", $time);
        $yuefen   = date("m", $time);
        $xingqi   = date("w");
        $lastdata = $this->getCurMonthLastDay(date("Y-m-d")); //本月最后一天
        $lastdays = strtotime($lastdata);
        $lastday  = date("d", $lastdays);

        $lastjidu      = $this->getCurjiduLastDay(); //季度最后一天
        $lastjiduday   = strtotime($lastjidu); //季度最后一天 时间戳
        $lastjidumonth = date("m", $lastjiduday); //季度最后一天所属月份
        $lastjidudate  = date("d", $lastjiduday); //季度最后一天具体日期

        //$lastdays = mktime($lastdata);
        //var_dump($lastdata);

        $yearmonth    = C('YEARMONTH');
        $yearday      = C('YEARDAY');
        $xunjianday   = C('XUNJIANDAY');
        $xunjianweek  = C('XUNJIANWEEK');
        $xunjianmonth = C('XUNJIANMONTH');
        $xunjianjd    = C('XUNJIANJD');
        $xunjianyear  = C('XUNJIANYEAR');
        // echo "日期:".$riqi."<br>";
        // echo "最后一天:".$lastday."<br>";
        // echo "季度最后一天:".$lastjidudate."<br>";
        // echo "年度最后一月:".$yearmonth."<br>";

        //程序开始时（理想定义每天23:59:59秒启动，实际可以23:30:00）只要启动auto页面 首先页面搜索日巡检计划
        //var_dump($voList);
        // $this->makejihua($xunjianday, $y, $m, $d, 1);

        // if ($xingqi == 0) {
        //     // 如果是周最后一天  即周日
        //     $this->makejihua($xunjianweek, $y, $m, $d, 2);
        // }
        // if ($riqi == $lastday) {
        //     // 如果是月度最后一天
        //     $this->makejihua($xunjianmonth, $y, $m, $d, 3);
        // }

        // if ($riqi == $lastjidudate and $yuefen == $lastjidumonth) {
        //     // 如果是季度最后一天
        //     $this->makejihua($xunjianjd, $y, $m, $d, 4);
        // }
        // if ($riqi == $yearday and $yuefen == $yearmonth) {
        //     // 如果是年最后一天
        //     $this->makejihua($xunjianyear, $y, $m, $d, 5);
        // }

    }

    public function midhour()
    {
        $y          = date("Y");
        $m          = date("m");
        $d          = date("d");
        $xunjianmidhour = C('XUNJIANMIDHOUR');
        $this->makejihua($xunjianmidhour, $y, $m, $d, 6);
    }

    public function dayjihua()
    {
        $y          = date("Y");
        $m          = date("m");
        $d          = date("d");
        $xunjianday = C('XUNJIANDAY');
        $this->makejihua($xunjianday, $y, $m, $d, 1);
    }

    public function weekjihua()
    {
        $y           = date("Y");
        $m           = date("m");
        $d           = date("d");
        $xunjianweek = C('XUNJIANWEEK');
        $this->makejihua($xunjianweek, $y, $m, $d, 2);
    }

    public function monthjihua()
    {
        $y            = date("Y");
        $m            = date("m");
        $d            = date("d");
        $xunjianmonth = C('XUNJIANMONTH');
        $this->makejihua($xunjianmonth, $y, $m, $d, 3);
    }

    public function yearjihua()
    {
        $y           = date("Y");
        $m           = date("m");
        $d           = date("d");
        $xunjianyear = C('XUNJIANYEAR');
        $this->makejihua($xunjianyear, $y, $m, $d, 5);
    }
}
