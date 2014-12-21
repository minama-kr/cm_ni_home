<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>입원생활 안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.subtitle{
			padding-top:5px;
		}

		.blue_sq{
			font-size:14px;
			font-weight: bold;
			color:#58c2d5;
		}

		.life_div{
			overflow: hidden;
			border-bottom: 1px solid #ececec;
			padding-top:8px;
			padding-bottom:16px;

		}
		.life_contents{
			padding-left:15px;
		}

		.stress{
			color:#000;
			font-weight: bold;
			width:55px;
		}

		.account{
			background:url(/images/page/use/life_account.jpg) no-repeat;
			height:35px;
			margin:5px auto 5px 15px;
		}

		.account span{
			height:35px;
			margin-left:15px;
			font-size:18px;
			line-height: 1.9em;
			color:#000;
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">

		$(document).ready(function(){			
				$(".life_div:last").css("border-bottom","none");
				$(".life_div:last").css("padding-bottom","0px");
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
			<div style="background:url(/images/page/use/life_main.jpg) no-repeat 0 top; width:100%; height:275px;">
				<h2>입원생활 안내</h2>
				<h4 class="blind">
					천안시립노인병원은 어르신들께 가족처럼 편안함과 안락함을 드리겠습니다.
				</h4>
				<p class="blind">
					천안시립노인전문병원은 최고의 전문 의료진과 임직원 모두 성심을 다하는 진료와 깨끗한 주변 자연환경을 갖추고 있어 어르신들의 빠른 건강 쾌유에 크게 작용하고 있습니다.
				</p>
			</div>
			<div class="life_div">			
				<p class="blue_sq">입원 시 준비물</p>
				<p class="life_contents">
				   세면도구 (수건, 화장지, 컵, 비누 등)<br/>
				   의복류 (내복, 외투 등)<br/>
				   그 밖의 금지품목외 필요물품
				</p>
			</div>		
			<div class="life_div">			
				<p class="blue_sq">금기사항</p>
				<p class="life_contents">
				   병원내에서는 가스나 전열기구를 사용하실 수 없습니다. (전기방석, 전기담요, 커피포트, 전기밥솥, 찜질팩 등)<br/>
				   개인 취사용품 반입을 일절 금지합니다.<br/>
				   쾌적한 원내 환경을 위하여 음주 및 흡연을 금지합니다.
				</p>
			</div>	
			<div class="life_div">			
				<p class="blue_sq">유의사항</p>
				<p class="life_contents">
				   귀중품은 분실 우려가 있으므로 병실에 보관하지 마시고 간호사실 또는 원무과에 보관하여 주시기 바랍니다.<br/>
				   환자의 안정과 감염예방을 위하여 면회시간을 지켜주시기 바랍니다. (면회시간 : 08:00 ~ 20:00)<br/>
				   기본적으로 제공되는 소모품 외에는 개별적으로 준비하셔야 합니다. (속옷, 물티슈, 실내화, 기저귀 등)<br/>
				   환자분들의 안정을 위해서 오후 9시 이후에는 소등하여 주시고 TV시청 등을 삼가 주시기 바랍니다.
				</p>
			</div>	
			<div class="life_div">			
				<p class="blue_sq">편의시설</p>
				<p class="life_contents">
					<span class="stress">전자레인지 </span>: 병동 간호사실 앞에 있으며 전자레인지는 음식을 데우는 용도로만 사용합니다.<br/>
					<span class="stress">세탁물관리 </span>: 시트 및 환의는 간병사가 교환해드리고 있습니다. 다만 별도의 오염 발생 시 말씀해 주시면 처리해 드리겠습니다.<br/>
				    <span class="stress left">TV 시청 </span> 
				    <span style="width:645px; float:right;">: 각 호실 및 병동 휴게실에 배치되어 있으며, 환자분의 안정을 위하여 오후 9시 이후에는 소등하여 주시고 TV시청을 삼가 해 주시기 바랍니다.</span><br/><br/>				  
				   <span class="stress left" style="width:65px;">매점 </span>: 1층 원무과 옆 휴게실에 위치하고 있습니다.<br/>
				</p>
			</div>	
			<div class="life_div">			
				<p class="blue_sq">지참 약 안내</p>
				<p class="life_contents">
				  입원 전에 복용하던 약은 반드시 주치의, 담당 간호사와 상의하시기 바랍니다.
				</p>
			</div>	
			<div class="life_div">			
				<p class="blue_sq">식사 시간</p>
				<p class="life_contents">
				  식사는 다음과 같은 시간에 제공됩니다.<br/>
				  식사 변경이 필요하시면 식사제공 전에 간호사실에 말씀해 주십시오.<br/>
				  <span class="stress" style="margin-right:25px;"> 아침 07:00 ~</span>
				  <span class="stress" style="margin-right:25px;"> 점심 12:00 ~</span>
				  <span class="stress" style="margin-right:25px;"> 저녁 17:00 ~</span>
				</p>
			</div>
			<div class="life_div">			
				<p class="blue_sq">낙상주의</p>
				<p class="life_contents">
				   낙상 예방을 위하여 다음 사항을 꼭 지켜주시기 바랍니다.<br/>
				   침대 난간은 항상 올려주시고 난간 위로 넘어다니지 않습니다.<br/>
				   침대 위에서 일어서지 않습니다.<br/>
				   거동이 불편하신 분은 간병사와 함께 화장실에 가십시오.<br/>
				   간호사의 도움이 필요하시면 간호사 호출벨을 눌러 주세요.<br/>
				</p>
			</div>	
			<div class="life_div">			
				<p class="blue_sq">외박 또는 외출 신청 안내</p>
				<p class="life_contents">
				   주치의와 상의 후 보호자와 함께 외출(외박) 신청서를 작성 후 가능합니다. (4박 5일 이내)
				</p>
			</div>	
			<div class="life_div">			
				<p class="blue_sq">중간 진료비 수납</p>
				<p class="life_contents">
				   입원 환자는 매월 1회 중간금을 원무과에 납부해 주시기 바랍니다.<br/>
				   매월 7일 이후 문자를 보내드리며 1층 원무과로 오셔서 확인하시거나 전화로 문의주시면 금액을 알려드리니 1층 원무과에 수납 혹은 아래 계좌로 입금해 주시기 바랍니다. (계좌 이체 후 현금영수증 처리를 원할시에는 원무과로 연락을 주시기 바랍니다.)<br/>
				</p>
				<div class="account">
					<span>계좌번호 : </span>
				</div>
				<p class="life_contents">
				   순납은 365일 항시 원무과에서 수납 가능합니다. (09:00 ~ 22:00)<br/>
				   중간계산서는 현재시점의 모든 금액이 아니라 1일부터 말일까지의 누적 금액이 계산되어 있습니다. (중간 입원한 경우에는 입원 시점부터 말일까지 계산)<br/>
				</p>
			</div>
				
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>