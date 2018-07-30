<?php
/**
 *
 *
 * 作    者：七宝<jiaoaixin@126.com>
 * 日    期：2016-09-20
 * 版    本：1.0.0
 * 功能说明：文章控制器。
 *
 **/

namespace Qwadmin\Controller;

use Qwadmin\Controller\ComController;
use Vendor\Tree;

class CategoryztController extends ComController
{

    public function index()
    {

        $category = M('categoryzt')->field('id,pid,name')->order('id asc')->select();
        $category = $this->getMenu($category);
        $this->assign('category', $category);
        $this->display();
    }

    public function del()
    {

        $id = isset($_GET['id']) ? intval($_GET['id']) : false;
        if ($id) {
            $data['id'] = $id;
            $category   = M('categoryzt');
            if ($category->where('pid=' . $id)->count()) {
                die('2'); //存在子类，严禁删除。
            } else {
                $category->where('id=' . $id)->delete();
                addlog('删除分类，ID：' . $id);
            }
            die('1');
        } else {
            die('0');
        }

    }

    public function edit()
    {

        $id              = isset($_GET['id']) ? intval($_GET['id']) : false;
        $currentcategory = M('categoryzt')->where('id=' . $id)->find();
        $this->assign('currentcategory', $currentcategory);

        $category = M('category')->field('id,pid,name')->order('id asc')->select();
        $tree     = new Tree($category);
        $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
        $category = $tree->get_tree(0, $str, $currentcategory['pid']);

        $this->assign('category', $category);
        $this->display();
    }

    public function add()
    {

        $pid      = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
        $category = M('categoryzt')->field('id,pid,name')->order('id asc')->select();
        $tree     = new Tree($category);
        $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
        $category = $tree->get_tree(0, $str, $pid);

        $this->assign('category', $category);
        $this->display();
    }

    public function update($act = null)
    {

        $id           = I('post.id', false, 'intval');
        $data['pid']  = I('post.pid', 0, 'intval');
        $data['name'] = I('post.name');

        if ($data['name'] == '') {
            $this->error('分类名称不能为空！');
        }
        if ($id) {
            if (M('categoryzt')->data($data)->where('id=' . $id)->save()) {
                addlog('文章分类修改，ID：' . $id . '，名称：' . $data['name']);
                $this->success('恭喜，分类修改成功！');
                die(0);
            }
        } else {
            $id = M('categoryzt')->data($data)->add();
            if ($id) {
                addlog('新增分类，ID：' . $id . '，名称：' . $data['name']);
                $this->success('恭喜，新增分类成功！');
                die(0);
            }
        }
        $this->success('恭喜，操作成功！');
    }
}
