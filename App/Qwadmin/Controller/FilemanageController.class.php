<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2017-05-09
 * 版    本：1.0.0
 * 功能说明：文件上传控制器。
 *
 **/

namespace Qwadmin\Controller;

use Qwadmin\Controller\ComController;
use Think\Auth;
use Think\GSFileManager;
use Think\GSFileSystemFileStorage;

class FilemanageController extends ComController
{

    public function index()
    {
        $uid  = $this->USER['uid'];
        $user = M('member')->where('uid=' . $uid)->find();

        $oid = explode(',', $user['o_id']);
        if ($oid) {

            foreach ($oid as $key => $value) {
                # code...
                $oname[$key] = $this->organization($value);
            }
            //dump($oname);
            $this->assign('oname', $oname);
            $this->display('menu');

        }

    }

    public function indexs()
    {
        $uid  = $this->USER['uid'];
        $user = M('member')->where('uid=' . $uid)->find();
        $_oid = explode(',', $user['o_id']);

        $oid  = $_GET['oid'];
        $isin = in_array($oid, $_oid);

        if ($isin) {
            $oname   = $this->organization($oid);
            $oidname = $oname['id'];
            $this->assign('oidname', $oidname);
            $this->display();
        } else {
            $this->error('对不起，您无权查看该文件夹！');

        }

    }

    public function admin()
    {
        $uid      = $this->USER['uid'];
        $Auth     = new Auth();
        $userauth = $Auth->getGroups($uid);
        $group    = (int) $userauth[0]['group_id'];
        if ($group == 1 || $group == 10) {
            //有权限增删改查
            $this->display('index');
        } else {
            $this->display('user');
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
            $uid                            = $this->USER['uid'];
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
