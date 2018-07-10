<template>
    <section id="exam">
        <h2>
            试卷名称&nbsp&nbsp {{pname}}
            <el-button round @click="submit">提交</el-button>
        </h2>
        <el-form ref="form" :model="form" >
            <ul class="box">
                <li v-for="(item,index) in tableData" :key="index">
                    <h3> {{item.title}}  <span>({{item.score}}分--{{item.stype}})</span></h3>
                    <ul class="options" v-if="item.stype == '单选'">
                        <el-form-item>
                            <el-radio-group v-model="form['title'+index]">
                                <el-radio v-for="v in item.options" :key="v['key']" :label="v['key']">
                                    {{v['key']}}: {{v['value']}}
                                </el-radio>
                            </el-radio-group>
                        </el-form-item>
                    </ul>
                    <ul class="options" v-else-if="item.stype == '多选'">
                        <el-form-item>
                            <el-checkbox-group  v-model="form['title'+index]">
                                <el-checkbox v-for="v in item.options" :key="v['key']" :label="v['key']">
                                    {{v['key']}}: {{v['value']}}
                                </el-checkbox>
                            </el-checkbox-group>
                        </el-form-item>
                    </ul>
                    <ul class="options" v-else-if="item.stype == '简答'">
                        <li>
                            <el-input v-model="form['title'+index]"></el-input>
                        </li>
                    </ul>
                </li>
            </ul>
        </el-form>
    </section>
</template>
<script>
    import ElCheckbox from "../../../node_modules/element-ui/packages/checkbox/src/checkbox.vue";
    import ElRadio from "../../../node_modules/element-ui/packages/radio/src/radio.vue";
    import ElFormItem from "../../../node_modules/element-ui/packages/form/src/form-item.vue";
    export default{
        components: {
            ElFormItem,
            ElRadio,
            ElCheckbox},
        name:'studentpaper',
        data:function () {
            return{
                tableDatas:[],
                pid: '',
                pname:'',
                form: {
                    title0:'',
                    title1:'',
                    title2:'',
                    title3:'',
                    title4:'',
                    title5:'',
                    title6:'',
                    title7:'',
                    title8:'',
                    title9:'',
                    title10:'',
                }
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
                        title,
                        options,
                        stype:element.stype,
                        score:element.score
                    })
                })
                return tableData;
            }
        },
        methods:{
            submit(){
                let sids=this.tableDatas.map(ele=>ele.sid)
                this.$http.post('/testhome/studentAnswer.php',{sids:sids,pid:this.pid,answer:this.form}).then(res=>{
                    if(res.body=='ok'){
                        this.$message({
                            message:'恭喜你，提交成功',
                            type:"success"
                        })
                        this.$router.push('studentHistory')
                    }else if(res.body=='error'){
                        this.$message({
                            message:'对不起，提交失败',
                            type:"error"
                        })
                    }
                })
            }
        },
        mounted(){
            this.pid=this.$route.query.pid;
            this.$http.get('/testhome/studentpaper.php?pid='+this.pid).then(res=>{
                this.tableDatas = res.body.sort((a,b)=>a.st-b.st);
                this.pname=this.tableDatas[0]['pname'];
                for(let i=0;i<this.tableDatas.length;i++){
                    if(this.tableDatas[i].stype=='单选' || this.tableDatas[i].stype=='简答'){
                        this.form["title"+i]='';
                    }else if(this.tableDatas[i].stype=='多选'){
                        this.form["title"+i]=[];
                    }
                }
            })
        }
    }
</script>
<style>
    *{
        margin:0;
        padding: 0;
        list-style: none;
        text-decoration: none;
    }
    a{
        display: block;
        width: 100%;
        height: 100%;
    }
    #exam{
        padding-top: 100px;
        width: 1200px;
        margin:0 auto;
        height: auto;
    }
    #exam h2{
        width: 100%;
        height: 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 60px;
        background: #dddddd;
        font-size: 14px;
        font-weight: normal;
        position: fixed;
        top:80px;
        left:0;
        z-index:100;
        box-sizing: border-box;
    }
    .box{
        width: 100%;
        height: auto;
        margin-top:50px;
    }
    .box>li{
        width: 100%;
        height: 200px;
        margin: 15px 0;
        padding: 30px;
        box-shadow: 0 0px 5px rgba(0,0,0,0.3);
        border-radius: 5px;
    }
    .box li h3{
        font-size: 16px;
        border-bottom: 1px solid #dddddd;
        line-height: 1.5;
        margin-bottom: 10px;
    }
</style>