<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community 게시판</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css" />

    <style type="text/css">
        .nav-link {
            font-size: 20px;
            margin-left: 20px;
        }

        .nav-link {
            font-size: 20px;
            margin-left: 20px;
        }

        #wrap {
            width: 100%;
            height: 100%;
            margin: auto;
        }

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

    <div id="wrap" >
		<jsp:include page="../header.jsp" />

        <div id="search" style="width: 80%; margin: auto; margin-top:10px; margin-bottom: 10px; ">
            <form>
                <select name="tag" style="height: 30px;">
                    <option value="1">제목</option>
                    <option value="2">내용</option>
                </select>
                <input type="text" placeholder="검색 내용 입력하시오." />
                <input type="button" value="검색"/>
            </form>
        </div>

		<div style="width: 80%; margin: auto;" >
            <table class="table table-hover" id="table1">
                <thead>
                    <tr class="table-primary">
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">글쓴이</th>
                        <th scope="col">증상</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="table-active">
                        <th scope="row">1</th>
                        <td>어깨 아플때 운동 추천 좀요 [3]</td>
                        <td>헬린이</td>
                        <td>어깨 통증</td>
                    </tr>
    
                    <tr>
                        <th scope="row">2</th>
                        <td>복통 심한날은?!~[1]</td>
                        <td>마루치</td>
                        <td>왼쪽 아랫배 통증, 오른쪽 아랫배 통증</td>
                    </tr>
    
                    <tr class="table-active">
                        <th scope="row">3</th>
                        <td>마음이 아파요[0]</td>
                        <td>중2</td>
                        <td>눈 통증</td>
                    </tr>
    
                    <tr>
                        <th scope="row">4</th>
                        <td>근육통은 좋은가요~?[99]</td>
                        <td>김종국</td>
                        <td>왼쪽 허벅지 통증</td>
                    </tr>
    
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

</body>
</html>