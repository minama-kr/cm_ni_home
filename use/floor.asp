<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>층별안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.subtitle{
			padding-top:5px;
		}

		.blue_sq{
			font-size:13px;
		}

		.floor_div{
			margin-top:20px;
			overflow: hidden;
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
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
			<div style="background:url(/images/page/use/floor_main.jpg) no-repeat 0 top; width:100%; height:275px;">
				<h2>층별안내</h2>
				<h4 class="blind">
					천안시립노인전문병원은 축적된 경험으로 어르신 한 분 한 분을 소중히 모시겠습니다.
				</h4>
				<p class="blind">
					노인질환 및 뇌졸중, 치매, 말기 암 등 장기적인 간병을 요하는 만성질환을 겪으시는 어르신들께 천안시립노인전문병원은 섬김의 마음으로 병원장 이하 임직원 모두 최선을 다하여 모시도록 하겠습니다.
				</p>
			</div>
			<div class="floor_div">
				<h3 class="subtitle left">4층 안내도 / 5병동</h3> 
				<span class="blue_sq right">입원실</span>
				<img src="/images/page/use/floor_01.jpg" alt=""/>
			</div>		

			<div class="floor_div">
				<h3 class="subtitle left">3층 안내도 / 3병동</h3> 
				<span class="blue_sq right">중환자실, 입원실, 호스피스 실</span>
				<img src="/images/page/use/floor_02.jpg" alt=""/>
			</div>

			<div class="floor_div">
				<h3 class="subtitle left">2층 안내도</h3> 
				<span class="blue_sq right">물리치료실, 작업치료실, 언어치료실, 교양실, 레크레이션실, 사회복지사실, 자원봉사실, 목욕탕</span>
				<img src="/images/page/use/floor_03.jpg" alt=""/>
			</div>
					
			<div class="floor_div">
				<h3 class="subtitle left">1층 안내도</h3> 
				<span class="blue_sq right">외래진료실, 주간보호 센터, 임상병리실, 방사선실, 약국, 총무부, 원무과, 상담실, 카페</span>
				<img src="/images/page/use/floor_04.jpg" alt=""/>
			</div>

			<div class="floor_div">
				<h3 class="subtitle left">지하 1층 안내도</h3> 
				<span class="blue_sq right">어르신 식당, 가족식당</span>
				<img src="/images/page/use/floor_05.jpg" alt=""/>
			</div>
					

				
				
				
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>