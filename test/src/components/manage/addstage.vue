<template>
    <div>
        <el-form ref="form" :model="form" label-width="80px" :rules="rules">
            <el-form-item label="所属方向">
                <el-select v-model="form.did" placeholder="请选择所属方向">
                    <el-option v-for="val in direction" :value="val.dname" :label="val.dname" :key="val.did"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="阶段名称" prop="sname">
                <el-input  type="text" v-model="form.sname"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('form')">提交</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
    export default{
        name:'addstage',
        data() {
            return {
                direction:[],
                form: {
                    sname: '',
                    did:''
                },
                rules: {
                    sname: [
                        { required: true, message: '请输入阶段名称', trigger: 'blur' },
                        { min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur' }
                    ],
                }
            }
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$http.post('/testhome/addstage.php',this.form).then(res=>{
                            if(res.body=='ok'){
                                this.$message({
                                    message:'恭喜你，添加成功',
                                    type:"success"
                                })
                                this.$router.push('managestage')
                            }else if(res.body=='error'){
                                this.$message({
                                    message:'对不起，添加失败',
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
            this.$http.get('/testhome/managedir.php').then(res=>{
                this.direction = res.body
            })
        }
    }
</script>
<style>

</style>