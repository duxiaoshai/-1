<template>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 方向列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/manage/addDir"><span class="icon-plus-square-o"></span> 添加方向</a>
        </div>
        <el-table :data="tableData" style="width: 100%" height="365">
            <el-table-column prop="did" label="序号"></el-table-column>
            <el-table-column prop="dname" label="方向名称"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'dirUpdate',query:{did:scope.row.did}}">修改</router-link>
                    <el-button @click="del(scope.row.did)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default{
        name:'managedir',
        data() {
            return {
                tableData: []
            }
        },
        methods:{
            del(did){
                this.$http.post('/testhome/dirdelete.php',{did}).then(res=>{
                    if(res.body=='ok'){
                        this.tableData=this.tableData.filter(ele=>ele.did!=did);
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
            this.$http.get('/testhome/managedir.php').then(res=>{
               this.tableData = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>