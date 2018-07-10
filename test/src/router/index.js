import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import login from '../components/login/login.vue'
///////////////管理员////////////////////////////////
import manage from '../components/manage/manage.vue'
////////方向dir//////////
import managedir from '../components/manage/managedir.vue'
import dirUpdate from '../components/manage/dirupdate.vue'
import addDir from '../components/manage/addDir.vue'
////////阶段stage//////////
import managestage from '../components/manage/managestage.vue'
import stageUpdate from '../components/manage/stageUpdate.vue'
import addstage from '../components/manage/addstage.vue'
//////////班级管理classes/////
import manageclass from '../components/manage/manageclass.vue'
import classUpdate from '../components/manage/classUpdate.vue'
import addclass from '../components/manage/addclass.vue'
//////学生管理managestudent////
import managestudent from '../components/manage/managestudent.vue'
import studentUpdate from '../components/manage/studentUpdate.vue'
import addstudent from '../components/manage/addstudent.vue'
//////教师管理manageteacher////
import manageteacher from '../components/manage/manageteacher.vue'
import teacherUpdate from '../components/manage/teacherUpdate.vue'
import addteacher from '../components/manage/addteacher.vue'


import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import  VueResource from 'vue-resource'
///////////////////////教师管理////////////////////////////////
import teacher from '../components/teacher/teacher.vue'
// 题型管理
import testType from '../components/teacher/testType.vue'
import testTypeUpdate from '../components/teacher/testTypeupdate.vue'
import addtestType from '../components/teacher/addtestType.vue'
// 试题管理
import managetests from '../components/teacher/managetests.vue'
import testsUpdate from '../components/teacher/testsupdate.vue'
import addtests from '../components/teacher/addtests.vue'
// 试卷管理
import managepaper from '../components/teacher/managepaper.vue'
import editpaper from '../components/teacher/editpaper.vue'
import addpaper from '../components/teacher/addpaper.vue'
///////////////////////学生管理////////////////////////////////
import student from '../components/student/student.vue'
import studentexam from '../components/student/studentexam.vue'
import studentpaper from '../components/student/studentpaper.vue'
import studentHistory from '../components/student/studentHistory.vue'
import historypaper from '../components/student/historypaper.vue'

Vue.use(Router)
Vue.use(ElementUI)
Vue.use(VueResource)
/////////////////实例化路由/////////////////
export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: login
    },
    {
     path:'/login',
     name:'login',
     component: login
    },
      {
          path:'/manage',
          name:'manage',
          component: manage,
          children:[
              // 方向
              {path:'managedir',name:'managedir',component:managedir},
              {path:'dirUpdate', name:'dirUpdate', component: dirUpdate},
              {path:'addDir', name:'addDir', component: addDir},
              //阶段
              {path:'managestage',name:'managestage',component:managestage},
              {path:'stageUpdate', name:'stageUpdate', component: stageUpdate},
              {path:'addstage', name:'addstage', component: addstage},
              //班级管理
              {path:'manageclass',name:'manageclass',component:manageclass},
              {path:'classUpdate', name:'classUpdate', component: classUpdate},
              {path:'addclass', name:'addclass', component: addclass},
              //学生管理
              {path:'managestudent',name:'managestudent',component:managestudent},
              {path:'studentUpdate', name:'studentUpdate', component: studentUpdate},
              {path:'addstudent', name:'addstudent', component: addstudent},
              //教师管理
              {path:'manageteacher',name:'manageteacher',component:manageteacher},
              {path:'teacherUpdate', name:'teacherUpdate', component: teacherUpdate},
              {path:'addteacher', name:'addteacher', component: addteacher},
          ]
      },
      {
          path:'/teacher',
          name:'teacher',
          component: teacher,
          children:[
              // 题型
              {path:'testType',name:'testType',component:testType},
              {path:'testTypeUpdate', name:'testTypeUpdate', component: testTypeUpdate},
              {path:'addtestType', name:'addtestType', component: addtestType},
              // 试题
              {path:'managetests',name:'managetests',component:managetests},
              {path:'testsUpdate', name:'testsUpdate', component: testsUpdate},
              {path:'addtests', name:'addtests', component: addtests},
              // 试卷
              {path:'managepaper',name:'managepaper',component:managepaper},
              {path:'editpaper', name:'editpaper', component: editpaper},
              {path:'addpaper', name:'addpaper', component: addpaper},
          ]
      },
      {
          path:'/student',
          name:'student',
          component: student,
          children:[
              {path:'studentexam', name:'studentexam', component: studentexam},
              {path:'studentpaper', name:'studentpaper', component: studentpaper},
              {path:'studentHistory', name:'studentHistory', component: studentHistory},
              {path:'historypaper', name:'historypaper', component: historypaper},
          ]
      },
  ]
})
