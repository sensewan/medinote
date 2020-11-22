<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
href="/css/layout.css"/>
<style type="text/css">

	#c_btn1{
		margin-left: 88%;
	}

</style>

</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content">
			<div class="content_side"></div>
			<div class="content_center">

		
		        <h3 style="margin: 20px 0 5px 10%;">보기</h3>
		
		        <div style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 800px; margin: auto; margin-bottom: 5px;">
		            제목 적혀 있을거임
		        </div>
		
		        <div style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 800px; height: 400px; margin: auto; margin-bottom: 5px;">
		            내용 적혀 있을거임
		        </div>
		
		        <div style="border: 1px solid black; background-color:rgb(220, 220, 219); border-radius: 5px; padding: 10px; width: 800px; height: 40px; margin: auto;">
		            증상태그
		        </div>
		        <div style="margin-left: 66%; padding: 3px;">
		            <button type="submit" class="btn btn-primary" onclick="">삭제</button>
		            <button type="submit" class="btn btn-primary" onclick="">수정</button>
		            <button type="submit" class="btn btn-primary" onclick="">목록</button>
		        </div>
		
		        <div style="width: 800px; margin: auto;">
		            comment<br/>
		            <input type="text" placeholder="댓글 입력하시오" style="width: 800px;">
		            <button type="submit" class="btn btn-primary" onclick="" style="margin: 3px 0 3px 93%;">등록</button>
		        </div>
		
		        <p style="width: 800px; margin: auto;">댓글목록</p>
		        <div style="width: 800px; margin: auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto;">
		            1.댓글임
		        </div>
		        <div style="width: 800px; margin: auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto;">
		            2.글 작성자의 댓글임<br/>
		            <input id = "c_btn1" type="button" value="수정">
		            <input id = "c_btn2" type="button" value="삭제">
		        </div>
					
					</div>
				</div>
	</div>
</body>
</html>