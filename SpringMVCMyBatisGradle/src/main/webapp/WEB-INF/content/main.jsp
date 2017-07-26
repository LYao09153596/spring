<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/css.css" rel="stylesheet">
</head>
<body class="background2css">
<%-- <%@include file="navbar.jsp" %> --%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><p>欢迎您！${sessionScope.user.name}</p></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse fontcss" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          用户管理 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="showMessage">修改密码</a></li>
            <li><a href="buyCar?buttonCar=0">我的购物车</a></li>
            <li><a href="#">我的已购订单</a></li>
<!--             <li role="separator" class="divider"></li> -->
<!--             <li><a href="#">查看购物车</a></li> -->
<!--             <li role="separator" class="divider"></li> -->
<!--             <li><a href="#">One more separated link</a></li> -->
          </ul>
        </li>
      </ul>
      <p>现在与您同时在线共有  ${count }人！</p>
    </div>

  </div>
</nav>
<!-- ================================================= -->
<div class="container">
    <div id="carousel-example-generic" class="carousel slide carouselcss" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="images/01.png" alt="..." height="400px"/>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="images/06.png" alt="..." height="400px"/>
                <div class="carousel-caption">
                </div>
            </div>
             <div class="item">
                <img src="images/07.png" alt="..." height="400px"/>
                <div class="carousel-caption">
                </div>
            </div>
        </div>
        

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>


<!-- ============================================================== -->
<div class="container marketing">
    <!-- Three columns of text below the carousel -->
    <div class="row">
        <c:forEach var="good" items="${goodList}">
            <div class="col-lg-3">
                <img class="img-rounded"
                     src="images/${good.goodPicture} "
                     alt="Generic placeholder image" width="140" height="140"
                     border="10" border-color="black">
                <h4>${good.goodName}</h4>
                <p>价格：${good.goodPrice}元</p>
                <p>已售：${good.goodSaled}件</p>
                <p><a class="btn btn-default" href="detatil/${good.id}" role="button">详情页面 &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
        </c:forEach>
    </div><!-- /.row -->
    <!-- =================================== -->
    <script src="bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>