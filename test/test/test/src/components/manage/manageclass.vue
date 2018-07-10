<template>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 班级列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/manage/addclass"><span class="icon-plus-square-o"></span> 添加班级</a>
        </div>
        <el-table :data="tableData" style="width: 100%" height="365">
            <el-table-column prop="cid" label="序号"></el-table-column>
            <el-table-column prop="cname" label="班级名称"></el-table-column>
            <el-table-column prop="did" label="所属方向"></el-table-column>
            <el-table-column prop="sid" label="所学阶段"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'classUpdate',query:{cid:scope.row.cid}}">修改</router-link>
                    <el-button @click="del(scope.row.cid)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default{
        name:'calssUpdate',
        data() {
            return {
                tableData: []
            }
        },
        methods:{
            del(cid){
                this.$http.post('/testhome/classdelete.php',{cid}).then(res=>{
                    if(res.body=='ok'){
                        this.tableData=this.tableData.filter(ele=>ele.cid!=cid);
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
            this.$http.get('/testhome/manageclass.php').then(res=>{
                this.tableData = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>