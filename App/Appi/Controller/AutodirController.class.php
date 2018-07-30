<?php

//七宝 2017 5.16 智慧医管家自动补充文件夹控制器

namespace Appi\Controller;

use Appi\Controller\ComsController;

class AutodirController extends ComsController
{

    public function index()
    {

        $oname = M('organization')->field('name')->select();
        foreach ($oname as $key => $value) {
            # code...
            $upload_dir = iconv('UTF-8', 'GB2312', $value['name']); 
            //dump($upload_dir);
            if (!@file_exists(C('dir') . $upload_dir)) {
                @mkdir(C('dir') . $upload_dir);
      			  echo $value['name']."success";

            }else{
      			  echo $value['name']."alreday exist<br>";

            }

        }

    }
}