<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bbs write</title>
    <link rel="stylesheet" href="css/summernote-lite.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

    <style type="text/css">

        #wrap {
            width: 100%;
            height: 100%;
            margin: auto;
        }

    </style>


</head>

<body>

<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content">
			<div class="content_side"></div>
			<div class="content_center">
			
			
			    <h3 style="margin-left: 10%; margin-top: 20px;">글쓰기</h3>
			    <hr>
			    <form style="width: 80%; margin: auto;">
			        <div style="margin-left: 20px;">
			            <input type="text" name="" placeholder="제목" style="width: 70%;"><br/>
			            <textarea rows="12" cols="83" id="content" name="content" placeholder="내용" style="margin-top: 10px;"></textarea>
			        </div>
			        <div style="margin-left: 20px;">
			            <select class="custom-select" style="width: 70%;">
			                <option selected="">증상</option>
			                <option value="1">어깨 통증</option>
			                <option value="2">왼쪽 아랫배 통증</option>
			                <option value="3">오른쪽 머리 두통</option>
			            </select>
			        </div>
			        <div style="margin-left: 51%; padding: 5px;" >
			            <button type="submit" class="btn btn-primary" onclick="">등록</button>
			            <button type="submit" class="btn btn-primary" onclick="">취소</button>
			        </div>
			    </form>
			
			</div>
		</div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<script src="css/js/summernote-lite.min.js"></script>
<script src="css/js/lang/summernote-ko-KR.js"></script>


<script>
    // ┌>섬머노트 적용
    $(function() {
        // id가 content인 태그에 edit 적용<┐  ┌>옵션 넣어주면 된다.
        $('#content').summernote({
            // ┌> 화면 예시..
            placeholder:"적당히 쓰거라",
            height : 300,
            maxHeight : 600, //최대크기지정
            minHeight : 200,
            tabSize : 10,
            width : 800,
            focus : true,
            lang : "ko-KR",

            // ┌>어떤 사건에 의해서 자동으로 호출되는 함수임 (이미지가 들어올때 수행되게 만들기)
            callbacks : {
                //┌> 게시판 내용에 이미지가 추가될 때마다 수행됨 (이미지를 여러개 첨부할 수 있으므로 배열로 인식)
                onImageUpload : function(files, editor) {
                    // ┌> 배열이므로 for문으로 보내기
                    for (var i = 0; i < files.length; i++) {
                        sendFile(files[i], editor);
                    }
                }
            }
        });
        //┌> lineHeight (줄간격) 을 적용할면 이렇게 한 번 더 적어줘야함(왜그런지는 몰라) 
        $('#content').summernote("lineHeight", 0.7);
    });

</script>

</body>

</html>
