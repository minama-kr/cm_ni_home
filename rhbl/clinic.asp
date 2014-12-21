<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>전문클리닉</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.section{
			margin-bottom:15px; 
		}

		.diagram_text{
			width:124px;
			text-align: center;
			color:#000;
			font-size:13px;
			font-weight: bold;	
			margin-right:26px;	
			margin-top:43px;	
			line-height: 1.2em;
		}

		.underline{
			width:560px;
			border-bottom:1px solid #9d9d9d;
			margin-left:165px;
			padding-bottom:5px;
		}

		.blue_sq{
			color:#000;
		}

		.top_contents{
			border-bottom:1px solid #dddddd;
			padding-bottom:20px;
		}

		.bottom_contents{
			margin:15px 0px 20px 0px;
		}

		.mg_t_25{
			margin-top:25px;
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".clinic_diagram .diagram_text:last").css("margin-right","0px");
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
			<div style="background:url(/images/page/rhbl/clinic_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>전문클리닉</h2>
				<h4 class="blind">
					천안시립노인전문병원은 전문클리닉 운영을 통하여 최상의 효과를 추구합니다.
				</h4>
				<p class="blind">
					어르신들의 각종 질병 및 노인성 만성질환에 따른 증세와 수반되는 통증 및 원활한 생활을 유지하시기 부족함이 없도록 전문클리닉을 운영하여 최선의 효과를 얻을 수 있도록 체계적 준비가 되어 있습니다.
				</p>
			</div>
			<div>
				<h3 class="subtitle left">전문클리닉 운영</h3> 
				<div class="underline">
					<span class="fr_text">천안시립노인병원은 어르신의 빠른 쾌유와 질병 호전을 위해 최선을 다하고 있습니다.</span>
				</div>
				<div style="background:url(/images/page/rhbl/clinic_diagram.jpg) no-repeat 0 top; width:100%; height:130px;margin-top:10px;margin-bottom:28px;">
					<div class="clinic_diagram">		
						<p class="diagram_text left">뇌졸중클리닉</p>
						<p class="diagram_text left">치매 클리닉</p>
						<p class="diagram_text left">통증클리닉</p>
						<p class="diagram_text left" style="margin-top:35px;">연하곤란<br/>클리닉</p>
						<p class="diagram_text left" style="margin-top:35px;">골다공증<br/>클리닉</p>
					</div>
				</div>
			</div>	

			<div class="section">
				<p class="blue_sq">뇌졸중 클리닉</p>
				<div style="background:url(/images/page/rhbl/clinic_box_01.jpg) no-repeat 0 top; width:690px; height:135px; margin-top:10px;padding:20px 20px 20px 20px;">
					<p class="top_contents">뇌졸중클리닉에서는 뇌졸중의 위험인자를 가진 분들의 예방적 치료와 급성기 이후의 재활 및 후유증의 초소화를 위해 최신 진단 및 치료장비, 약물, 재활치료법으로 보다 빠르고 정확하게 치료합니다.</p>
					<div class="bottom_contents">
						<p class="txt_00bcde bold">뇌졸중의 정의</p>	
						<p>뇌졸중은 뇌혈관의 병변으로 인해 뇌혈관이 막히거나(뇌경색), 터져서(뇌출혈) 운동(전신, 편)마비, 손발저림, 손떨림, 언어장애, 두통, 현기증 등의 증세가 갑자기 나타나는 질환입니다.
						</p>	
					</div>
				</div>
			</div>

			<div class="section">
				<p class="blue_sq">치매 클리닉</p>
				<div style="background:url(/images/page/rhbl/clinic_box_02.jpg) no-repeat 0 top; width:690px; height:180px; margin-top:10px;padding:20px 20px 20px 20px;">
					<p class="top_contents">치매클리닉에서는 신경학적 진찰과 환자의 기억력, 판단력, 계산능력, 시간공간 지각능력, 언어능력 및 감정변화 등을 평가하기 위한 인지기능검사, 뇌파검사, 그리고 여러가지 내과적 검사를 통해 치매의 원인을 확인하고 혈관성 치매와 알쯔하이머병의 치매증상 호전을 위한 약물치료를 합니다.</p>
					<div class="bottom_contents">
						<p class="txt_00bcde bold">치매의 정의</p>	
						<p>치매는 사람의 정신(지적)능력과 사회적 활동을 할 수 있는 능력의 소실을 말하며, 어떤 사람의 일상생활의 장애를 가져올 정도로 충분히 심할 때, 우리는 이것을 "치매"라고 합니다. 즉 치매는 그 자체가 어떤 활동을 이야기하는 진단명이 아니라 단지 특정한 증상들이 나타나서 어떤 기준을 만족 시키는 경우를 이야기하는 하나의 증후군(증상복합체)입니다.
						</p>	
					</div>
				</div>
			</div>

			<div class="section">
				<p class="blue_sq">통증 클리닉</p>
				<div style="background:url(/images/page/rhbl/clinic_box_02.jpg) no-repeat 0 top; width:690px; height:180px; margin-top:10px;padding:20px 20px 20px 20px;">
					<p class="top_contents">모든 의학을 통증이란 주제로 재정리하여 연구하는 학문을 통증의학이라 할 수 있으며, 이것을 이용하여 통증 	환자를 전문적으로 치료하는 치료단위가 통증클리닉입니다.
						<span class="bold"><br/>요하지통 근막통증증후군 / 두통 및 안면 신경통 / 목, 어깨, 팔에 나타나는 통증 / 자율신경의 이상으로 일어나는 질환</span>
					</p>
					<div class="bottom_contents">
						<p class="txt_00bcde bold">통증의 정의</p>	
						<p>통증이란 의학적으로 조직이 손상을 당하거나 손상이 임박했을 때 손상과 관련하여 표현되는 감각적이고 정서적인 불유쾌한 감각을 말합니다. 이는 누구나 어렸을 때 부터 경험하여 왔기에 잘 알고 있긴 하지만, 매우 주관적으로 사람 마다 느끼는 정도가 다릅니다. 지금도 이러한 통증의 가전과 원인을 정확히 알아내기 위한 연구가 진행되고 있습니다.
						</p>	
					</div>
				</div>
			</div>

			<div class="section">
				<p class="blue_sq">연하곤란클리닉</p>
				<div style="background:url(/images/page/rhbl/clinic_box_03.jpg) no-repeat 0 top; width:690px; height:108px; margin-top:10px;padding:10px 20px 10px 20px;">
					<div class="bottom_contents">
						<p class="txt_00bcde bold">연하곤란의 정의</p>	
						<p>음식물이 입에서부터 위로 통과하는데 장애를 받는 느낌이 있는 증상이며, 삼킴 장애라고도 합니다. 음식물을 삼키기 힘든 증상과 음식물을 삼켜서 내려가는 과정에서 바로 걸린 것처럼 느껴지는 증상이도 하며, 연하곤란에는 음식이 너무 크거나 식도가 좁아서 생기는 기계적 연하곤란과 연동운동이 잘 이루어지지 않아서 생기는 운동성 연하곤란이 있습니다.
						</p>	
					</div>
				</div>
			</div>

			<div class="section">
				<p class="blue_sq">골다공증클리닉</p>
				<div style="background:url(/images/page/rhbl/clinic_box_04.jpg) no-repeat 0 top; width:690px; height:138px; margin-top:10px;padding:10px 20px 0px 20px;">
					<div class="bottom_contents">
						<p class="txt_00bcde bold">골다공증의 정의</p>	
						<p>골다공증은 남녀노소를 가리지 않지만, 특히 폐경 여성에게서 흔하게 발생하는 질환으로 연령이 증가함에 따라 발생빈도가 높아집니다. 이제 우리 나라도 노령화 사회에 접어들어 골다공증 환자가 기하급수적으로 늘어나는 추세입니다. 일상적인 사소한 충격에도 쉽게 골절을 일으켜 경제적으로 엄청난 부담을 주게되는 골다공증은 일단 발생하면 장기간의 치료를 필요로 하지만 완전한 회복은 쉽지 않아서 사회적으로 큰 문제로 대두되고 있습니다.
						</p>	
					</div>
				</div>
			</div>			
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>