<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediNote</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="/css/layout.css"/>
<style>
	#pop{
		display: none;
		position:fixed;
		width:300px;
		height:200px;
		top:50%;
		left:50%;
		margin-top:-75px;
		margin-left:-150px;
		background:#d9e5e9;
		overflow: auto;
		
	}
	.symp_table {
		border: 1px solid black;
		width: 400px;
		height: 300px;
	}
	.scale:hover {
		transform: scale(1.1);
	  -webkit-transform: scale(1.1);
	  -moz-transform: scale(1.1);
	  -ms-transform: scale(1.1);
	  -o-transform: scale(1.1);
	}
	
	.content{
		padding : 30px;
	}
	.content .img{
		width : 500px;
	}
	
	area:focus{
	  border: none;
	  outline:none;
	  outline-style: none;
	  -moz-outline-style:none; 
	}
	img, img a {
	 outline: none !important;
	 border: none !important;
	}
	#table1 {
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        background-color: rgba( 255, 255, 255, 1 );
    }
    
    
    .box_modal {
	  position:fixed;
	  display:block;
	  width:300px;
	  height:150px;
	  top:50%;
	  left:50%;
	  margin-top:-75px;
	  margin-left:-150px;
	  background:#d9e5e9;
	  border:1px solid #386980;
	  overflow:hidden;
	  /* 아래 부분은 애니메이션 효과를 위한 부분 */
	  visibility: collapse;
	  opacity: 0.6;
	  filter: alpha(opacity=60);
	  -webkit-transition: all .2s ease;
	  transition: all .2s ease;
	  -webkit-transform: scale(0, 0);
	  -ms-transform: scale(0, 0);
	  transform: scale(0, 0);
	}
	.box_modal:hover {
	  opacity: 1;
	  filter: alpha(opacity=100);
	}
    
    .pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  margin: 10px 0 20px;
	  padding-top: 10px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  border: 5px solid #3571B5;
	  z-index: 10;
	}
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
	  display: block;
	}
	
	a.btn-layerMore {
	  display: inline-block;
	  height: 25px;
	  padding: 0 14px 0;
	  border: 1px solid #304a8a;
	  background-color: #3f5a9d;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	}
	a.btn-layerMore:hover {
	  border: 1px solid #091940;
	  background-color: #1f326a;
	  color: #fff;
	}
	
	a.btn-layerClose {
	  display: inline-block;
	  height: 25px;
	  padding: 0 14px 0;
	  border: 1px solid #304a8a;
	  background-color: #3f5a9d;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	}
	a.btn-layerClose:hover {
	  border: 1px solid #091940;
	  background-color: #1f326a;
	  color: #fff;
	}
	
	.btnModal{
		cursor : pointer;
		-webkit-cursor: pointer;
	  	-moz-cursor: pointer;
	  	-ms-cursor: pointer;
	  	-o-cursor: pointer;
	}
	
	.modal-body{
		overflow:auto;	
		height: 300px;
		width: 690px;
	}
	
	.modal-content{
		width: 700px;
		margin : 0 auto;
	}
	
	.modal-dialog{
		max-width : 1000px;
	}
	    
</style>
</head>
<body>
	<div class="wrap">
		<div id="header_test">
		<jsp:include page="../header.jsp"/>
		</div>
		<div class="content_wrap">
			<div class="content">
				<img src="img/body_img.png" alt="Body" usemap="#bodymap" name="point">
				<map name="bodymap">
					<area shape="rect" id="B000016,B000019" class="btnModal" alt="전신" title="전신" coords="1,54,165,123" onmouseover="if(document.images) point.src='img/body_img2.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000006" class="btnModal" alt="등" title="등" coords="3,116,165,234" onmouseover="if(document.images) point.src='img/body_img3.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000013" class="btnModal" alt="엉덩이" title="엉덩이" coords="3,239,165,417" onmouseover="if(document.images) point.src='img/body_img4.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000003,B000011,B000014" class="btnModal" alt="기타" title="기타" coords="2,419,167,542" onmouseover="if(document.images) point.src='img/body_img5.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000002,B000004,B000007,B000015,B000017" class="btnModal" alt="머리 / 얼굴" title="머리 / 얼굴" coords="167,52,333,111" onmouseover="if(document.images) point.src='img/body_img6.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000008,B000020" class="btnModal" alt="목 / 가슴" title="목 / 가슴" coords="167,113,332,171" onmouseover="if(document.images) point.src='img/body_img7.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000010" class="btnModal" alt="배" title="배" coords="167,175,333,233" onmouseover="if(document.images) point.src='img/body_img8.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000001" class="btnModal" alt="골반" title="골반" coords="167,236,334,293" onmouseover="if(document.images) point.src='img/body_img9.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000005,B000018" class="btnModal" alt="팔 / 다리" title="팔 / 다리" coords="168,297,334,502" onmouseover="if(document.images) point.src='img/body_img10.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" id="B000009,B000012" class="btnModal" alt="손 / 발" title="손 / 발" coords="169,506,334,543" onmouseover="if(document.images) point.src='img/body_img11.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
				</map>
			</div>
		</div>
	</div>
	 
	 <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title symptom-title"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form action="showMore" name="frm" method="post">
					<table style="width:100%">
						<tbody id="content">
						</tbody>
					</table>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="showMore">Show More</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	 <div class="modal" id="loginPopup" tabindex="-1" role="dialog" aria-hidden="true" style="border:1px solid red">
		<div class="modal-dialog modal-dialog-centered" role="document" >
			<div class="modal-content" style="width: 500px; height: 250px; border-color: #64ac7d">	
				<div class="modal-header">
					<h5 class="modal-title">로그인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="width: 100%">
				<form>
					<table style="width: 100%">
						<colgroup>
							<col width="50px">
							<col width="*">
						</colgroup>
						<tr>
							<td class="staticEmail"><label class="">ID</label>
							</td>
							<td><input type="text" id="u_id" maxlength="10"
								class="form-control" /></td>
						</tr>
						<tr>
							<td class="staticEmail"><label>PW</label></td>
							<td><input type="password" id="u_pw" maxlength="15"
								class="form-control" /></td>
						</tr>
						<tr>
							<td colspan="2" class="" align="right" ><input type="button"
								value="회원가입" class="btn btn-primary login_btn" onclick="javascript:location.href='/join'"/>
								<input type="button" id="btnLogin"
								value="로그인" class="btn btn-primary login_btn" /></td>
						</tr>
						<tr>
							<td colspan="2" class="" align="right"><a href="/find"><font
									size="2">아이디/비밀번호 찾기</font></a></td>
						</tr>
					</table>
				</form>
				</div>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
	<script>
		function pop(){
			var pop = document.getElementById("pop");
			pop.style.display = "block";
		}
		
		function popClose(){
			document.getElementById("pop").style.display = "none";
		}
		
		function exe(){
			location.href="disease"
		}
		
		function more(){
			location.href="disease"
		}
		
		function showMore(){
	    	document.frm.submit();
	    }
		
		<%-- 체크된 값 가져오기 --%>
		function checked(){
			var check_count = document.getElementsByName("s_cd").length;
			var arr = [];
			var cnt = 0;
	        for (var i=0; i<check_count; i++) {
	            if (document.getElementsByName("s_cd")[i].checked == true) {
	                arr[cnt++] = document.getElementsByName("s_cd")[i].value;
	            }
	        }
	        return arr;
		}

		<%-- 모달 레이어 팝업 --%>
	    $(document).ready(function(){
			$(".btnModal").on("click", function(event) {
				$("#myModal").modal('show');
				var id = $(this).attr("id");
				var title = $(this).attr("title");
				$(".symptom-title").empty();
				$(".symptom-title").append(title);
				$.ajax({
					url: "Body_Symptom",
					type: "post",
					data: "B_CD="+id,
					dataType: "json"
				}).done(function(data){
					var res = data.res;
					var tag = "";
					
					for(var i = 0; i < res.length; i += 3){
						tag += "<tr>";
						tag += "<td><input type='checkbox' class='symp' name='s_cd' value='" + res[i].s_cd;
						tag += "'/>" + res[i].s_nm + "</td>";
						if(res[i+1] != null){
							tag += "<td><input type='checkbox' class='symp' name='s_cd' value='" + res[i+1].s_cd;
							tag += "'/>" + res[i+1].s_nm + "</td>";
						}
						if(res[i+2] != null){
							tag += "<td><input type='checkbox' class='symp' name='s_cd' value='" + res[i+2].s_cd;
							tag += "'/>" + res[i+2].s_nm + "</td>";
						}
						tag += "</tr>";
					}
					$("#content").append(tag);
				});
			});
			
			$('#showMore').on("click", function(){
				var arr = checked();
				console.log('arr : ' + arr.length);
				
				$.ajax({
					url: "showMore",
					type: "post",
					data: "s_cd=" + arr,
					dataType: "json"
				}).done(function(data){
					console.log("loginChk : " + data.loginChk)
					if(data.loginChk == false){
						alert('로그인이 필요합니다.');
						$("#loginPopup").modal('show');
					}else{
					
					if(data.hvo.length > 0)
						self.location = "/disease";
					else
						alert("선택한 증상의 검색 결과가 없습니다.");
					}
				});
			});
			
			$('#myModal').on('shown.bs.modal', function () {
				$("#content").empty();
				$(".symptom-title").empty();
			});
			
			$('#myModal').on('hidden.bs.modal', function() {
			});
		});
	    
	  
	    $(".symp").change(function() {
	    	 $('input:checkbox[name="s_cd"]').each(function() {

	    	     if( $('input:checkbox[name="s_cd"]:cheked').length <= 3){ //값 비교

	    	    	 $('input:checkbox[name="s_cd"]').attr("checked", true);

	    	            if(this.checked){//checked 처리된 항목의 값
	    	                alert("선택되었습니다."); 
	    	          	} else {
	    	          		alert("너무 많은 증상이 선택되었습니다.");
	    	          	}
	    	      }
	    	 });


		    $("#showMore").on("click", function(event) {
		    	$("input:checkbox[name='s_cd']:checked").each(function(){
		    		var checkedSymp = $(this).val();
					console.log(checkedSymp);
		    	});
		    });
		});
	</script>
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
					
					$("#loginPopup").modal('hide');
					$('#header_test').load(window.location.href+'#header_test');
					
					
					$("#showMore").click();
					
				}else{
					alert("아이디 또는 비밀번호를 다시 확인 하시길 바랍니다.")
				}
		
			});
			

		});
	});
</script>
</body>
</html>