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
		//默认一直有地方存储  先不判断是否有空位   input 插入无需判断
		//判断入库商品是否存在，如果不存在就插入insert     如果存在就把数量增加   需要查询数量后加上入库数量	 update
		//出库 要判断数量  如果小于现有数量 则goods减少数量并且output添加一条数据   如果等于现有数量则删除goods的一条元组 并output添加一条数据  如果大于 则出库失败
		//可以写一个类 方法 函数集成  判断   或直接在jsp代码中写  需要修改goods input place表
		    //table input
			String gno = request.getParameter("gno") ;
			String infactory = request.getParameter("infactory") ;
			String intime = request.getParameter("time") ;
			String inplace = request.getParameter("place") ;
			String innumber = request.getParameter("gnumber") ;
			Input input = new Input(gno,infactory,intime,inplace,innumber) ;						
			InputDao dao1 = new InputDao();
			
			int result1 = dao1.input(input) ;
	
						
			//table goods
//			String gno = request.getParameter("gno") ;
			String gname = request.getParameter("gname");
			String gsize = request.getParameter("gsize");
			String gnumber = request.getParameter("gnumber");
			int gnumber1=Integer.parseInt(gnumber);
//			String infactory = request.getParameter("infactory");			

			Goods goods = new Goods(gno,gname,gsize,gnumber1,infactory);
	
			IsExistDao dao3= new IsExistDao();
			int flag=dao3.IsExist(goods);
			//int flag=0;   //debug  测试 到底是哪个dao代码写错了 发现是flag的问题  后来再试 发现没问题？？？
			int result2 = 0;	
			if(flag == 1){	
			GoodsDao dao2 = new GoodsDao();	
			result2 = dao2.inGoods(goods);					
			}
			else{
				
				UpdateGoodsDao dao4 = new UpdateGoodsDao();
				result2=dao4.updateGoods(goods);
				
			}
			
			
			//table place   或者用触发器 存储过程函数之类的
//			String gno = request.getParameter("gno") ;
			//入库过程中，如果存在则place update  不存在则insert
			String wplace = request.getParameter("place") ;
			String wgnumber = request.getParameter("gnumber");	
			int wgnumber1=Integer.parseInt(wgnumber);
			Place place = new Place(gno,wplace,wgnumber1);
			PlaceDao dao5 = new PlaceDao();
			IsExistDao1 dao6 = new IsExistDao1();		
			int flag1=dao6.IsExist(place);
			int result3 = 0;
			if(flag1 == 1){	
				result3=dao5.inplace(place);			
			}
			else{
				result3=dao5.updateplace_add(place);
			}
			

			
			
			//例如  e.g.
//			create trigger goods_update
//			after update on goods for each ROW
//			update place set place=new.place where gno=old.gno;
		
//create trigger goods_insert
//after insert on goods for each ROW
//insert into place(gno,place) values(new.gno,new.place) 
			
			
			if(result1 > 0 && result2 > 0 && result3 > 0){
				//response.sendRedirect("success.jsp") ;//页面跳转：重定向， 导致数据丢失
				//页面跳转：请求转发, 可以获取到数据，并且 地址栏 没有改变（仍然保留 转发时的页面check.jsp）
				//request.getRequestDispatcher("success.jsp").forward(request,response);
				out.print("入库成功！");
			}else{
				out.print("入库失败，系统异常！！");
			}			
		
		%>

</body>
</html>