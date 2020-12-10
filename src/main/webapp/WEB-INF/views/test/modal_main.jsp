<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="css/layout.css" />

<style>
.modal{
	margin-top: auto auto;
}
	
</style>
</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content_wrap">
			<div class="content">
			<div>
				<h1>Modal 테스트</h1>
				<input type="button" id="btnModal" value="ModalTest">
			</div>
			</div>
		</div>
	</div>

	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Save changes</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnModal").on("click", function(event) {
			
			
			$("#myModal").modal('show')      
		});
		
		$('#myModal').on('shown.bs.modal', function (e) {
			  alert('show');
		});
		
		$('#myModal').on('hidden.bs.modal', function() {
			alert('hidden');
		});
		
		
		
	});
	
	</script>
	</body>
</html>