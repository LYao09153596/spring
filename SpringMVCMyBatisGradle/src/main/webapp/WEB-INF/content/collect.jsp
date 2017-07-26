<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@include file="navbar.jsp" %>
<div class="row" style="margin-top:70px">
	<div style="text-align:center">
	<h1>收藏夹
<!-- 		<button  type="button" class="btn btn-info"><a href="addGood">添加商品 </a></button> -->
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
					<th>商品图片</th>
					<th>删除收藏</th>
				</tr>
	        	<c:forEach items="${collectList}" var="collect" varStatus="status"> 
	        	<tr> 
	                <th>${collect.id}</th>
	                <th>${collect.goodName}</th>
	                <th>${collect.goodPrice}</th>
	                <th><img src="../images/${collect.goodPicture}" width="50px" height="50px" alt="" /></th>
<%-- 	                <th>${good.goodRating}</th> --%>
	                <td>
	                <form action="collectDelete">
	                	<input type="hidden" value="${collect.id}" name="id" />
	                	<button type="submit" class="btn btn-danger" >删除收藏</button>
	                </form>
	                </td>
	            </tr>
	          </c:forEach>
	   </table>
	   </div>
	   </div>
	   </div>
   </div>