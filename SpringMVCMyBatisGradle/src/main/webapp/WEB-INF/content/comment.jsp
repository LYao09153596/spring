<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论页面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/star.css" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<body class="">
	<%@include file="navbar.jsp" %>
	<div class="container">
	<div class="row" style="margin-top:70px">
    <div class="col-xs-4 col-md-4">
    </div>
    <!-- <div class="row clearfix"> -->
<!-- 		<div class="col-md-3 column"> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-6 column"> -->
    <div class="col-xs-4 col-md-4 ">
      <form class="form-signin"  action="" method="post">
        <h2 class="form-signin-heading wordcolorcss">订单评价</h2>
		<font size="4"><strong>订单编号：</strong></font><font size="4" color="red">${order.orderId}</font>

        <h4>物流评分:</h4>
		<select class="form-control" id="tComment">
	  		<option>1</option>
	  		<option>2</option>
	  		<option>3</option>
	  		<option>4</option>
	  		<option>5</option>
		</select>

		<h4>质量评分:</h4>
		<select class="form-control" id="qComment">
	  		<option>1</option>
	  		<option>2</option>
	  		<option>3</option>
	  		<option>4</option>
	  		<option>5</option>
		</select>

		<h4>服务评分:</h4>
		<select class="form-control" id="sComment">
	  		<option>1</option>
	  		<option>2</option>
	  		<option>3</option>
	  		<option>4</option>
	  		<option>5</option>
		</select>
<!-- 		</div> -->
		<div class="form-group" id="picture">
			<label for="picture">图片评论</label>
			<input type="file" id="picture" name="file">
		</div>
		<div class="form-group" id="comment">
			<label for="comment">文字评论</label>
			<textarea class="form-control" rows="3"></textarea>
	 	</div>
	 	<input type="hidden" id="orderId" name="orderId" value="${order.orderId }">
<%-- 	 	<input type="hidden" id="status" name="status" value="${order.status }"> --%>
		<button type="submit" class="btn btn-default">提交</button>
	</form>

</body>
</html>