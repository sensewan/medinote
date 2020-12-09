<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<style>

	.disTab{
		border:1px solid black;
		margin: 50px auto;
		width: 600px;
		height: 550px;
	}
	
	#table1 {
            width: 100%;
            margin-left: auto;
            margin-right: auto;
            /* background-color: rgba( 255, 255, 255, 1 ); */
        }

</style>
</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content_wrap">
			<div class="content">
			<div>
				<table class="table table-hover" id="table1">
				<thead>
					<tr class="table-primary">
						<th scope="col">번호</th>
						<th scope="col">병명</th>
						<th scope="col">진료과</th>
					</tr>
				</thead>
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
	</div>
</body>
</html>