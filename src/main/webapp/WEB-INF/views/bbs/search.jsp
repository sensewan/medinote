<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색 결과</title>
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
    </style>

</head>
<body>

	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="content">	
			<div style="position:relative; z-index: 4; ">
					
		
		        <div style="padding: 7px 5px 0 5px;">
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
		                        <th scope="row">${st.index+1}</th>
		                        <td>
									<a href="view?idx=${aa.idx}"> ${aa.title }</a></td>
						                               <!-- ↳ 클릭한 게시물을 보여주기 위해 필요 -->
		                        <td>${aa.writer }</td>
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

			                    <td colspan="6" style="text-align: right;">
			                        <button type="button" class="btn btn-primary btn-sm" onclick="goList()" style="text-align: right;">목록</button>
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

function goList() {
	                  // ↱ ViewController에서 받은 인자 사용가능 -> 왜냐면 기본적으로 포워드로 이동한 것이므로 가능함
	location.href="bbs?cPage=${param.cPage}";
}
</script>


</body>
</html>