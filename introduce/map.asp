<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>오시는 길</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		#itfsMap{
			width:724px;
			height:355px;
			border:1px solid #bdbdbd;
			margin:32px 0px 0px 0px;
		}

		.addr_detail{
			margin-left:20px;
			font-size:12px;
		}

		.ask_detail{
			margin-left:34px;
			font-size:12px;
		}


		.car_detail{
			 width:100%; 
			 height:80px;
			 margin-bottom:28px;
		}

		.bus_num{
			font-size:18px;
			font-weight: bold;
			color:#ff7f41;
			margin:10px 0px 6px 15px;
		}

		.bus_sche tr td{
			padding-left:20px;
			text-align: left;
			height: 35px;
		}

		.shuttle_sche tr td{
			padding-left:15px;
			text-align: left;
			height: 35px;
		}

		.shuttle{
			padding-left:15px;
			padding-top:12px;
			font-size:14px;
			font-weight:bold;
		}
		.arrow{
			margin:3px 10px 0px 10px;
		}

		.bus_down{
			float:right;
			background: url(/images/page/introduce/bus_btn.jpg) no-repeat;
			width:115px;
			height:25px;
			font-size: 13px;
			text-align: center;
			color:#fff !important;
			padding-top: 1px;
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>

<%
	strUrl = LCase(Request.ServerVariables("SERVER_NAME"))

	If strUrl = "www.cheonangh.co.kr" Then 
		NaverMapKey = "e6082b3abf3d5a89891b904621e0a35a"
	ElseIf strUrl = "cheonangh.co.kr" Then 
		NaverMapKey = "fa2843a7cec2cb086154e24fd338f467  "
	ElseIf strUrl = "pjy6211.cafe24.com" Then 
		NaverMapKey = "c004bc80989079194901b9b90930819a"		
	End if

	
%>
	<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=<%=NaverMapKey%>"></script>
	<script type="text/javascript">
		$(document).ready(function(){	
			$(".ask_detail:first").css("margin-left","20px");

	/*naver*/
	var oPoint = new nhn.api.map.LatLng(36.825416, 127.2268644);  //위에서 얻은 x,y값을 이렇게 작성하여 준다 (y값,x값)
		nhn.api.map.setDefaultPoint('LatLng');
		oMap = new nhn.api.map.Map('itfsMap', {
					point : oPoint,
					zoom : 12, // – 초기 줌 레벨은 10으로 둔다.
					nableWheelZoom : true,
					enableDragPan : true,
					enableDblClickZoom : false,
					mapMode : 0,
					activateTrafficMap : false,
					activateBicycleMap : false,
					minMaxLevel : [ 1, 14 ],
					size : new nhn.api.map.Size(724, 355)
		 }); 

		var mapZoom = new nhn.api.map.ZoomControl();
			mapZoom.setPosition({left:20, bottom:30});
			oMap.addControl(mapZoom); 

		var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
			oMap.addControl(oMapTypeBtn);
			oMapTypeBtn.setPosition({
				bottom : 30,
				right : 20
		});
		
		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 

		var oMarker1 = new nhn.api.map.Marker(oIcon, { title : '천안시립노인전문병원' });
				oMarker1.setPoint(oPoint);
				oMap.addOverlay(oMarker1);
		var oLabel1 = new nhn.api.map.MarkerLabel();
				oMap.addOverlay(oLabel1);
				oLabel1.setVisible(true, oMarker1); 

	/*//naver*/


		});
	</script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<div style="background:url(/images/page/introduce/map_main.jpg) no-repeat 0 top; width:100%; height:245px;">
				<h2>오시는 길</h2>
				<h4 class="blind">
					천안 시내에서 15분 거리에 자연 친화적인 천안시립노인전문병원이 있습니다.
				</h4>
				<p class="blind">
					분야별 뛰어난 전문의료진과 수려한 자연환경으로 어르신들의 건강은 물론 정신적인 치료까지 꾀함으로 어르신들의 삶의 질적향상은 물론 보다 빠른 쾌유를 위한 준비가 되어 있습니다.
				</p>		
			</div>			
			<div id = "itfsMap"></div>
			<div style="background:url(/images/page/introduce/bg_map_addr.jpg) no-repeat 0 top; width:100%; height:60px;margin-top:3px;padding:8px 0px 10px 20px;text-align:justify;">			
				<span class="blue_sq addr_detail">주소 : 충청남도 천안시 동남구 목천읍 송전리 431번지</span>
				<span class="blue_sq addr_detail">도로명 주소 : 충청남도 천안시 동남구 목천읍 삼방로 735</span><br/>				
				<span class="blue_sq ask_detail txt_00bcde">대표전화 : (041)521-1114</span>
				<span class="blue_sq ask_detail txt_00bcde">입원상담문의 : (041)521-1262</span>
				<span class="blue_sq ask_detail txt_00bcde">문의 Mail : <a class="txt_00bcde" href="mailto:cagh@cheonangh.co.kr">cagh@cheonangh.co.kr</a></span>
			</div>
			<span class="bold" style="font-size:16px;">찾아오시는 길</span>
			<div>
				<p class="blue_sq">자동차 이용시</p>
				<div class="car_detail">
					<img src="/images/page/introduce/map_01.jpg" alt="천안 IC진입. 천안로 사거리 좌회전. 동부 사거리. 천안시립노인전문병원"/>
				</div>
			</div>
			<!--버스 이용시-->			
			<p class="blue_sq">버스 이용시</p>
			<div>
				<p class="bus_num">390번
					<a class="bus_down" href="bus_390.zip" title="390번 노선도 다운로드">노선도 다운로드</a>
				</p>
				<div style="background:url(/images/page/introduce/map_tbl_bg_01.jpg) no-repeat 0 top;width:100%; height:75px;" >
					<table class="bus_sche" summary="390번 버스 이용안내" style="width:100%;">
						<caption>390번 버스 이용안내</caption>
							<colgroup>
								<col width="163"></col>
								<col width="98"></col>
								<col width="93"></col>
								<col width="93"></col>
								<col width="93"></col>
								<col width="93"></col>
								<col width="93"</col>
							</colgroup>									
							<tbody>
								<tr>
									<td>종합터미널 출발(기점)</td>
									<td>06:35(첫차)</td>
									<td>08:45</td>
									<td>10:00</td>
									<td>14:45</td>
									<td>16:15</td>
									<td style="padding-left:0px">20:35(막차)</td>									
								</tr>
								<tr>
									<td style="text-align:left;padding-left:20px;">석천 출발<span class="right" style="padding-right:19px;">(종점)</span></td>
									<td>07:40(첫차)</td>
									<td>09:50</td>
									<td>11:05</td>
									<td>15:50</td>
									<td>17:20</td>
									<td style="padding-left:0px">21:35(막차)</td>									
								</tr>
							</tbody>
					</table>
				</div>
				<div style="width:100%; height:170px;">
					<img src="/images/page/introduce/map_02.jpg" alt="종합터미널. 천안역. 신계초등학교. 천안시립노인전문병원. 석천리. 천안시립노인전문병원. 목천IC. 천안역"/>
				</div>
				<div>
					<p class="bus_num">391번
						<a class="bus_down" href="bus_391.zip" title="391번 노선도 다운로드">노선도 다운로드</a>
					</p>
					<div style="background:url(/images/page/introduce/map_tbl_bg_01.jpg) no-repeat 0 top; width:100%; height:75px;" >
						<table class="bus_sche" summary="391번 버스 이용안내">
							<caption>391번 버스 이용안내</caption>
								<colgroup>
									<col width="163"></col>
									<col width="93"></col>
									<col width="93"></col>
									<col width="93"></col>
									<col width="*"></col>
								</colgroup>									
								<tbody>
									<tr>
										<td>종합터미널 출발(기점)</td>
										<td>11:45(첫차)</td>
										<td>17:45(막차)</td>
										<td></td>
										<td></td>								
									</tr>
									<tr>
										<td style="text-align:left;padding-left:20px;">석천 출발<span class="right" style="padding-right:19px;">(종점)</span></td>
										<td>06:45(첫차)</td>
										<td>12:50</td>
										<td>18:50(막차)</td>		
										<td></td>				
									</tr>
								</tbody>
						</table>
					</div>
					<div style="width:100%; height:170px;">
						<img src="/images/page/introduce/map_03.jpg" alt="종합터미널. 천안역. 신계초등학교. 천안시립노인전문병원. 석천리. 천안시립노인전문병원. 응원리. 천안역"/>
					</div>
				</div>
			</div>
			<!--//버스 이용시-->	
			<!--병원 셔틀 버스-->
			
			<div style="background:url(/images/page/introduce/map_tbl_bg_02.jpg) no-repeat 0 top; width:100%; height:120px;margin-top:10px;" >
				<p class="shuttle">병원 셔틀버스</p>
				<table class="shuttle_sche" style="margin-top:8px;" summary="병원 셔틀버스 이용안내">
					<caption>병원 셔틀버스 이용안내</caption>
						<colgroup>
							<col width="215"></col>
							<col width="93"></col>
							<col width="93"></col>
							<col width="93"></col>
							<col width="93"></col>
							<col width="*"></col>
						</colgroup>									
						<tbody>
							<tr>
								<td>
									<span class="txt_00bcde">노인전문병원</span>
									<img class="arrow" style="margin-left:10px;"src="/images/page/introduce/arrow.png" />
									<span style="margin-left:7px;">충무병원</span>
								</td>
								<td>08:50</td>
								<td>13:00</td>
								<td>15:30</td>
								<td>17:40</td>
								<td></td>										
							</tr>
							<tr>
								<td>
									<span style="margin-left:12px;">충무병원</span>
									<img class="arrow" style="margin-left:20px;" src="/images/page/introduce/arrow.png" />
									<span class="txt_00bcde">노인전문병원</span>								
								</td>
								<td>07:40</td>
								<td>09:30</td>
								<td>13:45</td>
								<td>16:10</td>
								<td></td>								
							</tr>

						</tbody>
				</table>
			</div>
			<span class="right">※병원 셔틀버스 이용전 원무과에 반드시 문의하시길 바랍니다. <span style="color:#0fa8bc;">T.041)521-1114</span></span>
			<!--//병원 셔틀 버스-->
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>