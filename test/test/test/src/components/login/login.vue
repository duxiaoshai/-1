<template>
<div>
    <div class="bg"></div>
    <div class="container">
        <div class="line bouncein">
            <div class="xs6 xm4 xs3-move xm4-move">
                <div style="height:150px;"></div>
                <div class="media media-y margin-big-bottom"></div>
                <el-form ref="form" :model="form" label-width="80px" :rules="rules">
                    <el-form-item label="账户名称" prop="name">
                        <el-input v-model="form.name"></el-input>
                    </el-form-item>
                    <el-form-item label="账户密码" prop="pass">
                        <el-input  type="password" v-model="form.pass"></el-input>
                    </el-form-item>
                    <el-form-item label="验证码">
                        <el-input  type="test" v-model="form.yanzheng" style="width: 60%"></el-input>
                        <img :src="src" alt="" @click="src='/testhome/code.php?id='+Math.random()"
                             style="float:right;margin-top: 6px;">
                    </el-form-item>
                    <el-form-item label="您的身份">
                        <el-radio-group v-model="form.type">
                            <el-radio label="manager">管理员</el-radio>
                            <el-radio label="manageteacher">教师</el-radio>
                            <el-radio label="managestudent">学生</el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('form')">登录</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</div>
</template>
<script>
    export default{
        name:'login',
        data() {
            return {
                src:'/testhome/code.php',
                form: {
                    name: '',
                    pass:'',
                    type: '',
                    yanzheng:''
                },
                rules: {
                    name: [
                        { required: true, message: '请输入用户名', trigger: 'blur' },
                        { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
                    ],
                    pass: [
                        { required: true, message: '请输入密码', trigger: 'blur' },
                        { min: 1, max: 11, message: '长度在 1 到 11 个字符', trigger: 'blur' }
                    ],
                    yz: [
                        { required: true, message: '请输入验证码', trigger: 'blur' },
                        { min: 1, max: 4, message: '长度在 1 到 4 个字符', trigger: 'blur' }
                    ],
                    resource: [
                        { required: true, message: '请选择您的身份', trigger: 'change' }
                    ]
                }
            }
        },

        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/checklogin.php',this.form).then(res=>{
                            if(res.body==1){
                                this.$message({
                                    message:'恭喜你，登录成功',
                                    type:"success"
                                })
                                if(this.form.type=='manager'){
                                    this.$router.push('manage')
                                }else if(this.form.type=='manageteacher'){
                                    this.$router.push('teacher')
                                }else if(this.form.type=='managestudent'){
                                    this.$router.push({name:'studentexam'})
                                }
                            }else if(res.body==2){
                                this.$message({
                                    message:'对不起，你输入的密码有误',
                                    type:"error"
                                })
                            }else if(res.body==3){
                                this.$message({
                                    message:'对不起，你输入的用户名不存在',
                                    type:"warning"
                                })
                            }else if(res.body=='error'){
                                this.$message({
                                    message:'对不起，你输入的验证码错误',
                                    type:"error"
                                })
                            };
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });


            }
        }
    }
</script>
<style>
    @import "../../assets/css/admin.css";
    @import "../../assets/css/pintuer.css";
</style>