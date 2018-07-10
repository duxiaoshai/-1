<template>
    <div>
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
            <el-form-item label="ID">
                {{form.tid}}
            </el-form-item>
            <el-form-item label="题型名称" prop="tname">
                <el-input  type="text" v-model="form.tname"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('form')">提交</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    export default{
        name:'testTypeupdate',
        data:function () {
            return{
                tid:'',
                form:{
                    tid:'',
                    tname:'',
                },
                rules: {
                    tname: [
                        { required: true, message: '请输入题型名称', trigger: 'blur' },
                        { min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur' }
                    ],
                }
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/testTypeupdate.php',this.form).then(res=>{
                            if(res.body=='ok'){
                                this.$message({
                                    message:'恭喜你，修改成功',
                                    type:"success"
                                })
                                this.$router.push('testType')
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
           this.tid=this.$route.query.tid;
           this.$http.get('/testhome/testTypequery.php?tid='+this.tid).then(res=>{
                this.form=res.body
           })
        }
    }
</script>
<style>

</style>