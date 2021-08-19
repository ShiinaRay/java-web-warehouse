package com.cn.dao;

import java.sql.*;

import com.cn.entity.*;


public class InputDao {
//	public int login(String name,String pwd)//1:登录成功   0：登录失败（用户名或密码有误）  -1：系统异常
	public int input(Input input)//1:登录成功   0：登录失败（用户名或密码有误）  -1：系统异常
	{
		String URL = "jdbc:mysql://localhost:3306/warehouse";
		String USERNAME = "root";
		String PWD = "5677897";
		Connection connection = null;
		PreparedStatement  pstmt = null;
		ResultSet rs = null ; 
		try {
			// a.导入驱动，加载具体的驱动类
			Class.forName("com.mysql.cj.jdbc.Driver");// 加载具体的驱动类  build path后可查看   错误驱动类会报错  根据提示改即可
			// b.与数据库建立连接
			connection = DriverManager.getConnection(URL, USERNAME, PWD);
			// c.发送sql
			String sql = "insert into input(gno,infactory,intime,inplace,innumber) values(?,?,?,?,?)";
			pstmt = connection.prepareStatement(sql);//预编译
			pstmt.setString(1, input.getGno());
			pstmt.setString(2, input.getInfactory());
//			pstmt.setInt(1, 1);
			pstmt.setString(3, input.getIntime());
			pstmt.setString(4, input.getInplace());
			pstmt.setString(5, input.getInnumber());
			
			int count =pstmt.executeUpdate() ;// 返回值表示 增删改 几条数据
			// d.处理结果
			return count ;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return -1 ;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1 ;
		} catch(Exception e) {
			e.printStackTrace();
			return -1 ;
		}
		finally {
			try {
				if(rs!=null) rs.close(); 
				if(pstmt!=null) pstmt.close();// 对象.方法
				 if(connection!=null)connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

