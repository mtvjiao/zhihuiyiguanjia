<?php

namespace Appi\Controller;

use Think\Controller;

class ComsController extends Controller
{

    public function _initialize()
    {
        C(setting());

    }

    public function json($code, $message = '', $data = array())
    {

        if (!is_numeric($code)) {
            return '';
        }
        //$message = iconv("GB2312","UTF-8",$message) ;
        $result = array(
            'code'    => $code,
            'message' => $message,
            'data'    => $data,
        );

        echo json_encode($result);
        exit;
    }

    public function shebei($shebeiid)
    {
        //获取设备名称设备方法
        $name = M('shebei')->field('name')->where(" id = '{$shebeiid}'")->find();
        return $name;
    }
    public function shebeiarea($shebeiid)
    {
        //获取设备名称设备方法
        $name = M('shebei')->field('area')->where(" id = '{$shebeiid}'")->find();
        return $name['area'];
    }
    public function area($areaid)
    {
        //获取设备名称设备方法
        $areaname = M('area')->where(" id = '{$areaid}'")->find();
        $ceng     = $areaname['name'];
        if ($areaname['pid'] != 0) {
            # code...
            $pid  = $areaname['pid'];
            $lou  = M('area')->where(" id = '{$pid}'")->find();
            $name = $lou['name'] . $ceng;
        } else {
            $name = $ceng;
        }

        return $name;
    }
    public function sumf($day)
    {
        $risum = M('jihuas')->field('id')->where("zhouqi = " . $day)->select();
        if (!$risum) {
            # code...
            $xiaozusums = 0;
        } else {
            # code...
            foreach ($risum as $k => $v) {
                $xiaozusum = M('jihuazhixing')->where("jihuasid = " . $v['id'])->count();
                $xiaozusums += $xiaozusum;

            }
        }

        return $xiaozusums;
    }
    public function sumc($day)
    {
        $risum = M('jihuas')->field('id')->where("zhouqi = " . $day)->select();
        if (!$risum) {
            # code...
            $xiaozusumfs = 0;
        } else {
            foreach ($risum as $k => $v) {
                $xiaozusumf = M('jihuazhixing')->where("success = '1' and jihuasid = " . $v['id'])->count();
                $xiaozusumfs += $xiaozusumf;
            }
        }
        return $xiaozusumfs;
    }
    public function username($userid)
    {
        //获取用户名
        $name = M('member')->field('user')->where(" uid = '{$userid}'")->find();
        return $name;
    }
    public function organization($o_id)
    {
        //获取用户名
        $name = M('organization')->field('id,name')->where(" id = '{$o_id}'")->find();
        return $name;
    }
    public function xiaozuname($xiaozu)
    {
        //»ñÈ¡ÓÃ»§Ãû
        $name = M('organization')->field('name')->where(" id = '{$xiaozu}'")->find();
        return $name;
    }
    public function getCurMonthFirstDay($date)
    {
        //一个日期，获取其本月的第一天
        return date('Y-m-01', strtotime($date));
    }

    public function getCurMonthLastDay($date)
    {
        //一个日期，获取其本月的最后一天
        return date('Y-m-d', strtotime(date('Y-m-01', strtotime($date)) . ' +1 month -1 day'));
    }
    public function getCurjiduFirstDay($date)
    {
        //一个日期，获取其本月的第一天
        //$date = getdate();
        $season = ceil((date('n')) / 3);
        return date('Y-m-d H:i:s', mktime(0, 0, 0, $season * 3 - 3 + 1, 1, date('Y')));
        //$end = mktime(0,0,0,$start+3,1,$year); //当季最后一天的时间戳
    }

    public function getCurjiduLastDay()
    {
        //一个日期，获取其本月的最后一天
        $season = ceil((date('n')) / 3); //当月是第几季度
        return date('Y-m-d H:i:s', mktime(23, 59, 59, $season * 3, date('t', mktime(0, 0, 0, $season * 3, 1, date("Y"))), date('Y')));
    }

    //优化巡检计划自动执行的com类  2016.12.29
    public function makejihua($day, $y, $m, $d, $type)
    {

        $Model = M();
        $sql   = 'SELECT a.*,b.id as zhixingids  FROM qw_jihuas a left join qw_jihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and a.zhouqi = ' . $day; //查找计划执行表 状态为开始中  zt=1

        $voList = $Model->query($sql); // $rijihua=M('jihuazhixing')->where("zt=1")->select(); //
        //dump($day.$y.$m.$d.$type);
        if ($voList) {
            echo "有计划"; //有日计划情况 同时修改3个表 计划表状态 改变为已计划关闭   计划执行表状态改变为计划关闭
            // 计划设备表状态改变为计划关闭   此三表操作 用到sql 事务
            // 执行完毕上述操作  继续执行 3表操作 计划表状态 改变为已计划启动 新增计划执行表                              新增计划设备表，同时要注意，此操作在一个大循环下循环执行

            foreach ($voList as $key => $value) {

                $Model->startTrans(); //事务开始
                $flag = false;

                $data['zt'] = 2;
                if (M('jihuazhixing')->data($data)->where("id='{$value[zhixingids]}'")->save()) {
                    $flag = true;
                } else {
                    $flag = false;
                }

                //改变此执行记录的状态
                //\Think\Log::write("不通过",'WARN');
                //\Think\Log::write('测试日志信息，这是警告级别，并且实时写入','WARN');

                $xinzhixing['jihuasid'] = $value['id'];
                $xinzhixing['zt']       = 1;
                $xinzhixing['success']  = 0;

                $zero1 = strtotime(date("y-m-d h:i:s")); //当前时间 要和指定时间对比 以防执行程序时间太长 跨天
                $zero  = mktime(23, 59, 59, $m, $d, $y); //执行时间 要和指定时间对比
                if ($zero1 < $zero) {
                    $dday = $d + 1;
                } else {
                    $dday = $d;
                }
                $allday = date("t");
                $tt     = date("Y-m-d H:i:s");

                //date("Y-m-d H:i:s",strtotime("+7 days"));
                $xinzhixing['starttime'] = mktime(0, 0, 0, $m, $dday, $y);
                if ($type == 1) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $dday, $y);
                } elseif ($type == 2) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $dday + 6, $y);
                } elseif ($type == 3) {
                    $xinzhixing['stoptime'] = strtotime($this->getNextMonthDays($tt));
                } elseif ($type == 4) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m + 3, $allday, $y);
                } elseif ($type == 5) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $allday, $y + 1);
                }

                if ($id = M('jihuazhixing')->data($xinzhixing)->add()) {
                    $flag = true;
                } else {
                    $flag = false;
                }
                //var_dump($id);

                $shebeiids   = $value['shebeiids'];
                $shebeiarray = explode(',', $shebeiids);
                foreach ($shebeiarray as $k => $v) {
                    $shebei['zt'] = 2;
                    M('zhixingshebei')->data($shebei)->where("shebeiid='{$v}' and zhixingid='{$value[zhixingids]}' and zt = '1'")->save(); //改变此执行设备状态
                    $xinshebei['zhixingid'] = $id;
                    $xinshebei['shebeiid']  = $v;
                    $xinshebei['zt']        = 1;

                    M('zhixingshebei')->data($xinshebei)->add();
                }
                $jihuas['cishu']     = $value['cishu'] + 1;
                $jihuas['zhixingid'] = $id;
                if (M('jihuas')->data($jihuas)->where("id='{$value[id]}'")->save()) {
                    //巡检记录启动+1
                    $flag = true;
                } else {
                    $flag = false;
                }

                if (!$flag) {
                    $Model->rollback();
                } else {
                    $Model->commit();
                }

            }

        } else {

            echo "无计划";
        }

        $sqls = 'SELECT *  FROM qw_jihuas  where zt = 0 and zhouqi = ' . $day; //查找计划执行表 状态为开始中  zt=1
        var_dump($voList);
        $voLists = $Model->query($sqls);

        if ($voLists) {
            foreach ($voLists as $key => $value) {
                $data['zt'] = 1;
                M('jihuas')->data($data)->where("id='{$value[id]}'")->save(); //改变此执行记录的状态
                $xinzhixing['jihuasid'] = $value['id'];
                $xinzhixing['zt']       = 1;
                $xinzhixing['success']  = 0;

                $zero1 = strtotime(date("y-m-d h:i:s")); //当前时间 要和指定时间对比 以防执行程序时间太长 跨天
                $zero  = mktime(23, 59, 59, $m, $d, $y); //执行时间 要和指定时间对比
                if ($zero1 < $zero) {
                    $dday = $d + 1;
                } else {
                    $dday = $d;
                }

                //$xinzhixing['starttime'] = mktime(0,0,0,$m,$dday,$y);
                //$xinzhixing['stoptime'] = mktime(23,59,59,$m,$dday,$y);

                $allday = date("t");
                $tt     = date("Y-m-d H:i:s");

                //date("Y-m-d H:i:s",strtotime("+7 days"));
                $xinzhixing['starttime'] = mktime(0, 0, 0, $m, $dday, $y);
                if ($type == 1) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $dday, $y);
                } elseif ($type == 2) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $dday + 6, $y);
                } elseif ($type == 3) {
                    $xinzhixing['stoptime'] = strtotime($this->getNextMonthDays($tt));
                } elseif ($type == 4) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m + 3, $allday, $y);
                } elseif ($type == 5) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $allday, $y + 1);
                }

                $id          = M('jihuazhixing')->data($xinzhixing)->add();
                $shebeiids   = $value['shebeiids'];
                $shebeiarray = explode(',', $shebeiids);
                foreach ($shebeiarray as $k => $v) {

                    $xinshebei['zhixingid'] = $id;
                    $xinshebei['shebeiid']  = $v;
                    $xinshebei['zt']        = 1;

                    M('zhixingshebei')->data($xinshebei)->add();
                }
                $jihuas['cishu']     = $value['cishu'] + 1;
                $jihuas['zhixingid'] = $id;
                M('jihuas')->data($jihuas)->where("id='{$value[id]}'")->save(); //巡检记录启动+1
            }

        }

    }

    public function makexgjihua($day, $y, $m, $d)
    {

        $Model  = M();
        $sql    = 'SELECT a.*,b.id as zhixingids  FROM qw_xgjihuas a left join qw_xgjihuazhixing b on a.id = b.jihuasid  where b.zt = 1 and a.zhouqi = ' . $day; //查找计划执行表 状态为开始中  zt=1
        $voList = $Model->query($sql); // $rijihua=M('jihuazhixing')->where("zt=1")->select(); //

        if ($voList) {
            echo "有计划"; //有日计划情况 同时修改3个表 计划表状态 改变为已计划关闭   计划执行表状态改变为计划关闭
            // 计划设备表状态改变为计划关闭   此三表操作 用到sql 事务
            // 执行完毕上述操作  继续执行 3表操作 计划表状态 改变为已计划启动 新增计划执行表                              新增计划设备表，同时要注意，此操作在一个大循环下循环执行

            foreach ($voList as $key => $value) {

                $Model->startTrans(); //事务开始
                $flag = false;

                $data['zt'] = 2;
                if (M('xgjihuazhixing')->data($data)->where("id='{$value[zhixingids]}'")->save()) {
                    $flag = true;
                } else {
                    $flag = false;
                }
                //改变此执行记录的状态
                //\Think\Log::write("不通过",'WARN');
                //\Think\Log::write('测试日志信息，这是警告级别，并且实时写入','WARN');
                $xinzhixing['jihuasid'] = $value['id'];
                $xinzhixing['zt']       = 1;
                $xinzhixing['success']  = 0;

                $zero1 = strtotime(date("y-m-d h:i:s")); //当前时间 要和指定时间对比 以防执行程序时间太长 跨天
                $zero  = mktime(23, 59, 59, $m, $d, $y); //执行时间 要和指定时间对比
                if ($zero1 < $zero) {
                    $dday = $d + 1;
                } else {
                    $dday = $d;
                }

                $xinzhixing['starttime'] = mktime(0, 0, 0, $m, $dday, $y);
                $xinzhixing['stoptime']  = mktime(23, 59, 59, $m, $dday, $y);
                if ($id = M('xgjihuazhixing')->data($xinzhixing)->add()) {
                    $flag = true;
                } else {
                    $flag = false;
                }
                //var_dump($id);

                //$project = $value['project'] ;  //巡更项目
                $shebeiids = M('xgshebei')->where("projectid='{$value[project]}'")->select();

                // var_dump($id);
                /*$shebeiids = $value['shebeiids'] ;
                $shebeiarray = explode(',',$shebeiids);*/
                foreach ($shebeiids as $k => $v) {
                    //var_dump($v['id']);
                    $shebei['zt'] = 2;
                    M('xgzhixingshebei')->data($shebei)->where("shebeiid='{$v[id]}' and zhixingid='{$value[zhixingids]}' and zt = '1'")->save(); //改变此执行设备状态
                    $xinshebei['zhixingid'] = $id;
                    $xinshebei['shebeiid']  = $v['id'];
                    $xinshebei['zt']        = 1;

                    M('xgzhixingshebei')->data($xinshebei)->add();
                }
                $jihuas['cishu']     = $value['cishu'] + 1;
                $jihuas['zhixingid'] = $id;
                if (M('xgjihuas')->data($jihuas)->where("id='{$value[id]}'")->save()) {
                    //巡检记录启动+1
                    $flag = true;
                } else {
                    $flag = false;
                }

                if (!$flag) {
                    $Model->rollback();
                } else {
                    $Model->commit();
                }

            }

        } else {

            echo "无日计划";
        }

        $sqls    = 'SELECT *  FROM qw_xgjihuas  where zt = 0 and zhouqi = ' . $day; //查找计划执行表 状态为开始中  zt=0
        $voLists = $Model->query($sqls);

        if ($voLists) {
            foreach ($voLists as $key => $value) {
                $data['zt'] = 1;
                M('xgjihuas')->data($data)->where("id='{$value[id]}'")->save(); //改变此执行记录的状态
                $xinzhixing['jihuasid'] = $value['id'];
                $xinzhixing['zt']       = 1;
                $xinzhixing['success']  = 0;

                $zero1 = strtotime(date("y-m-d h:i:s")); //当前时间 要和指定时间对比 以防执行程序时间太长 跨天
                $zero  = mktime(23, 59, 59, $m, $d, $y); //执行时间 要和指定时间对比
                if ($zero1 < $zero) {
                    $dday = $d + 1;
                } else {
                    $dday = $d;
                }

                $allday = date("t");
                $tt     = date("Y-m-d H:i:s");
                //date("Y-m-d H:i:s",strtotime("+7 days"));
                $xinzhixing['starttime'] = mktime(0, 0, 0, $m, $dday, $y);
                if ($type == 1) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $dday, $y);
                } elseif ($type == 2) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $dday + 6, $y);
                } elseif ($type == 3) {
                    $xinzhixing['stoptime'] = strtotime($this->getNextMonthDays($tt)) - 1;
                } elseif ($type == 4) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m + 3, $allday - 1, $y);
                } elseif ($type == 5) {
                    $xinzhixing['stoptime'] = mktime(23, 59, 59, $m, $allday - 1, $y + 1);
                }
                $id = M('xgjihuazhixing')->data($xinzhixing)->add();

                $shebeiids = $M('xgshebei')->where("projectid='{$value[project]}'")->select();

                var_dump($id);
                var_dump($shebeiids);

                $shebeiids   = $value['shebeiids'];
                $shebeiarray = explode(',', $shebeiids);
                foreach ($shebeiarray as $k => $v) {

                    $xinshebei['zhixingid'] = $id;
                    $xinshebei['shebeiid']  = $v;
                    $xinshebei['zt']        = 1;

                    M('xgzhixingshebei')->data($xinshebei)->add();
                }
                $jihuas['cishu']     = $value['cishu'] + 1;
                $jihuas['zhixingid'] = $id;
                M('xgjihuas')->data($jihuas)->where("id='{$value[id]}'")->save(); //巡检记录启动+1
            }

        }

    }

    public function bxname($title, $sid)
    {

        $area = M('area')->field('id,pid,name')->where('id=' . $title)->find();
        if (!$area) {
            # code...
            $categorys['areaname'] = null;
        } else {
            $areas = M('area')->field('id,name')->where('id=' . $area['pid'])->find();

            $categorys['areaname'] = $areas['name'] . $area['name'];
        }

        $cate = M('category')->field('name')->where('id=' . $sid)->find();
        if (!$cate) {
            # code...
            $categorys['catename'] = null;
        } else {
            $categorys['catename'] = $cate['name'];
        }

        return $categorys;
    }

    public function getNextMonthDays($date)
    {
        $timestamp = strtotime($date);
        $arr       = getdate($timestamp);
        if ($arr['mon'] == 12) {
            $year     = $arr['year'] + 1;
            $month    = $arr['mon'] - 11;
            $firstday = $year . '-0' . $month . '-01';
            $lastday  = date('Y-m-d 23:59:59', strtotime("$firstday +1 month -1 day"));
        } else {
            $firstday = date('Y-m-01', strtotime(date('Y', $timestamp) . '-' . (date('m', $timestamp) + 1) . '-01'));
            $lastday  = date('Y-m-d 23:59:59', strtotime("$firstday +1 month -1 day"));
        }
        return $lastday;
    }

/**
 * 获取某年的每周第一天和最后一天
 * @param  [int] $year [年份]
 * @return [arr]       [每周的周一和周日]
 */
    public function get_week($year)
    {
        $year_start = $year . "-01-01";
        $year_end   = $year . "-12-31";
        $startday   = strtotime($year_start);
        if (intval(date('N', $startday)) != '1') {
            $startday = strtotime("next monday", strtotime($year_start)); //获取年第一周的日期
        }
        $year_mondy = date("Y-m-d", $startday); //获取年第一周的日期

        $endday = strtotime($year_end);
        if (intval(date('W', $endday)) == '7') {
            $endday = strtotime("last sunday", strtotime($year_end));
        }

        $num = intval(date('W', $endday));
        for ($i = 1; $i <= $num; $i++) {
            $j          = $i - 1;
            $start_date = date("Y-m-d", strtotime("$year_mondy $j week "));

            $end_day = date("Y-m-d", strtotime("$start_date +6 day"));

            $week_array[$i] = array(
                str_replace("-",
                    "-",
                    $start_date
                ), str_replace("-", "-", $end_day));
        }
        return $week_array;
    }

/**
 * 获取指定月份的第一天开始和最后一天结束的时间戳
 *
 * @param int $y 年份 $m 月份
 * @return array(本月开始时间，本月结束时间)
 */
    public function mFristAndLast($y = "", $m = "")
    {
        if ($y == "") {
            $y = date("Y");
        }

        if ($m == "") {
            $m = date("m");
        }

        $m = sprintf("%02d", intval($m));
        $y = str_pad(intval($y), 4, "0", STR_PAD_RIGHT);

        $m > 12 || $m < 1 ? $m = 1 : $m = $m;
        $firstday              = strtotime($y . $m . "01000000");
        $firstdaystr           = date("Y-m-01", $firstday);
        $lastday               = strtotime(date('Y-m-d 23:59:59', strtotime("$firstdaystr +1 month -1 day")));

        return array(
            "firstday" => $firstday,
            "lastday"  => $lastday,
        );
    }
}
