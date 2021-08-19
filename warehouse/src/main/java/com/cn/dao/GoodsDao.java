package com.cn.dao;

import java.sql.*;

import com.cn.entity.*;


public class GoodsDao {
//	public int login(String name,String pwd)//1:登录成功   0：登录失败（用户名或密码有误）  -1：系统异常
	
	public int inGoods(Goods goods)//1:登录成功   0：登录失败（用户名或密码有误）  -1：系统异常
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
			String sql = "insert into goods(gno,gname,gsize,gnumber,infactory) values(?,?,?,?,?)";
			pstmt = connection.prepareStatement(sql);//预编译
			pstmt.setString(1, goods.getGno());
			pstmt.setString(2, goods.getGname());
			pstmt.setString(3, goods.getGsize());
			pstmt.setInt(4, goods.getGnumber());			
			pstmt.setString(5, goods.getInfactory());
			
			int count =pstmt.executeUpdate() ;
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
	
	
	
//	public int login(String name,String pwd)//1:登录成功   0：登录失败（用户名或密码有误）  -1：系统异常
//此处可额外再写一个类 加一个方法 也可就在此类下写这个方法……
	public int outGoods(Goods goods)
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
			String sql = "delete from goods where gno=?";
			pstmt = connection.prepareStatement(sql);//预编译
			pstmt.setString(1, goods.getGno());		
			int count =pstmt.executeUpdate() ;
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


