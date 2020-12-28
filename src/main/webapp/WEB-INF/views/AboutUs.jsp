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

	.div_page_title{
		width:70%;
		margin: 0 auto;
		margin-top : 10px;
		
	}
	
	.page_title{
		color: #5a5a5a;
    	font-weight: bold;
    	font-size: x-large;
    	margin-left : 10px;
	}
	
	.div_page_title > hr{
		background-color: #5a5a5a;
	    border: 0;
	    height: 2px;
	}


	.aboutUs{
		/* border : 1px solid blue; */
		width: 70%;
		margin: 0 auto;
		height: 90%;
		background-color: white;
		opacity: 0.8;
	}
	

	.l_about{
		width: 40%;
		/* border : 1px solid blue; */
		height: 100%;
		position: relative;
		float: left;
		border-right: 1px solid #cdcdcd;
	}
	.r_about{
		width: 60%;
		/* border : 1px solid blue; */
		height: 100%;
		position: relative;
		float: right;
		
	}
	
	
	
	.l_img{
		width: 92%;
		/* border : 1px solid blue; */
		height: 95%;
		position: relative;
		top:50%;
		transform:translate(0, -50%);
		margin: 0 auto;
	}
	
	.r_intro{
		width: 95%;
		/* border : 1px solid blue; */
		height: 95%;
		position: relative;
		top:50%;
		transform:translate(0, -50%);
		/* background-color: #64ac7d; */
		background-color : rgba(100,	172, 125, 0.5);
		/* opacity: 0.5; */
		margin: 0 auto;
	}
	
	.r_txt{
		padding : 10px;
		font-weight: bold;
    	color: 	#333333;

	}
	
	
	
</style>
</head>
<body>
	<div class="wrap">
		<%@include file="header.jsp"%>
		<div class="content_wrap">
			<div class="div_page_title">
				<p class="page_title">About Us</p>
				<hr />
			</div>
			<div class="aboutUs">
				<div class="l_about">
					<div class="l_img">
						<img alt="" src="/img/all.jpeg" style="width: 100%; height: 100%">
					</div>

				</div>
				<div class="r_about">

					<div class="r_intro">
						<p class="r_txt">안녕하세요</p>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>