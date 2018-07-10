<template>
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 试题列表</strong></div>
        <div class="padding border-bottom">
            <a class="button border-yellow" href="#/teacher/addtests">
                <span class="icon-plus-square-o"></span> 添加试题
            </a>
        </div>
        <el-table :data="tableData" style="width: 100%" height="365">
            <el-table-column type="expand">
                <template slot-scope="props">
                    <el-form label-position="left" inline class="demo-table-expand">
                        <el-form-item label="解析">
                            <span>{{ props.row.sexp }}</span>
                        </el-form-item>
                        <div v-if="props.row.options">
                            <el-form-item label="选项"></el-form-item>
                            <el-form-item v-for="item in props.row.options" :key="item.key">
                                <span>{{ item.key }}</span><span>:</span><span>{{ item.value }}</span>
                            </el-form-item>
                        </div>
                    </el-form>
                </template>
            </el-table-column>
            <el-table-column label="题号" prop="sid"></el-table-column>
            <el-table-column label="题型" prop="stype"></el-table-column>
            <el-table-column label="题干" prop="title"></el-table-column>
            <el-table-column label="答案" prop="sanswer"></el-table-column>
            <el-table-column label="分数" prop="score"></el-table-column>
            <el-table-column label="所属阶段" prop="sname"></el-table-column>
            <el-table-column label="出题人" prop="sauthor"></el-table-column>
            <el-table-column label="操作">
                <template slot-scope="scope">
                    <router-link :to="{name:'testsUpdate',query:{sid:scope.row.sid}}">修改</router-link>
                    <el-button @click="del(scope.row.sid)" type="text" size="small">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default{
        name:'managetests',
        data() {
            return {
                tableDatas: []
            }
        },
        computed:{
            tableData(){
                let tableData=[];
                this.tableDatas.forEach(element=>{
                    let v=element.stitle.split('_');
                    let title=v[0];
                    let options=[];
                    if(v[1]){
                        let arr=v[1].split('|');
                        for(let i=0;i<arr.length;i++){
                            let newarr=arr[i].split(':');
                            options.push({key:newarr[0],value:newarr[1]})
                        }
                    }else{
                        options='';
                    }
                    tableData.push({
                        sid:element.sid,
                        title,
                        options,
                        stype:element.stype,
                        sanswer:element.sanswer,
                        sexp:element.sexp,
                        sauthor:element.sauthor,
                        sname:element.sname,
                        score:element.score
                    })
                })
                return tableData;
            }
        },
        methods:{
            del(sid){
                this.$http.post('/testhome/testsdelete.php',{sid}).then(res=>{
                    if(res.body=='ok'){
                        this.tableDatas=this.tableDatas.filter(ele=>ele.sid!=sid);
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
            this.$http.get('/testhome/managetests.php').then(res=>{
                this.tableDatas = res.body
            })
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>