<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btn-primary{
		border : 1px solid #efefef;
		width : 100%;
		height : 8%;
		font-size :20px;
	}
</style>
</head>
<body>
	<button type="button" class="btn btn-primary" onclick="myPage()">최근 검색 내역</button><br/>
	<button type="button" class="btn btn-primary" onclick="infoEdit()">내 정보 수정</button><br/>
	<button type="button" class="btn btn-primary" onclick="myNote()">내 메디노트</button><br/>
	<button type="button" class="btn btn-primary" onclick="myComm()">내가 작성한 글</button>
<script>
	function myPage(){
		location.href="/myPage";
	}
	function infoEdit(){
		location.href="/infoEdit";
	}
	function myNote(){
		location.href="/myNote";
	}
	function myComm(){
		location.href="/myComm";
	}
</script>
</body>
</html>