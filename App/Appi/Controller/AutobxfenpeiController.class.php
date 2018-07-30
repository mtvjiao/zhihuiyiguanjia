<?php
//七宝 11.18 智慧医管家维修自动执行分配控制器
namespace Appi\Controller;
use Appi\Controller\ComsController;
use Org\Util\GeTui;
class AutobxfenpeiController extends ComsController
{
    public function index()
    {
        $gt     = new GeTui();
        $voList = M('article')->field()->where('zt = 0 and fenpei = 0')->select();
        foreach ($voList as $key => $value) {
            //$value['sid']   故障分类  根据故障分类表 来查询对应的所属小组id
            $category = M('category')->field('id,pid,xiaozu')->where('id =' . $value['sid'])->find();
            //$category['xiaozu']  此故障所属小组id
            if (!$category) {
                //echo "无新报修单";
            } else {
                $list = M('member')->where("o_id like '%{$category['xiaozu']}%'")->select();
                //$list = M('member')->where("uid=3")->select();
                echo "<pre>";
                var_dump($list);
                foreach ($list as $keys => $values) {
                    $oid     = explode(',', $values['o_id']);
                    $oguanli = explode(',', $values['guanli']);
                    $a       = 0;
                    foreach ($oid as $k => $v) {
                        //echo intval($values).'<br>';
                        if (intval($v) == $category['xiaozu']) {
                            //$j = $i ;
                            break;
                        }
                        //var_dump($values);
                        //var_dump($i);
                        $a++;
                    }
                    //var_dump($a);
                    //var_dump($oguanli[$a-1]);
                    if (intval($oguanli[$a]) == '1') {
                        echo "管理员<br>";
                        $data['aid']       = $value['aid'];
                        $data['fenpeioid'] = $category['xiaozu'];
                        $data['xuserid']   = $values['uid'];
                        $data['xtime']     = time();
                        $aid               = M('articlefenpei')->data($data)->add(); //分配关联 添加
                        $zt['fenpei']      = 1;
                        M('article')->data($zt)->where('aid=' . $value['aid'])->save();
                        $xiaozuname = $this->xiaozuname($category['xiaozu']);
                        $mem        = M('member')->field('cid')->where('uid=' . $values['uid'])->find();
                        $title   = $xiaozuname['name'] . "报修分配提醒";
                        $content = "您所在的" . $xiaozuname['name'] . "有新的报修，请尽快分配。";
                        $rep     = $gt->pushToAndroidApp($mem['cid'], $title, $content, 'weixiuDan.html');
                        //已分配的状态改变
                    } else {
                        //echo "2";
                    }
                }
            }
        }
    }
}