<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
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

.join_wrap {
	width: 500px;
	/* position: absolute; */
	left: 35%;
	top : 10%;
	margin: 0 auto;

}

 .join_card_out {
	width: 100%;
    border: 1px solid black;
	/* position: relative; */
	margin-top: 50px;
	
} 

 .join_card_in{
	margin: 5%
}


.join_td_right{
	text-align: right;
	padding-right: 10px;
}

.join_btn{
	width: 100px;
}

.join_td_valid{
	height: 20px;
}  

.font_valid{
	color: red;
}


</style>
	</head>
<body>
	<div class="join_wrap">
		<div>
			<a href="/"><img alt="" src="logo/logo_login.png" width="500px"></a>
		</div>

		<div class="card border-primary mb-3 join_card_out">
			<div class="join_card_in">
				<form action="join" method="post">
					<table style="width: 100%">
						<colgroup>
							<col width="*">
							<col width="110px">
							<col width="110px">
							<col width="110px">
						</colgroup>
						<tr>
							<td colspan="4">
								<h4 class="card-title">회원가입</h4>
								<hr/>
							</td>
						</tr>
						<tr>
							<td class="join_td_right"><label>아이디</label>
							</td>
							<td colspan="3"><input type="text" id="u_id" name="u_id"  maxlength="10"
								class="form-control" /></td>
						</tr>
						<tr>
							<td />
							<td colspan="3" class="join_td_valid">
								<label ><font size="2" class="font_valid" id="f_valid_id"></font></label>
							</td>
						</tr>
						<tr>
							<td class="join_td_right"><label>비밀번호</label></td>
							<td colspan="3"><input type="password" id="u_pw" name="u_pw" onkeyup="valid_pw()" maxlength="15"
								class="form-control" /></td>
						</tr>
						<tr>
							<td />
							<td colspan="3">
								<label><font size="2" id="f_valid_pw" class="font_valid"></font></label>
							</td>
						</tr>
						<tr>
							<td class="join_td_right"><label>비밀번호 확인</label></td>
							<td colspan="3"><input type="password" id="chk_pw" name="chk_pw" onkeyup="valid_chk_pw()" maxlength="15"
								class="form-control" /></td>
						</tr>
						<tr>
							<td />
							<td colspan="3">
								<label><font size="2" id="f_valid_chk_pw" class="font_valid"></font></label>
							</td>
						</tr>
						<tr>
							<td class="join_td_right"><label>이름</label></td>
							<td colspan="3"><input type="text" id="u_nm" name="u_nm" onkeyup="valid_nm()" maxlength="5"
								class="form-control" /></td>
						</tr>
						<tr>
							<td />
							<td colspan="3">
								<label><font size="2" id="f_valid_nm" class="font_valid"></font></label>
							</td>
						</tr>
						<tr>
							<td class="join_td_right"><label>닉네임</label></td>
							<td colspan="3"><input type="text" id="u_nk" name="u_nk" 
								class="form-control" /></td>
						</tr>
						<tr>
							<td />
							<td colspan="3">
								<label><font size="2" id="f_valid_nk" class="font_valid"></font></label>
							</td>
						</tr>
						<tr>
							<td class="join_td_right"><label>생년월일</label></td>
							<td><input type="text" id="birth1" name="arrBirth" maxlength="4" placeholder="년(4자)" onkeyup="valid_birth1()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								class="form-control" />
							</td>
							<td>
								<select id="birth2" class="custom-select" name="arrBirth" >
								<c:forEach begin="1" end="12" var="idx">
								<option>${idx }</option>
								</c:forEach>
								</select>
							</td>

							<td><input type="text" id="birth3" name="arrBirth" maxlength="2" onkeyup="valid_birth3()"
								class="form-control" placeholder="일" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" max="31" />
							</td>
						</tr>
						<tr>
							<td  class="join_td_valid"/>
						</tr>
						<tr>
							<td class="join_td_right"><label>전화번호</label></td>
							<td><select id="phone1" name="arrPhone" class="custom-select">
									<option>010</option>
									<option>011</option>
									<option>017</option>
							</select></td>
							<td><input type="text" id="phone2" name="arrPhone" maxlength="4" onkeyup="valid_phone2()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" 
								class="form-control" /></td>
							<td><input type="text" id="phone3" name="arrPhone" maxlength="4" onkeyup="valid_phone3()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								class="form-control" /></td>
						</tr>
						<tr>
							<td  class="join_td_valid"/>
						</tr>
						<tr>
							<td colspan="4" class="join_td_right"><input type="button"
								value="가입" class="btn btn-primary join_btn" onclick="join(this.form)"/> <input
								type="button" value="취소" class="btn btn-primary join_btn" onclick="javascript:location.href='/login'" /></td>
						</tr>
					</table>
				</form>

			</div>
		</div>

	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>

	var v_idChk = false;
	$(document).ready(function() {
		//아이디 유효성 검사
		$("input[name=u_id]").keyup(function(event) {
	
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
	
				var inputVal = $(this).val();
	
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
			}
			
			var res = valid_id();
			if(!res) return;
	
			var id = $("#u_id").val();
			
			$.ajax({
				url:"idChk",
				type:"post",
				data:"u_id="+id,
				dataType:"json",
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}).done(function(data){
				var f_valid_id = document.getElementById("f_valid_id");
				var u_id = document.getElementById("u_id");
			 if(data.idChk){
					f_valid_id.innerHTML = "중복된 아이디 입니다.";
					u_id.className = "form-control is-invalid";
					v_idChk = false;
				}else{
					f_valid_id.innerHTML = "";
					u_id.className = "form-control is-valid";
					v_idChk = true;
				} 
	
			});
	
		});
	
	});
	var v_nkChk = false;
	$(document).ready(function() {
		//아이디 유효성 검사
		$("input[name=u_nk]").keyup(function(event) {
	
			var res = valid_nk();
			if(!res) return;
	
			var nk = $("#u_nk").val();
			
			$.ajax({
				url:"nkChk",
				type:"post",
				data:"u_nk="+nk,
				dataType:"json",
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    }
			}).done(function(data){
				var f_valid_nk = document.getElementById("f_valid_nk");
				var u_nk = document.getElementById("u_nk");
				
				console.log(data.nkChk);
			 if(data.nkChk){
					f_valid_nk.innerHTML = "중복된 닉네임 입니다.";
					u_nk.className = "form-control is-invalid";
					v_nkChk = false;
				}else{
					f_valid_nk.innerHTML = "";
					u_nk.className = "form-control is-valid";
					v_nkChk = true;
				} 
	
			});
	
		});
	
	});



	function valid_id() {
		var res = true;
		var u_id = document.getElementById("u_id");
		var f_valid_id = document.getElementById("f_valid_id");

		//아이디 유효성 검사
		if (u_id.value.trim().length ==  0) {
			f_valid_id.innerHTML = "아이디를 입력하세요";
			u_id.className = "form-control is-invalid";
			return false;
		} else {
			f_valid_id.innerHTML = "";
			u_id.className = "form-control is-valid";
		}
		
		//아이디 길이 검사
		if(u_id.value.trim().length < 5 || u_id.value.trim().length > 15 ){
			f_valid_id.innerHTML = "아이디는 5자 이상 15자 이하입니다.";
			u_id.className = "form-control is-invalid";
			res = false;
		}
		
		
		
		return res;

	}

	function valid_pw() {
		var res = true;
		var u_pw = document.getElementById("u_pw");
		var f_valid_pw = document.getElementById("f_valid_pw");
		
		  var chk_num = u_pw.value.search(/[0-9]/g);
		  var chk_eng = u_pw.value.search(/[a-z]/ig);

		//비밀번호 유효성 검사
		if (u_pw.value.trim().length == 0) {
			f_valid_pw.innerHTML = "비밀번호를 입력하세요";
			u_pw.className = "form-control is-invalid";
			res = false;
			return res;
		}else if(u_pw.value.trim().length < 5 || u_pw.value.trim().length > 15 ){
			f_valid_pw.innerHTML = "아이디는 5자 이상 15자 이하입니다.";
			u_pw.className = "form-control is-invalid";
			res = false;
			return res;
		}  
		else if(chk_num < 0 || chk_eng < 0){
			f_valid_pw.innerHTML = "비밀번호는 숫자와 영문자를 혼용하여야 합니다.";
			u_pw.className = "form-control is-invalid";
			res = false;
			return res;
		}else {
			f_valid_pw.innerHTML = "";
			u_pw.className = "form-control ";
		}
		

		
		return res;
	}

	function valid_chk_pw() {
		
		var u_pw = document.getElementById("u_pw")
		var chk_pw = document.getElementById("chk_pw");
		var f_valid_chk_pw = document.getElementById("f_valid_chk_pw");

		//비밀번호 확인 유효성 검사
	if (chk_pw.value.trim().length == 0) {
			f_valid_chk_pw.innerHTML = "비밀번호를 입력하세요";
			chk_pw.className = "form-control is-invalid";
			res = false;
			return res;
		} else if (chk_pw.value.trim().length < 5
				|| chk_pw.value.trim().length > 10) { //비밀번호 확인 길이 검사
			f_valid_chk_pw.innerHTML = "비밀번호는 5자 이상 15자 이하입니다.";
			chk_pw.className = "form-control is-invalid";
			res = false;
			return res;
		} else if (u_pw.value != chk_pw.value) {
			f_valid_chk_pw.innerHTML = "비밀번호가 동일하지 않습니다.";
			chk_pw.className = "form-control is-invalid";
			res = false;
			return res;
		} else {
			f_valid_chk_pw.innerHTML = "";
			chk_pw.className = "form-control ";
		}


		return true;
	}

	function valid_nm() {
		var res = true;
		var u_nm = document.getElementById("u_nm");
		var f_valid_nm = document.getElementById("f_valid_nm");

		//이름 유효성 검사
		if (u_nm.value.trim().length == 0) {
			f_valid_nm.innerHTML = "이름을 입력하세요";
			u_nm.className = "form-control is-invalid";
			res = false;
			return res;
		} else {
			f_valid_nm.innerHTML = "";
			u_nm.className = "form-control";
		}
		

		return res;

	}

	function valid_nk() {

		var res = true;
		var u_nk = document.getElementById("u_nk");
		var f_valid_nk = document.getElementById("f_valid_nk");

		//닉네임 유효성 검사
		if (!(u_nk.value.trim().length > 0)) {
			f_valid_nk.innerHTML = "닉네임을 입력하세요";
			u_nk.className = "form-control is-invalid";
			res = false;
			return res;
		}

		return res;
	}

	function valid_birth1() {

		var res = false;
		var birth1 = document.getElementById("birth1");

		//생일 유효성 검사
		if (birth1.value.trim().length > 0 && birth1.value.trim().length == 4) {
			birth1.className = "form-control";
			res = true;
		} else {
			birth1.className = "form-control is-invalid";
		}

		return res;

	}

	function valid_birth3() {
		var res = false;
		var birth3 = document.getElementById("birth3");

		//생일 유효성 검사
		if (birth3.value.trim().length > 0) {
			birth3.className = "form-control";
			res = true;
		} else {
			birth3.className = "form-control is-invalid";

		}

		return res;
	}

	function valid_phone2() {
		var res = false;

		var phone2 = document.getElementById("phone2");

		//전화번호 유효성 검사
		if (phone2.value.trim().length > 0) {
			phone2.className = "form-control";
			res = true;
		} else {
			phone2.className = "form-control is-invalid";

		}
		return res;
	}
	function valid_phone3() {
		var res = false;

		var phone3 = document.getElementById("phone3");

		if (phone3.value.trim().length > 0) {
			phone3.className = "form-control";
			res = true;
		} else {
			phone3.className = "form-control is-invalid";
		}

		return res;

	}
	function join(frm) {

		var res = true;
		if (!valid_id() || !valid_pw() || !valid_chk_pw() || !valid_nm()
				|| !valid_nk()) {
			res = false;
		} else if (!valid_birth1() || !valid_birth3() || !valid_phone2()
				|| !valid_phone3()) {
			res = false;
		} else if (!v_idChk) {
			f_valid_id.innerHTML = "중복된 아이디 입니다.";
			u_id.className = "form-control is-invalid";
			res = false;
		}else if(!v_nkChk){
			f_valid_nk.innerHTML = "중복된 닉네임 입니다.";
			u_nk.className = "form-control is-invalid";
			res = false;
		}

		if (res) {
			//frm.submit();

			var s_id = $("#u_id").val();
			var s_pw = $("#u_pw").val();
			var s_nm = $("#u_nm").val();
			var s_nk = $("#u_nk").val();

			var s_phone = [];
			s_phone.push($("#phone1").val());
			s_phone.push($("#phone2").val());
			s_phone.push($("#phone3").val());

			var s_birth = [];
			s_birth.push($("#birth1").val());
			s_birth.push($("#birth2").val());
			s_birth.push($("#birth3").val());

			$.ajax(
					{
						url : "join",
						type : "post",
						data : "u_id=" + s_id + "&u_pw=" + s_pw + "&u_nm="
								+ s_nm + "&u_nk=" + s_nk + "&arrPhone="
								+ s_phone + "&arrBirth=" + s_birth,
						dataType : "json",
						error : function(request, status, error) {
							alert("code = " + request.status + " message = "
									+ request.responseText + " error = "
									+ error); // 실패 시 처리
						}
					}).done(function(data) {
				if (data.result) {
					alert('가입이 완료되었습니다.');
					location.href = "/login";
				}
			});

		}
	}
</script>
</body>
</html>