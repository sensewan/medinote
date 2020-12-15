<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Test1</h1>
<div id="foo"></div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    $('#foo').append($('<div/>', {
        id: 'myid',
        title: 'Hello world?',
        text: 'hello world'
    }));
    $('#foo').append($('<a/>', {
        href: 'https://www.google.co.kr',
        title: '나를 클릭하면 구글로 간다.',
        text: '클릭!'
    }));
    $('#foo').append($('<input />', { type: 'checkbox', id: 'cb', value: "333" }));
    
    
    var tag = "<input type= "
    	+ "'checkbox' class='symp'/>증상1";
    $("#foo").append(tag);
});
</script>
</body>
</html>