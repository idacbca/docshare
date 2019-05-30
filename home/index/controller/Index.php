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
        $data = $goods->where('goodsid', input('id'))->select();
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
            
            //$type = $this->getCatgory();

            $goods = db('goods');
            $data = $goods->where('goodsid', input('id'))->select();
            //var_dump($data);
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
  public function goods_add()
  {
    $goods = db('goods');
    $goods->data([
        'goodsname' => $_POST['goodsname'],
        'goodtype' => $_POST['goodtype'],
        'categoryid' => $_POST['categoryid'],
        //'brief' => $_POST['brief'],
        'unitprice' => $_POST['unitprice'],
        'quantity' => $_POST['quantity'],
        'freight' => $_POST['freight'],
       // 'filepath' => $_POST['filepath'],
        //'filepath' => implode(',', $_POST['imagepath']),
    ]);
    var_dump($goods);
    $result = $goods->save();
    // $result = $db->insert($data);
    if($result){
        $this->success('商品添加成功！', 'upload');
    } else{
        $this->error('商品添加失败！');
    }
}

public function download(){
        $famlePath = input('filepath');
        $file_dir = ROOT_PATH . 'public' . DS . 'uploads' . '/' . "$famlePath";    // 下载文件存放目录
        
        // 检查文件是否存在
        if (! file_exists($file_dir) ) {
            $this->error('文件未找到');
        }else{
            // 打开文件
            $file1 = fopen($file_dir, "r");
            // 输入文件标签
            Header("Content-type: application/octet-stream");
            Header("Accept-Ranges: bytes");
            Header("Accept-Length:".filesize($file_dir));
            Header("Content-Disposition: attachment;filename=" . $file_dir);
            ob_clean();     // 重点！！！
            flush();        // 重点！！！！可以清除文件中多余的路径名以及解决乱码的问题：
            //输出文件内容
            //读取文件内容并直接输出到浏览器
            echo fread($file1, filesize($file_dir));
            fclose($file1);
            exit();
        }
}
}