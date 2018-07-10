<template>
<div>
    <div class="header bg-main">
        <div class="logo margin-big-left fadein-top">
            <h1><img src="../../assets/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
        </div>
        <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span
                class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
            <a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;
            <a class="button button-little bg-red" href="login"><span class="icon-power-off"></span> 退出登录</a> </div>
    </div>
    <div class="leftnav">
        <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
        <h2><span class="icon-user"></span>基本设置</h2>
        <ul style="display:block">
            <li><a href="#/manage/managedir" target="_parent"><span class="icon-caret-right"></span>方向管理</a></li>
            <li><a href="#/manage/managestage" target="_parent"><span class="icon-caret-right"></span>阶段管理</a></li>
            <li><a href="#/manage/manageclass" target="_parent"><span class="icon-caret-right"></span>班级管理</a></li>
            <li><a href="#/manage/managestudent" target="_parent"><span class="icon-caret-right"></span>学生管理</a></li>
            <li><a href="#/manage/manageteacher" target="_parent"><span class="icon-caret-right"></span>教师管理</a></li>
        </ul>
        <!--<h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
        <ul>
            <li><a href="list.html" target="_parent"><span class="icon-caret-right"></span>内容管理</a></li>
            <li><a href="add.html" target="_parent"><span class="icon-caret-right"></span>添加内容</a></li>
            <li><a href="cate.html" target="_parent"><span class="icon-caret-right"></span>分类管理</a></li>
        </ul>-->
    </div>
    <ul class="bread">
        <li><a href="{:U('Index/info')}" target="_parent" class="icon-home"> 首页</a></li>
        <li><a href="##" id="a_leader_txt">网站信息</a></li>
    </ul>
    <div class="admin" id="">
        <router-view></router-view>
    </div>
</div>
</template>
<script>
    export default {
        name: 'manage',
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>