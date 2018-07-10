<template>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 题型列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/teacher/addtestType"><span class="icon-plus-square-o"></span> 添加题型
            </a>
        </div>
        <el-table :data="tableData" style="width: 100%" height="365">
            <el-table-column prop="tid" label="序号"></el-table-column>
            <el-table-column prop="tname" label="方向名称"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'testTypeUpdate',query:{tid:scope.row.tid}}">修改</router-link>
                    <el-button @click="del(scope.row.tid)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default{
        name:'testType',
        data() {
            return {
                tableData: []
            }
        },
        methods:{
            del(tid){
                this.$http.post('/testhome/testTypedelete.php',{tid}).then(res=>{
                    if(res.body=='ok'){
                        this.tableData=this.tableData.filter(ele=>ele.tid!=tid);
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
            this.$http.get('/testhome/testType.php').then(res=>{
                this.tableData = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>