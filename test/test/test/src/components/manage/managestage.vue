<template>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 阶段列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/manage/addstage"><span class="icon-plus-square-o"></span> 添加阶段</a>
        </div>
        <el-table :data="tableData" style="width: 100%" height="365">
            <el-table-column prop="sid" label="序号"></el-table-column>
            <el-table-column prop="sname" label="阶段名称"></el-table-column>
            <el-table-column prop="did" label="所属方向"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'stageUpdate',query:{sid:scope.row.sid}}">修改</router-link>
                    <el-button @click="del(scope.row.sid)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default{
        name:'managestage',
        data() {
            return {
                tableData: []
            }
        },
        methods:{
            del(sid){
                this.$http.post('/testhome/stagedelete.php',{sid}).then(res=>{
                    if(res.body=='ok'){
                        this.tableData=this.tableData.filter(ele=>ele.sid!=sid);
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
            this.$http.get('/testhome/managestage.php').then(res=>{
                this.tableData = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>