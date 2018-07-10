<template>
    <div class="box">
        <header>
            <div class="content">
                <img src="" alt="">
                <div class="right">
                    <ul class="nav">
                        <li><a href="#/student/studentexam">试卷 </a></li>
                        <li><a href="#/student/studentHistory">历史记录 </a></li>
                    </ul>
                    <ul class="info">
                        <el-button round>王鹏</el-button>
                        <el-button round @click="del()">退出</el-button>
                    </ul>
                </div>
            </div>
        </header>
        <router-view>

        </router-view>
    </div>
</template>
<script>
    export default{
        name:'student',
        methods:{
            del(){
                this.$router.push({name:'login'});
            }
        },
//        beforeCreate(){
//            let flag=sessionStorage.isLogin;
//            if(!flag){
//                this.$router.push({name:'login'});
//            }
//        }
    }
</script>
<style>
    *{
    margin:0;
    padding: 0;
    list-style: none;
}
    .box{
        width: 100%;
        height: auto;
    }
    .box header{
    width: 100%;
    height: 80px;
    background: #ffffff;
    position: fixed;
    top:0;
    left:0;
    z-index: 100;
    box-shadow: 0 5px 5px rgba(0,0,0,0.2);
}
    .box .content{
        width: 1200px;
        height:100%;
        margin:0 auto;
        display: flex;
        justify-content: space-between;
        align-content: center;
    }
    .box .content img{
        width: 50px;
        height: 50px;
        filter:grayscale(1);
    }
    .box .content .right{
        flex:1;
        display: flex;
        justify-content: flex-end;
        height: 100%;
        align-items: center;
    }
    .nav,info{
        display: flex;
        height: 100%;
        justify-content: space-between;
        align-items: center;
    }
    .nav{
        margin-right: 30px;
    }
    .nav li{
        margin-right: 30px;
    }
</style>