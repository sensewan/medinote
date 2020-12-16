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
	
	.disTab{
		margin: 0px auto;
		width: 100%;
		height: 700px;
		overflow: auto;
	}
	
	#table1 {
            width: 100%;
            margin-left: auto;
            margin-right: auto;
            /* background-color: rgba( 255, 255, 255, 1 ); */
        }
       
    .text-muted{
    	display: inline-block;
    	position: relative;
    	text-align: right;
    	margin-top:5px;
     }   
	
	.modal{
		margin-top:50px;
	}
	
	.modal-content{
		width:800px;
	}
	
	.content_info{
		width:1200px;
		margin: 0 auto;
	}
	
	.content_wrap{
		margin-top: 80px;
	}
	
</style>
</head>
<body>
	<div class="wrap">
		<%@include file="../header.jsp" %>
		<div class="content_wrap">
				<div class="content_info">
					<p class="text-muted" style="font-size: 20px; margin: 10px auto;">
						선택한 증상 : 
						<c:forEach var="vr" items="${s_nm }" varStatus="s">
							<c:if test="${s.index ne 0}">
								,&nbsp;
							</c:if>
							${vr }
						</c:forEach>
					</p><br/>
					<p class="text-danger" style="font-size: 14px; font-weight:bold; text-align: left; margin-bottom: 3px; margin-right: 5px;">“진료과를 선택하면 내 주변에서 해당 진료과를 진료하는 병원을 지도에 나타내줍니다.” </p>
					</div>
			<div class="content">
				<div class="disTab">
					<table class="table table-hover" id="table1">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="50%">
					</colgroup>
					<thead>
						<tr class="table-primary">
							<th scope="col">번호</th>
							<th scope="col">병명</th>
							<th scope="col">진료과</th>
						</tr>
					</thead>
					
					<c:forEach var="vo" items="${hvo }" varStatus="g">
						<tr>
							<td>${g.count }</td>
							<td>${vo.d_nm }</td>
							<td>
							<c:set var="dept" value="${fn:split(vo.m_nm,',') }"></c:set>
							<c:forEach var="m_nm" items="${dept}" varStatus="a">
								<c:if test="${a.count != 1 }">,&nbsp;</c:if>
								<a href="#" class="dept">
								${m_nm }
								</a>
							</c:forEach>
							</td>
						</tr>
					</c:forEach>
						
					</table>
				</div>
				
					
				
				
				</div>
			</div>
		</div>
		
		<!-- 지도 -->
		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
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
						<div id="map" style="width:500px;height:400px;"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div id="map2" style="width:500px;height:400px;"></div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=90f4e8f76323a3fb51ab67576dbabd50&libraries=services,clusterer,drawing"></script>
	<script>
	
	<%-- 모달 레이어 팝업 --%>
	
    $(document).ready(function(){
			// ip geolocation 시작
			var lat = 37.566826;
			var lag = 126.9786567;
	
		
			  if (navigator.geolocation) {
			    navigator.geolocation.getCurrentPosition(showPosition);
			  } 
			
			
			function showPosition(position) {
			  lat = position.coords.latitude;
			  lag = position.coords.longitude;
			  
			}
			// ip geolocation 끝
		$(".dept").on("click", function(event) {
			$("#myModal").modal('show');
			var id = $(this).text();
			$(".modal-title").text(id);
			
			// 지도 시작
			
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(lat, lag), // 지도의 중심좌표
			        level: 3, // 지도의 확대 레벨
			    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 
			
			
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(id, placesSearchCB, {
				location : new kakao.maps.LatLng(lat, lag),
				radius : 2000
			}); 
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();
			        

			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       
					
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        //map.setBounds(bounds);
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			        alert('현재 범위 내 검색 결과가 존재하지 않습니다.');
			        return;

			    } else if (status === kakao.maps.services.Status.ERROR) {

			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;

			    }
			}

			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) ,
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
			
			kakao.maps.event.addListener(map, 'dragend', function() {
				var latlng = map.getCenter();
				var lat = latlng.getLat();
				var lng = latlng.getLng();
				
				ps.keywordSearch(id, placesSearchCB, {
					location : new kakao.maps.LatLng(lat, lng),
					radius : 2000
				}); 
			});
			
			
			// 지도 끝
		
		});
    });
		
    
	</script>
</body>
</html>