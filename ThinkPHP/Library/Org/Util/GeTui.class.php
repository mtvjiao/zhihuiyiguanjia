<?php
namespace Org\Util;
Vendor('getui.IGt','','.Push.php');
class GeTui {
    private $host = 'http://sdk.open.api.igexin.com/serviceex';

    private $appkey = 'TMkuZLSdev6DGENLohckW5';
    private $appid = '23Wf2VaKcm6uwEVICuQ8O2';
    private $mastersecret = 'NNGWrupfXw87Vjq8Nokt88';

    function pushToAndroidApp($cid,$title,$content,$html) {
        if(!$html){
            $html = "xunjian_plan.html";
        }
        
        //$a= $b? $c:$d
        //$igt = new \IGeTui($this->host, $this->appkey, $this->mastersecret);
        $igt = new \IGeTui('',$this->appkey,$this->mastersecret);//
        
       $template =  new \IGtTransmissionTemplate();
        // $template = new \IGtNotificationTemplate();
        $template->set_appId($this->appid); //应用appid
        $template->set_appkey($this->appkey); //应用appkey
        // $template->setbadge(0);
        $template->set_transmissionType(1); //透传消息类型
       // $template->set_transmissionContent("测试离线");//透传内容
        $template->set_transmissionContent('{"title":"'.$title.'","content":"'.$content.'","payload":{"id":"'.$html.'","type":"巡检计划"}}');


            $apn = new \IGtAPNPayload();
            $alertmsg=new \DictionaryAlertMsg();
            $alertmsg->body=$content;
            $alertmsg->actionLocKey="ActionLockey";
            $alertmsg->locKey="LocKey";
            $alertmsg->locArgs=array("locargs");
            $alertmsg->launchImage="launchimage";
            // IOS8.2 支持
            $alertmsg->title=$title;
            $alertmsg->titleLocKey="TitleLocKey";
            $alertmsg->titleLocArgs=array("TitleLocArg");
            $apn->alertMsg=$alertmsg;
            $apn->badge=0;
            $apn->sound="";
            $apn->contentAvailable = 1;
            // $pushInfo=json_encode(array('payload'=>array('id'=>"xunjian_plan.html")));
            // $apn->add_customMsg("payload",$pushInfo);
            // $apn->contentAvailable=1;
            $apn->add_customMsg("payload",$html);
            $apn->contentAvailable=1;


            $apn->category="ACTIONABLE";
            $template->set_apnInfo($apn);

      
        //个推信息体
        //基于应用消息体
        $message = new \IGtAppMessage();
        $message->set_isOffline(true);
        $message->set_offlineExpireTime(3600*12*1000);//离线时间单位为毫秒，例，两个小时离线为3600*1000*2
        $message->set_data($template);
        $message->set_PushNetWorkType(0);//设置是否根据WIFI推送消息，1为wifi推送，0为不限制推送
        $message->set_speed(1000);// 设置群推接口的推送速度，单位为条/秒，例如填写100，则为100条/秒。仅对指定应用群推接口有效。
        $message->set_appIdList(array($this->appid));
        $message->set_phoneTypeList(array('ANDROID'));
//        $message->set_provinceList(array('浙江','上海','北京'));
//        $message->set_tagList(array('开心'));

         $target = new \IGtTarget();
         $target->set_appId($this->appid);
         $target->set_clientId($cid);

        //$res = $igt->pushMessageToApp($message);
          $res = $igt->pushMessageToSingle($message, $target);

        return $res;
    }


}