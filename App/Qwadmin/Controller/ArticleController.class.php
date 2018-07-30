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
use Think\Auth;
use Vendor\Tree;

class ArticleController extends ComController
{
    public function add()
    {
        $option = M('organization')->order('id ASC')->select();
        $option = $this->getMenu($option);
        $this->assign('option', $option);
        $area = M('area')->order('o ASC')->select();
        $area = $this->getMenu($area);
        $this->assign('area', $area);
        $category = M('category')->field('id,pid,name')->order('o asc')->select();
        $tree     = new Tree($category);
        $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
        $category = $tree->get_tree(0, $str, 0);
        $this->assign('category', $category); //导航
        $this->display();
    }
    public function index($sid = 0, $p = 1)
    {
        $sid      = intval($sid);
        $p        = intval($p) > 0 ? $p : 1;
        $article  = M('article');
        $pagesize = 20; #每页数量
        $offset   = $pagesize * ($p - 1); //计算记录偏移量
        $prefix   = C('DB_PREFIX');
        if ($sid) {
            $where = "{$prefix}article.sid=$sid and {$prefix}article.zt = 0";
        } else {
            $where = "{$prefix}article.zt = 0";
        }
        $count = $article->where($where)->count();
        $list  = $article->field("{$prefix}article.*,{$prefix}category.name")->where($where)->order("{$prefix}article.aid desc")->join("{$prefix}category ON {$prefix}category.id = {$prefix}article.sid")->limit($offset . ',' . $pagesize)->select();
        foreach ($list as $key => $value) {
            $area = M('area')->field('id,pid,name')->where('id=' . $value['title'])->find();
            if ($area) {
                $areas                  = M('area')->field('id,name')->where('id=' . $area['pid'])->find();
                $list[$key]['areaname'] = $areas['name'] . $area['name'];
            } else {
                $list[$key]['areaname'] = "未知";
            }
            $shebei                   = M('shebei')->field('id,name')->where('id=' . $value['shebeiid'])->find();
            $list[$key]['shebeiname'] = $shebei['name'];
        }
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->display();
    }
    public function cindex($sid = 0, $p = 1)
    {
        $sid      = intval($sid);
        $p        = intval($p) > 0 ? $p : 1;
        $article  = M('article');
        $pagesize = 20; #每页数量
        $offset   = $pagesize * ($p - 1); //计算记录偏移量
        $prefix   = C('DB_PREFIX');
        if ($sid) {
            $where = "{$prefix}article.sid=$sid and {$prefix}article.zt = 1";
        } else {
            $where = "{$prefix}article.zt = 1";
        }
        $count = $article->where($where)->count();
        $list  = $article->field("{$prefix}article.*,{$prefix}category.name")->where($where)->order("{$prefix}article.aid desc")->join("{$prefix}category ON {$prefix}category.id = {$prefix}article.sid")->limit($offset . ',' . $pagesize)->select();
        foreach ($list as $key => $value) {
            $area = M('area')->field('id,pid,name')->where('id=' . $value['title'])->find();
            //$list[$key]['areaname'] = $area['name'];
            $areas                    = M('area')->field('id,name')->where('id=' . $area['pid'])->find();
            $list[$key]['areaname']   = $areas['name'] . $area['name'];
            $shebei                   = M('shebei')->field('id,name')->where('id=' . $value['shebeiid'])->find();
            $list[$key]['shebeiname'] = $shebei['name'];
        }
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->display();
    }
    public function del()
    {
        $aids = isset($_REQUEST['aids']) ? $_REQUEST['aids'] : false;
        if ($aids) {
            if (is_array($aids)) {
                $aids       = implode(',', $aids);
                $map['aid'] = array('in', $aids);
            } else {
                $map = 'aid=' . $aids;
            }
            if (M('article')->where($map)->delete()) {
                addlog('删除文章，AID：' . $aids);
                $this->success('恭喜，文章删除成功！');
            } else {
                $this->error('参数错误！');
            }
        } else {
            $this->error('参数错误！');
        }
    }
    public function edit($aid)
    {
        $aid     = intval($aid);
        $article = M('article')->where('aid=' . $aid)->find();
        if ($article) {
            $option = M('organization')->order('id ASC')->select();
            $option = $this->getMenu($option);
            $this->assign('option', $option);
            $area = M('area')->order('o ASC')->select();
            $area = $this->getMenu($area);
            $this->assign('area', $area);
            $category = M('category')->field('id,pid,name')->order('o asc')->select();
            $tree     = new Tree($category);
            $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
            $category = $tree->get_tree(0, $str, $article['sid']);
            $this->assign('category', $category); //导航
            $chengdu = $article['chengdu'];
            $this->assign('chengdu', $chengdu); //故障
            $this->assign('article', $article);
        } else {
            $this->error('参数错误！');
        }
        $this->display();
    }
    public function demo4()
    {
        $uid      = $this->USER['uid'];
        $Auth     = new Auth();
        $userauth = $Auth->getGroups($uid);
        if ($userauth[0]['group_id'] != 1) {
            $this->error('无权限！');
            exit;
        }
        $article = M('article');
        $prefix  = C('DB_PREFIX');
        $b       = date('Y'); //月份时间戳
        for ($i = 1; $i < 13; $i++) {
            if ($i < 12) {
                $a[$i]      = strtotime("$b-$i-1 00:00:00");
                $c[$i]      = strtotime("$b-$i-31 00:00:00");
                $count[$i]  = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i]")->count();
                $counts[$i] = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and {$prefix}article.zt = 1")->count();
            } else {
                $a[$i]      = strtotime("$b-$i-1 00:00:00");
                $d          = date('Y') + 1;
                $c[$i]      = strtotime("$d-1-31 00:00:00");
                $count[$i]  = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i]")->count();
                $counts[$i] = $article->where("{$prefix}article.t>$a[$i] and {$prefix}article.t < $c[$i] and {$prefix}article.zt = 1")->count();
            }
        }
        $this->assign('count', $count);
        $this->assign('counts', $counts);
        $this->display();
    }
    public function view($aid)
    {
        $aid     = intval($aid);
        $article = M('article')->where('aid=' . $aid)->find();
        if ($article) {
            $option = M('organization')->order('id ASC')->select();
            $option = $this->getMenu($option);
            $this->assign('option', $option);
            $area = M('area')->order('o ASC')->select();
            $area = $this->getMenu($area);
            $this->assign('area', $area);
            $category = M('category')->field('id,pid,name')->order('o asc')->select();
            $tree     = new Tree($category);
            $str      = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
            $category = $tree->get_tree(0, $str, $article['sid']);
            $this->assign('category', $category); //导航
            $chengdu = $article['chengdu'];
            $this->assign('chengdu', $chengdu); //故障
            $this->assign('article', $article);
        } else {
            $this->error('参数错误！');
        }
        $this->display();
    }
    public function update($aid = 0)
    {
        $aid                 = intval($aid);
        $data['sid']         = isset($_POST['sid']) ? intval($_POST['sid']) : 0;
        $data['chengdu']     = isset($_POST['chengdu']) ? intval($_POST['chengdu']) : 0;
        $data['title']       = isset($_POST['area']) ? $_POST['area'] : 0;
        $data['seotitle']    = isset($_POST['seotitle']) ? $_POST['seotitle'] : '';
        $data['keywords']    = isset($_POST['keywords']) ? $_POST['keywords'] : '';
        $data['bumen']       = isset($_POST['bumen']) ? $_POST['bumen'] : '';
        $data['description'] = I('post.description', '', 'strip_tags');
        $data['content']     = isset($_POST['content']) ? $_POST['content'] : false;
        $data['img0']        = I('post.thumbnail', '', 'strip_tags');
        $data['t']           = time();
/*        if(!$data['sid'] or !$data['title'] or !$data['content']){
$this->error('警告！文章分类、文章标题及文章内容为必填项目。');
}*/
        if ($aid) {
            M('article')->data($data)->where('aid=' . $aid)->save();
            addlog('编辑文章，AID：' . $aid);
            $this->success('恭喜！文章编辑成功！');
        } else {
            $aid = M('article')->data($data)->add();
            if ($aid) {
                addlog('新增文章，AID：' . $aid);
                $this->success('恭喜！文章新增成功！');
            } else {
                $this->error('抱歉，未知错误！');
            }
        }
    }
}
