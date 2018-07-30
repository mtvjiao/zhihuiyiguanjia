<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2016-2-21
 * 版    本：1.0.0
 * 功能说明：个人绑定cid中心控制器。
 *
 **/

namespace Appi\Controller;

use Appi\Controller\ComsController;

class CidupdateController extends ComsController
{

    public function index()
    {

        //index方法通过判断当前版本号与系统录入的最新版本号的对比来判断是否推送更新URL，完成更新
        $uid         = $_POST['uid'];
        $data['cid'] = $_POST['cid'];
        //$os = $_GET['os'];
        $Model = M('member');
        if ($uid) {
            $cid = $Model->data($data)->where("uid=" . $uid)->save();

            $this->json(200, '绑定成功');

        } else {
            $this->json(434, '请求错误');
        }

    }

}
