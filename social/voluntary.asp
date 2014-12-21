<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>자원봉사활동</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		.section{
			margin-bottom:40px; 
		}

		.diagram_text{
			width:124px;
			text-align: center;
			color:#000;
			font-size:14px;
			font-weight: bold;	
			margin-right:26px;	
			margin-top:30px;
			line-height: 1.2em;	
		}

		.detail_text{
			color:#484848;
			font-size:13px;
			height:38px;
			text-align:center;
			margin-bottom:18px;
		}

		/*봉사 내용*/
		.volun_contents{
			padding:15px 20px 15px 20px;
		}
		
		.volun_contents > li{
			width:340px;
			margin-top:5px;
			margin-bottom:25px;
		}
		.volun_contents > li > ul{
			margin-top:5px; 
			height:80px;
			padding-top:10px;
		}

		.volun_contents > li > ul > li{
			margin-left:85px;
			letter-spacing: -0.5px;
		}

		/*//봉사내용*/

		/*자원봉사 활동*/
		.act_border{
			border-top:1px solid #5ac5d9;
			padding-top:1px;
		}

		.activity ul{			
			height:195px;
		}
		/*//자원봉사 활동*/

		.mg_t_20{
			margin-top: 20px;

		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".section:last").css("margin-bottom","0px");
			$(".diagram_text:last").css("margin-right","0px");
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
			<div style="background:url(/images/page/social/volun_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>자원봉사활동</h2>
				<h4 class="blind">
					천안시립노인전문병원은 봉사의 미덕을 실천하실 장을 열어드립니다.
				</h4>
				<p class="blind">
					저희 천안시립노인전문병원은 사회 봉사의 고귀한 마음을 가지고 계신 분들이 어르신을 통한 봉사의 마음과 효를 실천 할 수 있는 기회를 드리고 있습니다. 어르신들께 드리는 즐거움은 물론 봉사를 통한 즐거움을 느껴보시기 바랍니다.
				</p>
			</div>
			<div class="section">
				<h3 class="subtitle">자원봉사란?</h3> 
				<span class="fr_text">자원봉사는 자발, 자주, 자유의지라는 뜻의 라틴어(Voluntas)에서 유래되었고,  자원봉사활동(Voluntarism)이란 개인 및 단체의 자발적 참여와 대가없이 도움이 필요한 이웃과 사회에 시간과 재능을 제공하여 사회문제 해결 및 사회공익에 기여하는 것을 말하며, 이러한 자원봉사활동을 실천에 옮기는 사람을 자원봉사자(Volunteer)라고 합니다.</span>			
			</div>			
			<div class="section">
				<h3 class="subtitle">봉사활동 내용</h3> 
				<div class="section"style="background:url(/images/page/social/volun_box_01.jpg) no-repeat; width:100%; height:445px;">
					<ul class="volun_contents">
						<li class="left">
							<span class="blue_sq">목욕봉사</span>
							<ul style="background:url(/images/page/social/volun_icon_01.jpg) no-repeat;">	
								<li>· 입원 어르신 목욕서비스 (나눔의 봉사단)</li>
								<li>· 매주 월요일 9시 ~ 12시</li>
								<li>· 2층 목욕실</li>
							</ul>
						</li>							
						<li class="left">
							<span class="blue_sq">미용봉사</span>
							<ul style="background:url(/images/page/social/volun_icon_02.jpg) no-repeat;">	
								<li>· 입원어르신 컷트 및 파마</li>
								<li>· 매월 1회 ~ 2회 (추후 일정 및 시간 조율)</li>
								<li>· 프로그램실 및 침상컷트는 각 병실에서 진행</li>
							</ul>
						</li>	
					</ul>	
					<ul class="volun_contents">
						<li class="left">
							<span class="blue_sq">프로그램 진행 및 보조봉사</span>
							<ul style="background:url(/images/page/social/volun_icon_03.jpg) no-repeat;">	
								<li>· 입원 어르신 프로그램 진행 및 프로그램 보조</li>
								<li>· 매주, 매월 정기(오전 10시 ~ 오후 1시 30분)</li>
								<li>· 프로그램실</li>
							</ul>
						</li>							
						<li class="left">
							<span class="blue_sq">각종 공연 / 행사봉사</span>
							<ul style="background:url(/images/page/social/volun_icon_04.jpg) no-repeat;">	
								<li>· 노래, 악기연주, 민요, 사물놀이, 합창, 클래식 등</li>
								<li>· 1시간 내외</li>
								<li>· 1층, 프로그램실 진행</li>
							</ul>
						</li>	
					</ul>
					<ul class="volun_contents">												
						<li class="left">
							<span class="blue_sq">정서, 케어봉사</span>
							<ul style="background:url(/images/page/social/volun_icon_05.jpg) no-repeat;">	
								<li>· 말벗이나 산책</li>
								<li>· 정기적인 봉사자(매월이나 매주)</li>
								<li>· 병실이나 병원 산책로</li>
							</ul>
						</li>	
					</ul>					
				</div>				
			</div>
			<div class="section">
				<h3 class="subtitle">자원봉사 신청절차</h3> 				
				<div style="background:url(/images/page/social/volun_bg_01.jpg) no-repeat 0 top; width:100%; height:120px; margin-top:20px;">
					<div class="out_diagram">		
						<p class="diagram_text left">전화 및 방문</p>
						<p class="diagram_text left mg_t_20">담당자 면담<br/>신청서 작성</p>
						<p class="diagram_text left mg_t_20">봉사<br/>분야별 교육</p>
						<p class="diagram_text left mg_t_20">자원봉사<br/>활동</p>
						<p class="diagram_text left mg_t_20">일지작성<br/>활동실적 등록</p>
					</div>
				</div>
				<p class="detail_text" style="margin-left:600px;">천안시 자원봉사센터<br/>VMS</p>
				<div style="background:url(/images/page/social/volun_box_02.jpg) no-repeat 0 top; height:35px; margin-top:18px;text-align:center;padding-top:10px;">
					<span>※자원봉사 신청 및 문의사항은 <span class="txt_00bcde">Tel.041-521-1114</span>나 이메일 <span class="txt_00bcde">cagh@cheonangh.co.kr</span>로 주시기 바랍니다.</span>
				</div>
			</div>
			<div class="section">
				<h3 class="subtitle">자원봉사 활동</h3> 				
				<div class="activity">
					<ul>
						<li class="left" style="width:241px;">
							<span>마술쇼</span>
							<img class="act_border" src="/images/page/social/volun_act_04.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>북일고 봉사활동</span>
							<img class="act_border" src="/images/page/social/volun_act_06.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>북일고 봉사활동</span>
							<img class="act_border" src="/images/page/social/volun_act_07.jpg" alt=""/>
						</li>
					</ul>
					<ul>
						<li class="left" style="width:241px;">
							<span>소년, 소녀합창단</span>
							<img class="act_border" src="/images/page/social/volun_act_09.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>어버이날</span>
							<img class="act_border" src="/images/page/social/volun_act_10.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>어린이집 공연</span>
							<img class="act_border" src="/images/page/social/volun_act_11.jpg" alt=""/>
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