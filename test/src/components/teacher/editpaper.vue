<template>
   <div>
       <el-form ref="form" :model="form" label-width="80px" :rules="rules">
           <el-form-item label="ID">{{form.pid}}</el-form-item>
           <el-form-item label="试卷名称" prop="pname">
               <el-input type="input" v-model="form.pname"></el-input>
           </el-form-item>
           <el-form-item label="选择班级">
               <el-select v-model="form.cname" placeholder="请选择班级">
                   <el-option v-for="val in classes" :value="val.cname" :label="val.cname" :key="val.cid"></el-option>
               </el-select>
           </el-form-item>
           <el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%"
                     @selection-change="handleSelectionChange" height="155">
               <el-table-column type="selection"></el-table-column>
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
               <el-table-column label="题号">
                   <template slot-scope="scope">{{ scope.row.sid }}</template>
               </el-table-column>
               <el-table-column label="题型" prop="stype"></el-table-column>
               <el-table-column label="题干" prop="title"></el-table-column>
               <el-table-column label="答案" prop="sanswer"></el-table-column>
               <el-table-column label="分数" prop="score"></el-table-column>
               <el-table-column label="所属阶段" prop="sname"></el-table-column>
               <el-table-column label="出题人" prop="sauthor"></el-table-column>
           </el-table>
           <div style="margin: 15px 10px;">
               <el-button @click="reverSelection()">反选</el-button>
               <el-button @click="cancel()">取消选择</el-button>
               <el-button @click="addTest()">添加试题</el-button>
           </div>
           <el-form-item>
               <el-button type="primary" @click="submitForm('form')">提交</el-button>
           </el-form-item>
       </el-form>
   </div>
</template>
<script>
    export default{
        name:'editpaper',
        data() {
            return {
                pid:'',
                form:{
                    pname:'',
                    cid:''
                },
                rules: {
                    pname: [
                        { required: true, message: '请输入试卷名称', trigger: 'blur' },
                        { min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur' }
                    ],
                },
                classes:[],
                tableDatas: [],
                multipleSelection: [],
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
            addTest(){
                let sids=this.multipleSelection.map(ele=>ele.sid);
                this.$http.post('/testhome/addTest.php',{pid:this.pid,sids:sids}).then(res=>{
                    if(res.body=='ok'){
                        this.$message({
                            message:'恭喜你，添加成功',
                            type:"success"
                        })
                    }else if(res.body=='error'){
                        this.$message({
                            message:'对不起，添加失败',
                            type:"error"
                        })
                    }
                })
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/paperupdate.php',this.form).then(res=>{
                            if(res.body=='ok'){
                                this.$message({
                                    message:'恭喜你，修改成功',
                                    type:"success"
                                })
                                this.$router.push('managepaper')
                            }else if(res.body=='error'){
                                this.$message({
                                    message:'对不起，修改失败',
                                    type:"error"
                                })
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });


            }
        },
        mounted(){
            this.pid=this.$route.query.pid;
            this.$http.get('/testhome/paperquery.php?pid='+this.pid).then(res=>{
                this.form=res.body
            })
            this.$http.get('/testhome/manageclass.php').then(res=>{
                this.classes = res.body
            })

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