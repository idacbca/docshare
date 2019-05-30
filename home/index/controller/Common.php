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
<<<<<<< HEAD
    public function getgoods(){
        $goods = db('goods');
        $data = $goods->select();

    }

    public function getfile(){
        $file = request()->file('file');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                // 成功上传后 获取上传信息
                // 输出 jpg
                echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getFilename(); 
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }
        
=======
    
    
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
    public function getimgPath(){
        $n = db('goods');
        //$m = db('goods_files');
        $img = $n->where('id',input('id'))->value('filepath');
        $img2 = explode(',',$img);
        //var_dump($img2);
        $imgpath = array();
        foreach($img2 as $img3){
            $imgpath2 = $m->where('id',$img3)->select();
            //var_dump($imgpath2);
            array_push($imgpath,$imgpath2);
        }
        
       //var_dump($imgpath);
       return $imgpath;
>>>>>>> 2814dabc15e97438c10e8ac165d7cc12177ef4f1
    }
}