<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../header.jsp"/>
		<div class="content_wrap">
			<div class="content">
				<img src="img/body_img.png" alt="Body" usemap="#bodymap" name="point">
				<map name="bodymap">
					<area shape="rect" itemid="" alt="전신" title="전신" coords="1,54,165,123" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img2.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="등" title="등" coords="3,116,165,234" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img3.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="엉덩이" title="엉덩이" coords="3,239,165,417" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img4.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="기타" title="기타" coords="2,419,167,542" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img5.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="머리/얼굴" title="머리/얼굴" coords="167,52,333,111" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img6.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="목/가슴" title="목/가슴" coords="167,113,332,171" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img7.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="배" title="배" coords="167,175,333,233" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img8.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="골반" title="골반" coords="167,236,334,293" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img9.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="팔/다리" title="팔/다리" coords="168,297,334,502" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img10.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
					<area shape="rect" alt="손/발" title="손/발" coords="169,506,334,543" href="javascript:pop()" onmouseover="if(document.images) point.src='img/body_img11.png'" onmouseout="if(document.images) point.src='img/body_img.png'"/>
				</map>
			<div  id="pop">
				<form>
					<table class="table table-hover" id="table1">
					<colgroup>
					</colgroup>
					<thead>
						<tr class="table-primary">
							<th scope="col" colspan="2">신체명</th>
							<th scope="col" style="background-color: white"><a href="#" onclick="popClose()">닫기</a></th>
						</tr>
					</thead>
						<tr>
							<td><input type="checkbox" class="symp"/>증상1</td>
							<td><input type="checkbox" class="symp"/>증상2</td>
							<td><input type="checkbox" class="symp"/>증상3</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="symp"/>증상4</td>
							<td><input type="checkbox" class="symp"/>증상5</td>
							<td><input type="checkbox" class="symp"/>증상6</td>
						</tr>
						<tr style="text-align: right;">
							<td></td>
							<td></td>
							<td>
								<input type="button" value="더보기" onclick="more()"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<a href="#layer2" class="btn-example">딤처리 팝업레이어 1</a>
				<div class="dim-layer">
				    <div class="dimBg"></div>
				    <div id="layer2" class="pop-layer">
				        <div class="pop-container">
				            <div class="pop-conts">
				                <!--content //-->
				                <form>
									<table class="table table-hover" id="table1">
									<colgroup>
									</colgroup>
									<thead>
										<tr class="table-primary">
											<th scope="col" colspan="3">신체명</th>
										</tr>
									</thead>
										<tr>
											<td><input type="checkbox" class="symp"/>증상1</td>
											<td><input type="checkbox" class="symp"/>증상2</td>
											<td><input type="checkbox" class="symp"/>증상3</td>
										</tr>
										<tr>
											<td><input type="checkbox" class="symp"/>증상4</td>
											<td><input type="checkbox" class="symp"/>증상5</td>
											<td><input type="checkbox" class="symp"/>증상6</td>
										</tr>
									</table>
								</form>
								<div class="btn-r">
									<%--<input type="button" value="더보기" onclick="more()"/> --%>
				                    <a href="#" class="btn-layerMore">더보기</a>
				                    <a href="#" class="btn-layerClose">닫기</a>
				                </div>
				                <!--// content-->
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<!-- <script type="text/javascript" src="</script'>http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> -->
<script type="text/javascript" src="</script'>http://davidlynch.org/projects/maphilight/jquery.maphilight.min.js"></script>
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
		
		
		$('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    });
	    function layer_popup(el){

	        var $el = $(el);    //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });

	    }
		
	</script>
</body>
</html>