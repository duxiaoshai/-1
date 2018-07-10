<template>
    <section id="exam">
        <h2>
            试卷名称:&nbsp&nbsp {{pname}}
            <el-button round>所得分数:&nbsp&nbsp{{score}} </el-button>
        </h2>
        <el-form ref="form" :model="form" >
            <ul class="box">
                <li v-for="(item,index) in tableData" :key="index">
                    <h3> {{item.title}}  <span>({{item.score}}分--{{item.stype}})</span></h3>
                    <ul class="options" v-if="item.stype == '单选'">
                        <el-form-item>
                            <el-radio-group v-model="form['title'+index]" disabled="disabled" >
                                <el-radio v-for="v in item.options" :key="v['key']" :label="v['key']">
                                    {{v['key']}}: {{v['value']}}
                                </el-radio>
                            </el-radio-group>
                        </el-form-item>
                    </ul>
                    <ul class="options" v-else-if="item.stype == '多选'">
                        <el-form-item>
                            <el-checkbox-group  v-model="form['title'+index]" disabled="disabled" >
                                <el-checkbox v-for="v in item.options" :key="v['key']" :label="v['key']">
                                    {{v['key']}}: {{v['value']}}
                                </el-checkbox>
                            </el-checkbox-group>
                        </el-form-item>
                    </ul>
                    <ul class="options" v-else-if="item.stype == '简答'">
                        <li>
                            <el-input v-model="form['title'+index]" disabled="disabled" ></el-input>
                        </li>
                    </ul>
                    <el-form-item label="正确答案：">
                        <span>{{item.sanswer}}</span>
                    </el-form-item>
                    <el-form-item label="解析：">
                        <span>{{item.sexp}}</span>
                    </el-form-item>
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
        name:'historypaper',
        data:function () {
            return{
                tableDatas:[],
                pid: '',
                score:0,
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
                        sanswer:element.sanswer,
                        sexp:element.sexp,
                        score:element.score,
                    })
                })
                return tableData;
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
            this.$http.get('/testhome/queryhistory.php?pid='+this.pid).then(res=>{
                let answer=res.body;
                let score=0;
                for(let i=0;i<answer.length;i++){
                    if(answer[i].stype=='单选' || answer[i].stype=='简答'){
                        this.form["title"+i]=answer[i]['answer'];
                    }else if(answer[i].stype=='多选'){
                        let arr=answer[i]['answer'].split(",")
                        this.form["title"+i]=arr;
                    }
                    if(answer[i]['answer']==answer[i]['sanswer']){
                        score+=answer[i]['score']*1;
                    }
                }
                this.score=score;
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