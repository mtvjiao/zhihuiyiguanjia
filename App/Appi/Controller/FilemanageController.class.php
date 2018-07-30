<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2017-05-16
 * 版    本：1.0.0
 * 功能说明：文件上传控制器。
 *
 **/

namespace Appi\Controller;

use Think\Auth;
use Think\GSFileManager;
use Think\GSFileSystemFileStorage;

class FilemanageController extends ComsController
{

    public function index()
    {
        $uid  = $_GET['uid'];
        $user = M('member')->where('uid=' . $uid)->find();

        $oid = explode(',', $user['o_id']);
        if ($oid) {

            foreach ($oid as $key => $value) {
                # code...
                $oname[$key] = $this->organization($value);
            }
            //dump($oname);
            //$this -> assign('oname' , $oname);
            $this->json(211, '返回', $oname);

        }

    }

    public function indexs()
    {
        $uid  = $_GET['uid'];
        $user = M('member')->where('uid=' . $uid)->find();
        $_oid = explode(',', $user['o_id']);
        //判断该小组ID是否属于该用户
        //var_dump($_oid);
        $oid  = $_GET['oid'];
        $isin = in_array($oid, $_oid);

        if ($isin) {
            $oname   = $this->organization($oid);
            $oidname = $oname['id'];
            $this->json(211, '返回', $oidname);
        } else {

            $this->json(404, '对不起，您无权查看该文件夹！');

        }

    }

    public function admin()
    {
        $uid      = $_GET['uid'];
        $Auth     = new Auth();
        $userauth = $Auth->getGroups($uid);
        $group    = (int) $userauth[0]['group_id'];
        if ($group == 1 || $group == 10) {
            //有权限增删改查
            $this->json(280, '允许管理');
        } else {
            $this->json(290, '允许查看');
        }

    }

    public function manage()
    {
        set_time_limit(0);
        error_reporting(E_ALL);
        ini_set('display_errors', true);
        mb_internal_encoding("UTF-8");

        $options                        = array();
        $options['max_upload_filesize'] = '10000'; //(the size in Kbytes)
        $dir                            = iconv('UTF-8', 'GB2312', 'filemanage'); //文件夹中文显示
        if ($_REQUEST['oidname'] == '1' || $_REQUEST['oidname'] == '') {
            $oidname = iconv('UTF-8', 'GB2312', '公共资源');
        } else {
            $uid  = $_GET['uid'];
            $user = M('member')->where('uid=' . $uid)->find();
            $_oid = explode(',', $user['o_id']);
            $isin = in_array($_REQUEST['oidname'], $_oid);
            if ($isin) {
                $oname   = $this->organization($_REQUEST['oidname']);
                $oidname = $oname['name'];
                $oidname = iconv('UTF-8', 'GB2312', $oidname);
            } else {
                $oidname = iconv('UTF-8', 'GB2312', '公共资源');
            }
        }

        // $options = array();
        // $options['max_upload_filesize'] = '10000'; //(the size in Kbytes)
        // $dir = iconv( 'UTF-8', 'GB2312', 'filemanage'); //文件夹中文显示
        // if($_REQUEST['oidname'] == 'admin' || $_REQUEST['oidname'] == ''){
        //     $oidname = iconv( 'UTF-8', 'GB2312', '公共资源');
        // }else{

        //     $oidname = iconv( 'UTF-8', 'GB2312', $_REQUEST['oidname']);
        // }
        $options[GSFileManager::$root_param] = 'D:/WWW/qwadmin0411/' . $dir . '/' . $oidname;
        $manager                             = new GSFileManager(new GSFileSystemFileStorage(), $options);
        try {
            $result = $manager->process($_REQUEST);
        } catch (Exception $e) {
            $result = '{result: \'0\', gserror: \'' . addslashes($e->getMessage()) . '\', code: \'' . $e->getCode() . '\'}';
        }
        echo $result;

    }
}
