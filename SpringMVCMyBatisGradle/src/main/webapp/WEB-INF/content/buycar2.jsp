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

    <title>购物车</title>

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
								购物车
							</h3>
							<table class="table">
								<thead>
									<tr>
										<th>ID</th>
										<th>商品名称</th>
										<th>商品价格</th>
										<th>选择物流</th>
										<th>购买数量</th>
										<th>操作</th>
									</tr>
								</thead>
								<c:forEach items="${requestScope.userGoodList }" var="userGood">
								<form action="remove" method="post">
								<tbody>
								<tr>
									<td>${userGood.id}</td>
               	 					<td>${userGood.goodName}</td>
                					<td>${userGood.price}</td>
                					<td>${userGood.traffic}</td>
                					<td>${userGood.buyCount}
                					<c:set value="${userGood.price*userGood.buyCount+sum}" var="sum"></c:set></td>
									<td>
										<input type="hidden" name="userId" id="userId" value="${userGood.userId}"   >
										<input type="hidden" name="goodId" id="goodId" value="${userGood.id }"   >
										<button type="submit" class="btn btn-danger"><a href="remove?id=${userGood.id}" style="color:#fff">删除</a></button>
										<button type="button"  class="btn btn-primary"><a href="add?id=${userGood.id}" style="color:#fff">增加</a></button>
										<button type="button"  class="btn btn-primary"><a href="reduce?id=${userGood.id}" style="color:#fff">减少</a></button>
									</td>
								</tr>
								</tbody>
								</form>
								</c:forEach>
								<tfoot>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
											<font size="5">总计：</font>
										</td>
										<td>
											<font size="5" color="red"><strong>${sum }</strong></font>
										</td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">&nbsp;&nbsp;&nbsp;结算&nbsp;&nbsp;&nbsp;</button>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  				<div class="modal-dialog" role="document">
    			<div class="modal-content">
      			<div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">支付信息</h4>
     			</div>
      			<div class="modal-body">请问您是否确定付款</div>
      			<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary"><a href="already?userId=${userId}" class="" style="color:#fff">确定付款</a></button>
     			</div>
    			</div>
  				</div>
				</div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
</body>
</html>