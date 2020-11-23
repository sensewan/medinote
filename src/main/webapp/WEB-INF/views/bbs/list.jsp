<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community 게시판</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

    <style type="text/css">


        #table1 {
            width: 100%;
            margin-left: auto;
            margin-right: auto;

        }


        tfoot .pagination {
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

</head>
<body>

	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content">
			<div class="content_side"></div>
			<div class="content_center">
			
				<div id="search" style="width: 80%; margin: auto; margin-bottom: 10px;">
		            <form>
		                <select name="tag" style="height: 30px;">
		                    <option value="1">제목</option>
		                    <option value="2">내용</option>
		                </select>
		                <input type="text" placeholder="검색 내용 입력하시오" />
		                <input type="button" value="검색"/>
		            </form>
		        </div>
		
		        <div style="border: 1px solid black; width: 80%; margin: auto;">
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
			
			                    <td colspan="3">
			                        <ul class="pagination" style="margin-left: 65%;">
			                            <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
			                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
			                            <li class="page-item"><a class="page-link" href="#">2</a></li>
			                            <li class="page-item"><a class="page-link" href="#">3</a></li>
			                            <li class="page-item"><a class="page-link" href="#">4</a></li>
			                            <li class="page-item"><a class="page-link" href="#">5</a></li>
			                            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			                        </ul>
			                    </td>
			                    <td style="text-align: right;">
			                        <button type="button" class="btn btn-primary btn-sm">글쓰기</button>
			                    </td>
			                </tr>
			
			            </tfoot>
			        </table>
		        
				</div>
			</div>
		</div>
	</div>

</body>
</html>