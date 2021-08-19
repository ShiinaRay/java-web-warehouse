package com.cn.dao;
import java.sql.*;
import com.cn.entity.*;
public class IsExistDao {
	public int IsExist(Goods goods)//1:不存在相同 直接插入  0：存在相同 增加数量 -1：系统异常
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
			String sql = "select gno from goods";
			pstmt = connection.prepareStatement(sql);//预编译
			rs = pstmt.executeQuery(); 
			// d.处理结果
			int flag=1;
			while(rs.next()) {
				//System.out.println(goods.getGno());
				//System.out.println(rs.getString(1));//Duplicate entry '2' for key 'place.PRIMARY'  触发器主键  异常  先去掉主键 返回-1 且不会return flag  了  且  
				if(Integer.parseInt(goods.getGno())==Integer.parseInt(rs.getString(1))) {//String 不能直接相等  或.equals
					flag = 0;
					break;
				}
        }	
			//System.out.println(goods.getGno());//debug
			//System.out.println(rs.getString(1));//debug  此处加了system.out 会报错且则一直flag=0  不加一直为1？？？  
			return flag;


		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
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
