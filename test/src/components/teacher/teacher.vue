<template>
<div>
    <div class="header bg-main">
        <div class="logo margin-big-left fadein-top">
            <h1><img src="../../assets/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台试题管理中心
            </h1>
        </div>
        <div class="head-l">
            <a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
            <a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;
            <a class="button button-little bg-red" href="login"><span class="icon-power-off"></span> 退出登录</a> </div>
    </div>
    <div class="leftnav">
        <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
        <h2><span class="icon-user"></span>基本设置</h2>
        <ul style="display:block">
            <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>密码修改</a></li>
        </ul>
        <h2><span class="icon-pencil-square-o"></span>功能设置</h2>
        <ul style="display:block">
            <li><a href="#/teacher/testType" target="_parent"><span class="icon-caret-right"></span>题型管理</a></li>
            <li><a href="#/teacher/managetests" target="_parent"><span class="icon-caret-right"></span>试题管理</a></li>
            <li><a href="#/teacher/managepaper" target="_parent"><span class="icon-caret-right"></span>试卷管理</a></li>
        </ul>
    </div>
    <ul class="bread">
        <li><a href="{:U('Index/info')}" target="_parent" class="icon-home"> 首页</a></li>
        <li><a href="##" id="a_leader_txt">网站信息</a></li>
    </ul>
    <div class="admin">
        <router-view></router-view>
    </div>
</div>
</template>
<script>
    export default {
        name: 'teacher',
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>