<%@ page language="java" pageEncoding="utf-8"%>
<%-- <% --%>
<!--  	String path = request.getContextPath(); -->
<!--  	String basePath = request.getScheme() + "://" -->
<!--  			+ request.getServerName() + ":" + request.getServerPort() -->
<!-- 			+ path + "/"; -->
<%-- %> --%>
<%-- <% --%>
<!--  	String uname = (String) session.getAttribute("uname"); -->
<!--  	String uid = String.valueOf(session.getAttribute("uid")); -->
<!-- %> -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%-- <base href="<%=basePath%>"> --%>
<title>个人信息</title>
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/css.css" rel="stylesheet">
    <link href="../tree/bootstrap.css" rel="stylesheet">
	<link href="../tree/bootstrap-treeview.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="js/kit.js"></script>
<script src="js/dom.js"></script>
<script src="js/form.js"></script>
<link rel="stylesheet" href="css/css1.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/validator.css" />
<!--validator-->
<script src="js/validator.js"></script>
<script src="js/autowired.validator.js"></script>
<style>
table td {
	font-size: 20px;
}

label {
	cursor: pointer;
	margin-right: 10px;
}
</style>


</head>
<body>
	<div>
	<h1>找回密码</h1>
	</div>
	<div id="regist-main">
	
		<form id="registForm" action="forget" method="get">
			<ol>
				<li><label for="UserName">用户名： <span
						class="kitjs-validator" for="@UserName"
						rules="[{notNull:true, message:'用户名不能为空'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="UserName"
					data-valmsg-replace="true"></span> <input id="UserName"
					name="userName" type="text" value="${user.name}" ></li>

				<label></label>

				<li><label for="Email">邮箱地址： <span
						class="kitjs-validator" for="@Email"
						rules="[{notNull:true, message:'电子邮件不能为空'},{isEmail:true,message:'电子邮件格式不正确'}]"></span>
				</label> <span class="field-validation-valid" data-valmsg-for="Email"
					data-valmsg-replace="true"></span> <input id="Email" name="email"
					type="text" value="${user.email}" ></li>

				<label></label>

			</ol>
			<div class="registError"></div>
			<center>
			<input id="submit1" type="submit" value="找回密码" class="btn btn-primary">
			</center>
		</form>
	</div>
</body>
</html>