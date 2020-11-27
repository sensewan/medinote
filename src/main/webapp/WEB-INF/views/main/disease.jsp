<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<style>
	.disTab{
		border:1px solid black;
		margin: 50px auto;
		width: 600px;
		height: 550px;
	}
	

</style>
</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content">
			<div class="content_side"></div>
			<div class="content_center">
				<table class="disTab">
					<tr>
						<td>번호</td>
						<td>병명</td>
						<td>진료과</td>
					</tr>
					<tr>
						<td>1</td>
						<td>아파</td>
						<td><a href="#">진료과</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>더아파</td>
						<td><a href="#">큰병원</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>