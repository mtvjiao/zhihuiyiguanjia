<?php

namespace Appi\Model;
use Think\Model;
class BaseModel extends Model {
    /**
     * 增
     * @param type $data
     * return boolean
     */
    public function add_data($data = array()) {
        if (empty($data)) {
            return FALSE;
        }
        return $this->add($data);
    }
    /**
     * 删
     * @param type $where
     * return boolean
     */
    public function delete_where($where = '') {
        if (empty($where)) {
            return FALSE;
        }
        return $this->where($where)->delete();
    }
    public function save_data($data = array()) {
        return $this->save_where_data($data);
    }
    /**
     * 改
     * @param type $data 传入数据
     * @param type $where 传入条件
     * return boolean 影响的行数
     */
    public function save_where_data($data = array(), $where = '') {
        if (empty($data)) {
            return FALSE;
        }
        if (empty($where)) {
            return $this->save($data);
        } else {
            return $this->where($where)->save($data);
        }
    }
    ///////////////////////////////////////////////查///////////////////////////////////////////////
    /////////////////////////////////find/////////////////////////////////
    /**
     * 根据条件查询1条数据find()，条件为空返回第一条数据
     * @param type $where
     * return type
     */
    public function find_admin_where_data($where = '') {
        if ($where == '') {
            return false;
        } else {
            return $this->find_where_data($where);
        }
    }
    /**
     * 根据条件查询1条数据find()，条件为空返回第一条数据
     * @param type $where
     * return type
     */
    public function find_where_data($where = '') {
        if ($where == '') {
            return $this->find();
        } else {
            return $this->where($where)->find();
        }
    }
    /**
     * where数据通过order排序
     * @param type $orderby
     * return type
     */
    public function find_where_orderby_data($where = 'id>0', $orderby = 'id') {
        return $this->where($where)->order($orderby)->find();
    }
    /////////////////////////////////count/////////////////////////////////
    /**
     * 满足指定条件的数据数量
     * @param type $where
     * return type
     */
    public function get_where_data_count($where = 'id>0') {
        return $this->where($where)->count();
    }
    /**
     * 数据表内所有数据数量
     * return type
     */
    public function get_all_data_count() {
        return $this->count();
    }
    /////////////////////////////////select/////////////////////////////////    
    /**
     * 根据条件进行查询，条件为空查询全部
     * @param type $where
     * return type
     */
    public function select_where_data($where = '') {
        if ($where == '') {
            return $this->select();
        } else {
            return $this->where($where)->select();
        }
    }
    /**
     * 返回全部数据的limit数据
     * @param type $offset
     * @param type $length
     * return type
     */
    public function select_limit_data($offset = 0, $length = 10) {
        return $this->limit($offset, $length)->select();
    }
    /**
     * 返回指定条件的limit数据
     * @param type $offset
     * @param type $length
     * return type
     */
    public function select_where_limit_data($where = 'id>0', $offset = 0, $length = 10) {
        return $this->where($where)->limit($offset, $length)->select();
    }
    /**
     * 全部数据，通过order排序
     * @param type $orderby
     * return type
     */
    public function select_all_orderby_data($orderby = 'id') {
        return $this->order($orderby)->select();
    }
    /**
     * where数据通过order排序
     * @param type $orderby
     * return type
     */
    public function select_where_orderby_data($where = 'id>0', $orderby = 'id') {
        return $this->where($where)->order($orderby)->select();
    }
    /**
     * where数据通过order排序
     * @param type $orderby
     * return type
     */
    public function select_where_limit_orderby_data($where = 'id>0', $orderby = 'id', $offset = 0, $length = 10) {
        return $this->where($where)->order($orderby)->limit($offset, $length)->select();
    }
    /**
     * where数据通过order排序
     * @param type $orderby
     * return type
     */
    public function select_limit_orderby_data($orderby = 'id', $offset = 0, $length = 10) {
        return $this->order($orderby)->limit($offset, $length)->select();
    }
    /////////////////////////////////all/////////////////////////////////
    /**
     * 返回全部数据
     * return type
     */
    public function get_all_data() {
        return $this->select();
    }
}
