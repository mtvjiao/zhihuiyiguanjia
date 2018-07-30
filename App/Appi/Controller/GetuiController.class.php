<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2016-12-21
 * 版    本：1.0.0
 * 功能说明 个推控制器。
 *
 **/

namespace Appi\Controller;

// use Appi\Controller\ComController;
use Org\Util\GeTui;

class GetuiController
{

    public function index()
    {
        $title   = "过年好";
        $content = "新年好";

        $gt = new GeTui();
        //$user = M('member')->field('cid')->select();
        $cid = 'ee32a359faeacfdad81c1fdeb2397f17';
        // foreach ($user as $key => $value) {
        //     # code...
        //         $rep = $gt->pushToAndroidApp($value['cid'],$title,$content);
        // }
        $rep = $gt->pushToAndroidApp($cid, $title, $content,'weixiu_main.html');

        var_dump($rep);
        echo ("<br><br>");

    }

}
