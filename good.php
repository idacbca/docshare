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