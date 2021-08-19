<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cn.dao.*" %>
<%@ page import="com.cn.entity.*" %>    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>仓库管理系统</title>
</head>
<body>
<%
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
		String sql = "select * from place ";
		pstmt = connection.prepareStatement(sql);//预编译				
		rs = pstmt.executeQuery(); 
%>	
	
		<table bgcolor="#87CEFA" border="1" width="666">
		<tr>
		<th>商品号</th>
		<th>存放位置</th>
		<th>此仓库内数量</th>		
		</tr>
		
<%				// d.处理结果

		while(rs.next()) {%>
		<tr>
		<!-- 输出结果集 -->
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		</tr>	
<%}	
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} catch(Exception e) {
		e.printStackTrace();
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
	
%>

</body>
</html>