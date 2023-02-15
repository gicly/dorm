package com.xpu.util;

import java.sql.*;

//工具类(创建)
public class JDBCUtil {
    //获取数据库连接的方法
    public Connection getConn(){
        Connection conn=null;

        try {
            Class.forName(PropertiesUtil.getValue("jdbcName"));
            conn= DriverManager.getConnection(PropertiesUtil.getValue("dbUrl"), PropertiesUtil.getValue("dbUserName"), PropertiesUtil.getValue("dbPassword"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  conn;
    }


    //关闭数据库连接、关闭执行对象、关闭结果集对象（关闭资源）
    public void closeAll(ResultSet rs, Statement st,Connection conn){
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(st!=null){
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }


    //执行增删改的通用方法
    public int exec(String sql,Object[] obj){
        int count=0;
        PreparedStatement pst=null;
        Connection conn=getConn();
        //预编译sql语句并返回执行对象
        try {
              pst=conn.prepareStatement(sql);
            for (int i = 0; i < obj.length; i++) {
                pst.setObject(i+1,obj[i]);
            }
           count=pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeAll(null,pst,conn);
        }
        return  count;

    }
}
