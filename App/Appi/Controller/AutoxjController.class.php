<?php

//�߱� 9.26 �ǻ�ҽ�ܼ��Զ�ִ�п�����

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
        $lastdata = $this->getCurMonthLastDay(date("Y-m-d")); //�������һ��
        $lastdays = strtotime($lastdata);
        $lastday  = date("d", $lastdays);

        $lastjidu      = $this->getCurjiduLastDay(); //�������һ��
        $lastjiduday   = strtotime($lastjidu); //�������һ�� ʱ���
        $lastjidumonth = date("m", $lastjiduday); //�������һ�������·�
        $lastjidudate  = date("d", $lastjiduday); //�������һ���������

        //$lastdays = mktime($lastdata);
        //var_dump($lastdata);

        $yearmonth    = C('YEARMONTH');
        $yearday      = C('YEARDAY');
        $xunjianday   = C('XUNJIANDAY');
        $xunjianweek  = C('XUNJIANWEEK');
        $xunjianmonth = C('XUNJIANMONTH');
        $xunjianjd    = C('XUNJIANJD');
        $xunjianyear  = C('XUNJIANYEAR');
        // echo "����:".$riqi."<br>";
        // echo "���һ��:".$lastday."<br>";
        // echo "�������һ��:".$lastjidudate."<br>";
        // echo "������һ��:".$yearmonth."<br>";

        //����ʼʱ�����붨��ÿ��23:59:59��������ʵ�ʿ���23:30:00��ֻҪ����autoҳ�� ����ҳ��������Ѳ��ƻ�
        //var_dump($voList);
        // $this->makejihua($xunjianday, $y, $m, $d, 1);

        // if ($xingqi == 0) {
        //     // ����������һ��  ������
        //     $this->makejihua($xunjianweek, $y, $m, $d, 2);
        // }
        // if ($riqi == $lastday) {
        //     // ������¶����һ��
        //     $this->makejihua($xunjianmonth, $y, $m, $d, 3);
        // }

        // if ($riqi == $lastjidudate and $yuefen == $lastjidumonth) {
        //     // ����Ǽ������һ��
        //     $this->makejihua($xunjianjd, $y, $m, $d, 4);
        // }
        // if ($riqi == $yearday and $yuefen == $yearmonth) {
        //     // ����������һ��
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
