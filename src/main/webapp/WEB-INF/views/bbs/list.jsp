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
	<link type="text/css" rel="stylesheet" href="css/layout.css"/>
	
    <style type="text/css">

        #table1 {
            width: 100%;
            margin-left: auto;
            margin-right: auto;
            /* background-color: rgba( 255, 255, 255, 1 ); */
        }

        tfoot .pagination {
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
        
	    .div_page_title{
			width:1200px;
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
        
    </style>

</head>
<body>

	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="div_page_title">
			<p class="page_title">community</p>
			<hr/>
		</div>
		<div class="content">	
			<div style="position:relative; z-index: 4; ">
					
				<div id="search" style="text-align:left; padding: 8px 0 0 5px; margin-bottom: 10px;">
		            <form action="bbsSearch" method="post">
		            	<input type="hidden" id="cPage" name="cPage" value="${param.cPage }"> <!-- 이거 만든 이유는 서치한 페이지에서 목록을 눌렀을 때 현재 페이지로 돌아가기 위해서임 -->
		                <select id="searchType" name="searchType" style="height: 30px;">
		                    <option value="1">제목</option>
		                    <option value="2">내용</option>
		                </select>
		                <input type="text" id="searchValue" name="searchValue" placeholder="검색 내용 입력하시오" />
		                <input type="button" value="검색" onclick="search(this.form)"/>
		            </form>
		        </div>
		
		        <div style="padding: 0 5px 0 5px;">
		            <table class="table table-hover" id="table1">
		                <thead>
		                    <tr class="table-primary">
		                        <th scope="col">번호</th>
		                        <th scope="col">제목</th>
		                        <th scope="col">글쓴이</th>
		                        <th scope="col">증상</th>
		                        <th scope="col">등록일</th>
		                        <th scope="col">조회수</th>
		                    </tr>
		                </thead>
		                
		                
		                <tbody>
		                <c:if test="${ar != null }">
		                	<c:forEach var ="aa" items="${requestScope.ar }" varStatus="st">
		                    <tr class="table-active">
		                        <th scope="row">${rowTotal - st.index -(blockList*(nowPage - 1)) }</th>
		                        <td>
											   <!-- ↱나중에 뒤로가기 or 목록 눌렀을 때 클릭하기 전 페이지로 돌아가기 위해 필요-->
									<a href="view?cPage=${nowPage }&idx=${aa.idx}"> ${aa.title }</a></td>
						                                 <!-- ↳ 클릭한 게시물을 보여주기 위해 필요 -->
		                        <td>${aa.u_nk }</td>   <!-- aa.writer에서 변경함 (현재 writer에 id가 들어가 있으므로) -->
		                        <td>${aa.srch_tag }</td>
		                        
		                        <td>
									<c:if test="${aa.create_dt ne null }">
										${fn:substring(aa.create_dt, 0, 10) }
									</c:if>
								</td>
								<td>${aa.hit }</td>
		                    </tr>
		                	</c:forEach>
		                </c:if>

		    
		                </tbody>
	
			            <tfoot>
			                <tr>
			<!-- 
			                    <td colspan="5">
			                        <ul class="pagination" style="margin-left: 45%;">
			                            <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
			                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
			                            <li class="page-item"><a class="page-link" href="#">2</a></li>
			                            <li class="page-item"><a class="page-link" href="#">3</a></li>
			                            <li class="page-item"><a class="page-link" href="#">4</a></li>
			                            <li class="page-item"><a class="page-link" href="#">5</a></li>
			                            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			                        </ul>
			                    </td>
			                     -->
			                    <td colspan="5">
			                    	${p_code }
			                    </td>
			                    <td style="text-align: right;">
			                        <button type="button" class="btn btn-primary btn-sm" id="write_btn">글쓰기</button>
			                    </td>
			                </tr>
			
			            </tfoot>
			        </table>
		        
				</div>
				
			</div> <!-- zindex적용해보기 -->

		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script type="text/javascript">

// 사용자가 검색한 태그들을 미리 session에 저장해 놓기
$(function () {
	$.ajax({
		url: "symTag"
	});
});


$(function () {

	$("#write_btn").bind("click", function () {
		var cPage = $("#cPage").val();
		
		$.ajax({
			url: "symTag"
		});
		
		$.ajax({
			url: "write",
			dataType:"JSON"
			
		}).done(function(data) {
			//console.log(data.chk);
		 	if (data.chk == "0") {
				alert("로그인 하셔야 합니다.");
				location.href="login";
			}else if (data.chk =="1") {
				location.href=data.url+"?cPage="+cPage;
			}
		
		});
		
	});
});




function search(f){
	var vvv = f.searchValue;
//아무것도 없는경우<┐          ┌>공백을 입력했을 경우
	if(!vvv.value || vvv.value.trim().length == 0){
		alert("머하니 검색할 단어를 넣어야지!~");
		
		vvv.value="";
		vvv.focus();
		
		return;
	}
	f.submit();
}

</script>


</body>
</html>