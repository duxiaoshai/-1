<template>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 题型列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/teacher/addpaper"><span class="icon-plus-square-o"></span> 添加试卷
            </a>
        </div>
        <el-table :data="tableData" style="width: 100%" height="365">
            <el-table-column prop="pid" label="序号"></el-table-column>
            <el-table-column prop="pname" label="试卷名称"></el-table-column>
            <el-table-column prop="cname" label="考试班级"></el-table-column>
            <el-table-column prop="uname" label="出题人"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'editpaper',query:{pid:scope.row.pid}}">编辑</router-link>
                    <el-button @click="del(scope.row.pid)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default{
        name:'managepaper',
        data() {
            return {
                tableData: []
            }
        },
        methods:{
            del(pid){
                this.$http.post('/testhome/paperdelete.php',{pid}).then(res=>{
                    if(res.body=='ok'){
                        this.tableData=this.tableData.filter(ele=>ele.pid!=pid);
                    }else if(res.body=='error'){
                        this.$message({
                            message:'删除失败',
                            type:"warning"
                        })
                    }
                })
            }
        },
        mounted(){
            this.$http.get('/testhome/managepaper.php').then(res=>{
                this.tableData = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>