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
				<h3>마이 노트</h3>
			</div>
		</div>
	</div>

</body>
</html>