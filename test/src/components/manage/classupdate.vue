<template>
    <div>
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
            <el-form-item label="ID">
                {{form.cid}}
            </el-form-item>
            <el-form-item label="班级名称" prop="cname">
                <el-input  type="text" v-model="form.cname"></el-input>
            </el-form-item>
            <el-form-item label="所属方向">
                <el-select v-model="form.did" placeholder="请选择所属方向">
                    <el-option v-for="val in direction" :value="val.dname" :label="val.dname" :key="val.did"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="所学阶段">
                <el-select v-model="form.sid" placeholder="请选择所学阶段">
                    <el-option v-for="val in stage" :value="val.sname" :label="val.sname" :key="val.sid"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('form')">提交</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    export default{
        name:'calssupdate',
        data:function () {
            return{
                sid:'',
                direction:'',
                stage:'',
                form:{
                    cid:'',
                    cname:'',
                    did:'',
                    sid:''
                },
                rules: {
                    cname: [
                        { required: true, message: '请输入班级名称', trigger: 'blur' },
                        { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
                    ],
                }
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/classupdate.php',this.form).then(res=>{
                            if(res.body=='ok'){
                                this.$message({
                                    message:'恭喜你，修改成功',
                                    type:"success"
                                })
                                this.$router.push('manageclass')
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
           this.cid=this.$route.query.cid;
           this.$http.get('/testhome/classquery.php?cid='+this.cid).then(res=>{
                this.form=res.body
           })
            this.$http.get('/testhome/managedir.php').then(res=>{
                this.direction = res.body
            })
            this.$http.get('/testhome/managestage.php').then(res=>{
                this.stage = res.body
            })
        }
    }
</script>
<style>

</style>