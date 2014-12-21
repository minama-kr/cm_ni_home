<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>시설안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{
			margin-bottom:30px; 
		}

		.facility ul{			
			height:255px;
			width:730px;
			margin-top: 6px;
			padding-bottom:3px;
			overflow: hidden;
		}
		.facility ul li{	
			margin-right: 6px;
		}
		
		.underline{
			width:560px;
			border-bottom:1px solid #9d9d9d;
			margin-left:165px;
			text-align: right;
		}

		.underline span{
			margin-top:5px;
			vertical-align: bottom;
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
			<div style="background:url(/images/page/use/facility_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>시설안내</h2>
				<h4 class="blind">
					천안시립노인전문병원은 어르신들을 위한 최상의 시설과 환경을 갖추고 있습니다.
				</h4>
				<p class="blind">
					어르신들의 질병에 대한 보다 빠른 쾌유를 위해 천안시립노인전문병원은 진료진뿐만 아닌 시설에도 최고를 추구하고 있습니다. 최고의 노력이 최선의 치료라고 임직원 모두 믿고 실천하고 있습니다.
				</p>
			</div>
			
			<div class="section">
				<h3 class="subtitle left">병원 외부전경</h3> 	
				<div class="underline">
					<span>어르신들께서 편안히 치료를 받으실 수 있도록 최상의 자연친화적 환경이 조성되어 있습니다.</span>
				</div>			
				<div class="facility">
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_01.jpg" alt=""/>
							<p>천안시립노인전문병원 전경</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_02.jpg" alt=""/>
							<p>천안시립노인전문병원 전경</p>
						</li>						
					</ul>
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_03.jpg" alt=""/>
							<p>병원 단지 내 분수대</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_04.jpg" alt=""/>
							<p>병원 단지 내 물레방아</p>
						</li>						
					</ul>
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_05.jpg" alt=""/>
							<p>병원 단지 내 산책로</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_06.jpg" alt=""/>
							<p>병원 단지 내 인공폭포</p>
						</li>						
					</ul>	
				</div>
			</div>


			<div class="section">
				<h3 class="subtitle left">병원내부시설</h3> 	
				<div class="underline">
					<span>어르신들의 보다 빠른 쾌유를 위한 쾌적한 시설과 함께 최신의 장비를 구비하고 있습니다.</span>
				</div>			
				<div class="facility">
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_07.jpg" alt=""/>
							<p>병원 앞 전경</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_08.jpg" alt=""/>
							<p>병원로비(접수실)</p>
						</li>						
					</ul>
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_09.jpg" alt=""/>
							<p>물리치료실 전경</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_10.jpg" alt=""/>
							<p>물리치료실</p>
						</li>						
					</ul>
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_11.jpg" alt=""/>
							<p>물리치료실</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_12.jpg" alt=""/>
							<p>물리치료실</p>
						</li>						
					</ul>	
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_13.jpg" alt=""/>
							<p>입원실</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_14.jpg" alt=""/>
							<p>방사선실</p>
						</li>						
					</ul>	
					<ul>
						<li class="left">							
							<img src="/images/page/use/facility_15.jpg" alt=""/>
							<p>병실복도</p>
						</li>
						<li>							
							<img src="/images/page/use/facility_16.jpg" alt=""/>
							<p>병원내 약국</p>
						</li>						
					</ul>	
				</div>
			</div>

		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>