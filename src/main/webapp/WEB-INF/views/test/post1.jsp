<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="button" onclick="goPost()" value="클릭">

<script type="text/javascript">

function goPost() {

	var form = document.createElement("form");

	form.setAttribute("charset", "UTF-8");

	form.setAttribute("method", "Post"); // Get 또는 Post 입력

	form.setAttribute("action", "/post2");
	
	var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", key);

    
    form.appendChild(hiddenField);

	document.body.appendChild(form);

	form.submit();

	}


</script>
</body>
</html>