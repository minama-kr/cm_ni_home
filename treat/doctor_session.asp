<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>진료시간 안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

	/*
		.txt_space{
			letter-spacing: -0.3px;
		}
		*/

		/*의사 소개*/
		.doc_part{
			border-top:1px solid #ededed;
			margin-bottom:27px;
		}

		.depart{
			width:93px;
			font-size:22px;
			color:#ff7f41;
			padding-top:20px;
			text-align:center;
		}

		.doc_profile{
			margin-top:20px;
			padding-left:25px;
		}

		.doc_career{
			 margin-top:15px;
		}
		/*//의사 소개*/

		/*세션 테이블*/
		.session_table{
			width:100%;
		}

		.session_table thead tr th{
			height:36px;
			text-align: center;
		}

		.session_table tbody tr td{
			text-align: center;
			height:38px;
			line-height: 1;
		}

		.session_table img{
			margin-top:2px;
		}
		/*//세션 테이블*/
		
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".doc_part:first").css("border-top","1px solid #9d9d9d");
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
			<div style="background:url(/images/page/treat/doctor_session_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:17px;">
				<h2>진료시간 안내</h2>
				<h4 class="blind">
					믿음과 신뢰를 받는 노인병원, 천안시립노인병원이 이루겠습니다.
				</h4>
				<p class="blind">
					천안시립노인전문병원은 노화에 따른 각종 질병을 앓고 있는 어르신들의 건강쾌유를 위한 효과적 시스템은 물론 중증질환나 분야별 전문 진료과와 함께 최고의 의료진을 배치하여 어르신들이 보다 편안하고 빠르게 쾌유하실 수 있도록 성심을 다하고 있습니다.
				</p>
			</div>

			<div>
				<h3 class="subtitle">과별 진료시간 안내</h3> 
				<div style="height:30px;">
					<div class="left" style="background:url(/images/page/treat/bg_doctor_session.png) no-repeat 0 top; width:470px; height:30px;margin-top:-2px;padding-top:3px;padding-left:20px;">
						<span class="bold" style="margin-right:17px;">진료시간</span>
						<span class="txt_space" style="margin-left:5px;"><span class="bold">평일(월~금)</span> 오전 09:00~오후 05:30 / <span class="bold">토요일</span> 오전 09:00~오전 12:00 </span>
					</div>	
					<div class="right"style="background:url(/images/page/treat/bg_doctor_session.png) no-repeat 0 top; width:205px; height:30px;margin-top:-2px;padding-top:3px;padding-left:20px;">
						<span class="bold" style="margin-right:17px;">점심시간</span>
						<span class="txt_space" style="margin-left:5px;">오후 12:30~오후 1:30</span>
					</div>	
				</div>	
			</div>
			<ul>
				<li>
					<div class="doc_part">					
						<dl style="height:180px;">
							<dt class="left depart">신경과</dt>
							<dd class="left" style="padding-top:5px;padding-bottom:4px;"><img src="/images/page/treat/doctor_nr.jpg" alt="신경과 문태순 병원장"/></dd>
							<dd class="left doc_profile">
								<span style="font-size:22px;">문태순</span><span style="font-size:14px;margin-left:10px;">병원장</span>
								<div class="doc_career">
									<ul class="left" style="width:260px;">
										<li>· 신경과 전문의 자격증 취득</li>
										<li>· 미국 의사면허 (USMLE) 취득</li>
										<li>· 뉴욕 BROOKDALE UNIVERSITY HOSPITAL<br/>&nbsp;&nbsp;MEDICAL CENTER 내과 전공의 수료</li>
										<li>· 대한 신경과 학회 정회원</li>
									</ul>
									<ul class="left">
										<li>· 미국 내과학회 회원</li>
										<li>· 대한 노인의학회 평생 회원</li>
										<li>· 현 천안시립노인전문병원 병원장</li>
										<li>· 현 경희대학교 겸임 교수</li>
									</ul>
								</div>
							</dd>
						</dl>
						<div style="background:url(/images/page/treat/tbl_bg.jpg) no-repeat 0 top; width:100%; height:116px;">
							<table class="session_table" summary="과별 진료시간 안내">
								<caption>과별 진료시간 안내</caption>
									<colgroup>
										<col width="*"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
									</colgroup>
									<thead>
										<tr>
											<th>진료시간</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>오전</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>									
										</tr>
										<tr>
											<td>오후</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>									
										</tr>
									</tbody>
							</table>
						</div>
					</div>	
				</li>
				<li>	
					<div class="doc_part">					
						<dl style="height:180px;">
							<dt class="left depart">내과<br/>·<br/>외과</dt>
							<dd class="left" style="padding-top:5px;padding-bottom:4px;"><img src="/images/page/treat/doctor_gs.jpg" alt="내과 및 외과 현석산 진료부장"/></dd>
							<dd class="left doc_profile">
								<span style="font-size:22px;">현석산</span><span style="font-size:14px;margin-left:10px;">진료부장</span>
								<div class="doc_career">
									<ul class="left">
										<li>· 서울대학교 의과대학 졸업
										<li>· 서울대학교병원 외과 전공의 과정 수료</li>
										<li>· 단양 서울병원 원장</li>
										<li>· 삼척 의료원 원장</li>
										<li>· 현 천안시립노인전문병원 진료부장</li>
									</ul>
								</div>
							</dd>
						</dl>
						<div style="background:url(/images/page/treat/tbl_bg.jpg) no-repeat 0 top; width:100%; height:116px;">
							<table class="session_table" summary="과별 진료시간 안내">
								<caption>과별 진료시간 안내</caption>
									<colgroup>
										<col width="*"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
									</colgroup>
									<thead>
										<tr>
											<th>진료시간</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>오전</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>									
										</tr>
										<tr>
											<td>오후</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>
											<td></td>									
										</tr>
									</tbody>
							</table>
						</div>
					</div>
				</li>
				<li>
					<div class="doc_part">					
						<dl style="height:180px;">
							<dt class="left depart">흉부외과</dt>
							<dd class="left" style="padding-top:5px;padding-bottom:4px;"><img src="/images/page/treat/doctor_ch.jpg" alt="흉부외과 이철세 진료과장"/></dd>
							<dd class="left doc_profile">
								<span style="font-size:22px;">이철세</span><span style="font-size:14px;margin-left:10px;">진료과장</span>
								<div class="doc_career">
									<ul class="left" style="width:260px;">
										<li>· 고려대학교 의과대학 졸업</li>
										<li>· 흉부외과 전문의 자격 취득</li>
										<li>· 전 순천향대학교 흉부외과 과장</li>
										<li>· 전 순천향대학교 진료부장</li>
										<li>· 전 순천향대학교 의과대학 교수</li>
									</ul>
									<ul class="left">
										<li>· 현 천안시립노인전문병원 진료과장</li>
									</ul>
								</div>
							</dd>
						</dl>
						<div style="background:url(/images/page/treat/tbl_bg.jpg) no-repeat 0 top; width:100%; height:116px;">
							<table class="session_table" summary="과별 진료시간 안내">
								<caption>과별 진료시간 안내</caption>
									<colgroup>
										<col width="*"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
									</colgroup>
									<thead>
										<tr>
											<th>진료시간</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>오전</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>
											<td></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>									
										</tr>
										<tr>
											<td>오후</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>									
										</tr>
									</tbody>
							</table>
						</div>
					</div>
				</li>
				<li>
					<div class="doc_part">					
						<dl style="height:180px;">
							<dt class="left depart">한방과</dt>
							<dd class="left" style="padding-top:5px;padding-bottom:4px;"><img src="/images/page/treat/doctor_cm.jpg" alt="한방과 정성수 한방과장"/></dd>
							<dd class="left doc_profile">
								<span style="font-size:22px;">정성수</span><span style="font-size:14px;margin-left:10px;">한방과장</span>
								<div class="doc_career">
									<ul class="left">
										<li>· 원광대학교 한의과 졸업
										<li>· 현 천안시립노인전문병원 한방과장</li>
									</ul>
								</div>
							</dd>
						</dl>
						<div style="background:url(/images/page/treat/tbl_bg.jpg) no-repeat 0 top; width:100%; height:116px;">
							<table class="session_table" summary="과별 진료시간 안내">
								<caption>과별 진료시간 안내</caption>
									<colgroup>
										<col width="*"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
										<col width="105"></col>
									</colgroup>
									<thead>
										<tr>
											<th>진료시간</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>오전</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>									
										</tr>
										<tr>
											<td>오후</td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td><img src="/images/icon/icon_circle_blue.png" alt=""/></td>
											<td></td>									
										</tr>
									</tbody>
							</table>
						</div>
					</div>
				</li>
			</ul>
			<div style="padding-top:7px;">
				<h3 class="subtitle">진료예약 및 문의</h3> 
				<span>접수는 전화예약이나 직접 방문으로 접수하시고, 접수 후 대기하셨다가 해당과의 진료를 받으시기 바랍니다.</span>
				<div class="bold" style="padding-top:7px;">
					<p class="left" style="font-size:15px;color:#000;">고객센터</p>
					<span style="font-size:18px;">&nbsp;&nbsp;&nbsp;Tel.<span class="txt_00bcde">041.521.1114</span>&nbsp;&nbsp;&nbsp;Fax.<span class="txt_00bcde">041.554.1239</span></span>						
				</div>
			</div>
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>