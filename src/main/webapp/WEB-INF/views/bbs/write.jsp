<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbs write</title>

<link type="text/css" rel="stylesheet" href="css/bootstrap.css" />

<link rel="stylesheet" href="css/summernote-lite.min.css"/>


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
</style>
</head>

<body>
	<div id="wrap">

		<jsp:include page="../header.jsp" />

	    <h3 style="margin-left: 10%; margin-top: 20px;">글쓰기</h3>
	    <hr>
	    <form style="width: 80%; margin: auto;">
	        <div style="margin-left: 20px;">
	            <input type="text" name="" placeholder="제목" style="width: 70%; margin-bottom: 7px;"><br/>
	            <textarea rows="12" cols="83" id="content" name="content" style="margin-top: 10px;"></textarea>
	        </div>
	        
	        <div style="margin-left: 20px;">
	            <select class="custom-select" style="width: 70%; margin-top: 7px;">
	                <option selected="">증상</option>
	                <option value="1">어깨 통증</option>
	                <option value="2">왼쪽 아랫배 통증</option>
	                <option value="3">오른쪽 머리 두통</option>
	            </select>
	        </div>
	        
	        <div style="margin-left: 61%; padding: 5px;" >
	            <button type="submit" class="btn btn-primary" onclick="">등록</button>
	            <button type="submit" class="btn btn-primary" onclick="">취소</button>
	        </div>
	    </form>

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
/* 
		function sendFile(file, editor) {
			//console.log(file+"^..^");

			// ┌>saveImage.jsp로 이미지파일 보내는 파라미터 만들기 (cf.form에서는 enc타입 해줘야만 파일 보낼수 있잖어)
			// │  보내는게 문자열이 아니고 파일인 경우! -> form태그에 encType을 지정한 form객체를 만들어야함.
			var frm = new FormData(); // <- = <form enctype="~~~"></form> 이거와 같음

			//          ┌>saveImage.jsp로 보낼 "img"파라미터 등록하기.
			frm.append("img", file); // <-  img=file 이렇게 된거임
			
			// ┌>비동기식 통신하기!!
			$.ajax({
				url : "saveImage.jsp",
				type : "post",
				data : frm,
				// ┌> contentType, processData를 지정해 줘야 일반적인 문자열을 보내는 것이 아닌 -> 파일을 보내는 것이라는 것을 알려줄 수 있다.
				contentType : false,
				processData : false,
				dataType : "json",

			}).done(function(res) { //성공시 (이미지 주소를 content에 넣어주기)
				//console.log(res.img_url);
				// ┌> jQuery로 img 태그 만듦
				//var image = $("<img>").attr("src", res.img_url);  // <-img태그 생성됨
			    //                        └>속성 부여
				// ┌>html id가 content인 내용안에 넣어주기 
				//$("#content").summernote("insertNode", image[0]);
				//                           └>(insertNode를 적으면<textarea rows="12" cols="50" id="content" name="content">!!insertNode!!열로 들어감</textarea>)

				//                            ┌>img 태그를 알아서 만들어서 넣어줌
				$("#content").summernote("editor.insertImage", res.img_url);

			}).fail(function(err) { //실패시
				console.log(err);
			})

		}

		function exe() {
			//제목과 내용이 입력되었는지 유효성 검사..생략

			document.frm.submit();

		} */
	</script>


</body>
</html>