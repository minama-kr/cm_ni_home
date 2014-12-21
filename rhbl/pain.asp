<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>통증치료</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.middle_box{
			margin-bottom:38px;
			overflow: hidden;
		}

		.middle_box span{
			padding-left:10px;
			letter-spacing: -0.2px;
		}

		.blue_sq{
			color:#000;
		}

		.part{		
			height: auto;
			width:680px;
			overflow:hidden;
			padding:10px 0px 10px 10px;
		}

		.part dl{
			width:100%;
			height:45px;
		}

		.part dl dd p{
			width:530px;
			border-bottom:1px solid #dddddd;
			padding-bottom:10px;
			float: right;
		}

		.program_blue_sq{
			font-size:14px;
			color:#000;
			font-weight: bold;
			background: url(/images/comm/blue_dot_sq.jpg) no-repeat left;
			float:left;
			width:120px;
			margin-left:5px;
			padding-left:15px;
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		$(".part dl dd p:last").css("border-bottom","none");

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
			<div style="background:url(/images/page/rhbl/pain_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>통증치료</h2>
				<h4 class="blind">
					만성적 통증을 다양한 진찰을 통해 적합한 통증치료 적용으로 지속관리
				</h4>
				<p class="blind">
					어르신들의 질병 또는 신체적으로 특정부위의 통증을 호소하시는 경우 의료진과의 상담을 통하여 어르신의 통증과 병세에 맞는 통증완화 및 개선을 위한 통증치료 프로그램 적용
				</p>
			</div>
			<div style="height:105px;width:708px;text-align:justify;">
				<img style="margin-right:20px;"class="left" src="/images/page/rhbl/pain_01.jpg" alt=""/>		
				<span style="width:600px;height:105px;overflow:hidden;">
					환자가 특정 부위 혹은 광범위한 부위에 통증을 호소하는 경우, 사진·촉진·문진 등의 진찰소견 및 다양한 진단을 통해 그 원인을 정확히 밝혀내고 도수치료, 전기치료 및 각종 보완 요법 중 적합한 방법을 병행합니다. 이를 통해 해당 부위의 통증이 감소되거나 염증이 완화되며, 근육경련이 감소되고 근육이 강화되어, 근육의 움직임이 바르고 재교육되어 통증이 지속적으로 경감되는 효과가 있습니다.
				</span>
			</div>		
			<div class="middle_box">
				<p class="blue_sq">단순·복잡·특수치료</p>
				<span>외상성 신경손상(디스크), 스트레스성 신경마비(안면 신경마비), 수핵탈출증, 척추전방전위증 등
				</span>
				<p class="blue_sq">근골격 질환환자</p>
				<span>오십견, 거북목 증후군, 어깨 결림, 인공관절수술 후의 재활, 퇴행성관절염, 급·만성관절염 및 근육통, 염좌 및 골절환자, 척추측만증 등
				</span>
			</div>
			<div>
				<h3 class="subtitle">치료프로그램 및 효과</h3> 
				<div style="background:url(/images/page/rhbl/pain_box.jpg) no-repeat; width:705px; height:225px;padding:20px 10px 17px 10px;">
					<div class="part">
						<dl>	
							<dt class="program_blue_sq">온열 및 냉치료</dt>
							<dd><p>온찜질, 냉찜질, 적외선 치료, 초음파(심층열)치료, 극초단파 치료</p></dd>
						</dl>
						<dl>	
							<dt class="program_blue_sq">전기치료</dt>
							<dd><p>경피신경자극치료, 간섭파 치료, 전기자극치료(est), 레이저치료</p></dd>
						</dl>
						<dl>	
							<dt class="program_blue_sq">공기압박치료</dt>
							<dd><p>급/만성 통증 및 팔·다리의 부종 감소, 혈액순환장애 개선</p></dd>
						</dl>
						<dl>	
							<dt class="program_blue_sq">견인치료</dt>
							<dd><p>경추·요추에 가해지는 압력을 인위적으로 줄여 디스크의 정상위치 회복을 도와주는 치료</p></dd>
						</dl>
						<dl>	
							<dt class="program_blue_sq">도수치료</dt>
							<dd><p>근막이완술, 근에너지기법, 정형도수기법 및 마사지기법 등을 사용한 다양한 접근방식의 운동치료</p></dd>
						</dl>
					</div>					
				</div>				
			</div>
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>