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
						    <c:if test="${ar ne null }">
						    	<c:forEach var="aa" items="${requestScope.ar}" varStatus="st">
									<tr class="table-active">
								    	<th scope="row">${st.index+1 }</th>
								      	<td>
								      		<a href="../bbs/view?idx=${aa.idx}">${aa.title }</a>
								      	</td>
								      	<td>${aa.srch_tag }</td>
								      	<td>${fn:substring(aa.creat_dt, 0, 10 }</td>
								    </tr>
						    	</c:forEach>							
						    </c:if>
					    </tbody>
					    <tfoot>
					    	<tr>
					    		<td colspan="4" style="text-align: right;">
					    			<button type="button" class="btn btn-primary btn-sm" onclick="goBack()" style="text-align: center;">뒤로</button>
					    		</td>
					    	</tr>
					    </tfoot>
					</table>	
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script>
		function goBack(){
			location.href="myComm";
		}
	</script>

</body>
</html>