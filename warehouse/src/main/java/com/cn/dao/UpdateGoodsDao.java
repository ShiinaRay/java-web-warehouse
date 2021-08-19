package com.cn.dao;

import java.sql.*;

import com.cn.entity.*;

public class UpdateGoodsDao {//减少goods 数量
	public int updateGoods(Goods goods)//1:登录成功   0：登录失败（用户名或密码有误）  -1：系统异常   
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
			String sql = "update goods set gnumber=? where gno=?";
			pstmt = connection.prepareStatement(sql);//预编译
			QueryNumberDao dao =new QueryNumberDao();
			int databaseNumber= dao.QueryNumber(goods);
			int number=goods.getGnumber()+databaseNumber;		//此处应该用传入input类（表）来获取入库的数量，但此时的goods也行，此时两个是一样的数据	但传input 又不能query数据库数据了。
			String number1=Integer.toString(number);
			pstmt.setString(1, number1);//pstmt.setInt(1, number);
			pstmt.setString(2, goods.getGno());


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
