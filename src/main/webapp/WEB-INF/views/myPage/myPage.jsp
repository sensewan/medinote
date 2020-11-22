<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--외부 css파일 연결 -->

<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content">
			<div class="content_side">
				<%@ include file="sideBar.jsp"%>
			</div>
			<div class="content_center">
				<table class="table table-hover">
					<thead>
				    	<tr>
				      		<th scope="col">번호</th>
				      		<th scope="col">태그</th>
				      		<th scope="col">검색 일자</th>
				      		<th scope="col">삭제</th>
				    	</tr>
				  	</thead>
				    <tbody>
					  	<tr class="table-success">
					    	<th scope="row">20</th>
					      	<td>설사</td>
					      	<td>2020-11-13</td>
					      	<td><input type="button" id="delete" value="X" onclick=""/></td>
					    </tr>
						<tr>
					    	<th scope="row">19</th>
					      	<td>아랫배 통증</td>
					      	<td>2020-11-13</td>
					      	<td><input type="button" id="delete" value="X" onclick=""/></td>
					    </tr>
					    <tr class="table-success">
					    	<th scope="row">18</th>
					      	<td>편두통</td>
					      	<td>2020-11-07</td>
					      	<td><input type="button" id="delete" value="X" onclick=""/></td>
					    </tr>
						<tr>
					    	<th scope="row">17</th>
					      	<td>어깨 통증</td>
					      	<td>2020-10-30</td>
					      	<td><input type="button" id="delete" value="X" onclick=""/></td>
					    </tr>
				    </tbody>
				</table>
        	</div>
		</div>
	</div>
</body>
</html>