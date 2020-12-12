<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--외부 css파일 연결 -->
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
</head>
<body>
	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="content">
			<div class="content_side" >
				<%@ include file="sideBar.jsp"%>
			</div>
			<div class="content_center">
				<div class="search_box">
					<select id="" name="" class="">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="date">작성일</option>
					</select>
					<input type="text" id="" name="" placeholder="검색하실 제목/내용/작성일을 입력해주세요"/>
					<button type="button" class="btn btn-primary" style="height: 28px, margin-bottom: 5px, text-height: 100%">검색</button>
				</div>
				<div>
					<table class="table table-hover">
						<thead>
					    	<tr>
					      		<th scope="col">번호</th>
					      		<th scope="col">제목</th>
					      		<th scope="col">증상</th>
					      		<th scope="col">작성일자</th>
					    	</tr>
					  	</thead>
					    <tbody>
						    <c:if test="">
								<tr>
							    	<th scope="row">19</th>
							      	<td>복통이 심한 날</td>
							      	<td>왼쪽 아랫배 통증, 오른쪽 아랫배 통증</td>
							      	<td>2020-10-28</td>
							    </tr>
						    </c:if>
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