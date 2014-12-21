<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>사회사업소개</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{
			margin-bottom:40px; 
		}

		.part_title{
			color:#000; 
			font-size:15px;
			width:180px;
			padding-top:18px;
		}

		.part_detail{
			margin:90px 25px auto 25px;
			text-align:justify;
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
			<div style="background:url(/images/page/social/intro_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>사회사업소개</h2>
				<h4 class="blind">
					천안시립노인전문병원은 천안시 노인의료 복지사업의 일환으로 건립되었습니다.
				</h4>
				<p class="blind">
					천안시의 노인복지사업 정책에 맞춰 천안시립노인전문병원은 사회사업활동에도 적극적인 활동을 펼쳐 지역주민이 보다 행복하고 건강한 삶의 질을 높일 수 있는 사회사업도 더불어 주력하고 있습니다.
				</p>
			</div>
			<div class="section">
				<h3 class="subtitle">사회복지란?</h3> 
				<span class="fr_text">사회복지(Social Welfare)는 인간의 행복을 증진시키기 위해서 정부나 민간이 제반 프로그램이나 서비스 또는 시설을 통해서 사회적 장애(Social Dysfunction)를 예방하고 경감시키기 위한 체계적 조직적 노력이다.</span>			
			</div>	
			<div class="section">
				<h3 class="subtitle">사회사업실에서는...</h3> 
				<span class="fr_text">본원을 이용하는 환자, 가족들이 보다 편안하게 가정에서와 같이 생활할 수 있도록 상담과 다양한 프로그램을 지원하여  입원생활동안 불편함이 생기기 않도록 돕는 역할을 하고 있습니다.</span>			
			</div>	
			<div class="section">
				<h3 class="subtitle">사회사업분야</h3> 
				<div class="left" style="background:url(/images/page/social/intro_part1.jpg) no-repeat 0 top;width:180px; height:245px;">
					<p class="txt_center bold part_title">집단프로그램 운영</p>
					<p class="part_detail">환자의 심리 및 욕구 등에 맞춰 원내에서 다양한 프로그램을 운영</p>
				</div>
				<div class="left" style="background:url(/images/page/social/intro_part2.jpg) no-repeat 0 top;width:180px; height:245px;">
					<p class="txt_center bold part_title">심리, 경제적 문제 상담</p>
					<p class="part_detail">경제적 문제 및 노인학대, 폭력 등에 대한 상담을 실시하여 해결 방안 제시</p>
				</div>
				<div class="left" style="background:url(/images/page/social/intro_part3.jpg) no-repeat 0 top;width:180px; height:245px;">
					<p class="txt_center bold part_title">환자 및 보호자 상담</p>
					<p class="part_detail">진료적 부분 외에도 환자 개별상담 및 보호자 상담 진행 후 복지정보를 제공하며, 가족참여 프로그램 연계</p>
				</div>
				<div class="left" style="background:url(/images/page/social/intro_part4.jpg) no-repeat 0 top;width:180px; height:245px;">
					<p class="txt_center bold part_title">환자 만족도 조사 실시</p>
					<p class="part_detail">매년 2회 환자 만족도 조사를 실시하여, 환자 및 보호자에게 부족한 부분에 대해 조사하고 추후에 적극적인 반영</p>
				</div>
				<span class="right" style="margin-right:9px;">※문의전화 : 사회사업실 사회복지사 <span class="txt_00bcde">Tel.041-521-1280</span></span>

			</div>
		
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>