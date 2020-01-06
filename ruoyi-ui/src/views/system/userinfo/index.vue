<template>
  <div class="app-container">



    <el-row :gutter="10" class="mb8">
      <!--部门数据-->
      <!-- <el-col :span="4" :xs="24">
         <div class="head-container">
           <el-input
             v-model="deptName"
             placeholder="请输入部门名称"
             clearable
             size="small"
             prefix-icon="el-icon-search"
             style="margin-bottom: 20px"
           />
         </div>
         <div class="head-container">
           <el-tree
             :data="deptOptions"
             :props="defaultProps"
             :expand-on-click-node="false"
             :filter-node-method="filterNode"
             ref="tree"
             default-expand-all
             @node-click="handleNodeClick"
           />
         </div>
       </el-col>-->
      <!--用户数据-->
      <el-col :span="1.5">
        <el-form :model="queryParams" ref="queryForm" :inline="true" >
          <el-form-item label="人员名称" prop="userName">
            <el-input
              v-model="queryParams.userName"
              placeholder="请输入人员名称"
              clearable
              size="small"
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="手机号码" prop="phonenumber">
            <el-input
              v-model="queryParams.phonenumber"
              placeholder="请输入手机号码"
              clearable
              size="small"
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="人员状态" prop="status">
            <el-select
              v-model="queryParams.status"
              placeholder="人员状态"
              clearable
              size="small"
              style="width: 240px"
            >
              <el-option
                v-for="dict in statusOptions"
                :key="dict.dictValue"
                :label="dict.dictLabel"
                :value="dict.dictValue"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="dateRange"
              size="small"
              style="width: 240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
            ></el-date-picker>
          </el-form-item>
          <!-- style="width:100%;text-align:right"-->
          <el-form-item >
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd"
              v-hasPermi="['system:user:add']"
            >新增</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              icon="el-icon-edit"
              size="mini"
              :disabled="single"
              @click="handleUpdate"
              v-hasPermi="['system:user:edit']"
            >修改</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['system:user:remove']"
            >删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="info"
              icon="el-icon-upload2"
              size="mini"
              @click="handleImport"
              v-hasPermi="['system:userinfo:import']"
            >导入</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="warning"
              icon="el-icon-download"
              size="mini"
              @click="handleExport"
              v-hasPermi="['system:userinfo:export']"
            >导出</el-button>
          </el-col>
        </el-row>

        <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="40" align="center"/>
          <el-table-column label="人员编号" align="center" prop="userId" />
          <el-table-column label="人员名称" align="center" prop="userName" />
          <el-table-column label="人员民族" align="center" prop="nation" />
          <!-- <el-table-column label="部门" align="center" prop="dept.deptName"/>-->
          <el-table-column label="人员生日" align="center" prop="borth" />
          <el-table-column label="手机号码" align="center" prop="phonenumber"  />
          <el-table-column label="人员状态" align="center">
            <template slot-scope="scope">
              <el-switch
                v-model="scope.row.status"
                active-value="0"
                inactive-value="1"
                @change="handleStatusChange(scope.row)"
              ></el-switch>
            </template>
          </el-table-column>
          <el-table-column label="创建时间" align="center" prop="createTime" width="160">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.createTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            width="180"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['system:userinfo:edit']"
              >修改</el-button>
              <el-button
                v-if="scope.row.userId !== 1"
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['system:userinfo:remove']"
              >删除</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-view"
                @click="handlewatch(scope.row)"
                v-hasPermi="['system:userinfo:query']"
              >查看</el-button>
              <!--<router-link to="/user/profile">
                <el-dropdown-item icon="el-icon-view">查看</el-dropdown-item>
              </router-link>-->
            </template>
          </el-table-column>
        </el-table>

        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-col>
    </el-row>

    <!-- 添加或修改参数配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px">
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row>
          <el-col :span="12">
           <el-form-item label="人员头像">
            </el-form-item>
            <div style="margin-left: 40px;">
              <div  v-for="(urls, index) in imgs " :key="index" style="float:left; margin: 5px ; border: 0px solid #ccc;"  >
                <div  v-if="title!='查看人员'" style="text-align: right; position: relative;" v-on:click="deleteImg(index)">X</div>
                <img :src="urls"  width="100px" height="100px"/>
              </div>
              <div  v-if="title!='查看人员'" style=" width: 100px; height: 100px; background-color: #ccc; border:1px solid #ccc; float: left; margin-top: 20px ;" v-on:click="imgClick()" title="点击上传头像"></div>
              <input style="float: left;  display: none;" type="file" id='uploadFile'  accept="image/*" name="picture"
                     v-on:change="readLocalFile()">
            </div>
          </el-col>
          <el-col :span="12">
            <el-form-item label="人员民族" prop="nation">
              <el-input v-model="form.nation" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.nation" placeholder="请输入人员民族" v-if="title!='查看人员'"/>
            </el-form-item>
          </el-col>
          <!--     <el-col :span="12">
                 <el-form-item label="归属部门" prop="deptId">
                   <treeselect v-model="form.deptId" :options="deptOptions" placeholder="请选择归属部门" />
                 </el-form-item>
               </el-col>-->
          <el-col :span="12">
            <el-form-item label="手机号码" prop="phonenumber">
              <el-input v-model="form.phonenumber" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.phonenumber" placeholder="请输入手机号码" maxlength="11" v-if="title!='查看人员'"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="人员邮箱" prop="email">
              <el-input v-model="form.email" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.email" placeholder="请输入人员邮箱" maxlength="50" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="人员名称" prop="userName">
              <el-input v-model="form.userName" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.userName" placeholder="请输入人员名称" v-if="this.title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员学历" prop="grade">
            <!--  <el-input v-model="form.grade" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.grade" placeholder="请输入人员学历" v-if="title!='查看人员'" />-->
              <el-select v-model="form.grade" placeholder="请选择学历" @change="styleChange" style="width: 260px;height: 36px">
                <el-option v-for="item in optionA4" :key="item.value" :label="item.label" :value="item.value"/>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员专业" prop="mayor">
              <el-input v-model="form.mayor" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.mayor" placeholder="请输入人员专业" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员籍贯" prop="custom">
              <el-input v-model="form.custom" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.custom" placeholder="请输入人员籍贯" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员户籍" prop="hukou">
              <el-input v-model="form.hukou" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.hukou" placeholder="请输入人员户籍" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员健康状况" prop="healthstatus">
              <el-input v-model="form.healthstatus" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.healthstatus" placeholder="请输入人员健康状况" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员特长" prop="direcion">
              <el-input v-model="form.direcion" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.direcion" placeholder="请输入人员特长" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员地址" prop="address">
              <el-input v-model="form.address" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.address" placeholder="请输入人员地址" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员获奖" prop="raward">
              <el-input v-model="form.raward" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.raward" placeholder="请输入人员获奖" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员英语水平" prop="CetPet">
              <el-input v-model="form.cetpet" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.cetpet" placeholder="请输入人员英语水平" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员所属职称" prop="position">
              <el-input v-model="form.position" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.position" placeholder="请输入人员所属职称" v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员参工日期" prop="time">
              <el-date-picker
                v-model="form.time"
                type="datetime"
                format="yyyy-MM-dd"
                value-format="yyyy-MM-dd"
                placeholder="选择日期"
                style="width: 260px;height: 36px"
              >
              </el-date-picker>
              <!--<el-input v-model="form.time" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.time" placeholder="请输入人员参工日期" v-if="title!='查看人员'" />-->
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员专业职称 " prop="professor">
              <el-input v-model="form.professor" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.professor" placeholder="请输入人员专业职称 " v-if="title!='查看人员'" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员执业资格" prop="title">
              <el-input v-model="form.title" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.title" placeholder="请输入人员执业资格" v-if="title!='查看人员'"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item  label="人员毕业院校" prop="school">
              <el-input v-model="form.school" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.school" placeholder="请输入人员毕业院校" v-if="title!='查看人员'"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="人员生日" prop="borth">
              <el-date-picker
                v-model="form.borth"
                type="datetime"
                format="yyyy-MM-dd"
                value-format="yyyy-MM-dd"
                placeholder="选择日期"
                style="width: 260px;height: 36px"
              >
              </el-date-picker>
              <!-- <el-input v-model="form.borth" :readonly="true" v-if="title=='查看人员'"></el-input>
               <el-input v-model="form.borth" placeholder="请输入人员生日" v-if="title!='查看人员'"/>-->
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="人员性别" >
              <el-input v-model="form.sex=='0'?'女':'男'" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-select v-model="form.sex" placeholder="请选择" v-if="title!='查看人员'" style="width: 260px;height: 36px">
                <el-option v-if="title!='查看人员'"
                           v-for="dict in sexOptions"
                           :key="dict.dictValue"
                           :label="dict.dictLabel"
                           :value="dict.dictValue"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="人员状态">
              <el-input v-model="form.status=='0'?'正常':'停用'" :readonly="true" v-if="title=='查看人员'" >
              </el-input>
              <el-radio-group v-model="form.status" v-if="title!='查看人员'">
                <el-radio v-if="title!='查看人员'"
                          v-for="dict in statusOptions"
                          :key="dict.dictValue"
                          :label="dict.dictValue"
                >{{dict.dictLabel}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>

          <!-- <el-col :span="12">
             <el-form-item label="岗位">
               <el-select v-model="form.postIds" multiple placeholder="请选择">
                 <el-option
                   v-for="item in postOptions"
                   :key="item.postId"
                   :label="item.postName"
                   :value="item.postId"
                   :disabled="item.status == 1"
                 ></el-option>
               </el-select>
             </el-form-item>
           </el-col>-->
          <!-- <el-col :span="12">
             <el-form-item label="角色">
               <el-select v-model="form.roleIds" multiple placeholder="请选择">
                 <el-option
                   v-for="item in roleOptions"
                   :key="item.roleId"
                   :label="item.roleName"
                   :value="item.roleId"
                   :disabled="item.status == 1"
                 ></el-option>
               </el-select>
             </el-form-item>
           </el-col>-->
          <el-col :span="24">
            <el-form-item label="人员备注">
              <el-input v-model="form.remark" :readonly="true" v-if="title=='查看人员'"></el-input>
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" v-if="title!='查看人员'"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm" v-if="title!='查看人员'">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 用户导入对话框 -->
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px">
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
        <div class="el-upload__tip" slot="tip">
          <el-checkbox v-model="upload.updateSupport" />是否更新已经存在的人员数据
          <el-link type="info" style="font-size:12px" @click="importTemplate">下载模板</el-link>
        </div>
        <div class="el-upload__tip" style="color:red" slot="tip">提示：仅允许导入“xls”或“xlsx”格式文件！</div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm" >确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { listUser, getUser, delUser, addUser, updateUser, exportUser, resetUserPwd, changeUserStatus, importTemplate } from "@/api/system/userinfo";
  import { getToken } from "@/utils/auth";
  import { treeselect } from "@/api/system/dept";
  import userAvatar from "./profile/userAvatar.vue";
  import Treeselect from "@riophae/vue-treeselect";
  import "@riophae/vue-treeselect/dist/vue-treeselect.css";
  import ElImageViewer from "element-ui/packages/image/src/image-viewer";



  export default {
    name: "User",
    components: {ElImageViewer, Treeselect,userAvatar},
    data() {
      return {
        optionA4: [
          {
            value: '0',
            label: '硕士研究生'
          },
          {
            value: '1',
            label: '本科'
          },
          {
            value: '2',
            label: '专科'
          },
          {
            value: '3',
            label: '高中'
          }
        ],
         imgs:[],
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 总条数
        total: 0,
        // 用户表格数据
        userList: null,
        // 弹出层标题
        title: "",
        // 部门树选项
        deptOptions: undefined,
        // 是否显示弹出层
        open: false,
        // 部门名称
        deptName: undefined,
        // 默认密码
        initPassword: undefined,
        // 日期范围
        dateRange: [],
        // 状态数据字典
        statusOptions: [],
        // 性别状态字典
        sexOptions: [],
        // 岗位选项
        postOptions: [],
        // 角色选项
        roleOptions: [],
        // 表单参数
        form: {},
        defaultProps: {
          children: "children",
          label: "label"
        },
        // 用户导入参数
        load: {
          // 是否显示弹出层（用户导入）
          open: false,
          // 弹出层标题（用户导入）
          title: "",
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的用户数据
          uid: '',
          // 设置上传的请求头部
          headers: { Authorization: "Bearer " + getToken() },
          // 上传的地址
          url: process.env.VUE_APP_BASE_API + "/system/userinfo/upload"
        },
        // 用户导入参数
        upload: {
          // 是否显示弹出层（用户导入）
          open: false,
          // 弹出层标题（用户导入）
          title: "",
          // 是否禁用上传
          isUploading: false,
          // 是否更新已经存在的用户数据
          updateSupport: 0,
          // 设置上传的请求头部
          headers: { Authorization: "Bearer " + getToken() },
          // 上传的地址
          url: process.env.VUE_APP_BASE_API + "/system/userinfo/importData"
        },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          userName: undefined,
          phonenumber: undefined,
          status: undefined,
          deptId: undefined
        },
        // 表单校验
        rules: {
          userName: [
            { required: true, message: "人员名称不能为空", trigger: "blur" }
          ],
          nickName: [
            { required: true, message: "人员昵称不能为空", trigger: "blur" }
          ],
          grade: [
            { required: true, message: "人员简历不能为空", trigger: "blur" }
          ],
          email: [
            {
              type: "email",
              message: "'请输入正确的邮箱地址",
              trigger: ["blur", "change"]
            }
          ],
          phonenumber: [
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: "请输入正确的手机号码",
              trigger: "blur"
            }
          ]
        }
      };
    },
    watch: {
      // 根据名称筛选部门树
      deptName(val) {
        this.$refs.tree.filter(val);
      }
    },
    created() {
      this.getList();
      this.getTreeselect();
      this.getDicts("sys_normal_disable").then(response => {
        this.statusOptions = response.data;
      });
      this.getDicts("sys_user_sex").then(response => {
        this.sexOptions = response.data;
      });
      this.getConfigKey("sys.user.initPassword").then(response => {
        this.initPassword = response.data;
      });
    },
    methods: {
      styleChange(val) {
        if(val == 0){
          this.isShow1 = true,
            this.isShow2 = false
        }else{
          this.isShow1 = false
          this.isShow2 = true
        }
        var data= {}
        this.outfallType = val
        data.outfallType = this.outfallType
        getRealDataV2(data).then(val => {
          if (val.code === 200) {
            this.newData(val)
          }
        })
      },
      //删除图片
       deleteImg:function(index){
         this.imgs.splice(index,1);
       },
       //图片click
       imgClick:function(){
         document.getElementById("uploadFile").click();
       },
       //点击选中图片
       readLocalFile: function () {
         var localFile = document.getElementById("uploadFile").files[0];
         document.getElementById("uploadFile").value="";
         var reader = new FileReader();
         var content;
         var current=this;
        current.form.avatar=localFile.name;
         reader.onload = function(event) {
           content = event.target.result;
         if(current.imgs.length<1) {
           current.imgs.push(content);  //获取图片base64代码
           var image = new FormData()
           image.append('picture', localFile)
           current.$axios.post(current.load.url, image, {
             headers: {
               "Content-Type": "multipart/form-data",
               Authorization: "Bearer " + getToken()
             }
           }).then(function (response) {
             current.msgSuccess(response.data.message);
          //   alert(JSON.stringify(response.data.message));
           })
         }else {

        // alert("只能上传一张图片")
           current.msgError("只能上传一张图片");
         }
         }
         reader.onerror = function(event) {
           current.msgError("error");
         }
         content = reader.readAsDataURL(localFile,"UTF-8");
         var sss=document.getElementById("uploadFile").value;
         console.log(112233);
         console.log(JSON.stringify(sss));
       },

      /** 查询用户列表 */
      getList() {
        this.loading = true;
        listUser(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
            this.userList = response.rows;
           // alert(JSON.stringify(this.userList))
            this.total = response.total;
            this.loading = false;
          }
        );
      },
      /** 查询部门下拉树结构 */
      getTreeselect() {
        treeselect().then(response => {
          this.deptOptions = response.data;
        });
      },
      // 筛选节点
      filterNode(value, data) {
        if (!value) return true;
        return data.label.indexOf(value) !== -1;
      },
      // 节点单击事件
      handleNodeClick(data) {
        this.queryParams.deptId = data.id;
        this.getList();
      },
      // 用户状态修改
      handleStatusChange(row) {
        let text = row.status === "0" ? "启用" : "停用";
        this.$confirm('确认要"' + text + '""' + row.userName + '"用户吗?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return changeUserStatus(row.userId, row.status);
        }).then(() => {
          this.msgSuccess(text + "成功");
        }).catch(function() {
          row.status = row.status === "0" ? "1" : "0";
        });
      },
      // 取消按钮
      cancel() {
        this.open = false;
        this.reset();
      },
      // 表单重置
      reset() {
        this.form = {
          userId: undefined,
          deptId: 100,
          userName: undefined,
          nation: undefined,
          password: undefined,
          phonenumber: undefined,
          email: undefined,
          sex: undefined,
          status: "0",
          avatar: undefined,
          remark: undefined,
          borth: undefined,
          mayor: undefined,
          grade: undefined,
          hukou: undefined,
          healthstatus: undefined,
          direcion: undefined,
          raward: undefined,
          cetpet: undefined,
          professor: undefined,
          school: undefined,
          title: undefined,
          postIds: [],
          roleIds: []
        };
        this.resetForm("form");
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.page = 1;
        this.getList();
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.dateRange = [];
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.userId);
        this.single = selection.length != 1;
        this.multiple = !selection.length;
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.getTreeselect();
        getUser().then(response => {
          this.imgs=[];
          this.postOptions = response.posts;
          this.roleOptions = response.roles;
          this.open = true;
          this.title = "添加人员";
          this.form.password = this.initPassword;
        });
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        this.getTreeselect();
        const userId = row.userId || this.ids;
        getUser(userId).then(response => {
          this.imgs=[];
          if(response.data.avatar)
            this.imgs.push(require('@/assets/image/'+response.data.avatar));
          this.form = response.data;
          this.postOptions = response.posts;
          this.roleOptions = response.roles;
          this.form.postIds = response.postIds;
          this.form.roleIds = response.roleIds;
          this.open = true;
          this.title = "修改人员";
          this.form.password = "";
        });
      },
      /** 查看人员按钮操作 */
      handlewatch(row) {
        this.reset();
        this.getTreeselect();
        const userId = row.userId || this.ids;
        getUser(userId).then(response => {
          this.form = response.data;
          //console.log(JSON.stringify(response.data))
          this.imgs=[];
          if(response.data.avatar)
          this.imgs.push(require('@/assets/image/'+response.data.avatar));
          this.load.uid=response.data.userId;
          this.postOptions = response.posts;
          this.roleOptions = response.roles;
          this.form.postIds = response.postIds;
          this.form.roleIds = response.roleIds;
          this.open = true;
          this.title = "查看人员";
          this.form.password = "";
        });
      },
      /** 提交按钮 */
      submitForm: function() {
        console.log(this.form)
          this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.userId != undefined) {
              updateUser(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess("修改成功");
                  this.open = false;
                  this.getList();
                } else {
                  this.msgError(response.msg);
                }
              });
            } else {
              addUser(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess("新增成功");
                  this.open = false;
                  this.getList();
                } else {
                  this.msgError(response.msg);
                }
              });
            }
          }
        });
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const userIds = row.userId || this.ids;
        this.$confirm('是否确认删除用户编号为"' + userIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delUser(userIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams;
        this.$confirm('是否确认导出所有人员数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportUser(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
      },
      /** 导入按钮操作 */
      handleImport() {
        this.upload.title = "人员导入";
        this.upload.open = true;
      },
      /** 下载模板操作 */
      importTemplate() {
        importTemplate().then(response => {
          this.download(response.msg);
        });
      },
      // 文件上传中处理
      handleFileUploadProgress(event, file, fileList) {
        this.upload.isUploading = true;
      },
      // 文件上传成功处理
      handleFileSuccess(response, file, fileList) {
        this.upload.open = false;
        this.upload.isUploading = false;
        this.$refs.upload.clearFiles();
        this.$alert(response.msg, "导入结果", { dangerouslyUseHTMLString: true });
        this.getList();
      },
      // 提交上传文件
      submitFileForm() {
        this.$refs.upload.submit();
      }
    }
  };
</script>
