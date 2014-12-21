<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>운동치료</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{		
			margin-bottom:37px; 
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
			height:120px;
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
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".section:last").css("margin-bottom","0px");

			$(".part").each(function (index) {	
				$(".part").eq(index).find("ul li dl:first").css("border-top","1px solid #dddddd");
			});

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
			<div style="background:url(/images/page/rhbl/exercise_main.jpg) no-repeat 0 top; width:100%; height:283px; margin-bottom:14px;">
				<h2>운동치료</h2>
				<h4 class="blind">
					증세 및 긴 병환이나 노환으로 약화된 근육을 1:1 맞춤 운동치료를 통한 체계적인 관리
				</h4>
				<p class="blind">
					어르신들의 만성적 증세 또는 긴 병환으로 약화된 근육을 전문 의료진과 협의를 통한 전문 치료사의 단계적이며 체계적인 관리를 통해 근육량을 높여 생활의 자유로움을 도모하여 드립니다.
				</p>
			</div>
			<div class="section" style="height:105px;width:708px;text-align:justify;">
				<img style="margin-right:20px;"class="left" src="/images/page/rhbl/exercise_01.jpg" alt=""/>		
				<span style="width:535px;height:105px;overflow:hidden;padding-top:20px;">운동치료실에는 보바스 전문과정과 PNF 전문과정을 이수한 전문치료사들이 환자와 1대1의 운동치료를 실시하고 있으며, 손상된 부위의 근 긴장도와 움직임의 패턴 그리고 기능 장애를 개별화된 평가에 의해 치료를 하고 있으며, 환자 분에게 필요한 운동지도 처방과 환자 및 보호자에 대한 상담을 통하여 치료의 효과를 극대화시키고 있습니다.
				</span>
			</div>			
			<div class="section">
				<h3 class="subtitle">치료프로그램 및 효과</h3> 
				<div style="background:url(/images/page/rhbl/exercise_box.jpg) no-repeat; width:725px; height:883px;padding:23px 10px 17px 10px;">
					<div class="part">
						<p class="blue_sq">신경발달치료</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/exercise_02.jpg" alt="" />
								<dl>
									<dt class="bold">PNF(고유수용성신경근촉진법)</dt>
									<dd>고유수용기를 자극하여 신경근의 반응을 촉진하는 방법으로 결함이 있는 신경근은 근력저하, 협응부전, 근육단축, 관절 가동범위의 제한, 경직 등을 유발하며, 이러한 비정상적인 운동기능를 향상시키기 위해 치료사의 올바른 조작을 통해 좋은 결과를 이끌어 내는 치료 방법입니다.</dd>
								</dl>
							</li>
							<li>
								<img class="left" src="/images/page/rhbl/exercise_03.jpg" alt=""/>	
								<dl>
									<dt class="bold">BOBATH(보바스 치료)</dt>
									<dd>보바스 접근법을 이용하여 신체적 움직임을 다양하고 조절된 움직임을 통하여 적절한 근육의 긴장도를 유지 또는 정상적인 움직임을 재 학습시켜 자세조절과 기능적인 움직임을 가르치며, 환자의 기능적 상태에 가장 적합한 최대한의 잔존능력을 개발하는데 역점을 두고 있습니다.</dd>
								</dl>
							</li>
							<li>
								<img class="left" src="/images/page/rhbl/exercise_04.jpg" alt=""/>	
								<dl>
									<dt class="bold">NDT(중추신경계발치료)</dt>
									<dd>신경학적인 장애를 지니고 있는 분들의 상실된 기능과 신체 움직임을 획득하고 발달시키기 위해 이를 이해시키고 생체학적 정렬을 맞추어 신체 움직임과 호흡기능, 일상생활을 효율적으로 수행할 수 있도록 접근하여 치료하는 방법입니다.</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="part">
						<p class="blue_sq">매트 및 이동훈련</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/exercise_05.jpg" alt="" />
								<dl>
									<dd>근력과 기능적 관절가동범위 및 균형능력 등을 향상시켜 서기나 걷기 전까지 침대, 매트 및 휠체어에서 이루어 질 수 있는 모든 활동(일상 생활 동작)을 배우게 됩니다.</dd>
								</dl>
							</li>							
						</ul>
					</div>
					<div class="part">
						<p class="blue_sq">보행훈련</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/exercise_06.jpg" alt="" />
								<dl>
									<dd>근육의 마비 및 협응 능력의 상실에 따른 비정상적인 보행 패턴을 교정하여 다양한 환경 속에서 최대한 효율적인 보행을 할 수 있도록 도움을 줍니다.</dd>
								</dl>
							</li>							
						</ul>
					</div>
					<div class="part">
						<p class="blue_sq">기능적 전기자극 치료</p>
						<ul>
							<li>
								<img class="left" src="/images/page/rhbl/exercise_07.jpg" alt="" />
								<dl>
									<dd>마비된 근육의 위축 및 변성을 예방하고 수익적 움직임을 도와줍니다. 어깨 관절의 아탈구를 예방하고 보행시 발이 바닥에 끌리는 것을 방지해서 팔과 다리의 기능향상에 도움이 됩니다.</dd>
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