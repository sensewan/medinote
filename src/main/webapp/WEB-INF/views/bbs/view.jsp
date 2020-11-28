<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view</title>
    
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="css/layout.css"/>

    <style type="text/css">
		#c_btn1 {
			margin-left: 88%;
		}
		
		.thumbnail {
			position: relative;
			padding-top: 100%; /* 1:1 ratio */
			overflow: auto;
		}
		
		img {
			position: relative;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			max-width: 80%;
			height: auto;
		}
</style>

</head>

<body>
	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="content">
			<form method="post" name="frm">
			
				<!-- ↱ action을 통해 이동할 때 값을 갖고 가기 위해 만듦 -->
				<input type="hidden" name="cPage" value="${param.cPage }">
				                                     <!-- ↳ list.jsp에서 파라미터로 cPage 넘김 -> BbsController에서 받음 -> 
				                                            mv.setViewName("bbs/view")을 통해 포워드 방식으로 여기로 이동함. 
				                                            그러므로 여기에서도 파라미터 사용가능 -->

			
		        <h3 style="">글 상세 보기</h3>
		
		        <div style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 800px; margin: auto; margin-bottom: 5px; text-align: left;">
		            ${vo.title }
		        </div>
		
		        <div class="thumbnail" style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 
		        800px; height: 400px; margin: auto; margin-bottom: 5px; text-align: left;">
		        	
		        	${vo.content }
		        	
		        </div>
		
		        <div style="border: 1px solid black; background-color:rgb(220, 220, 219); border-radius: 5px; padding: 10px; width: 800px; height: 40px; margin: auto; text-align: left;">
		            ${vo.srch_tag }
		        </div>
		        <div style="margin-left:53%; padding: 3px;">
					<input type="button" class="btn btn-primary" value="수정" onclick="editBbs()"/>
					<input type="button" class="btn btn-primary" value="삭제" onclick="delBbs()"/>
		            <input type="button" class="btn btn-primary" value="목록" onclick="goBack()"/>
		        </div>
		
		        <div style="width: 800px; margin: auto;">
		            comment<br/>
		            <input type="text" placeholder="댓글 입력하시오" style="width: 800px;">
		            <button type="submit" class="btn btn-primary" onclick="" style="margin: 3px 0 3px 93%;">등록</button>
		        </div>
		
		        <p style="width: 800px; margin: auto;">댓글목록</p>
		        <div style="width: 800px; margin: auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto; text-align: left;">
		            1.댓글임
		        </div>
		        <div style="width: 800px; margin: auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto; text-align: left;">
		            2.글 작성자의 댓글임<br/>
		            <input id = "c_btn1" type="button" value="수정">
		            <input id = "c_btn2" type="button" value="삭제">
		        </div>
			</form>
			
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">
	function goBack() {
	    // ↱ ViewController에서 받은 인자 사용가능 -> 왜냐면 기본적으로 포워드로 이동한 것이므로 가능함
		location.href="bbs?cPage=${param.cPage}";
	}
	
	function editBbs() {
		
		document.frm.action ="edit";   // cf. sendRedirect임

		document.frm.submit();
		
	}
	
	function delBbs() {
		var idx = ${vo.idx};
		
		$.ajax({
			url: "dell",
			type: "get",
			data: "idx="+encodeURIComponent(idx),
			dataType: "JSON"
		}).done(function(data) {
			alert(data.res);
			location.href=data.url+"?cPage=${param.cPage}";
		});
		
	}
	

</script>

</body>
</html>