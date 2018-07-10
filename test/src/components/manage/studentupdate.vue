<template>
    <div>
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
            <el-form-item label="ID">
                {{form.mid}}
            </el-form-item>
            <el-form-item label="学生姓名" prop="uname">
                <el-input  type="text" v-model="form.uname"></el-input>
            </el-form-item>
            <el-form-item label="性别">
                <el-radio-group v-model="form.msex">
                    <el-radio label="男">男</el-radio>
                    <el-radio label="女">女</el-radio>
                </el-radio-group>
            </el-form-item>
            <el-form-item label="学生学号" prop="mnum">
                <el-input  type="text" v-model="form.mnum"></el-input>
            </el-form-item>
            <el-form-item label="所在班级">
                <el-select v-model="form.cid" placeholder="请选择所在班级">
                    <el-option v-for="val in classes" :value="val.cname" :label="val.cname" :key="val.cid"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="所学阶段">
                <el-select v-model="form.sid" placeholder="请选择所学阶段">
                    <el-option v-for="val in stage" :value="val.sname" :label="val.sname" :key="val.sid"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="所属方向">
                <el-select v-model="form.did" placeholder="请选择所属方向">
                    <el-option v-for="val in direction" :value="val.dname" :label="val.dname" :key="val.did"></el-option>
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
        name:'studentupdate',
        data:function () {
            return{
                sid:'',
                direction:'',
                stage:'',
                classes:'',
                form:{
                    mid:'',
                    uname:'',
                    msex:'',
                    mnum:'',
                    did:'',
                    sid:'',
                    cid:'',
                },
                rules: {
                    mname: [
                        { required: true, message: '请输入学生姓名', trigger: 'blur' },
                        { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
                    ],
                    mnum: [
                        { required: true, message: '请输入学生学号', trigger: 'blur' },
                        { min: 1, max: 11, message: '长度在 1 到 11 个字符', trigger: 'blur' }
                    ]
                }
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/studentupdate.php',this.form).then(res=>{
                            if(res.body=='ok'){
                                this.$message({
                                    message:'恭喜你，修改成功',
                                    type:"success"
                                })
                                this.$router.push('managestudent')
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
           this.mid=this.$route.query.mid;
           this.$http.get('/testhome/studentquery.php?mid='+this.mid).then(res=>{
                this.form=res.body
           })
            this.$http.get('/testhome/managedir.php').then(res=>{
                this.direction = res.body
            })
            this.$http.get('/testhome/managestage.php').then(res=>{
                this.stage = res.body
            })
            this.$http.get('/testhome/manageclass.php').then(res=>{
                this.classes = res.body
            })
        }
    }
</script>
<style>

</style>