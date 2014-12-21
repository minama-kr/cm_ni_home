<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>작업치료</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{		
			margin-bottom:35px; 
		}

		.blue_sq{
			color:#000;
		}
		.part{
			margin:0px 20px 0px 18px;
			height: auto;
			width:670px;
			overflow:hidden;
		}

		.part ul{
			width:100%;
			margin:15px 0px 10px 0px;
		}

		.part ul li{
			width:100%;
			height:115px;
			margin:10px 0px 0px 0px;
		}

		.part ul li img{
			margin-top:20px;
			margin-right:40px;
		}

		.part ul li dl{
			padding-top:15px;
			margin-top:-20px;
			text-align:justify;
			overflow:hidden;
			border-top:1px solid #dddddd;
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
			<div style="background:url(/images/page/rhbl/work_main.jpg) no-repeat 0 top; width:100%; height:283px; margin-bottom:14px;">
				<h2>작업치료</h2>
				<h4 class="blind">
					일상생활에 어려움을 호소하는 어르신의 특정 질병에 대한 맞춤 작업치료
				</h4>
				<p class="blind">
					어르신들이 질병으로 인해 저하된 신체 기능을 진단하고 이에 맞는 작업치료를 통해 일상생활에 지장이 없도록 맞춤형 훈련을 통해 어르신들의 일상생활 복귀를 보다 빨리 돕고자 하는 치료입니다.
				</p>
			</div>
			<div class="section" style="height:105px;width:710px;">
				<img style="margin-right:20px;"class="left" src="/images/page/rhbl/work_01.jpg" alt=""/>		
				<span style="width:535px;height:105px;overflow:hidden;text-align:justify;padding-top:20px;">
					작업치료프로그램은 주로 <span class="txt_00bcde">뇌졸중</span>(뇌출혈, 뇌경색), <span class="txt_00bcde">외상성뇌손상, 척추손상, 심폐질환, 근골격계질환</span>(근육질환, 화상, 절단), <span class="txt_00bcde">노인성 질환</span>(치매, 퇴행성 질환), <span class="txt_00bcde">정신과질환</span>(우울증, 신경증) 등으로 일상생활에 필요한 작업을 수행함에 있어 어려움을 호소하는 모든 환자분들을 대상으로 합니다.
				</span>
			</div>			
			<div class="section">
				<h3 class="subtitle">치료프로그램 및 효과</h3> 
				<div style="background:url(/images/page/rhbl/work_box.jpg) no-repeat; width:710px; height:600px;padding:20px 10px 17px 10px;">
					<div class="part">
						<p class="blue_sq">단순·복잡·특수치료</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/work_02.jpg" alt="" />
								<dl>
									<dd>상체의 관절 움직임 범위를 향상시키고, 근력을 증진시키며, 손가락의 소근육 발달로 민첩성을 증진시켜 줍니다.</dd>
								</dl>
							</li>							
						</ul>
					</div>
					<div class="part">
						<p class="blue_sq">매트 및 이동훈련</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/work_03.jpg" alt="" />
								<dl>
									<dd>식사하기, 세수하기, 이동하기 등 기본적인 일상생활동작부터 요리하기, 돈계산하기, 청소하기 등의 기능적 일상 생활동작에 이르기까지 생활에 필요한 동작들을 환자의 상태와 필요에 맞추어 훈련함으로써 가정 및 사회로의 복귀를 도와드립니다.</dd>
								</dl>
							</li>							
						</ul>
					</div>
					<div class="part">
						<p class="blue_sq">연하곤란치료</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/work_04.jpg" alt="" />
								<dl>
									<dd>연하곤란은 입안에서 음식물을 삼킬 수 있는 형태를 만들어 삼키는 능력이 저하된것을 말합니다. 전문의의 정확하고 구체적인 진단평가에 따라 앉은 자세, 머리자세, 턱의 움직임, 혀의 움직임과 감각등의 복합적인 요소를 평가하고 치료합니다.</dd>
								</dl>
							</li>							
						</ul>
					</div>
					<div class="part">
						<p class="blue_sq">치매인지치료</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/work_05.jpg" alt="" />
								<dl>
									<dd>진행성 질환인 치매의 기억력, 지남력, 언어장애와 배회, 망각, 우울등의 증상을 완화하기 위한 인지적 접근과 현재의 신체적 기능을 유지 및 증진시키기 위한 활동을 합니다.</dd>
								</dl>
							</li>							
						</ul>
					</div>				
				</div>				
			</div>
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>