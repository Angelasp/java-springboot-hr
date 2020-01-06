package com.ruoyi.project.tool.gen.util;
import com.ruoyi.project.system.domain.SysDept;
import com.ruoyi.project.system.domain.SysUser;
import com.ruoyi.project.system.domain.User;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author：huang
 * @Date：2019-09-10 10:29
 * @Description：excel文件解析类
 */
public class Analysis {
    public static boolean isHasValues(Object object){
        Field[] fields = object.getClass().getDeclaredFields();
        boolean flag = false;
        for (int i = 0; i < fields.length; i++) {
            String fieldName = fields[i].getName();
            String methodName = "get"+fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
            Method getMethod;
            try {
                getMethod = object.getClass().getMethod(methodName);
                Object obj = getMethod.invoke(object);
                if (null != obj && !"".equals(obj)) {
                    flag = true;
                    break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
    public Analysis() {
        throw new Error("工具类不允许实例化！");
    }
    /**
     * 获取并解析excel文件，返回一个二维集合
     * @param file 上传的文件
     * @return 二维集合（第一重集合为行，第二重集合为列，每一行包含该行的列集合，列集合包含该行的全部单元格的值）
     */
    public static List<SysUser> analysis(MultipartFile file) throws IOException {
        //获取输入流
        InputStream in = file.getInputStream();
        //获取文件名称
        String fileName = file.getOriginalFilename();
        //判断excel版本
        Workbook workbook = null;
        if (judegExcelEdition(fileName)) {
            workbook = new XSSFWorkbook(in);
        } else {
            workbook = new HSSFWorkbook(in);
        }
        List<SysUser> list = new ArrayList<SysUser>();
        // 循环工作表Sheet
        for (int numSheet = 0; numSheet < workbook.getNumberOfSheets(); numSheet++) {
            Sheet hssfSheet = workbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                Row hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow == null) {
                    continue;
                }
                SysUser exam = new SysUser();
                SysDept dept=new SysDept();
                // 循环列Cell 用户序号
                Cell userid = hssfRow.getCell(0);
                exam.setUserId(Long.valueOf(Analysis.getValue(userid)));
                //读取登录名称
                Cell userName= hssfRow.getCell(1);
                exam.setUserName(Analysis.getValue(userName));
                //读取用户名称
                Cell nickName = hssfRow.getCell(2);
                exam.setNickName(Analysis.getValue(nickName));
                //读取用户邮箱
                Cell email = hssfRow.getCell(3);
                exam.setEmail(Analysis.getValue(email));
                //读取手机号码
                Cell phonenumber = hssfRow.getCell(4);
                exam.setPhonenumber(Analysis.getValue(phonenumber));
                //读取用户性别
                Cell sex= hssfRow.getCell(5);
                exam.setSex(Analysis.getValue(sex));
             /*   if("男".equals(Analysis.getValue(sex))){
                    exam.setSex("0");
                }else if("女".equals(Analysis.getValue(sex))){
                    exam.setSex("1");
                }else {
                    exam.setSex("2");
                }*/
                //读取账号状态
                Cell status= hssfRow.getCell(6);
                String statu=Analysis.getValue(status);
                if ("正常".equals(statu)){
                    exam.setStatus("0");
                }else if("停用".equals(statu)){
                    exam.setStatus("1");
                }
                //读取最后登录ip
                Cell ip= hssfRow.getCell(7);
                exam.setLoginIp(Analysis.getValue(ip));
                //读取最后登录时间
                Cell date= hssfRow.getCell(8);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ParsePosition pos = new ParsePosition(0);
                Date strtodate = formatter.parse(Analysis.getValue(date), pos);
                exam.setLoginDate(strtodate);
                //读取部门名称
                Cell name= hssfRow.getCell(9);
                Cell leader= hssfRow.getCell(10);
                dept.setDeptName(Analysis.getValue(name));
                dept.setLeader(Analysis.getValue(leader));
                exam.setDept(dept);
                list.add(exam);
            }
        }
        return list;
    }
    public static List<User> Excel(MultipartFile file) throws IOException {
        //获取输入流
        InputStream in = file.getInputStream();
        //获取文件名称
        String fileName = file.getOriginalFilename();
        //判断excel版本
        Workbook workbook = null;
        if (judegExcelEdition(fileName)) {
            workbook = new XSSFWorkbook(in);
        } else {
            workbook = new HSSFWorkbook(in);
        }
        List<User> list = new ArrayList<User>();
        // 循环工作表Sheet
        for (int numSheet = 0; numSheet < workbook.getNumberOfSheets(); numSheet++) {
            Sheet hssfSheet = workbook.getSheetAt(numSheet);
            if (hssfSheet == null) {
                continue;
            }
            // 循环行Row
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                Row hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow == null) {
                    continue;
                }
                User exam = new User();
                // 循环列Cell 人员序号
                Cell userid = hssfRow.getCell(0);
                exam.setUserId(Long.valueOf(Analysis.getValue(userid)));
                //读取人员名称
                Cell userName= hssfRow.getCell(1);
                exam.setUserName(Analysis.getValue(userName));
                //读取人员民族
                Cell nation = hssfRow.getCell(2);
                exam.setNation(Analysis.getValue(nation));
                //读取人员邮箱
                Cell email = hssfRow.getCell(3);
                exam.setEmail(Analysis.getValue(email));
                //读取手机号码
                Cell phonenumber = hssfRow.getCell(4);
                exam.setPhonenumber(Analysis.getValue(phonenumber));
                //读取用户性别
                Cell sex= hssfRow.getCell(5);
                if("男".equals(Analysis.getValue(sex))){
                    exam.setSex("0");
                }else if("女".equals(Analysis.getValue(sex))){
                    exam.setSex("1");
                }else {
                    exam.setSex("2");
                }
                //读取人员头像
                Cell avatar= hssfRow.getCell(6);
                exam.setAvatar(Analysis.getValue(avatar));
                //读取人员状态
                Cell status= hssfRow.getCell(7);
                String statu=Analysis.getValue(status);
                if ("正常".equals(statu)){
                    exam.setStatus("0");
                }else if("停用".equals(statu)){
                    exam.setStatus("1");
                }
                //读取人员生日
                Cell birthday= hssfRow.getCell(8);
                exam.setBorth(Analysis.getValue(birthday));
              //  exam.setLoginIp(Analysis.getValue(ip));
                //读取人员学历
                Cell grade= hssfRow.getCell(9);
                exam.setGrade(Analysis.getValue(grade));
                //读取人员毕业院校
                Cell school= hssfRow.getCell(10);
                exam.setGrade(Analysis.getValue(school));
                //读取人员所属专业
                Cell mayor= hssfRow.getCell(11);
                exam.setMayor(Analysis.getValue(mayor));
                //读取人员所属职称
                Cell position= hssfRow.getCell(12);
                exam.setPosition(Analysis.getValue(position));
                //读取人员籍贯
                Cell custom= hssfRow.getCell(13);
                exam.setPosition(Analysis.getValue(custom));
                //读取人员户籍
                Cell hukou= hssfRow.getCell(14);
                exam.setHukou(Analysis.getValue(hukou));
                //读取健康状况
                Cell health= hssfRow.getCell(15);
                exam.setHealthstatus(Analysis.getValue(health));
                //读取人员所熟悉擅长
                Cell shanchang= hssfRow.getCell(16);
                exam.setDirecion(Analysis.getValue(shanchang));
                //读取人员通信地址
                Cell address= hssfRow.getCell(17);
                exam.setAddress(Analysis.getValue(address));
                //读取人员获奖
                Cell raward= hssfRow.getCell(18);
                exam.setRaward(Analysis.getValue(raward));
                //读取人员英语水平
                Cell cet= hssfRow.getCell(19);
                exam.setCetpet(Analysis.getValue(cet));
                //读取人员参工日期
                Cell cangong= hssfRow.getCell(20);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ParsePosition pos = new ParsePosition(0);
                Date strtodate = formatter.parse(Analysis.getValue(cangong), pos);
             //   exam.setLoginDate(strtodate);
                exam.setTime(strtodate);
                //读取人员专业职称
                Cell professor= hssfRow.getCell(21);
                exam.setProfessor(Analysis.getValue(professor));
                //读取人员执业资格
                Cell tile= hssfRow.getCell(22);
                exam.setTitle(Analysis.getValue(tile));
                //读取人员创建日期
                Cell chuangjian= hssfRow.getCell(23);
                SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ParsePosition pos1 = new ParsePosition(0);
                Date chuangjiandate = formatter1.parse(Analysis.getValue(chuangjian), pos1);
                //   exam.setLoginDate(strtodate);
                exam.setTime(chuangjiandate);
                //读取人员修改日期
                Cell xiugai= hssfRow.getCell(24);
                SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ParsePosition pos2 = new ParsePosition(0);
                Date xiugaidate = formatter2.parse(Analysis.getValue(xiugai), pos2);
                //   exam.setLoginDate(strtodate);
                exam.setTime(xiugaidate);

              /*  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                ParsePosition pos = new ParsePosition(0);
                Date strtodate = formatter.parse(Analysis.getValue(date), pos);
     */        //   exam.setLoginDate(strtodate);
                //读取部门名称
          /*      Cell name= hssfRow.getCell(9);
                Cell leader= hssfRow.getCell(10);
                dept.setDeptName(Analysis.getValue(name));
                dept.setLeader(Analysis.getValue(leader));
                exam.setDept(dept);*/
                list.add(exam);
            }
        }
        return list;
    }
    /**
     * 判断上传的excel文件版本（xls为2003，xlsx为2017）
     * @param fileName 文件路径
     * @return excel2007及以上版本返回true，excel2007以下版本返回false
     */
    public static boolean judegExcelEdition(String fileName){
        if (fileName.matches("^.+\\.(?i)(xls)$")){
            return false;
        }else {
            return true;
        }
    }
    /**
     * 得到Excel表中的值
     *
     * @param hssfCell
     *      Excel中的每一个格子
     * @return Excel中每一个格子中的值
     */
    public static String getValue(Cell hssfCell) {
        if (hssfCell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
            // 返回布尔类型的值
            return String.valueOf(hssfCell.getBooleanCellValue());
        } else if (hssfCell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            // 返回数值类型的值
            DecimalFormat df = new DecimalFormat("0");
            String strCell = df.format(hssfCell.getNumericCellValue());
            return String.valueOf(strCell);
        } else {
            // 返回字符串类型的值
            return String.valueOf(hssfCell.getStringCellValue());
        }
    }
}