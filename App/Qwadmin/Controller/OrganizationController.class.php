<?php

namespace Qwadmin\Controller;

use Qwadmin\Controller\ComController;
use Vendor\Tree;

class OrganizationController extends ComController
{

    public function index()
    {

        $category = M('organization')->field('id,pid,name,o')->order('o asc')->select();
        $category = $this->getMenu($category);
        $this->assign('category', $category);
        $this->display();
    }

    public function del()
    {

        $id = isset($_GET['id']) ? intval($_GET['id']) : false;
        if ($id) {
            $data['id'] = $id;
            $category   = M('organization');
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
        $currentcategory = M('Organization')->where('id=' . $id)->find();
        $this->assign('currentcategory', $currentcategory);

        $category = M('Organization')->field('id,pid,name')->order('o asc')->select();
        $tree     = new Tree($category);
        $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
        $category = $tree->get_tree(0, $str, $currentcategory['pid']);

        $this->assign('category', $category);
        $this->display();
    }

    public function add()
    {

        $pid      = isset($_GET['pid']) ? intval($_GET['pid']) : 0;
        $category = M('Organization')->field('id,pid,name')->order('o asc')->select();
        $tree     = new Tree($category);
        $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
        $category = $tree->get_tree(0, $str, $pid);

        $this->assign('category', $category);
        $this->display();
    }

    public function update($act = null)
    {
        if ($act == 'order') {
            $id = I('post.id', 0, 'intval');
            if (!$id) {
                die('0');
            }
            $o = I('post.o', 0, 'intval');
            M('Organization')->data(array('o' => $o))->where("id='{$id}'")->save();
            addlog('修改排序，ID：' . $id);
            die('1');
        }

        $id = I('post.id', false, 'intval');

        $data['pid']  = I('post.pid', 0, 'intval');
        $data['name'] = I('post.name');

        $data['o'] = I('post.o', 0, 'intval');
        if ($data['name'] == '') {
            $this->error('名称不能为空！');
        }

        if ($id) {
            $oldname = M('Organization')->where('id=' . $id)->find();
			//dump(C('dir').$oldname['name']);
            $oldupload_dir = iconv('UTF-8', 'GB2312', C('dir').$oldname['name']); //保存上传文件的目录
            $upload_dir = iconv('UTF-8', 'GB2312', C('dir').$data['name']); //保存上传文件的目录

            //dump($oldupload_dir);

            rename($oldupload_dir, $upload_dir);
            if (M('Organization')->data($data)->where('id=' . $id)->save()) {

                addlog('修改，ID：' . $id . '，名称：' . $data['name']);
                $this->success('恭喜，修改成功！');
                die(0);
            }
        } else {
            $id         = M('Organization')->data($data)->add();
            $upload_dir = iconv('UTF-8', 'GB2312', $data['name']); //保存上传文件的目录

            if (!@file_exists(C('dir') . $upload_dir)) {
                @mkdir(C('dir') . $upload_dir);

                if ($id) {
                    addlog('新增，ID：' . $id . '，名称：' . $data['name']);
                    $this->success('恭喜，新增成功！');
                    die(0);
                }
            }

        }
        $this->success('恭喜，操作成功！');
    }
}
