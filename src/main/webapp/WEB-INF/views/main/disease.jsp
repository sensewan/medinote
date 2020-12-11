<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediNote</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<style>

	.disTab{
		margin: 0px auto;
		width: 100%;
		height: 700px;
		overflow: auto;
	}
	
	#table1 {
            width: 100%;
            margin-left: auto;
            margin-right: auto;
            /* background-color: rgba( 255, 255, 255, 1 ); */
        }
       
    .text-muted{
    	display: inline-block;
    	position: relative;
    	text-align: right;
    	margin-top:5px;
     }   

</style>
</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content_wrap">
			<div class="content">
					<p class="text-muted">“진료과를 선택하면 내 주변에서 해당 진료과를 진료하는 병원을 지도에 나타내줍니다.” </p>
				<div class="disTab">
					<table class="table table-hover" id="table1">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="50%">
					</colgroup>
					<thead>
						<tr class="table-primary">
							<th scope="col">번호</th>
							<th scope="col">병명</th>
							<th scope="col">진료과</th>
						</tr>
					</thead>
					
					<c:forEach var="vo" items="${hvo }" varStatus="g">
						<tr>
							<td>${g.count }</td>
							<td>${vo.d_nm }</td>
							<td>
							<c:set var="dept" value="${fn:split(vo.m_nm,',') }"></c:set>
							<c:forEach var="m_nm" items="${dept}" varStatus="a">
								<c:if test="${a.count != 1 }">,&nbsp;</c:if>
								<a href="#">
								${m_nm }
								</a>
							</c:forEach>
							</td>
						</tr>
					</c:forEach>
						
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>