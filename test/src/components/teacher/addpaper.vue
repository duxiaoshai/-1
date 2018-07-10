<template>
    <div>
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
            <el-form-item label="试卷名称" prop="pname">
                <el-input type="input" v-model="form.pname"></el-input>
            </el-form-item>
            <el-form-item label="选择班级">
                <el-select v-model="form.cname" placeholder="请选择班级">
                    <el-option v-for="val in classes" :value="val.cname" :label="val.cname" :key="val.cid"></el-option>
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
        name:'addpaper',
        data() {
            return {
                classes:[],
                form: {
                    pname: '',
                    cname:''
                },
                rules: {
                    pname: [
                        { required: true, message: '请输入试卷名称', trigger: 'blur' },
                        { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
                    ],
                }
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/addpaper.php',this.form).then(res=>{
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
            this.$http.get('/testhome/manageclass.php').then(res=>{
                this.classes = res.body
            })
        }
    }
</script>
<style>

</style>