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
.div_page_title {
	width: 70%;
	margin: 0 auto;
	margin-top: 10px;
}

.page_title {
	color: #5a5a5a;
	font-weight: bold;
	font-size: x-large;
	margin-left: 10px;
}

.div_page_title>hr {
	background-color: #5a5a5a;
	border: 0;
	height: 2px;
}

.aboutUs {
	
	width: 70%;
	margin: 0 auto;
	height: 90%;
	background-color: white;
	opacity: 0.8;
}

.l_about {
	width: 40%;
	/* border : 1px solid blue; */
	height: 100%;
	position: relative;
	float: left;
	border-right: 1px solid #cdcdcd;
}

.r_about {
	width: 60%;
	/* border : 1px solid blue; */
	height: 100%;
	position: relative;
	float: right;
}

.l_img {
	width: 92%;
	/* border : 1px solid blue; */
	height: 95%;
	position: relative;
	top: 50%;
	transform: translate(0, -50%);
	margin: 0 auto;
}

.r_intro {
	width: 95%;
	/* border : 1px solid blue; */
	height: 95%;
	position: relative;
	top: 50%;
	transform: translate(0, -50%);
	/* background-color: #64ac7d; */
	background-color: rgba(100, 172, 125, 0.5);
	/* opacity: 0.5; */
	margin: 0 auto;
	padding : 10px;
}

.r_txt {
	font-weight: bold;
	color: #333333;
	font-size: small;
	margin : 0;
}

.r_txt_title{
	color : black;
	font-size: 15px;
	font-weight: 900;
	margin : 0;
}
.r_txt_nm{
	color : black;
	font-size: 14px;
	font-weight: 800;
	margin : 0;
}

.l_t_img {
	border: 1px solid #cdcdcd;
	float: left;
	width: 50%;
	height: 50%;
}

.r_t_img {
	border: 1px solid #cdcdcd;
	float: right;
	width: 50%;
	height: 50%;
}

.l_b_img {
	border: 1px solid #cdcdcd;
	width: 50%; 
	height : 50%; 
	position : absolute; 
	clear : left; 
	float :	left; 
	bottom : 0;
	left: 0;
	height: 50%;
	position: absolute;
	clear: left;
	float: left;
	bottom: 0;
}

.r_b_img {
	border: 1px solid #cdcdcd;
	width: 50%;
	height: 50%;
	position: absolute;
	clear: right;
	float: right;
	bottom: 0;
	right: 0;
}

img {
	width: 100%;
	height: 100%;
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
						<div class="l_t_img">
							<img alt="" src="/img/aboutUs/doryang.png" >
						</div>
						<div class="r_t_img">
							<img alt="" src="/img/aboutUs/jieun.JPG" >
						</div>
						<div class="l_b_img">
							<img alt="" src="/img/aboutUs/seungwan.jpg" >
						</div>
						<div class="r_b_img">
							<img alt="" src="/img/aboutUs/minjong.png" >
						</div>
						
					</div>

				</div>
				<div class="r_about">
					<div class="r_intro">
							<p class="r_txt_title">
							[소개]
							</p>
							<p class="r_txt">
							Medinote에 오신 것을 환영합니다! <br/>
							Medinote는 강도량, 김지은, 박승완, 변민종  4명의 개발자가 함께 만들었습니다. <br/>
							10월 20일에 처음 기획을 하여 11월 중순 부터 시작된  Medinote 프로젝트는 12월에 성공적으로 마무리 되었습니다. <br/>
							Medinote는 우리가 아픈 증상이 있을 때 질병과 병원을 찾는데 도움이 되는 웹 사이트가 되었으면 합니다.  <br/>
							 <br/>
							 </p>
							 <p class="r_txt_title">[기획 의도]</p>
							<p class="r_txt">
							 갑자기 몸 상태가 좋지 않으면 병원을 찾아가봐야 하는데 내가 느끼는 증상들을 진료해주는 병원이 어디인지 모를때가 있었습니다.<br/>
							 그래서 지금 나의 증상들로 대략적인 병명의 예측이나 진료과를 알려주는 사이트가 있으면 좋지않을까? 하여 Medinote 프로젝트를 기획하고 만들게 되었습니다.
							 <br/> <br/>
							 <p class="r_txt_title">[개발 소감]</p>
							 <p class="r_txt">
							 <p class="r_txt_nm">강도량 </p>
							  <p class="r_txt"><br/><br/></p>
							 <p class="r_txt_nm">김지은</p>
							 <p class="r_txt">
								생각 한 것을 기획하고, 기획 한 것을 개발하여 웹 사이트를 완성하기까지 쉽지 않은 과정이었지만 프로그램을 개발하는 모든 과정에 참여 할 수 있었던 소중한 경험이었다.
							         앞으로 개발 경험을 많이 쌓아서 다른 사람들에게 도움이 되는 프로그램을 만들고 싶다는 소망도 생겼다.
							<br/><br/></p>
							 <p class="r_txt_nm">박승완</p>
							 <p class="r_txt">
							 ‘일단 시작해라’ 라는 말이 떠오른다. 막막하고 안 될거만 같던 생각과 계획들이 갖은 오류속에서도 조금씩 완성되어가는 모습에 코딩의 매력을 다시 한 번 느꼈다.
오류 메세지는 이제 나에게 있어 이정표이며 성장의 밑거름이다.<br/><br/>
							</p>
							<p class="r_txt_nm">변민종</p>
							 <p class="r_txt">
							코딩을 배우고 첫 팀프로젝트였다. 프로젝트의 기획부터 문서화, 개발까지 하나의 결과를 만들어냈다는 것이 뿌듯하다. 
개발과정에서 원하는 기능들을 구현하는 것에 어려움을 겪기도 했지만 그런 기능들을 구현했을 때에는 성취감 또한 크게 다가왔다.
그리고 무엇보다 혼자라면 힘들었을텐데 팀원들과 함께 할 수 있어서 잘 해낼 수 있었다고 생각한다.<br/>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>