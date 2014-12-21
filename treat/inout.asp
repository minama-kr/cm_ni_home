<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>입·퇴원 안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{
			margin-bottom:66px; 
		}

		.diagram_text{
			width:124px;
			text-align: center;
			color:#000;
			font-size:14px;
			font-weight: bold;	
			margin-right:26px;	
			margin-top:28px;	
			line-height: 1.2em;
		}
		.underline{
			width:600px;
			border-bottom:1px solid #9d9d9d;
			margin-left:120px;
			padding-bottom:5px;
		}
		.detail_text{
			color:#484848;
			height:38px;
			text-align:center;
			margin-bottom:18px;

		}

		
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".in_diagram .diagram_text:last").css("margin-right","0px");
			$(".out_diagram .diagram_text:last").css("margin-right","0px");
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
			<div style="background:url(/images/page/treat/inout_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:10px; margin-top:1px;">
				<h2>입·퇴원 안내</h2>
				<h4 class="blind">
					병원 모든 임·직원은 어르신을 내 부모님을 모시는 마음으로 정성을 다하겠습니다.
				</h4>
				<p class="blind">
					병원의 모든 임직원은 '환자를 가족처럼'의 원훈을 기반으로 끊임없는 노력과 연구를 통하여 어르신들께서 병원 입원 생활에 불편함이 없도록 천안시립노인전문병원은 만반의 준비를 다 하고 있습니다.
				</p>
			</div>

			<div class="section">
				<h3 class="subtitle">입원 대상</h3> 
				<span class="fr_text">중풍, 치매, 말기암, 기타 노인성 질환 또는 해당과에서 입원치료가 필요하다고 판단되는 환자</span>			
			</div>

			<div class="section">
				<h3 class="subtitle left">입원시 절차</h3> 
				<div class="underline">
					<span class="fr_text">천안시립노인병원의 입원은 다음의 절차를 통해 이뤄집니다.</span>
				</div>
				<div style="background:url(/images/page/treat/in_bg.jpg) no-repeat 0 top; width:100%; height:118px; margin-top:20px;">
					<div class="in_diagram">		
						<p class="diagram_text left">입원상담</p>
						<p class="diagram_text left">입원결정</p>
						<p class="diagram_text left">원무과</p>
						<p class="diagram_text left">입원수속</p>
						<p class="diagram_text left">입실</p>
					</div>
				</div>
				<span class="detail_text left" style="margin-left:5px;margin-right:215px;"> 전화상담, 방문상담,<br/>인터넷 상담</span>
				<span class="detail_text left" style="margin-right:80px;"> 병실배정 및 <br/>일정등록</span>
				<span class="detail_text">입원서류작성 및<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보제공</span>
				<div style="background:url(/images/page/treat/in_box.jpg) no-repeat 0 top; height:85px; margin-top:18px;padding:23px 10px 0px 12px;">
					<ul>
						<li>· 병실사정으로 당일 입원이 불가능할 경우에는 입원 예약을 해드립니다.</li>		
						<li>· 타병원에 입원중인 환자를 본원으로 입원시키고자 할 때는 보호자께서 병원 담당의사의 소견서와 MRI 또는 CT필름 사본, 검사<br/>&nbsp;&nbsp;기록등을 준비하여 절차를 밟으신 후, 본 병원 의사 선생님과 상담 후 입원여부를 결정합니다.</li>
					</ul>
				</div>
			</div>

			<div class="section">
				<h3 class="subtitle left">퇴원시 절차</h3> 
				<div class="underline">
					<span class="fr_text">천안시립노인병원의 퇴원은 다음의 절차를 통해 이뤄집니다.</span>
				</div>
				<div style="background:url(/images/page/treat/out_bg.jpg) no-repeat 0 top; width:100%; height:120px; margin-top:20px;">
					<div class="out_diagram">		
						<p class="diagram_text left">퇴원신청</p>
						<p class="diagram_text left mg_t_18">주치의<br/>상담</p>
						<p class="diagram_text left mg_t_18">필요서류<br/>신청</p>
						<p class="diagram_text left">퇴원수납</p>
						<p class="diagram_text left">병동</p>
					</div>
				</div>
				<p class="detail_text" style="margin-left:600px;">퇴원 약, 퇴원 시<br/>간호계획지 등 제공</p>
				<div style="background:url(/images/page/treat/out_box.jpg) no-repeat 0 top; height:68px; margin-top:18px;padding:18px 10px 0px 10px;">
					<ul>
						<li>· 보호자는 수납창구에 진료비를 납부 하신 후 해당 병동 간호사실에서 퇴원 후 지켜야 할 사항등의 설명을 들은 후 퇴원을 합니다.</li>
						<li>· 엠뷸런스는 재원 중 응급상황 시에만 이용할 수 있습니다.</li>
					</ul>
				</div>
			</div>
			<div style="padding-top:7px;margin-top:40px;">
				<h3 class="subtitle">입·퇴원 및 문의</h3> 
				<span>입·퇴원에 관하여 자세한 내용은 고객센터로 문의하시면 신속하게 처리해드리겠습니다
				</span>
				<div class="bold" style="padding-top:7px;">
					<p class="left" style="font-size:15px;color:#000;">고객센터</p>
					<span style="font-size:18px;">&nbsp;&nbsp;&nbsp;Tel.<span class="txt_00bcde">041.521.1262</span>&nbsp;&nbsp;&nbsp;Fax.<span class="txt_00bcde">041.554.1239</span></span>						
				</div>
			</div>

		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>