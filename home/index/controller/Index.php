<?php
namespace app\index\controller;

use think\Controller;

class Index extends Common
{
    public function index()
    {
        $this->assign([
            'title' => 'DocShare'
        ]);
        return $this->fetch();
    }

    public function blog_details()
    {
        $this->assign([
            'title' => 'DocShare - 详情'
        ]);
        return $this->fetch();
    }
}