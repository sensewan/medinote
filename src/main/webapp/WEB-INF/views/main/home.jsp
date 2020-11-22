<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<style>
	.pop{
		visibility : hidden;
	}
	.symp_table {
		border: 1px solid black;
		width: 400px;
		height: 300px;
	}
	.scale:hover {
		transform: scale(1.1);
	  -webkit-transform: scale(1.1);
	  -moz-transform: scale(1.1);
	  -ms-transform: scale(1.1);
	  -o-transform: scale(1.1);
	}
</style>
</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content">
			<div class="content_side"></div>
			<div class="content_center">
				<img src="img/body.jpg" alt="Body" usemap="#bodymap" width="600px">
				<map name="bodymap">
					<area shape="circle" coords="300,70,44" alt="head" href="#">
					<area shape="circle" coords="400,330,44" alt="hand" href="#">
				</map>
				<input type="button" value="임시버튼" onclick="pop()"/>
				<form class="pop">
					<table class="symp_table">
						<tr>
							<td>
								<a href="#">X</a>
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="symp"/>증상1</td>
							<td><input type="checkbox" class="symp"/>증상2</td>
							<td><input type="checkbox" class="symp"/>증상3</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="symp"/>증상4</td>
							<td><input type="checkbox" class="symp"/>증상5</td>
							<td><input type="checkbox" class="symp"/>증상6</td>
						</tr>
						<tr style="text-align: right;">
							<td>
								<input type="button" value="더보기" onclick="exe()"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
		</div>
	</div>
	<script>
		function pop(){
			
		}
		
		function exe(){
			
		}
	</script>
</body>
</html>