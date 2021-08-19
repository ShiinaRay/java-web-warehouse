<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓库管理系统</title>
</head>
<body>
		登录成功！<br/>
		欢迎您：
		<%
			  String name = request.getParameter("uname") ;
				out.print(name) ;
				//加cookie   session  保存信息……
 		%>
 		<h1 style="color:rgb(162, 80, 255)">商品入库</h1>
 		<form action="input.jsp" method="post">
 		商品号：<input type="text" name="gno" /><br/>
 		商品名称：<input type="text" name="gname" /><br/>
 		商品规格：
 		<select name="gsize">
    		<option value="s">小</option>
    		<option value="m">中</option>
    		<option value="l">大</option>
		</select><br>
 		商品数量：<input type="number" name="gnumber" /><br>
 		生产厂家：<input type="text" name="infactory" /><br/>
 		存放位置： 		
 		<select name="place">
    		<option value="w1">1号仓库</option>
    		<option value="w2">2号仓库</option>
    		<option value="w3">3号仓库</option>
    		<option value="w4">4号仓库</option>
    		<option value="w5">5号仓库</option>
		</select><br>
		入库日期：<input type="datetime-local" name="time"><br>
 		<input type="submit"  value="入库" /><br/>
		</form>



    	<h1 style="color:rgb(255,192,203)">商品出库</h1> 
    	
 		<form action="output.jsp" method="post">
 		商品号：<input type="text" name="gno" /><br/>
 		商品数量：<input type="number" name="gnumber" /><br>
 		出售厂家：<input type="text" name="outfactory" /><br/>
 		存放位置： 		
 		<select name="place">
    		<option value="w1">1号仓库</option>
    		<option value="w2">2号仓库</option>
    		<option value="w3">3号仓库</option>
    		<option value="w4">4号仓库</option>
    		<option value="w5">5号仓库</option>
		</select><br>
		出库日期：<input type="datetime-local" name="time"><br>
 		<input type="submit"  value="出库" /><br/>
		</form>

	
    	<h1 style="color:rgb(0,191,255)">查询</h1> 
    	
 		<form action="queryName.jsp" method="post">
 		按商品名称查询：<input type="text" name="gname" />
 		<input type="submit"  value="查询" /><br/>
		</form>    	
		
 		<form action="queryId.jsp" method="post">
 		按商品号查询：<input type="text" name="gno" />
 		<input type="submit"  value="查询" /><br/>
		</form>    	
		<br/>
		<br/>
		<br/>
		
 		<form action="printGoods.jsp" method="post">
 		<input type="submit"  value="打印商品表" /><br/>
		</form>  
		<br/>	
			  	
 		<form action="printPlace.jsp" method="post">
 		<input type="submit"  value="打印位置表" /><br/>
		</form>   	
		<br/>	
							
 		<form action="printInput.jsp" method="post">
 		<input type="submit"  value="打印入库表" /><br/>
		</form>       	
		<br/>	
			
		<form action="printOutput.jsp" method="post">
 		<input type="submit"  value="打印出库表" /><br/>
		</form>   
    	

<h1 color:"red">h1</h1>
<h1 color="red">h1</h1>
<font color="red">font</font><br/>
<font color='blue'>font</font>
</body>
</html>