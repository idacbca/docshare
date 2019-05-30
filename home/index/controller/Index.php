<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Common
{
    public function index()
    {
        if(input('id')){
        $goods = db('goods');
        $data = $goods->where('id', input('id'))->select();
        $this->assign([
            'title' => 'DocShare', 
            'details' => $data 
        ]);
        return $this->fetch();
    } else{
        $goods = db('goods');
        $data = $goods->select();
            $this->assign([
                'details' => $data,
            ]);
            return $this->fetch();
      }
    }

    public function upload()
    {
        
        $this->assign([
            'title' => 'DocShare - 上传文件'
        ]);
        return $this->fetch();
    }

    public function blog_details()
    {
        if(input('id')){
            //var_dump(input('id'));
            //$type = $this->getCatgory();

            $goods = db('goods');
            $data = $goods->where('id', input('id'))->select();
            $id = $tpid->where('pid',input('id'))->column('id');
            $this->assign([
                'details' => $data,
            ]);
            return $this->fetch();
        } else{
            $goods = db('goods');
            //$idpath = $this->getGoodsPath();
           // $img = $this->getimgPath();
            $data = $goods->select();
            $this->assign([
                'details' => $data,
            ]);
            return $this->fetch();
      }
  }
}