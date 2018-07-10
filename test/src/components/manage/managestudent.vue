<template>

    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 学生列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/manage/addstudent"><span class="icon-plus-square-o"></span> 添加学生</a>
        </div>
        <el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange" height="300">
            <el-table-column type="selection"></el-table-column>
            <el-table-column label="序号">
                <template slot-scope="scope">{{ scope.row.mid }}</template>
            </el-table-column>
            <el-table-column prop="uname" label="学生姓名"></el-table-column>
            <el-table-column prop="msex" label="性别"></el-table-column>
            <el-table-column prop="mnum" label="学号"></el-table-column>
            <el-table-column prop="cid" label="所在班级"></el-table-column>
            <el-table-column prop="sid" label="所学阶段"></el-table-column>
            <el-table-column prop="did" label="所属方向"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'studentUpdate',query:{mid:scope.row.mid}}">修改</router-link>
                </template>
            </el-table-column>
        </el-table>
        <div style="margin: 15px 10px;">
            <el-button @click="reverSelection()">反选</el-button>
            <el-button @click="cancel()">取消选择</el-button>
            <el-button @click="del()">删除</el-button>
        </div>
    </div>
</template>
<script>
    export default{
        name:'managestudent',
        data() {
            return {
                tableData: [],
                multipleSelection: [],
            }
        },
        methods:{
            ///////反选/////////
            reverSelection() {
                this.tableData.forEach(row => {
                    this.$refs.multipleTable.toggleRowSelection(row);
                });
            },
            ///////取消选择///////
            cancel(){
                this.$refs.multipleTable.clearSelection();
            },
            //////////多选//////////
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            //////////删除选中的//////////
            del(){
                let ids=this.multipleSelection.map(ele=>ele.mid);
                this.$http.post('/testhome/studentdelete.php',{ids}).then(res=>{
                    if(res.body=='ok'){
                        this.$message({
                            message:'删除成功',
                            type:"success"
                        })
                        this.tableData=this.tableData.filter(ele=>!ids.includes(ele.mid));
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
            this.$http.get('/testhome/managestudent.php').then(res=>{
                this.tableData = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>