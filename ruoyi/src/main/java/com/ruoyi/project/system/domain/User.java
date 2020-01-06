package com.ruoyi.project.system.domain;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.aspectj.lang.annotation.Excel.ColumnType;
import com.ruoyi.framework.aspectj.lang.annotation.Excel.Type;
import com.ruoyi.framework.aspectj.lang.annotation.Excels;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 用户对象 sys_user
 *
 * @author ruoyi
 */
public class User extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    @Excel(name = "人员序号", cellType = ColumnType.NUMERIC, prompt = "人员编号")
    private Long userId;

/*    /*
    @Excel(name = "部门编号", type = Type.IMPORT)
    private Long deptId;*/
    private Long deptId;

    /** 用户账号 */
    @Excel(name = "人员名称")
    private String userName;

    /** 人员名族 */
    @Excel(name = "人员民族")
    private String nation;

    /** 用户邮箱 */
    @Excel(name = "人员邮箱")
    private String email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phonenumber;

    /** 用户性别 */
    @Excel(name = "人员性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 用户头像 */
    @Excel(name = "人员头像")
    /** 用户头像 */
    private String avatar;

    /** 密码 */
    private String password;

    /** 盐加密 */
    private String salt;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "人员状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

   /** 最后登陆IP */
   // @Excel(name = "最后登陆IP", type = Type.EXPORT)
    private String loginIp;

    /** 最后登陆时间 */
 //  @Excel(name = "最后登陆时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss", type = Type.EXPORT)
    private Date loginDate;

/*    *//** 部门对象 *//*
    @Excels({
            @Excel(name = "部门名称", targetAttr = "deptName", type = Type.EXPORT),
            @Excel(name = "部门负责人", targetAttr = "leader", type = Type.EXPORT)
    })
    private SysDept dept;*/

    /** 角色对象 */
    private List<SysRole> roles;

    /** 角色组 */
    private Long[] roleIds;

    /** 岗位组 */
    private Long[] postIds;

    /** 人员生日 */
    @Excel(name = "人员生日")
    private String borth;
    /** 人员创建日期 */
    /*@Excel(name = "人员创建日期")
    private String ctime;*/
    /** 人员修改日期 */
   /* @Excel(name = "人员修改日期")
    private String utime;*/
    /** 人员学历 */
    @Excel(name = "人员学历")
    private String grade;
    /** 人员毕业院校 */
    @Excel(name = "人员毕业院校")
    private String school;
    /** 人员所属专业  */
    @Excel(name = "人员所属专业 ")
    private String mayor;
    /** 人员所属职称 */
    @Excel(name = "人员所属职称")
    private String position;
    /** 人员籍惯 */
    @Excel(name = "人员籍惯")
    private String custom;
    /** 人员户籍 */
    @Excel(name = "人员户籍")
    private String hukou;
    /** 健康状况 */
    @Excel(name = "健康状况")
    private String healthstatus;
    /** 人员所熟悉擅长 */
    @Excel(name = "人员所熟悉擅长")
    private String direcion;
    /** 人员通信地址 */
    @Excel(name = "人员通信地址")
    private String address;
    /** 人员获奖 */
    @Excel(name = "人员获奖")
    private String raward;
    /** 人员英语水平 */
    @Excel(name = "人员英语水平")
    private String cetpet;
    /** 人员参工日期 */
    @Excel(name = "人员参工日期")
    private Date time;
    /** 人员专业职称 */
    @Excel(name = "人员专业职称")
    private String professor;
    /** 人员执业资格 */
    @Excel(name = "人员执业资格")
    private String title;
    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "人员创建日期")
    private Date createTime;
    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "人员修改日期")
    private Date updateTime;


    public User()
    {

    }

    public User(Long userId)
    {
        this.userId = userId;
    }

   /* public String getCtime() {
        return ctime;
    }

    public void setCtime(String ctime) {
        this.ctime = ctime;
    }

    public String getUtime() {
        return utime;
    }

    public void setUtime(String utime) {
        this.utime = utime;
    }
*/


   /*

    @Override
    public Date getcreatetime() {
        return createtime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }*/

    public String getBorth() {
        return borth;
    }

    public void setBorth(String borth) {
        this.borth = borth;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMayor() {
        return mayor;
    }

    public void setMayor(String mayor) {
        this.mayor = mayor;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCustom() {
        return custom;
    }

    public void setCustom(String custom) {
        this.custom = custom;
    }

    public String getHukou() {
        return hukou;
    }

    @Override
    public Date getCreateTime() {
        return createTime;
    }

    @Override
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setHukou(String hukou) {
        this.hukou = hukou;
    }

    public String getHealthstatus() {
        return healthstatus;
    }

    public void setHealthstatus(String healthstatus) {
        this.healthstatus = healthstatus;
    }

    public String getDirecion() {
        return direcion;
    }

    public void setDirecion(String direcion) {
        this.direcion = direcion;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRaward() {
        return raward;
    }

    public void setRaward(String raward) {
        this.raward = raward;
    }


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCetpet() {
        return cetpet;
    }

    public void setCetpet(String cetpet) {
        this.cetpet = cetpet;
    }

    public String getProfessor() {
        return professor;
    }

    public void setProfessor(String professor) {
        this.professor = professor;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public Long getUserId()
    {
        return userId;
    }

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId)
    {
        return userId != null && 1L == userId;
    }

/*    public Long getDeptId()
    {
        return deptId;
    }

    public void setDeptId(Long deptId)
    {
        this.deptId = deptId;
    }*/


    public String getNation()
    {
        return nation;
    }

    public void setNation(String nation)
    {
        this.nation = nation;
    }

    @NotBlank(message = "用户账号不能为空")
    @Size(min = 0, max = 30, message = "用户账号长度不能超过30个字符")
    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    @Size(min = 0, max = 11, message = "手机号码长度不能超过11个字符")
    public String getPhonenumber()
    {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber)
    {
        this.phonenumber = phonenumber;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getSalt()
    {
        return salt;
    }

    public void setSalt(String salt)
    {
        this.salt = salt;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getLoginIp()
    {
        return loginIp;
    }

    public void setLoginIp(String loginIp)
    {
        this.loginIp = loginIp;
    }

    public Date getLoginDate()
    {
        return loginDate;
    }

    public void setLoginDate(Date loginDate)
    {
        this.loginDate = loginDate;
    }

/*
    public SysDept getDept()
    {
        return dept;
    }

    public void setDept(SysDept dept)
    {
        this.dept = dept;
    }
*/

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public List<SysRole> getRoles()
    {
        return roles;
    }

    public void setRoles(List<SysRole> roles)
    {
        this.roles = roles;
    }

    public Long[] getRoleIds()
    {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds)
    {
        this.roleIds = roleIds;
    }

    public Long[] getPostIds()
    {
        return postIds;
    }

    public void setPostIds(Long[] postIds)
    {
        this.postIds = postIds;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", sex='" + sex + '\'' +
                ", avatar='" + avatar + '\'' +
                ", password='" + password + '\'' +
                ", salt='" + salt + '\'' +
                ", status='" + status + '\'' +
                ", delFlag='" + delFlag + '\'' +
                ", roles=" + roles +
                ", roleIds=" + Arrays.toString(roleIds) +
                ", postIds=" + Arrays.toString(postIds) +
                ", borth='" + borth + '\'' +
                ", grade='" + grade + '\'' +
                ", school='" + school + '\'' +
                ", mayor='" + mayor + '\'' +
                ", position='" + position + '\'' +
                ", custom='" + custom + '\'' +
                ", hukou='" + hukou + '\'' +
                ", healthstatus='" + healthstatus + '\'' +
                ", direcion='" + direcion + '\'' +
                ", address='" + address + '\'' +
                ", raward='" + raward + '\'' +
                ", cetpet='" + cetpet + '\'' +
                ", time=" + time +
                ", professor='" + professor + '\'' +
                ", title='" + title + '\'' +
                '}';
    }
}
