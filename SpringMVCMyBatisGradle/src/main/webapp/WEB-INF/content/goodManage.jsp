<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/css.css" rel="stylesheet">
    <link href="../tree/bootstrap.css" rel="stylesheet">
	<link href="../tree/bootstrap-treeview.css" rel="stylesheet">
</head>
<body class="background3css">
	<div style="text-align:center">
	<h1>商品管理中心
		<button  type="button" class="btn btn-info"><a href="addGood">添加商品 </a></button>
	</h1>
	</div>
		<br>
		<div class="container">
		<div class="row">
		<div class="col-md-2">
			<div id="treeview1" class=""></div>
		</div>
		<div class="col-md-10">
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>商品制造公司</th>
					<th>商品图片</th>
					<th>商品评价星级</th>
					<th>商品库存</th>
					<th>商品已售数量</th>
					<th>修改信息</th>
					<th>删除商品</th>
				</tr>
	        	<c:forEach items="${goodList}" var="good" varStatus="status"> 
	        	<tr> 
	                <td>${good.id}</td>
	                <td>${good.goodName}</td>
	                <td>${good.goodPrice}</td>
	                <td>${good.goodProduct}</td>
	                <td><img src="../images/${good.goodPicture}" width="50px" height="50px" alt="" /></td>
	                <td>${good.goodRating}</td>
	                <td>${good.goodCount}</td>
	                <td>${good.goodSaled}</td>
	                <td>
	                	<button class="btn btn-primary" onclick="clickHidden(${status.index})">修改商品</button>
	                </td>     
	                <td>
	                <form action="goodDelete">
	                	<input type="hidden" value="${good.id}" name="id" />
	                	<button type="submit" class="btn btn-danger" >删除商品</button>
	                </form>
	                </td>
	            </tr>
	            <tr class="trHidden" hidden>
	            	<form action="../goodUpdate">
		            	<td><input type="text" value="${good.id}" name="id"></td>
		                <td><input type="text" value="${good.goodName}" name="goodName" /></td>
		                <td><input type="text" value="${good.goodPrice}" name="goodPrice" /></td>
		                <td><input type="text" value="${good.goodProduct}" name="goodProduct" /></td>
		                <td><input type="text" value="${good.goodPicture}" name="goodPicture" /></td>
		                <td><input type="text" value="${good.goodRating}" name="goodRating" /></td>
		                <td><input type="text" value="${good.goodCount}" name="goodCount" /></td>
		                <td><input type="text" value="${good.goodSaled}" name="goodSaled" /></td>
		                	<input type="hidden" value="${good.goodRelation}" name="goodRelation" />
		                <td>
		                	<button class="btn btn-default" type="submit">确认修改</button>
		                </td>
	                </form>
	            </tr>
	            </c:forEach>
	   </table>
	   </div>
	   </div>
   </div>
	<!--    ==================================================== -->
	<script src="<c:url value="/bootstrap/js/jquery-3.2.1.min.js"/>"></script>
	<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/tree/jquery.js"/>"></script>
  	<script src="<c:url value="/tree/bootstrap-treeview.js"/>"></script>
	<script src="<c:url value="/js/script.js"/>"></script>
	<script type="text/javascript">
	
  		$(function() {
  		        var defaultData = [
  		  {
  		     text: '商品管理',
  		     href: '#',
  		     tags: ['3'],
  		     nodes: [
  		  	{
             	text: '彩色隐形眼镜',
             	href: '../select/${"A1"}',
             	tags: ['4'],
             	nodes: [
               	{
                 	text: '博士伦',
                 	href: '../select/${"A11"}',
                 	tags: ['0']
               	},{
                 	text: '强生',
                 	href: '../select/${"A12"}',
                 	tags: ['0']
               	},{
                 	text: '海昌',
                 	href: '../select/${"A13"}',
                 	tags: ['0']
               	},{
                 	text: '其它',
                 	href: '../select/${"A14"}',
                 	tags: ['0']
                 }
             	]
           	},
           	{ 
        	 text: '透明隐形眼镜',
             href: '../select/${"B2"}',
             tags: ['4'],
             nodes:[
            	 {
                     text: '博士伦',
                     href: '../select/${"B21"}',
                     tags: ['0']
                   },{
                     text: '强生',
                     href: '../select/${"B22"}',
                     tags: ['0']
                   },{
                     text: '海昌',
                     href: '../select/${"B23"}',
                     tags: ['0']
                   },{
                     text: '其它',
                     href: '../select/${"B24"}',
                     tags: ['0']
                     }
             ]
           },
           {
             text: '护理用品',
             href: '../select/${"C3"}',
             tags: ['4'],
             nodes:[
            	 {
                     text: '博士伦',
                     href: '../select/${"C31"}',
                     tags: ['0']
                   },{
                     text: '强生',
                     href: '../select/${"C32"}',
                     tags: ['0']
                   },{
                     text: '海昌',
                     href: '../select/${"C33"}',
                     tags: ['0']
                   },{
                     text: '其它',
                     href: '../select/${"C34"}',
                     tags: ['0']
                     }
             ] 
           }
  		   ]
  		  },
  		{
   		     text: '订单管理',
   		     href: '#',
   		     tags: ['0'],
   		     nodes: [ ]
  		},
         ];

         $('#treeview1').treeview({
           enableLinks: true,
           expanded: false,
           data: defaultData
         });
    
   		});
  	</script>
</body>
</html>