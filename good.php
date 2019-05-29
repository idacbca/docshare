public function downloud(){ 
    $file_n = Db::name("youxi")->where("uid",$request->param("id"))->find();
    if(!$file_n){
        return "暂无下载入口";
    }
        $file = get_img($file_n["xiazai"]);
        //str_replace为了严谨点嘛，不要也可以
        $file_lj = str_replace("\\","/",ROOT_PATH.'public');
        $files = $file_lj.$file;
        if(!file_exists($files)){
            return "文件不存在";
        }else {
            //打开文件
            $file1 = fopen($files, "r");
            //输入文件标签
            Header("Content-type: application/octet-stream");
            Header("Accept-Ranges: bytes");
            Header("Accept-Length: " . filesize($files));
            Header("Content-Disposition: attachment; filename=" . $file_n["xiazai"]);
            echo fread($file1, filesize($files));
            fclose($file1);
        }

}


public function downloud(){ 
    $id = input('id');
    $m = db('goods');
    $file = $m->find($id);
    $file
    $file_dir = ROOT_PATH . 'public' . DS . 'uploads' . '/' . "$famlePath";    // 下载文件存放目录
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
function download($file_url,$new_name=''){
    if(!isset($file_url)||trim($file_url)==''){
      echo '500';
    }
    if(!file_exists($file_url)){ //检查文件是否存在
      echo '404';
    }
    $file_name=basename($file_url);
    $file_type=explode('.',$file_url);
    $file_type=$file_type[count($file_type)-1];
    $file_name=trim($new_name=='')?$file_name:urlencode($new_name);
    $file_type=fopen($file_url,'r'); //打开文件
    //输入文件标签
    header("Content-type: application/octet-stream");
    header("Accept-Ranges: bytes");
    header("Accept-Length: ".filesize($file_url));
    header("Content-Disposition: attachment; filename=".$file_name);
    //输出文件内容
    echo fread($file_type,filesize($file_url));
    fclose($file_type);
}
