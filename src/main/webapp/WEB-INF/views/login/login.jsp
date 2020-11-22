<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" 
href="/css/bootstrap.css"/>
<link type="text/css" rel="stylesheet" 
href="/css/bootstrap.min.css"/>
<style type="text/css">

.div_logo{
	text-align: center;
    padding-top: 200px;
}

.div_line{
	width: 80%;
    height: 40px;
    border-bottom: 4px solid #64ac7d;
    text-align: center;
    margin: 0 auto;
}

.login_wrap {
	width: 500px;
	margin: 0 auto;
	left: 35%;
	top : 20%;

}

.login_card_out {
	width: 100%;
    border: 1px solid black;
	position: relative;
	margin-top: 100px;
	
} 

 .login_card_in{
	margin: 5%
}

.login_card_in td{
	text-align: right;
	padding-right : 10px
}

.login_btn{
	margin-top: 10px;
	width: 100px;
	margin-left: 5px;
} 
input#s_id{
	margin-bottom: 10px;
}


</style>
	</head>
<body>

     <div class="div_logo">
			<a href="/home"><img alt="" src="logo/logo2.png" width="500px"></a>
		</div>
	
	<div class="div_line"></div>
	
	<div class="login_wrap">
	
		<div class="card border-primary mb-3 login_card_out">
			<div class="login_card_in">
				<form>
					<table style="width: 100%">
						<colgroup>
							<col width="50px">
							<col width="*">
						</colgroup>
						<tr>
							<td class="staticEmail"><label class="">ID</label>
							</td>
							<td><input type="text" id="u_id"
								class="form-control" /></td>
						</tr>
						<tr>
							<td class="staticEmail"><label>PW</label></td>
							<td><input type="text" id="u_pw"
								class="form-control" /></td>
						</tr>
						<tr>
							<td colspan="2" class="" ><input type="button"
								value="회원가입" class="btn btn-primary login_btn" onclick="javascript:location.href='/join'"/>
								<input type="button" id="btnLogin"
								value="로그인" class="btn btn-primary login_btn" /></td>
						</tr>
						<tr>
							<td colspan="2" class=""><a href="/find"><font
									size="2">아이디/비밀번호 찾기</font></a></td>
						</tr>
					</table>
				</form>

			</div>
		</div>

	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {

		//로그인 버튼 클릭 이벤트
		$("#btnLogin").on("click", function(event) {
			
			var isChk = true;
			
			var u_id = $("#u_id").val();
			var u_pw = $("#u_pw").val();
			
			//아이디 유효성 검사 - IsNull
			if(u_id.trim().length < 1){
				$("#u_id").addClass('is-invalid');
				isChk = false;
			}else{
				$("#u_id").removeClass('is-invalid');
			}
			
			//비밀번호 유효성 검사 - IsNull
			if(u_pw.trim().length < 1){
				$("#u_pw").addClass('is-invalid');
				isChk = false;
			}else{
				$("#u_pw").removeClass('is-invalid');
			}
			
			//유효성 검사 후 isChk가 false인 경우 return
			if(!isChk) return;
			
			//로그인 이벤트
			$.ajax({
				url:"login",
				type:"post",
				data:"u_id="+u_id+"&u_pw="+u_pw,
				dataType:"json",
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}).done(function(data){
				var res = data.loginChk;
				if(res){
					alert("로그인에 성공하였습니다.");
					location.href="/"
				}else{
					alert("아이디 또는 비밀번호를 다시 확인 하시길 바랍니다.")
				}
		
			});
			

		});
	});
</script>

</body>
</html>