<?php

namespace Appi\Controller;

use Appi\Controller\ComsController;

class TestController extends ComsController
{
    public function Index()
    {
        // echo "string";
        // $data = array('name'=>'hahah' , 'age'=>'23');
        // $data['age']  = '29';
        // D('test')->add_data(array('name'=>'hah212ah' , 'age'=>'23'));
        $m = M();
        // $sql  = 'SELECT * FROM qw_test where id = %d'; //占位符
        // $sids = $m->query($sql, 1);

        // $where = 'id = %d';
        // $sids  = M('test')->where($where, 1)->select();

        //调用存储过程的测试  call 调取mysql的储存过程
        // $sql = "call selectuser()";
        // $sids = $m->query($sql);
        // %d来替代select中的数字 占位符
        // $sql  = "select * from qw_test where id = %d";
        // $sids = $m->query($sql, 3);
        //调用mysql函数的测试  select 调取mysql的函数
        $sql  = "select adduser('jia',30) ";
        $sids = $m->query($sql);



        dump($sids);
    }

}
