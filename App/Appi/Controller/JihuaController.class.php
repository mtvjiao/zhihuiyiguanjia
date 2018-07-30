<?php
// 单个计划详情接口
// 2016.10.10  焦军

namespace Appi\Controller;

class JihuaController extends ComController
{
    public function View()
    {

        $id = $_GET['id'];

        $jihuas       = M('jihuazhixing')->field()->where(" jihuasid = '{$id}' and zt = '1'")->find();
        $zhixingid    = $jihuas['id'];
        $shebeifinish = M('zhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and zt = '1' and success = '1' and type='0'")->select();
        //循环输出每个执行计划的设备名称
        //赋值给json
        //var_dump($shebeifinish);
        foreach ($shebeifinish as $key => $value) {
            $sid      = $value['sid'];
            $name     = $this->shebei($value['shebeiid']);
            $areaid   = $this->shebeiarea($value['shebeiid']);
            $areaname = $this->area($areaid);
            //巡检人
            $zhixinguser = M('projectjl')->field()->where(" zhixingsbid = '{$sid}' ")->order('id desc')->find();

            $usern                             = $this->username($zhixinguser['name']);
            $shebeibz                          = $this->shebeibz($value['shebeiid']);
            $shebeifinish[$key]['shebeibz']    = $shebeibz;
            $shebeifinish[$key]['shebeiname']  = $name['name'];
            $shebeifinish[$key]['zhixinguser'] = $usern['user'];
            $shebeifinish[$key]['areaname']    = $areaname;

        }
        $jihuas['shebeifinish'] = $shebeifinish;

        $shebeifinishu = M('zhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and zt = '1' and success = '1' and type='1'")->order('time desc')->select();
        //循环输出每个执行计划的设备名称
        //赋值给json

        foreach ($shebeifinishu as $key => $value) {
            $sid = $value['sid'];

            $name        = $this->shebei($value['shebeiid']);
            $areaid      = $this->shebeiarea($value['shebeiid']);
            $areaname    = $this->area($areaid);
            $zhixinguser = M('projectjl')->where(" zhixingsbid = '{$sid}' ")->order('id desc')->find();

            $usern                              = $this->username($zhixinguser['name']);
            $shebeibz                           = $this->shebeibz($value['shebeiid']);
            $shebeifinishu[$key]['shebeibz']    = $shebeibz;
            $shebeifinishu[$key]['shebeiname']  = $name['name'];
            $shebeifinishu[$key]['zhixinguser'] = $usern['user'];
            $shebeifinishu[$key]['areaname']    = $areaname;
        }
        $jihuas['shebeifinishu'] = $shebeifinishu;

        $shebeiunfinish = M('zhixingshebei')->field()->where(" zhixingid = '{$zhixingid}' and zt = '1' and success = '0'")->order('time desc')->select();
        foreach ($shebeiunfinish as $key => $value) {

            $name                             = $this->shebei($value['shebeiid']);
            $areaid                           = $this->shebeiarea($value['shebeiid']);
            $areaname                         = $this->area($areaid);
            $shebeibz                         = $this->shebeibz($value['shebeiid']);
            $shebeiunfinish[$key]['shebeibz'] = $shebeibz;

            $shebeiunfinish[$key]['shebeiname'] = $name['name'];
            $shebeiunfinish[$key]['areaname']   = $areaname;

        }
        $jihuas['shebeiunfinish'] = $shebeiunfinish;

        $this->json(209, '成功', $jihuas);

    }

}
