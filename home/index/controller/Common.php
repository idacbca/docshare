<?php
namespace app\index\controller;

use think\Controller;
use think\auth\Auth;

class Common extends Controller
{
    // 当任何函数加载时候  会调用此函数
    public function _initialize(){
        $re = input('?session.cid');
        if($re){
            if(time() - session('session_start_time_f') > config('session')['expire']) {
                session(null);//真正的销毁在这里！
                $this->error('登录已过期！', url('index/users/login'));
            } 
        }
        
    }
    
    
    public function getGoodsPath(){
        //$m = db('goods_type');
        $n = db('goods');
        //$id = $n->where('id',input('id'))->value('tid');
        //$idpath = $m->where('id',$id)->value('path');
      //  $idpath = $m->where('id',$id)->value('path');
        //$arr2 = explode(',',$idpath);
       // $arr = array_filter($arr2);
        $pathname2 = array();
        foreach($arr as $k=>&$pathname){           
            $arr[$k] = $m->where('id',$pathname)->value('name');               
        }
        //var_dump($arr);
        return $arr;
    }
    public function getfilePath(){
        $n = db('goods');
        $m = db('goods_files');
        $file = $n->where('id',input('id'))->value('filepath');
        $file2 = explode(',',$file);
        var_dump($file2);
        $filepath = array();
        foreach($file2 as $file3){
            $filepath2 = $m->where('id',$file3)->select();
            //var_dump($imgpath2);
            array_push($filepath,$filepath2);
        }
        
       //var_dump($imgpath);
       return $filepath;
    }
}