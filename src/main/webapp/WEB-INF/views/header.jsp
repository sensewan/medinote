<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header_wrap" id="myHeader">

	<div class="header">
    
		<a href="/"><h1>logo</h1></a>

		<ul class="menu">
			<li><a href="/">Home</a></li>
			<li><a href="#">About us</a></li>
			<li><a href="#">Community</a></li>
			<li><a href="#">My page</a></li>
		</ul>
		<ul class="login">
			<c:if test="${sessionScope.loginId eq null}">
				<li><a href="/login">login</a></li>
			</c:if>
			<c:if test="${sessionScope.loginId ne null}">
				<li><a href="/logout">logout</a></li>
			</c:if>
		</ul>
	</div>
</div>

