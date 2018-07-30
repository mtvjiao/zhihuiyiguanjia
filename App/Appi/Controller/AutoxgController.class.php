<?php

//七宝 9.26 智慧医管家自动执行控制器

namespace Appi\Controller;

use Appi\Controller\ComController;

class AutoxgController extends ComController
{

    public function index()
    {

        $y = date("Y");
        $m = date("m");
        $d = date("d");

        $xunjianday = C('XUNJIANDAY');

        echo "日期:" . $riqi . "<br>";

        //程序开始时（理想定义每天23:59:59秒启动，实际可以23:30:00）只要启动auto页面 首先页面搜索日巡检计划
        //var_dump($voList);
        $this->makexgjihua($xunjianday, $y, $m, $d);

    }

}
