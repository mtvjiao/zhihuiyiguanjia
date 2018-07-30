<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


// 应用入口文件
session_start();
// 检测PHP环境

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',true);
//$dbname=  $_SESSION['apidatabase'];
define('APP_MODE','cli');
//define('BIND_MODULE','Home');//绑定Home模块到当前入口文件，可用于新增Home模块

// 定义应用目录
define('APP_PATH','./App/');
// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';