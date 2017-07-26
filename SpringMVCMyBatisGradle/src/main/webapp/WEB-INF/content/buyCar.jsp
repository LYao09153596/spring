SSSSSSSSSSSSSSSSSSSSSSSS<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/css.css"/>" rel="stylesheet">
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
<div class="row" style="margin-top:70px">
	<div style="text-align:center">
		<h1>购物车</h1>
	</div>
    <%--===============================================================================--%>
    <div class="row buycarcss">
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
					<th>购买数量</th>
					<th>选择物流</th>
				</tr>
				
        <c:forEach var="userGood" items="${userGoodList}">
                <tr>
                <th>${userGood.id}</th>
                <th>${userGood.goodName}</th>
                <th>${userGood.price}</th>
                <th>${userGood.buyCount}</th>
                <th>${userGood.traffic}</th></tr>
        </c:forEach>
        </table>
        	<div>
            	<button class="btn btn-lg btn-primary btn-block"  type="submit">购物车结算</button>
            </div>
    </div>
    <%--============================================================================--%>
	</div>
</div>
<script src="<c:url value="/bootstrap/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/script.js"/>"></script>
</body>
</html>
