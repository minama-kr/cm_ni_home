<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>프로그램 안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.section{
			margin-bottom:27px; 
		}

		/*주요 프로그램 테이블*/
		.program_main thead tr th{
			height:36px;
			text-align: center;
		}

		.program_main tbody tr td{
			text-align: center;			
			height:68px;
			vertical-align: middle;
		}

		.main_tbl_noon{
			line-height:8em;
			height:68px;
			padding-right:6px;
		}
		/*//주요 프로그램 테이블*/

		/*상세 테이블*/
		.program_detail thead tr th{
			height:36px;
			text-align: center;
		}
		
		.program_detail tbody tr td{
			text-align: center;	
			padding:auto 15px auto 15px;
			height:67px;		
		}

		.tbl_hgt_37{
			height:37px !important;
		}

		.program_detail_contents{
			text-align:left !important;
			padding:0px 8px;	
		}

		/*//상세 테이블*/


		/*프로그램 활동*/
		.act_border{
			border-top:1px solid #5ac5d9;
			padding-top:1px;
		}

		.activity ul{			
			height:195px;
		}
		/*//프로그램 활동*/

		
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
			<div style="background:url(/images/page/social/program_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:14px;">
				<h2>프로그램 안내</h2>
				<h4 class="blind">
					어르신들께 건강과 즐거움을 드리기 위한 프로그램이 구성되어 있습니다.
				</h4>
				<p class="blind">
					저희 천안시립노인전문병원은 어르신들께서 입원 치료를 받으시는 동안 의학치료뿐만이 아닌 감성적 활동을 통한 즐거움과 더불어 쾌유의 시너지를 높이고자 다양한 프로그램을 연구 구성되어 있습니다.
				</p>
			</div>
			<div class="section">
				<h3 class="subtitle">주요 프로그램</h3> 
				<div style="background:url(/images/page/social/program_tbl_01.jpg) no-repeat 0 top;height:174px;">
					<table class="program_main" summary="주요 프로그램 안내">
						<caption>주요 프로그램 안내</caption>
							<colgroup>
								<col width="66"></col>
								<col width="94"></col>
								<col width="94"></col>
								<col width="94"></col>
								<col width="94"></col>
								<col width="94"></col>
								<col width="94"></col>
								<col width="94"></col>
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
									<th>일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><p class="main_tbl_noon">오전</p></td>
									<td>목욕서비스<br/>(나눔의 봉사단)</td>
									<td>사물놀이</td>
									<td>미용서비스</td>
									<td>공예교실</td>
									<td>노래방</td>
									<td>놀이마당공연</td>
									<td>기독교예배</td>	
								</tr>
								<tr>
									<td><p class="main_tbl_noon">오후</p></td> 
									<td></td>
									<td>건강체조</td>
									<td>종이접기</td>
									<td>천주교미사</td>
									<td>노래교실</td>
									<td></td>	
									<td></td>
								</tr>
							</tbody>
					</table>
				</div>
			</div>


			<div class="section">
				<h3 class="subtitle">프로그램 상세내용</h3> 
				<div style="background:url(/images/page/social/program_tbl_02.jpg) no-repeat 0 top; width:100%; height:660px;">
					<table class="program_detail" summary="프로그램 상세내용">
						<caption>프로그램 상세내용</caption>
							<colgroup>
								<col width="89"></col>
								<col width="89"></col>
								<col width="*"></col>
							</colgroup>
							<thead>
								<tr>
									<th>프로그램명</th>
									<th>기간</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>사물놀이</td>
									<td>매주 화요일</td>
									<td class="program_detail_contents">사물놀이란? 네사람이 각기 꽹과리, 징, 장구, 북을 가지고 어우러져 치는 놀이로 어르신들께서 유년시절 들었던 우리 고유의 정서가 담긴 장구가락을 통하여 사고력과 인지력을 향상 시킬수 있다.</td>
								</tr>
								<tr>
									<td>건강체조</td>
									<td>매주 화요일</td>
									<td class="program_detail_contents">노래에 맞춰 스트레칭, 근력운동, 레크레이션, 다리운동, 요가 등 다양한 건강운동을 노래에 맞춰 운동함으로써 일상생활의 활력을 증진 시킨다.</td>						
								</tr>
								<tr>
									<td>종이접기</td>
									<td>매주 수요일</td>
									<td class="program_detail_contents">종이를 접으면서 신경을 집중해서 전 손끝을 사용함으로 어르신들의 치매 예방 및 치료, 재활을 돕습니다.</td>						
								</tr>
								<tr>
									<td>공예교실</td>
									<td>매주 목요일</td>
									<td class="program_detail_contents">종이접기, 미술치료, 요리치료, 공예, 야외집단활동 등등을 모두 통합해서 진행되고 있는 프로그램으로 모든 프로그램의 장점이 융합되어 효과를 증진 시킬 수 있다.</td>						
								</tr>
								<tr>
									<td>노래방</td>
									<td>매주 금요일</td>
									<td class="program_detail_contents">음악과 노래를 통하여 심리적으로 즐거움을 증진 시킬 수 있다.<br/>
										노래교실 시간에 배운노래를 다시 복습하여 기억력 향상에 도움을 줄 수 있다</td>						
								</tr>
								<tr>
									<td>노래교실</td>
									<td>매주 금요일</td>
									<td class="program_detail_contents">음악과 노래를 통하여 심리적으로 즐거움을 증진 시킬 수 있다.<br/>
										박자에 맞춰 손과 발을 사용하여 박자감각을 유지 시킬 수 있다.</td>						
								</tr>
								<tr>
									<td>놀이마당</td>
									<td>매주 토요일</td>
									<td class="program_detail_contents">대화하기, 만들기, 게임 등을 봉사가족과 함께 하기 때문에 편안함을 느끼며 프로그램에 참여 할 수 있는 시간이 될 수 있다.</td>						
								</tr>
								<tr>
								 	<td class="tbl_hgt_37">공연</td>
									<td class="tbl_hgt_37">매달 </td>
									<td class="tbl_hgt_37 program_detail_contents">어르신들의 흥겨움과 볼거리를 제공한다.</td>						
								</tr>
								<tr>
									<td rowspan="3">종교활동</td>
									<td class="tbl_hgt_37">불교</td>
									<td class="tbl_hgt_37 program_detail_contents">매년 부처님오신날 행사진행(각원사 주지스님)</td>						
								</tr>
								<tr>
									<td class="tbl_hgt_37">천주교</td>
									<td class="tbl_hgt_37 program_detail_contents">격주로 미사, 봉성체, 기도 진행(박아오스딩 신부님)</td>						
								</tr>
								<tr>
									<td class="tbl_hgt_37">기독교</td>
									<td class="tbl_hgt_37 program_detail_contents">매주 일요일 예배진행(하늘샘교회 목사님)</td>						
								</tr>


							</tbody>
					</table>
				</div>
			</div>

			<div class="section">
				<h3 class="subtitle">프로그램 활동</h3> 				
				<div class="activity">
					<ul>
						<li class="left" style="width:241px;">
							<span>건강체조</span>
							<img class="act_border" src="/images/page/social/volun_act_01.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>노래자랑</span>
							<img class="act_border" src="/images/page/social/volun_act_02.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>노래자랑</span>
							<img class="act_border" src="/images/page/social/volun_act_03.jpg" alt=""/>
						</li>
					</ul>
					<ul>						
						<li class="left" style="width:241px;">
							<span>목욕</span>
							<img class="act_border" src="/images/page/social/volun_act_05.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>사물놀이</span>
							<img class="act_border" src="/images/page/social/volun_act_08.jpg" alt=""/>
						</li>
						<li class="left" style="width:241px;">
							<span>나눔봉사단</span>
							<img class="act_border" src="/images/page/social/volun_act_12.jpg" alt=""/>
						</li>						
					</ul>								
				</div>
			</div>
			
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>