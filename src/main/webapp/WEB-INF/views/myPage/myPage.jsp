<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediNote</title>
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
				<h3>최근 검색 내역</h3>
				<div style="padding: 0 5px 0 5px;">
					<table class="table table-hover" id="table1">
						<thead>
							<tr class="table-primary">
			                	<th scope="col">번호</th>
			                    <th scope="col">태그</th>
			                    <th scope="col">검색일자</th>
			                    <th scope="col">삭제</th>
			                 </tr>
						</thead>
						<tbody>

								<tr class="table-active">
							    	<th scope="row">20</th>
							      	<td>설사</td>
							      	<td>2020-11-13</td>
							      	<td><input type="button" id="delete" value="X" onclick=""/></td>
							    </tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>