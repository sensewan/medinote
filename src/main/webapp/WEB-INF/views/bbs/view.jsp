<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		
		        <div style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 800px; margin: auto; margin-bottom: 5px; text-align: left; background-color: rgba( 255, 255, 255, 1 );">
		            ${vo.title }
		        </div>
		
		        <div class="thumbnail" style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 
		        800px; height: 400px; margin: auto; margin-bottom: 5px; text-align: left; background-color: rgba( 255, 255, 255, 1 );">
		        	
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
		
			</form>
			
			
		        <div style="width: 800px; margin: auto;">
		            comment<br/>
		            <form name="comm_write" id="comm_write">
		            	<input type="hidden" name="p_no" value="${vo.idx }">
		            	<input type="hidden" name="writer" value="${sessionScope.mvo.u_nk }">
		            	
		            	<!-- <input type="text" name="content" id="content" placeholder="댓글 입력하시오" style="width: 800px;" > -->
		            	<textarea rows="2" cols="96" name="content" id="content" placeholder="댓글을 입력하세요"></textarea>
		            	<input type="button" id="writeComm" class="btn btn-primary" style="margin: 3px 0 3px 93%;" value="등록">
		            </form>
		        </div>
		
		        <p style="width: 800px; margin: auto;">댓글목록</p>
		        
		        <c:if test="${!empty vo.c_list }">
		        	<c:forEach var="cvo" items="${vo.c_list }" varStatus="st">
		        		<c:set var="wr" value="${sessionScope.mvo.u_nk }" /> <!-- cf.vo.writer하면 작성글의 작성자 닉네임 -->
		        		<c:set var="wr2" value="${cvo.writer }" /> <!-- 댓글 작성자의 닉네임 -->
		        		<c:set var="commIdx" value="${cvo.idx }"/>
		        			<div style="z-index: 1; width: 800px; margin: 5px auto 5px auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto; text-align: left; background-color: rgba( 255, 255, 255, 1 );">
								번호: ${st.index+1}&nbsp;
								이름: ${cvo.writer } &nbsp;&nbsp;
								날짜: ${fn:substring(cvo.create_dt, 0, 19) }<br/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용: ${cvo.content }
								<c:if test="${wr eq wr2 }">
									<div style="">
										<input id = "c_btn1" type="button" value="수정">
							            <input id = "c_btn2" type="button" onclick="delComm(${commIdx})" value="삭제">
							                                                               <!-- ↳ 현재 댓글 칸의 idx 값을 넘겨 준다!! -->
									</div>
								</c:if>
				    	    </div>
				    	    
					</c:forEach>
	
		        </c:if>
		        
		        <c:if test="${empty vo.c_list}">
		        	<div style="width: 800px; margin: auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto; text-align: left;">
		        		무플상태
		        	</div>
		        </c:if>
		        
		        
			
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

	
	$(function () {
		
		$("#writeComm").bind("click", function() {
			var commform = $("#comm_write").serialize(); // id가 comm_write인 form의 요소들의 값을 넣어 준다.
			
			$.ajax({
				url: "comm",
				type: "post",
				data: commform,
				dataType: "JSON",
			}).done(function(data) {
				if (data.res == 0) {
					location.reload();
				}else {
					alert(data.res);
				}
			});
		});
		
	});
	
	function delComm(c_idx) {
		var idx = c_idx;
		
		$.ajax({
			url: "dellComm",
			type: "get",
			data: "idx="+encodeURIComponent(idx),
			dataType: "JSON"
		}).done(function(data) {
			if(data.res == 0){
				location.reload();
			}else {
				alert(data.res);
			}
		});
	}
	
	

</script>

</body>
</html>