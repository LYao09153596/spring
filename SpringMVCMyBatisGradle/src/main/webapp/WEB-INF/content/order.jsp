<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="now" class="java.util.Date" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>我的订单</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/css.css" rel="stylesheet">
    <script src="bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%@include file="navbar.jsp" %>
<div class="row" style="margin-top:70px">
<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
					
						<div class="col-md-2">
						</div>
						<div class="col-md-8">
							<h3>
								我的订单
							</h3>
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>商品名称</th>
										<th>商品价格</th>
										<th>选择物流</th>
										<th>购买数量</th>
										<th>总价</th>
										<th>购买时间</th>
										<th>操作</th>
									</tr>
								</thead>
								c:forEach items="${requestScope.userGoodList }" var="userGood">
								<form action="remove" method="post">
								<tbody>
								<tr>
<%-- 									<td>${userGood.id}</td> --%>
<%--                	 					<td>${userGood.goodName}</td> --%>
<%--                 					<td>${userGood.price}</td> --%>
<%--                 					<td>${userGood.traffic}</td> --%>
<%--                 					<td>${userGood.buyCount}</td> --%>
                					<td><c:set value="${userGood.price*userGood.buyCount}" var="sum1"></c:set></td>
                					<td> </td>
                				</tr>