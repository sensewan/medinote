<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediNote</title>
    
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
	
	td, th {
		border: 1px solid black;
		border-left: hidden;
		border-right: hidden;
	}
	
	#counter {
		position: absolute;
		bottom: 52px;
		right: 8px;
		background: rgba(42, 229, 148, 0.5);
		border-radius: 0.5em;
		padding: 0 .5em 0 .5em;
		font-size: 0.75em;
	}
	
	.div_page_title {
		width: 1200px;
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
</style>

</head>

<body>
	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="div_page_title">
			<p class="page_title">글 상세 보기</p>
			<hr/>
		</div>
		<div class="content" style="padding-top: 5px;">
			<form method="post" name="frm">
			
				<!-- ↱ action을 통해 이동할 때 값을 갖고 가기 위해 만듦 -->
				<input type="hidden" name="cPage" value="${param.cPage }">
				                                     <!-- ↳ list.jsp에서 파라미터로 cPage 넘김 -> BbsController에서 받음 -> 
				                                            mv.setViewName("bbs/view")을 통해 포워드 방식으로 여기로 이동함. 
				                                            그러므로 여기에서도 파라미터 사용가능 -->

			
		
		        <div style="border: 1px solid black; border-radius: 5px; padding: 10px; width: 800px; margin: auto; margin-bottom: 5px;  text-align: left; background-color: rgba( 255, 255, 255, 1 );">
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
			
			
		        <div style="width: 800px; margin: auto; position:relative;">
		            comment<br/>
		            <form name="comm_write" id="comm_write">
		            	<input type="hidden" name="p_no" value="${vo.idx }">
		            	<input type="hidden" name="writer" value="${sessionScope.mvo.u_id }">
		            	
		            	<!-- <input type="text" name="content" id="content" placeholder="댓글 입력하시오" style="width: 800px;" > -->
		            	<textarea rows="2" cols="96" name="content" id="content" placeholder="댓글을 입력하세요"></textarea>
		            		<span id="counter">0/300</span>
		            	<input type="button" id="writeComm" class="btn btn-primary" style="margin: 3px 0 3px 93%;" value="등록">
		            </form>
		        </div>
		
		        <p style="width: 800px; margin: auto;">댓글목록</p>
		        
		        <c:if test="${!empty vo.c_list }">
        			<table style="margin: auto; width: 66%;">
        				<tbody>
				        	<c:forEach var="cvo" items="${vo.c_list }" varStatus="st">
				        		<c:set var="wr" value="${sessionScope.mvo.u_id }" /> <!-- cf.vo.writer하면 작성글의 작성자 닉네임 -->
				        		<c:set var="wr2" value="${cvo.writer }" /> <!-- 댓글 작성자의 id랑 비교됨 (writer에 id가 들어가 있으므로) -->
				        		<c:set var="commIdx" value="${cvo.idx }"/>
				        					<tr>
				        						<th>${st.index+1}</th>
				        						<td>이름: ${cvo.u_nk }</td>
				        						<td>날짜: ${fn:substring(cvo.create_dt, 0, 19) }</td>
				        					</tr>
				        					<tr style="border-top:hidden;">
				        						<td colspan="3" style="text-align: left;"><p style="position: absolute; z-index: 1;">내용:</p> 
				        							<textarea id="aa" name="${commIdx }" disabled="disabled" rows="2" cols="90" style="opacity: 0.7; margin-left: 5%; position: relative; z-index: 2;">${cvo.content }</textarea>
				        						</td>
				        					</tr>
				        					<c:if test="${wr eq wr2 }">
					        					<tr style="border-top:hidden;">
					        						<td colspan="3">
					        							<input name="${commIdx }" type="hidden" onclick="editOK(${commIdx})" value="저장">
					        							<input name="${commIdx }" type="hidden" onclick="exitComm(${commIdx})" value="취소">
														<input id = "c_btn1" name="c1_btn${commIdx }" type="button" onclick="editComm(${commIdx})" value="수정">
											            <input id = "c_btn2" name="c2_btn${commIdx }" type="button" onclick="delComm(${commIdx})" value="삭제">
											                                                                                         <!-- ↳ 현재 댓글 칸의 idx 값을 넘겨 준다!! -->
					        						</td>
					        					</tr>
											</c:if>
				        			<%-- 
				        			<div style="z-index: 1; width: 800px; margin: 5px auto 5px auto; border: 1px solid darkgrey; border-radius: 5px; width: 800px; height: auto; text-align: left; background-color: rgba( 255, 255, 255, 1 );">
										번호: ${st.index+1}&nbsp;
										이름: ${cvo.writer }
										날짜: ${fn:substring(cvo.create_dt, 0, 19) }<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용: 
										<textarea rows="2" cols="90" style="opacity: 0.7">${cvo.content }</textarea>
										<c:if test="${wr eq wr2 }">
											<div style="">
												<input id = "c_btn1" type="button" value="수정">
									            <input id = "c_btn2" type="button" onclick="delComm(${commIdx})" value="삭제">
									                                                               <!-- ↳ 현재 댓글 칸의 idx 값을 넘겨 준다!! -->
											</div>
										</c:if>
						    	    </div>
						    	     --%>
							</c:forEach>
        				</tbody>
	       			</table>
	
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
		var cf = confirm("글을 삭제하시겠습니까?");
		
		var idx = ${vo.idx};
		
		if (cf) {
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
		
		
	}

	
	$(function () {
		
		$("#writeComm").bind("click", function() {
			if(document.comm_write.content.value == ""){
				alert("댓글 내용을 입력해주세요");
				document.comm_write.content.focus();
				return;
			}
			
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
	
	$(function() {
	      $('#content').keyup(function (e){
	          var content = $(this).val();
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter').html(content.length + '/300');
	          
	          if (content.length > 300) {
				alert("댓글은 최대 300자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 300));
				$('#counter').html("300 / 300");
			}
	      });
	     
	});
	
	
	function delComm(c_idx) {
		var cf = confirm("댓글을 삭제하시겠습니까?");
		
		var idx = c_idx;
		
		if (cf) {
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
	}
	
	function editComm(c_idx) {
		var idx= c_idx;
		
		$("textarea[name="+idx+"]").removeAttr("disabled");
		$("textarea[name="+idx+"]").focus();
		$("input[name="+idx+"]").attr("type", "button");
		
		$("input[name="+"c1_btn"+idx+"]").attr("type", "hidden");
		$("input[name="+"c2_btn"+idx+"]").attr("type", "hidden");
	}
	
	
	
	function exitComm(c_idx) {
		var idx= c_idx;
		
		$("textarea[name="+idx+"]").attr("disabled", "disabled");
		$("textarea[name="+idx+"]").focus();
		$("input[name="+idx+"]").attr("type", "hidden");
		
		$("input[name="+"c1_btn"+idx+"]").attr("type", "button");
		$("input[name="+"c2_btn"+idx+"]").attr("type", "button");
	}
	
	function editOK(c_idx) {
		var idx = c_idx;
		var content = $("textarea[name="+idx+"]").val();
		
		var allData = {"idx":idx, "content":content};
		
		$.ajax({
			url: "editComm",
			type: "post",
			data: allData,
			dataType: "JSON"
			
		}).done(function(data) {
			if (data.res == 0) {
				location.reload();
			}else {
				alert(data.res);
			}
		});
	}
	

</script>

</body>
</html>