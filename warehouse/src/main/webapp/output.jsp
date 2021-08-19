<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cn.dao.*" %>
<%@ page import="com.cn.entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>仓库管理系统</title>
</head>
<body>
		<%
		//默认一直有地方存储  先不判断是否有空位  input 插入无需判断
		//判断入库商品是否存在，如果不存在就插入insert     如果存在就把数量增加   需要查询数量后加上入库数量	 update
		//出库 要判断数量  如果小于现有数量 则goods减少数量并且output添加一条数据   如果等于现有数量则删除goods的一条元组 并output添加一条数据  如果大于 则出库失败
		//可以写一个类 方法 函数集成  判断   或直接在jsp代码中写 需要修改goods output place表
		    //table output goods
			String gno = request.getParameter("gno") ;
			String outfactory = request.getParameter("outfactory") ;
			String outtime = request.getParameter("time") ;
			String outplace = request.getParameter("place") ;
			String outnumber = request.getParameter("gnumber") ;
			Output output = new Output(gno,outfactory,outtime,outplace,outnumber) ;						
			OutputDao dao1 = new OutputDao();
			Goods goods = new Goods(gno);//其实可以多写几个构造方法  方便后面的方法传goods对象的值 ，不然只能再传一个output对象来传值
			QueryNumberDao qdao =new QueryNumberDao();
			int databasenumber = qdao.QueryNumber(goods);
			int outnumber1 = Integer.parseInt(outnumber);
			int result1 = 0;
			int result2 = 0;
			GoodsDao gdao = new GoodsDao();
			if (outnumber1 < databasenumber){
				result1 = dao1.output(output) ;	
				//减少数量 方法
				UpdateGoodsDao1 udao = new UpdateGoodsDao1();
				result2 = udao.updateGoods(goods, output);
				
			}else if(outnumber1 == databasenumber){
				result1 = dao1.output(output) ;	
				//删除goods  一条数据  方法
				result2 = gdao.outGoods(goods);
			}else{
				result1 = 0;//库存不足 出库失败
			}
			
			


			//table place   或者用触发器 存储过程函数之类的
//			String gno = request.getParameter("gno") ;
			String wplace = request.getParameter("place") ;
			String wgnumber = request.getParameter("gnumber");	
			int wgnumber1=Integer.parseInt(wgnumber);
			int result3 = 0;
			PlaceDao pdao = new PlaceDao();
			QueryNumberDao1 qdao1 =new QueryNumberDao1();
			Place place = new Place(gno,wplace,wgnumber1);
			int databasenumber1 = qdao1.QueryNumber(place);
			//根据place的wnumber来判断  出库过程中，根据place的wnumber来判断 仓库中若足够则update；若相等 则delete ； 若不足，则出库失败。
			
			if(wgnumber1 < databasenumber1){
				result3=pdao.updateplace_minus(place);
			}else if (wgnumber1 == databasenumber1){
				result3=pdao.deleteplace(place);
			}else{
				result3 = 0;//此仓库 库存不足 出库失败
			}
		    //debug  console没有报错  但有一个返回值不是>0    数据库结果操作也是正确的
		    //System.out.println(result1);//1
		    //System.out.println(result2);//0  发现判断语句中有个result2 写成了result1  导致result2结果没变
		    //System.out.println(result3);//1   
			if(result1 > 0 && result2 > 0 && result3 > 0){
				//response.sendRedirect("success.jsp") ;//页面跳转：重定向， 导致数据丢失
				//页面跳转：请求转发, 可以获取到数据，并且 地址栏 没有改变（仍然保留 转发时的页面check.jsp）
				//request.getRequestDispatcher("success.jsp").forward(request,response);
				out.print("出库成功！");
			}else{
				out.print("出库失败，系统异常或库存不足！！");
			}			
		
		%>
</body>
</html>