<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2017-04-24
 * 版    本：1.0.0
 * 功能说明：表盘 折线图。
 *
 **/

namespace Appi\Controller;

class SuccessController extends ComsController
{

    public function index()
    {

        $onedaystart                    = strtotime(date("Y-m-d", strtotime("-1 day")));
        $onedaystop                     = strtotime(date("Y-m-d")) - 1;
        $onedaycount                    = M('jihuazhixing')->where('starttime=' . $onedaystart . ' and stoptime = ' . $onedaystop)->count();
        $onedayfinishcount              = M('jihuazhixing')->where('starttime=' . $onedaystart . ' and stoptime = ' . $onedaystop . ' and success = 1')->count();
        $count['oneday']['count']       = $onedaycount;
        $count['oneday']['finishcount'] = $onedayfinishcount;
        $count['oneday']['time']        = date("Y-m-d", $onedaystart);

        $twodaystart = strtotime(date("Y-m-d", strtotime("-2 day")));
        $twodaystop  = strtotime(date("Y-m-d", strtotime("-1 day"))) - 1;
        //$yesterdaystop = strtotime('-2 day'); strtotime(date('Y-m-d'));
        $twodaycount                    = M('jihuazhixing')->where('starttime=' . $twodaystart . ' and stoptime = ' . $twodaystop)->count();
        $twodayfinishcount              = M('jihuazhixing')->where('starttime=' . $twodaystart . ' and stoptime = ' . $twodaystop . ' and success = 1')->count();
        $count['twoday']['count']       = $twodaycount;
        $count['twoday']['finishcount'] = $twodayfinishcount;
        $count['twoday']['time']        = date("Y-m-d", $twodaystart);

        $threedaystart                    = strtotime(date("Y-m-d", strtotime("-3 day")));
        $threedaystop                     = strtotime(date("Y-m-d", strtotime("-2 day"))) - 1;
        $threedaycount                    = M('jihuazhixing')->where('starttime=' . $threedaystart . ' and stoptime = ' . $threedaystop)->count();
        $threedayfinishcount              = M('jihuazhixing')->where('starttime=' . $threedaystart . ' and stoptime = ' . $threedaystop . ' and success = 1')->count();
        $count['threeday']['count']       = $threedaycount;
        $count['threeday']['finishcount'] = $threedayfinishcount;
        $count['threeday']['time']        = date("Y-m-d", $threedaystart);

        $oneweekstart                    = mktime(0, 0, 0, date('m'), date('d') - date('w') + 1 - 7, date('Y'));
        $oneweekstop                     = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7 - 7, date('Y'));
        $oneweekcount                    = M('jihuazhixing')->where('starttime=' . $oneweekstart . ' and stoptime = ' . $oneweekstop)->count();
        $oneweekfinishcount              = M('jihuazhixing')->where('starttime=' . $oneweekstart . ' and stoptime = ' . $oneweekstop . ' and success = 1')->count();
        $count['oneweek']['count']       = $oneweekcount;
        $count['oneweek']['finishcount'] = $oneweekfinishcount;
        $count['oneweek']['time']        = date("Y-m-d", $oneweekstart);

        $twoweekstart                    = mktime(0, 0, 0, date('m'), date('d') - date('w') + 1 - 14, date('Y'));
        $twoweekstop                     = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7 - 14, date('Y'));
        $twoweekcount                    = M('jihuazhixing')->where('starttime=' . $twoweekstart . ' and stoptime = ' . $twoweekstop)->count();
        $twoweekfinishcount              = M('jihuazhixing')->where('starttime=' . $twoweekstart . ' and stoptime = ' . $twoweekstop . ' and success = 1')->count();
        $count['twoweek']['count']       = $twoweekcount;
        $count['twoweek']['finishcount'] = $twoweekfinishcount;
        $count['twoweek']['time']        = date("Y-m-d", $twoweekstart);

        $threeweekstart                    = mktime(0, 0, 0, date('m'), date('d') - date('w') + 1 - 21, date('Y'));
        $threeweekstop                     = mktime(23, 59, 59, date('m'), date('d') - date('w') + 7 - 21, date('Y'));
        $threeweekcount                    = M('jihuazhixing')->where('starttime=' . $threeweekstart . ' and stoptime = ' . $threeweekstop)->count();
        $threeweekfinishcount              = M('jihuazhixing')->where('starttime=' . $threeweekstart . ' and stoptime = ' . $threeweekstop . ' and success = 1')->count();
        $count['threeweek']['count']       = $threeweekcount;
        $count['threeweek']['finishcount'] = $threeweekfinishcount;
        $count['threeweek']['time']        = date("Y-m-d", $threeweekstart);

        $zhouqi     = C('XUNJIANMONTH');
        $monthjihua = M('jihuas')->field()->where("zhouqi='{$zhouqi}'")->select();
        if ($monthjihua) {
            foreach ($monthjihua as $key => $value) {
                $sids[$key] = $value['id'];
            }
            $sids      = implode(',', $sids);
            $thismonth = (int) date('m');
            $thisyear  = (int) date('Y');
            if ($thismonth == 1) {
                $lastonemonth   = 12;
                $lasttwomonth   = 11;
                $lastthreemonth = 10;
                $lastoneyear    = $lasttwoyear    = $lastthreeyear    = $thisyear - 1;
            } elseif ($thismonth == 2) {
                $lastonemonth   = $thismonth - 1;
                $lasttwomonth   = 12;
                $lastthreemonth = 11;
                $lastoneyear    = $thisyear;
                $lasttwoyear    = $lastthreeyear    = $thisyear - 1;
            } elseif ($thismonth == 3) {
                $lastonemonth   = $thismonth - 1;
                $lasttwomonth   = $thismonth - 2;
                $lastthreemonth = 12;
                $lastoneyear    = $lasttwoyear    = $thisyear;
                $lastthreeyear  = $thisyear - 1;
            } else {
                $lastonemonth   = $thismonth - 1;
                $lasttwomonth   = $thismonth - 2;
                $lastthreemonth = $thismonth - 3;

                $lastoneyear = $lasttwoyear = $lastthreeyear = $thisyear;
            }

            $lastoneStartDay = $lastoneyear . '-' . $lastonemonth . '-1';
            $lastoneEndDay   = $lastoneyear . '-' . $lastonemonth . '-' . date('t', strtotime($lastoneStartDay));

            $lasttwoStartDay   = $lasttwoyear . '-' . $lasttwomonth . '-1';
            $lasttwoEndDay     = $lasttwoyear . '-' . $lasttwomonth . '-' . date('t', strtotime($lasttwoStartDay));
            $lastthreeStartDay = $lastthreeyear . '-' . $lastthreemonth . '-1';
            $lastthreeEndDay   = $lastthreeyear . '-' . $lastthreemonth . '-' . date('t', strtotime($lastthreeStartDay));

            $onemonthstart = strtotime($lastoneStartDay); //上个月的月初时间戳
            $onemonthstop  = strtotime($lastoneEndDay . '23:59:59'); //上个月的月末时间戳

            $twomonthstart = strtotime($lasttwoStartDay); //上2个月的月初时间戳
            $twomonthstop  = strtotime($lasttwoEndDay . '23:59:59'); //上2个月的月末时间戳

            $threemonthstart = strtotime($lastthreeStartDay); //上3个月的月初时间戳
            $threemonthstop  = strtotime($lastthreeEndDay . '23:59:59'); //上3个月的月末时间戳

            $onemonthcount                    = M('jihuazhixing')->where("starttime >= " . $onemonthstart . " and stoptime <= " . $onemonthstop . " and jihuasid in ({$sids}) ")->count();
            $onemonthfinishcount              = M('jihuazhixing')->where("starttime >= " . $onemonthstart . " and stoptime <= " . $onemonthstop . " and jihuasid in ({$sids})  and success = 1 ")->count();
            $count['onemonth']['count']       = $onemonthcount;
            $count['onemonth']['finishcount'] = $onemonthfinishcount;
            $count['onemonth']['time']        = date("Y-m-d", $onemonthstart);

            $twomonthcount                    = M('jihuazhixing')->where("starttime >= " . $twomonthstart . " and stoptime <= " . $twomonthstop . " and jihuasid in ({$sids}) ")->count();
            $twomonthfinishcount              = M('jihuazhixing')->where("starttime >= " . $twomonthstart . " and stoptime <= " . $twomonthstop . " and jihuasid in ({$sids})  and success = 1 ")->count();
            $count['twomonth']['count']       = $twomonthcount;
            $count['twomonth']['finishcount'] = $twomonthfinishcount;
            $count['twomonth']['time']        = date("Y-m-d", $twomonthstart);

            $threemonthcount       = M('jihuazhixing')->where("starttime >= " . $threemonthstart . " and stoptime <= " . $threemonthstop . " and jihuasid in ({$sids}) ")->count();
            $threemonthfinishcount = M('jihuazhixing')->where("starttime >= " . $threemonthstart . " and stoptime <= " . $threemonthstop . " and jihuasid in ({$sids})  and success = 1 ")->count();

            $count['threemonth']['count']       = $threemonthcount;
            $count['threemonth']['finishcount'] = $threemonthfinishcount;
            $count['threemonth']['time']        = date("Y-m-d", $threemonthstart);
        }
        //dump($count);
        $this->json(200, '成功', $count);

    }

    public function dayline()
    {
        $thismonth = date('m');
        $thisyear  = date('Y');
        $startDay  = $thisyear . '-' . $thismonth . '-1';
        $endDay    = $thisyear . '-' . $thismonth . '-' . date('t', strtotime($startDay));
        //dump($endDay);
        $b_time = strtotime($startDay); //当前月的月初时间戳
        $e_time = strtotime($endDay); //当前月的月末时间戳

        $j   = 0;
        $day = array();
        for ($i = $b_time; $i < $e_time + 1; $i += 86400) {

            if (date("Y-m-d", $i) == date('Y-m-d')) {
                break;
            } else {
                $start = strtotime(date("Y-m-d 00:00:00", $i));
                $stop  = strtotime(date("Y-m-d 23:59:59", $i));
                $j++;
                $daycount                  = M('jihuazhixing')->where('starttime=' . $start . ' and stoptime = ' . $stop)->count();
                $dayfinishcount            = M('jihuazhixing')->where('starttime=' . $start . ' and stoptime = ' . $stop . ' and success = 1')->count();
                $day[$j]['daycount']       = $daycount;
                $day[$j]['dayfinishcount'] = $dayfinishcount;
                // print $daycount.'---'.$dayfinishcount . '<br/>';
            }

        }
        $this->json(200, '成功', $day);
    }

    public function weekline()
    {

        $thisyear  = date('Y');
        $weeks     = $this->get_week($thisyear);
        $arr       = time() - ((date('w') == 0 ? 7 : date('w')) - 1) * 24 * 3600; //本周一的时间戳
        $new       = mktime(0, 0, 0, date("m", $arr), date("d", $arr), date("Y", $arr));
        $zhouqi    = C('XUNJIANWEEK');
        $weekjihua = M('jihuas')->field()->where("zhouqi='{$zhouqi}'")->select();
        foreach ($weekjihua as $key => $value) {
            $sids[$key] = $value['id'];
        }
        $sids = implode(',', $sids);
        //echo '第1周开始日期：'.$weeks[1][0].'';
        //echo '第最后1周结束日期：'.$weeks[52][1];
        foreach ($weeks as $key => $value) {
            # code...

            $start = strtotime(date($value[0] . " 00:00:00"));
            $stop  = strtotime(date($value[1] . "23:59:59"));

            if ($new == $start) {
                break;
            } else {
                $weekcount       = M('jihuazhixing')->where("starttime >= {$start} and stoptime <=  {$stop} and jihuasid in ({$sids}) ")->count();
                $weekfinishcount = M('jihuazhixing')->where("starttime >= {$start} and stoptime <=  {$stop} and success = 1 and jihuasid in ({$sids}) ")->count();

                //dump($weekcount);
                // dump($weekfinishcount);

                $week[$key]['weekcount']       = $weekcount;
                $week[$key]['weekfinishcount'] = $weekfinishcount;
            }
        }
        $this->json(200, '成功', $week);
        // dump($week);

    }

    public function monthline()
    {
        $thisyear  = date('Y');
        $thismonth = date('m');
        $zhouqi    = C('XUNJIANMONTH');
        $monthjihua = M('jihuas')->field()->where("zhouqi='{$zhouqi}'")->select();
        foreach ($monthjihua as $key => $value) {
            $sids[$key] = $value['id'];
        }
        $sids = implode(',', $sids);
        if ($sids) {
            for ($i = 1; $i < 13; $i++) {
                if ($i == $thismonth) {
                    break;
                } else {
                    $a                             = $this->mFristAndLast($thisyear, $i);
                    $stop                          = $a['lastday'];
                    $start                         = $a['firstday'];
                    $monthcount                    = M('jihuazhixing')->where("starttime >= {$start} and stoptime <=  {$stop} and jihuasid in ({$sids}) ")->count();
                    $monthfinishcount              = M('jihuazhixing')->where("starttime >= {$start} and stoptime <=  {$stop} and success = 1 and jihuasid in ({$sids}) ")->count();
                    $month[$i]['monthcount']       = $monthcount;
                    $month[$i]['monthfinishcount'] = $monthfinishcount;

                }

            }
            $this->json(200, '成功', $month);
        } else {
            $this->json(404, '无计划');

        }
        // dump($month);

    }

}
