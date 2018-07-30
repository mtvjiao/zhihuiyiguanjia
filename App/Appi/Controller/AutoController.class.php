<?php

namespace Home\Controller;

use Think\Controller;

class AutoxjController extends ComController
{
    public function index()
    {

        $time = time();

        echo date("y-m-d", $time); //2010-08-29

        //    $cc=M('jihuas')->select();

    }

}
