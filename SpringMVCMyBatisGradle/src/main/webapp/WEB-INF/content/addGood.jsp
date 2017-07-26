<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/css.css" rel="stylesheet">
</head>
<body>
		<div class="addcss">
			添加商品 
		</div>
	</div>
		<form class="form-horizontal" method="post" id="addGoods" action="goodAdd">
			<div class="control-group">
				<p>商品名称</p>
				<div class="controls">
					<input id="inputName" type="text" name="goodName"/>
				</div>
				</div>
				<div class="control-group">
					<p>商品价格</p>
				<div class="controls">
					<input id="inputPrice" type="text" name="goodPrice"/>
				</div>
				</div>
				<div class="control-group">
					<p>商品制造公司</p>
					<div class="controls">
						<input id="inputProduct" type="text" name="goodProduct"/>
					</div>
				</div>
				<div class="control-group">
					<p>商品图片</p>
					<div class="controls">
						<input id="inputPicture" type="file" name="goodPicture" />
					</div>
				</div>		
				<div class="control-group">
					<p>商品评价星级</p>
					<div class="controls">
						<input id="inputRating" type="text" name="goodRating"/>
					</div>
				</div>
				<div class="control-group">
					<p>商品库存</p>
					<div class="controls">
						<input id="inputCount" type="text" name="goodCount"/>
					</div>
				</div>
				</div>
				<div class="control-group">
					<p>商品已售数量</p>
					<div class="controls">
						<input id="inputSaled" type="text" name="goodSaled"/>
					</div>
				</div>
				<div class="control-group">
				<div class="controls">
					<input id="submit" type="submit" value="提交"/>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="<c:url value="/js/script.js"/>"></script>
</body>
</html>