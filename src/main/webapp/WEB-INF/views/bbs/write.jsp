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
    
    <link type="text/css" rel="stylesheet" href="css/layout.css"/>

    <style type="text/css">
  	
  	.haha{
  		position:relative;
		z-index: 10;
	}  

    </style>


</head>

<body>


	<%@include file="../header.jsp" %>
	<div class="content_wrap">
		<div class="content">
		
		    <h3 style="padding-top: 10px;">글쓰기3</h3>
		    <hr>
		    <div class="haha">
		    
			    <form action="write_ok" method="post" encType="multipart/form-data" name="frm" style="margin: auto; " >
			        <div style="margin-left: 17%; z-index: 9;">
			            <input type="text" name="title" placeholder="제목" style="width: 81%; margin-right: 20%; margin-bottom: 5px;"><br/>
			            <textarea id="content" name="content" style="margin-top: 10px; "></textarea>
			        </div>
			        
			        <div style="margin-left: 17%;">
			            <select class="custom-select" id="st1" name="st0" style="width: 81%; margin-right: 20%; margin-top: 5px;">
			                <option value="">증상</option>
			                <option value="1">어깨 통증</option>
			                <option value="2">왼쪽 아랫배 통증</option>
			                <option value="3">오른쪽 머리 두통</option>
			            </select>
			            <input type="text" name="srch_tag" id="srch_tag">
			        </div>
			        
			        <div style="margin-left: 59%; padding: 5px;" >
			        	<input type="button" class="btn btn-primary" value="등록" onclick="sendData()"/>
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
	
	function sendData(){
/* 			alert(document.forms[0].elements.length);
	 		for(var i=0 ; i<document.forms[0].elements.length-210 ; i++){
			if(document.forms[0].elements[i].value == ""){
				alert(document.forms[0].elements[i].name+"를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			} */
			
			//alert(document.forms[0].title.value.trim().length)
 			 
			if(document.forms[0].title.value == ""){
				alert("제목을 입력해주세요");
				document.forms[0].title.focus();
				return;
			}
			if (document.forms[0].content.value == "") {
				alert("내용을 입력해주세요");
				document.forms[0].content.focus();
				return;
			}
			
		
	 
	    //             ↱셀렉트박스 아이디 적고 + option:selected 적으면 value값을 가지고 올 수 있다.
	 	var tag1 = $("#st1 option:selected").val();  // .val()을 해야 value 값을 갖고 옴(단 .toString()을해야 함?) .text를 하면 선택된 텍스트 값을 갖고
	 	$("#srch_tag").val(tag1);
	 	
		if (document.forms[0].srch_tag.value == "") {
			alert("증상선택하시오");
			return;
		} 
		//document.forms[0].submit();
	}
	
		
	$(function () {
		console.log("SSSSS");
		$("#content").summernote({
			placeholder:"내용 입력하세요",
			height:300,
			maxHeight:600,  //최대크기지정
			minHeight:200,
			tabSize:10,
			width: 807,
			lang:"ko-KR",
			
			callbacks: {
				onImageUpload: function (files, editor) {
					console.log('yyyyyyy');
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], editor);
					}
				}
			}
		});
	});
	
	function sendFile(file, editor) {
		var frm = new FormData();
		
		frm.append("file", file)
		
		// ┌>비동기식 통신하기!!
		$.ajax({
			url:"write_summer",
			type:"post",
			data: frm,
			// ┌> contentType, processData를 지정해 줘야 일반적인 문자열을 보내는 것이 아닌 -> 파일을 보내는 것이라는 것을 알려줄 수 있다.
			contentType: false,
			processData: false,
			dataType:"json",
			
		}).done(function(res) { //성공시 (이미지 주소를 content에 넣어주기)
			console.log(res.img_url);
		     //┌> jQuery로 img 태그 만듦
			var image = $("<img>").attr("src", res.img_url);  // <-img태그 생성됨
		                           //└>속성 부여
		     //┌>html id가 content인 내용안에 넣어주기 
		    //$("#content").summernote("insertNode", image[0]);
		                               //└>(insertNode를 적으면<textarea rows="12" cols="50" id="content" name="content">!!insertNode!!열로 들어감</textarea>)
		    
		    
		    //                            ┌>img 태그를 알아서 만들어서 넣어줌
			$("#content").summernote("editor.insertImage", res.img_url);
			$("#file_name").val(res.f_name);
		}).fail(function(err) { //실패시
			console.log(err);
		});
	} 
	
	

</script>

</body>

</html>
