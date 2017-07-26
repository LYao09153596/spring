<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/css.css"/>" rel="stylesheet">
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <%--=================================--%>
	<div class="col-sm-12 col-md-12">
    	<div class="thumbnail">
            <div class="row" style="margin-top:70px">
            	<div class="colsm-4 col-md-4">
<!--                 	<img class="img-rounded" -->
<%--                      src="../images/${good.goodPicture}" --%>
<!--                      alt="Generic placeholder image"  -->
<!--                      width="350" height="300" -->
<!--                      border="10" border-color="black" alt="..."/> -->
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
                <img src="../images/${goodPicture1.goodPicture}" alt="..." />
<!--                 width="200px" height="200px"/> -->
                <div class="carousel-caption">
                </div>
            	</div>
        	<c:forEach var="picture" items="${goodPictureList1}">
        		<div class="item">
                <img src="../images/${picture.goodPicture}" alt="..." />
<!--                 width="200px" height="200px"/> -->
                <div class="carousel-caption">
                </div>
            	</div>
        	</c:forEach>
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
            	<div class="colsm-6 col-md-6">
                	<div class="caption">
                	<h3 class="colortop1">商品名称：${good.goodName}</h3>
                    <p class="colortop1">商品价格：${good.goodPrice}元</p>
                    <p class="colortop1">商品库存：${good.goodCount}件</p>
                    <p class="colortop1">商品公司：${good.goodProduct}</p>
                    <p class="colortop1">商品星评：${good.goodRating}星</p>
					<h3 class="colortop1">购买信息</h3>
                    <form class="form-inline" action="../buyCar" method="post">
                    	<input type="hidden" name="goodId" value="${good.id}">
                     	<input type="hidden" name="goodName" value="${good.goodName}">
                     	<input type="hidden" name="price" value="${good.goodPrice}">
                        <div class="form-group">
                         	<label for="duble" class="colortop1">购买数量:</label>
                            <div class="input-group spinner">
                            	<input type="text" name="buyCount" id="duble" class="form-control" value="1">
                               	<div class="input-group-btn-vertical">
                                  <button class="btn btn-default" type="button"><i
                                          class="glyphicon glyphicon-menu-up"></i>
                                  </button>
                                  <button class="btn btn-default" type="button"><i
                                          class="glyphicon glyphicon-menu-down"></i>
                                  </button>
                               </div>
                            </div>
                         </div>
<!--                                 <p class="colortop">选择颜色： -->
<%--                                     <c:forEach var="goodColor" items="${goodColorList}"> --%>
<!--                                         <input type="radio" name="colorName" -->
<%--                                                value="${goodColor.colorName}">${goodColor.colorName} --%>
<%--                                         <input type="hidden" name="colorId" value="${goodColor.colorId}"> --%>
<%--                                     </c:forEach> --%>
<!--                                 </p> -->
                                <p class="colortop">选择物流：
                                    <select name="traffic" id="select">
                                        <option value="顺丰">顺丰物流</option>
                                        <option value="申通">申通物流</option>
                                        <option value="韵达">韵达物流</option>
                                        <option value="京东">京东物流</option>
                                    </select>
                                </p>
                                <p>
                                    <button type="submit" name="buttonCar" value="add1" class="btn btn-primary bottomcss">添加到购物车</button>
                                </p>
                     </form>
                    <form action="../buyCar">
                            	<input type="hidden" name="goodId" value="${good.id}">
                                <input type="hidden" name="goodName" value="${good.goodName}">
                                <input type="hidden" name="goodPicture" value="${good.goodPicture}">
                                <input type="hidden" name="goodPrice" value="${good.goodPrice}"/>
                                <button type="submit" name="buttonCar" value="add2" class="btn btn-primary bottomcss">添加收藏</button>
                    </form>
                    </div>
                </div>
                    </div>
                   
                    <form action="../detatil/${good.id}" method="post">
<!--                         <p> -->
<!--                             <button type="submit" class="btn btn-primary">发表评论</button> -->
<!--                         </p> -->
                        <%--<p><a href="../goComment" class="btn btn-primary" role="button">发表评论</a></p>--%>
<%--                         <input type="hidden" name="goodId" value="${good.id}"> --%>
<%--                         <input type="hidden" name="goodName" value="${good.goodName}"> --%>
<!--                         <textarea class="form-control" name="comment" value="" rows="3"></textarea> -->
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--======================================================--%>
    <c:forEach var="comment" items="${commentList}">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">用户：${comment.userName}</h3>
            </div>
            <div class="panel-body">
                评论：${comment.comment}
            </div>
        </div>
    </c:forEach>
    <%--==========================================================--%>
</div>
<script src="<c:url value="/bootstrap/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/script.js"/>"></script>
</body>
</html>