<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediNote</title>
<!--외부 css파일 연결 -->
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<style>
	.search_content{
		width : 37%;
	}
</style>
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="content">
			<div class="content_side" >
				<%@ include file="sideBar.jsp"%>
			</div>
			<div class="content_center">
				<h3>내가 작성한 글</h3>
      			<div style="padding: 0 5px 0 5px;">
					<select class="search_type">
						<option value="title">제목</option>
						<option value="content">증상</option>
						<option value="date">작성일</option>
					</select>
					<input type="text" class="search_content" name="search_content" placeholder="검색하실 제목/증상/작성일을 입력해주세요."/>
					<button type="button">검색</button>
				</div>
				<div>
					<table class="table table-hover">
						<thead>
					    	<tr class="table-primary">
					      		<th scope="col">번호</th>
					      		<th scope="col">제목</th>
					      		<th scope="col">증상</th>
					      		<th scope="col">작성일자</th>
					    	</tr>
					  	</thead>
					    <tbody>
								<tr class="table-active">
							    	<th scope="row">19</th>
							      	<td>복통이 심한 날</td>
							      	<td>왼쪽 아랫배 통증, 오른쪽 아랫배 통증</td>
							      	<td>2020-10-28</td>
							    </tr>
						
					    </tbody>
					</table>	
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script>
	
	</script>

</body>
</html>