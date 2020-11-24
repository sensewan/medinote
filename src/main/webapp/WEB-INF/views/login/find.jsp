<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css" />
<style type="text/css">
.find_wrap{
	width: 50%;
	/* position: absolute; */
	left: 20%;
	top : 20%;
	margin: 0 auto;
}

.login_card_out {
	width: 100%;
	/* position: relative; */
	margin-top: 100px;
	display: inline-block;
	height: 280px;
	
} 

 .login_card_in_l{
 	display : inline-block;
 	width: 50%;
 	float: left;
 	padding: 10px;
	border-right: 1px solid #dcdcdc;
	height: 100%;
}
 .login_card_in_r{
 	display : inline-block;
 	width: 50%;
 	float: right;
 	padding: 10px;
 	height: 100%;
}

.find_btn{
	width: 100px;
}

.find_td_right{
	text-align: right;
	padding-right: 10px;
}

.find_td_btn_right{
	text-align: right;
}


table{
	width: 100%
}

td{
	 height: 50px; 

	
}

input.btn.btn-primary.find_btn2 {
    width: 100%;
    height: 60px;
    font-size: 20px;
    font-weight: bold;
    /* margin: 0 auto; */
    /* text-align: end;
    
   }
   


</style>
</head>
<body>
	<div class="find_wrap">
		<div style="text-align: center">
			<a href="/"><img alt="" src="logo/logo_login.png" width="500px"></a>
		</div>
		<div class="card border-primary mb-3 login_card_out">
			
			<div class="login_card_in_l">
				<form id="f_id_find">
					<table>
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr>
							<td colspan="4">
								<h5 class="card-title">아이디 찾기</h5>
								<hr />
							</td>
						</tr>
						<tr>
							<td class="find_td_right"><label>이름</label></td>
							<td colspan="3"><input type="text" id="id_name" class="form-control" maxlength="5" />
							</td>
						</tr>
						<tr>
							<td class="find_td_right"><label>전화번호</label></td>
							<td><select id="id_phone1" name="arrPhone" class="custom-select">
									<option>010</option>
									<option>011</option>
									<option>017</option>
							</select></td>
							<td><input type="text" id="id_phone2" name="arrPhone" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								class="form-control"  /></td>
							<td><input type="text" id="id_phone3" name="arrPhone" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								class="form-control" /></td>
						</tr>

						<tr>
							<td />
						</tr>
						<tr>
							<td colspan="4" class="find_td_btn_right"><input type="button" id="btnFindId"
								value="찾기" class="btn btn-primary find_btn" /></td>
						</tr>
					</table>
				</form>
				<form id="f_id_result" style="display: none">
					<table>
						<colgroup>
							<col width="50%">
							<col width="*">
						</colgroup>
						<tr>
							<td colspan="2">
								<h5 class="card-title">아이디 찾기</h5>
								<hr/>
							</td>
						</tr>
						
						<tr><td/></tr>
							<tr>
							<td class="find_td_right">
								<label>아이디</label>
							</td>
							<td>
								<label id="lbId"></label>
							</td>

						</tr>
						<tr>
							<td/>

						</tr>
						<tr>
							<td colspan="2" class="find_td_btn_right">
								<input type="button" value="완료" class="btn btn-primary find_btn" onclick="javascript:location.href='/login'" />
							</td>
						</tr>
					</table>
				</form>

			</div>
			<div class="login_card_in_r">
				<form id="f_pw_find">
					<table>
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr>
							<td colspan="4">
								<h5 class="card-title">비밀번호 찾기</h5>
								<hr />
							</td>
						</tr>
						<tr>
							<td class="find_td_right"><label>아이디</label></td>
							<td colspan="3"><input type="text" id="pw_id" class="form-control" />
							</td>
						</tr>
						<tr>
							<td class="find_td_right"><label>이름</label></td>
							<td colspan="3"><input type="text" id="pw_name" class="form-control" maxlength="5"/></td>

						</tr>
						<tr>
							<td class="find_td_right"><label>전화번호</label></td>
							<td><select id="pw_phone1" name="arrPhone" class="custom-select">
									<option>010</option>
									<option>011</option>
									<option>017</option>
							</select></td>
							<td><input type="text" id="pw_phone2" name="arrPhone" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								class="form-control" /></td>
							<td><input type="text" id="pw_phone3" name="arrPhone" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								class="form-control" /></td>
						</tr>
						<tr>
							<td colspan="4" class="find_td_btn_right"><input type="button" id="btnFindPw"
								value="찾기" class="btn btn-primary find_btn" /></td>
						</tr>
					</table>
				</form>
				<form id="f_pw_result"  style="display: none">
					<table>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
						<tr>
							<td colspan="2">
								<h5 class="card-title">비밀번호 찾기</h5>
								<hr />
							</td>
						</tr>
						<tr>
							<td class="find_td_right"><label>새 비밀번호</label></td>
							<td><input type="password" id="pw_new" class="form-control" />
							</td>
						</tr>
						<tr>
							<td class="find_td_right"><label>비밀번호 확인</label></td>
							<td><input type="password" id="pw_new_chk" class="form-control" /></td>

						</tr>
						<tr>
							<td />
							<td><input type="hidden" id="pw_new_id" class="form-control" /></td>
						</tr>
						<tr>
							<td colspan="2" class="find_td_btn_right"><input type="button" id="btnChange"
								value="완료" class="btn btn-primary find_btn" /></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
		<div>
			<input type="button" value="로그인" class="btn btn-primary find_btn2 " onclick="javascript:location.href='/login'"/>
		</div>


	</div>
	
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
<script>
	$(document).ready(function() {
		
/**********************************************************************/
		//아이디 찾기 버튼 클릭 이벤트
		$("#btnFindId").on("click", function(event) {
			
			var isChk = true;
			
			var id_name = $("#id_name").val();
			
			var id_phone1 = $("#id_phone1").val();
			var id_phone2 = $("#id_phone2").val();
			var id_phone3 = $("#id_phone3").val();
			
			//이름 유효성 검사 - IsNull
			if(id_name.trim().length < 1){
				$("#id_name").addClass('is-invalid');
				isChk = false;
			}else{
				$("#id_name").removeClass('is-invalid');
			}
			
			//전화번호2 유효성 검사 - IsNull
			if(id_phone2.trim().length < 1){
				$("#id_phone2").addClass('is-invalid');
				isChk = false;
			}else{
				$("#id_phone2").removeClass('is-invalid');
			}
			
			//전화번호3 유효성 검사 - IsNull
			if(id_phone3.trim().length < 1){
				$("#id_phone3").addClass('is-invalid');
				isChk = false;
			}else{
				$("#id_phone3").removeClass('is-invalid');
			}
			

			//유효성 검사 후 isChk가 false인 경우 return
			if(!isChk) return;
			
			var id_phone = id_phone1 + id_phone2 + id_phone3;
			
			//아이디 찾기 이벤트
			$.ajax({
				url:"findId",
				type:"post",
				data:"u_nm="+id_name+"&phone="+id_phone,
				dataType:"json",
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}).done(function(data){
				var res = data.findId;
				if(res != null && res.trim().length > 0){
					alert("아이디를 찾았습니다. : " + res);
				    $( '#f_id_find' ).css("display", "none" );
				    $( '#f_id_result' ).css("display", "flex" );
				    $( '#lbId').text( res );
				    
				}else{
					alert("이름 또는 전화번호를 다시 확인 하시길 바랍니다.")
				}
		
			});

		});
		
/**********************************************************************/
		//비밀번호 찾기 버튼 클릭 이벤트
		$("#btnFindPw").on("click", function(event) {
			
			var isPwChk = true;
			
			var pw_id = $("#pw_id").val();
			var pw_name = $("#pw_name").val();
			
			var pw_phone1 = $("#pw_phone1").val();
			var pw_phone2 = $("#pw_phone2").val();
			var pw_phone3 = $("#pw_phone3").val();
			
			//아이디 유효성 검사 - IsNull
			if(pw_id.trim().length < 1){
				$("#pw_id").addClass('is-invalid');
				isPwChk = false;
			}else{
				$("#pw_id").removeClass('is-invalid');
			}
			
			//이름 유효성 검사 - IsNull
			if(pw_name.trim().length < 1){
				$("#pw_name").addClass('is-invalid');
				isPwChk = false;
			}else{
				$("#pw_name").removeClass('is-invalid');
			}
			
			//전화번호2 유효성 검사 - IsNull
			if(pw_phone2.trim().length < 1){
				$("#pw_phone2").addClass('is-invalid');
				isPwChk = false;
			}else{
				$("#pw_phone2").removeClass('is-invalid');
			}
			
			//전화번호3 유효성 검사 - IsNull
			if(pw_phone3.trim().length < 1){
				$("#pw_phone3").addClass('is-invalid');
				isPwChk = false;
			}else{
				$("#pw_phone3").removeClass('is-invalid');
			}
			
			//유효성 검사 후 isChk가 false인 경우 return
			if(!isPwChk) return;
			
			var pw_phone = pw_phone1 + pw_phone2 + pw_phone3;
			
			//비밀번호 찾기 이벤트
			$.ajax({
				url:"findPw",
				type:"post",
				data:"u_id="+pw_id+"&u_nm="+pw_name+"&phone="+pw_phone,
				dataType:"json",
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}).done(function(data){
				var res = data.findPw;
				if(res){
					alert("비밀번호 변경해봐요. : " + res);
				    $( '#f_pw_find' ).css("display", "none" );
				    $( '#f_pw_result' ).css("display", "flex" );
				    //console.log(pw_id);
				    $( '#pw_new_id').val( pw_id );

				    
				}else{
					alert("아이디, 이름 또는 전화번호를 다시 확인 하시길 바랍니다.")
				}
		
			});

		});	
		
		
/**********************************************************************/		
		//비밀번호 변경 완료 버튼 클릭 이벤트
		$("#btnChange").on("click", function(event) {
			
			var isPwChgChk = true;
			
			var pw_new = $("#pw_new").val();
			var pw_new_chk = $("#pw_new_chk").val();
			var pw_new_id = $("#pw_new_id").val();
			
			//비밀번호 유효성 검사 - IsNull
			if(pw_new.trim().length < 1){
				$("#pw_new").addClass('is-invalid');
				isPwChgChk = false; return;
			}else{
				$("#pw_new").removeClass('is-invalid');
			}
			
			//비밀번호 확인 유효성 검사 - IsNull
			if(pw_new_chk.trim().length < 1){
				$("#pw_new_chk").addClass('is-invalid');
				isPwChgChk = false; return;
			}else{
				$("#pw_new_chk").removeClass('is-invalid');
			}
			

			//비밀번호 확인 길이 검사
			if(pw_new.trim().length < 5 || pw_new_chk.trim().length > 10 ){
				//f_valid_chk_pw.innerHTML = "비밀번호는 5자 이상 15자 이하입니다.";
				alert('비밀번호는 5자 이상 15자 이하입니다.');
				$("#pw_new").addClass('is-invalid');
				isPwChgChk = false; return;
			}
			
			//새로운 비밀번호와 비밀번호 확인 동일 확인
			if(pw_new.trim() != pw_new_chk.trim()){
				alert('비밀번호가 동일하지 않습니다.');
				isPwChgChk = false; return;
			}
		
			
			//유효성 검사 후 isChk가 false인 경우 return
			if(!isPwChgChk) return;
						
			//비밀번호 변경 이벤트
			$.ajax({
				url:"ChangePw",
				type:"post",
				data:"u_id="+pw_new_id+"&u_pw="+pw_new,
				dataType:"json",
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}).done(function(data){
				if(data.chk){
					alert('변경이 완료 되었습니다.');
					location.href="/login";
					
				}

			});
		});			
	
	});	
	
</script>
</body>
</html>