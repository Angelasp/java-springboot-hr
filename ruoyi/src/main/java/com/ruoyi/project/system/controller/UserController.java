package com.ruoyi.project.system.controller;


import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.security.LoginUser;
import com.ruoyi.framework.security.service.TokenService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.domain.Result;
import com.ruoyi.project.system.domain.SysUser;
import com.ruoyi.project.system.domain.User;
import com.ruoyi.project.system.service.ISysPostService;
import com.ruoyi.project.system.service.ISysRoleService;
import com.ruoyi.project.system.service.ISysUserService;
import com.ruoyi.project.system.service.UserService;
import com.ruoyi.project.tool.gen.util.Analysis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 档案信息
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/userinfo")
public class UserController extends BaseController
{
    @Autowired
    private UserService userService;

    /*@Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysPostService postService;*/

    @Autowired
    private TokenService tokenService;

    /**
     * 获取用户列表
     */
    @PreAuthorize("@ss.hasPermi('system:userinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(User user)
    {
        startPage();
        List<User> list = userService.selectUserList(user);
        System.out.println(list+"================================================================");
        return getDataTable(list);
    }

    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('system:userinfo:export')")
    @GetMapping("/export")
    public AjaxResult export(User user)
    {
        List<User> list = userService.selectUserList(user);
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.exportExcel(list, "用户数据");
    }


    @Log(title = "用户管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:userinfo:import')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        List<User> list=Analysis.Excel(file);
        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String operName = loginUser.getUsername();
        String message = userService.importUser(list, updateSupport, operName);
        return AjaxResult.success(message);
    }
    @PostMapping("/upload")
    @PreAuthorize("@ss.hasPermi('system:userinfo:picture')")
    public Result upload(@RequestParam("picture") MultipartFile picture, HttpServletRequest request/*,@RequestParam("userid")String userid*/) {
        System.out.println(picture.getOriginalFilename()+"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        //获取文件在服务器的储存位置
        String path = request.getSession().getServletContext().getRealPath("/upload");
        File filePath = new File(path);
        String imgpath="D:\\ruoyi-vue\\ruoyi-ui\\src\\assets\\image";
        System.out.println("文件的保存路径：" + imgpath);
      /*  if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("目录不存在，创建目录:" + filePath);
            filePath.mkdir();
        }*/

        //获取原始文件名称(包含格式)
        String originalFileName = picture.getOriginalFilename();
        System.out.println("原始文件名称：" + originalFileName);

        //获取文件类型，以最后一个`.`为标识
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("文件类型：" + type);
        //获取文件名称（不包含格式）
        String name = originalFileName.substring(0, originalFileName.lastIndexOf("."));

        //设置文件新名称: 当前时间+文件名称（不包含格式）
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = sdf.format(d);
        String fileName = date + name + "." + type;
        //System.out.println("新文件名称：" + fileName);

        //在指定路径下创建一个文件
        File targetFile = new File(imgpath, originalFileName);

        //将文件保存到服务器指定位置
        try {
            picture.transferTo(targetFile);
            System.out.println("上传成功");
            //将文件在服务器的存储路径返回
            return new Result(true,"上传成功");
        } catch (IOException e) {
            System.out.println("上传失败");
            e.printStackTrace();
            return new Result(false, "上传失败");
        }
    }
    @GetMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.importTemplateExcel("用户数据");
    }
/*

    */
/**
     * 根据用户编号获取详细信息
     */

    @PreAuthorize("@ss.hasPermi('system:userinfo:query')")
    @GetMapping(value = { "/", "/{userId}" })
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) Long userId)
    {
        AjaxResult ajax = AjaxResult.success();

        if (StringUtils.isNotNull(userId))
        {
            ajax.put(AjaxResult.DATA_TAG, userService.selectUserById(userId));
           // User user =userService.selectUserById(userId);
            System.out.println(ajax);

        }
        return ajax;
    }


    /**
     * 新增用户
     */
    @PreAuthorize("@ss.hasPermi('system:userinfo:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody User user)
    {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(user.getUserName())))
        {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
        {
            return AjaxResult.error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setCreateBy(SecurityUtils.getUsername());
     //   user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('system:userinfo:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody User user)
    {
        System.out.println(user+"11111111111111111111111111111111111111111111");
        userService.checkUserAllowed(user);
        if (UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user)))
        {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        else if (UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user)))
        {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.updateUser(user));
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermi('system:userinfo:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(userService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasPermi('system:userinfo:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public AjaxResult resetPwd(@RequestBody User user)
    {
        userService.checkUserAllowed(user);
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('system:userinfo:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody User user)
    {
        userService.checkUserAllowed(user);
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.updateUserStatus(user));
    }
}