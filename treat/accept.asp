<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>외래접수 안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.process img{
			margin-left:32px;
		}

		.process dl{
			width:100%;
			height:116px; 
		}

		.process dl dt{
			font-size:14px;
			color:#000;
			font-weight: bold;
			float: left;
			height:95px;
			width:122px;
			margin-top:21px;
			text-align: center;
			margin-right: 45px;
			line-height: 1.2em;
		}

		.process dl dd{
			text-align: justify;
			padding-right:20px;
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
			<div style="background:url(/images/page/treat/accept_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>외래접수 안내</h2>
				<h4 class="blind">
					최초의 노인전문병원은 아니지만 최고의 노인전문병원이되기 위해 최선을 다합니다.
				</h4>
				<p class="blind">
					어르신과 가족들이 함께 할 수 있도록 뛰어난 자연경관이 마련되어 있고, 의료분야의 여러 전문가들이 좀 더 "안락한 섬김" 을 드리기 위해 최선을 다하고 있는 천안시립노인전문병원 입니다.
				</p>
			</div>
				<h3 class="subtitle">외래 진료 절차</h3> 
				<div class="process">
					<dl style="background:url(/images/page/treat/accept_box_01.jpg) no-repeat 0 top;">
						<dt> 외래접수<br/>(원무과)</dt>
						<dd style="padding-top: 18px;">
							<p>· 환자의 인적사항 및 보험자격 여부를 확인합니다.</p>
							<p>· 환자의 진료전 개인정보 수집에 대한 동의 절차를 거칩니다.</p>
							<p>· 진료과를 지정하지 못하신분들은 진료과를 지정하여 드립니다.</p>
							<p>· 접수가 완료되면 접수증을 드립니다. (환자 확인을 위한 접수증이오니 반드시 지참해주세요)</p>
						</dd>
					</dl>					
					<img src="/images/page/treat/arrow_bottom.jpg" alt=""/>
				</div>	
				<div class="process">
					<dl style="background:url(/images/page/treat/accept_box_02.jpg) no-repeat 0 top;">
						<dt> 진료<br/>(진료과)</dt>
						<dd style="padding-top: 38px;">
							<p>· 진료전 1층 대기실에서 혈압측정이 이루어집니다.</p>
							<p>· 원무과 직원의 안내에 따라 진료실로 안내합니다.</p>
						</dd>
					</dl>					
					<img src="/images/page/treat/arrow_bottom.jpg" alt=""/>
				</div>
				<div class="process">
					<dl style="background:url(/images/page/treat/accept_box_03.jpg) no-repeat 0 top;">
						<dt> 검사 및<br/>처치</dt>
						<dd style="padding-top: 28px;">
							<p>· 치료를 위해 검체검사 및 영양 검사 및 물리치료가 이루어 질 수 있습니다. 원무과 직원의 안내를 받아 해당 부서로 이동하시면 됩니다.(접수증으로 환자확인을 하고있습니다. 번거롭더라도 협조 부탁드립니다.</p>
						</dd>
					</dl>					
					<img src="/images/page/treat/arrow_bottom.jpg" alt=""/>
				</div>
				<div class="process">
					<dl style="background:url(/images/page/treat/accept_box_04.jpg) no-repeat 0 top;">
						<dt> 수납 및<br/>약수령</dt>
						<dd style="padding-top: 38px;">
							<p>· 진료 종료 후 원무과에서 수납이 이루어집니다.</p>
							<p>· 원내에서 약을 처방받은 뒤 귀가 합니다.</p>
						</dd>
					</dl>
				</div>

		

				
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>