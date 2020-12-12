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
<style>
	.infoEdit_ok{
		position : relative;
		display : inline-block;
		width : 75%;
		padding : 0 15px;
		margin-left: 15px;
	}
	#chk_box{
		width: 28px;
		height: 28px;
	}
	#lastrow{
		text-align : right;		
	}
	.s_td{
		padding-left : 20px;
	}
	.dob{
		width: 100px;
		text-align : center;
	}
	tr{
		padding : 10px 20px;
		height: 35px;
	}
	tr>td:first-child{
		text-align: right;
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
				<div class="infoEdit_ok">
					<table class="info_t">
						<tr class="infoEdit_box">
							<td>아이디</td>
							<td class="s_td"><input type="text" placeholder="${sessionScope.loginId }"/></td>
						</tr>
						<tr class="infoEdit_box">
							<td>비밀번호</td>
							<td class="s_td"><input type="password"/></td>
						</tr>
						<tr class="infoEdit_box">
							<td>비밀번호 확인</td>
							<td class="s_td"><input type="password"/></td>
						</tr>
						<tr class="infoEdit_box">
							<td>이름 </td>
							<td class="s_td"><input type="text"/></td>
						</tr>
						<tr class="infoEdit_box">
							<td>생년월일</td>
							<td class="s_td">
								<input type="text" placeholder="년(4자리)" class="dob"/>-
								<select id="b_year" name="b_year" class="dob">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>		
								-
								<input type="text" placeholder="일" class="dob"/>
							</td>
						</tr>
						<tr class="infoEdit_box">
							<td>전화번호 </td>
							<td class="s_td"><input type="text"/>-<input type="text"/>-<input type="text"/></td>
						</tr>
						<tr class="infoEdit_box">
							<td>검색내역 저장 </td>
							<td class="s_td">
								<input type="checkbox" id="chk_box"/>
		      				</td>      				
						</tr>
						<tr>
							<td colspan="2" id="lastrow" class="s_td">
								<button type="button" class="btn btn-primary" onclick="info_edit()">수정</button>
								<button type="button" class="btn btn-primary" onclick="go_back()">취소</button>
							</td>
						</tr>
					</table>
				
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<script>
		//수정버튼 클릭시, 입력된 정보들로 회원정보를 update해야 한다.
		function info_edit(){
			
		}	
		
		//취소버튼 클릭시 비밀번호 확인 페이지로 돌아간다.
		function go_back(){
			location.href="infoEdit_ok";
		}
	</script>
</body>
</html>