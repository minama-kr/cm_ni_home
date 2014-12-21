<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>센터소개</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{
			margin-bottom:40px; 
		}
		
		.therapy{
			font-weight: bold;
			color:#000;
		}
		
		.topline{
			 background:url(/images/page/rhbl/topline.jpg) no-repeat 0 top;
			 padding-top:4px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".section:last").css("margin-bottom","0px");
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
			<div style="background:url(/images/page/rhbl/rhbl_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>센터소개</h2>
				<h4 class="blind">
					천안시립노인전문병원은 어르신들의 증세에 따라 맞춤 재활센터를 운영합니다.
				</h4>
				<p class="blind">
					어르신들의 증세에 가장 효과적인 재활 프로그램을 적용하며 이는 운동, 작업, 통증치료로 구분되어집니다. 보다 빠른 어르신들의 쾌유를 위해 천안시립노인전문병원은 재활방법을 끊임없이 연구하여 효과를 거두고 있습니다.
				</p>
			</div>
			<div class="section">
				<h3 class="subtitle">치료프로그램</h3>				
				<div style="background:url(/images/page/rhbl/brace.jpg) no-repeat 0 top; width:100%; height:65px; padding-left:30px;">
					<p><span class="therapy">운동치료 : </span>신경발달치료, 매트 및 이동훈련, 보행훈련, 기능적 전기자극 치료</p>
					<p><span class="therapy">작업치료 : </span>단순·복잡·특수작업치료, 일상생활동작치료, 연하곤란치료, 치매인지치료</p>
					<p><span class="therapy">통증치료 : </span>온열 및 냉 치료, 전기치료, 공기압박치료, 견인치료, 도수치료</p>					
				</div>	
			</div>
			<div class="section">
				<h3 class="subtitle">재활전문치료센터는?</h3> 
				<div style="background:url(/images/page/rhbl/rhbl_bg_01.jpg) no-repeat 0 top;height:220px;">
					<p style="padding:30px 30px 20px 230px;text-align:justify;">
					<span class="topline">사람의</span> 머리속에 있는 중추신경계(대뇌, 소뇌, 뇌교, 시상 등)는 외부의 다양하고 복잡한 정보를 처리하는 중요한 부분으로, 이 중추신경계가 출혈, 경색, 사고 등 원인으로 손상되어 팔, 다리 등의 신체에 기능 장애가 발생한 경우, 재활의학전문의의 진단에 따라 개인에 맞는 재활치료 프로그램을 적용하게 됩니다. 각각의 환자에게 최적의 치료방법으로 처방된 재활치료 프로그램은 정상적인 움직임을 촉진시키며, 비정상적인 근 긴장도 및 움직임의 패턴을 조절해 좀 더 쉽고 효율적인 방법으로 움직일 수 있도록 하는 것으로, 환자가 최대한 빠른 시간에 정상에 가까운 생활을 영위할 수 있도록 손상된 신체 기능을 회복시켜 줍니다.
					</p>
				</div>	
			</div>	
			<div class="section">
				<h3 class="subtitle">재활전문치료 대상자</h3> 
				<div style="background:url(/images/page/rhbl/rhbl_bg_02.jpg) no-repeat 0 top;height:155px;">
					<p style="padding:40px 30px 40px 230px;text-align:justify;">
					<span class="topline">뇌졸중</span>(뇌출혈, 뇌경색), 외상성 뇌손상, 척추손상, 파킨슨병 등의 중추신경계 손상 및 장애환자와 심폐질환, 근골격계 질환(근육질환, 화상, 절단 등), 노인성 질환(퇴행성질환)으로 근력이 약화되거나, 이동, 보행 등과 같이 일상생활에 제한이 있는 환자분들을 대상으로 합니다.
					</p>
				</div>	
			</div>	
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>