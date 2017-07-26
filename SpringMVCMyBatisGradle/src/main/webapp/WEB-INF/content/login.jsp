<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/css.css" rel="stylesheet">
</head>
<body class="backgroundcss">
	<%@include file="navbar.jsp" %>
    <!--登录代码-->
    <div class="container">
    <div class="col-xs-4 col-md-4">
    </div>
    <div class="col-xs-4 col-md-4 logincss">
      <form class="form-signin" action="goMain" method="post">
        <h2 class="form-signin-heading wordcolorcss">Welcome!请登录</h2>
          <c:if test="${not empty success}">
              ${success}
          </c:if>
        <label for="inputUser" class="sr-only">用户名</label>
        <input type="text" value="${username}" name="username"  id="inputUser" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" value="${pass}" name="pass" id="inputPassword" class="form-control" placeholder="登录密码" required>
          <c:if test="${not empty message}">
              ${message}
          </c:if>
          <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me"><span class="wordcolorcss"> 记住用户名和密码</span>
                <a href="register" class="registercss">注册</a>
                <a href="goForget" class="">忘记密码</a>
              </label>
          </div>
        <button class="btn btn-lg btn-primary btn-block" name="buttonUser" value="user1" type="submit">用户登录</button>
        <button class="btn btn-lg btn-default btn-block" name="buttonUser" value="user2" type="submit">管理员登录</button>
      </form>
	</div>
	<div class="col-xs-4 col-md-4">
    </div>
    </div> <!-- /container -->
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>