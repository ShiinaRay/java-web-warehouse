<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.cn.dao.LoginDao" %>
<%@ page import="com.cn.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>仓库管理系统</title>
	</head>
<body>		
		<%
		
			String name = request.getParameter("uname") ;
			String pwd = request.getParameter("upwd") ;
			Login login = new Login(name,pwd) ;
			
			
			LoginDao dao = new LoginDao();
			
			int result = dao.login(login) ;
			if(result >0){
				//response.sendRedirect("success.jsp") ;//页面跳转：重定向， 导致数据丢失
				//页面跳转：请求转发, 可以获取到数据，并且 地址栏 没有改变（仍然保留 转发时的页面check.jsp）
				request.getRequestDispatcher("success.jsp").forward(request,response);
			}else if(result==0){
				out.print("用户名或密码有误！！");
			}else{
				out.print("系统异常！！");
			}
		
		%>
</body>
</html>