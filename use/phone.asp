<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>전화번호 안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">


	
		.phone_top{
			background:url(/images/page/use/phone_guide_bg.jpg) no-repeat;		
			width:270px;	
			height: 28px;
			overflow: hidden;
			padding-top:2px;
		}

		.phone_title{		
			madding-right:20px;
			width:110px;
			float: left;
			text-align: center;
			vertical-align: middle;
			color:#000;
			font-weight: bold;
		}
		.phone_contents{
			font-weight: bold;
			margin-left: 10px;
		}

		.top_contents{
			padding-top:5px;
			padding-bottom:5px;
			border-bottom:1px solid #ececec;
		}
		.txt_ff7f41{
			color:#ff7f41;
		}

		.depart_name{
			width:80px;
			text-align:center;
			font-weight: bold;
			height:20px;
			padding-bottom: 2px;
		}

		.phone_list{
			 width:730px;
		}

		.phone_list ul{
			 margin-top:25px;
		}

		.phone_list ul li img{
			 margin-right:10px;
		}

			/*전화번호 테이블*/
		.session_table{
			padding-left:15px;
			width:635px;
		}

		.session_table tbody tr td{
			text-align: left;
			padding-left:15px;
			height:38px;
		}
		/*//전화번호 테이블*/

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".top_contents:last").css("border-bottom","none");
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
			<div style="background:url(/images/page/use/phone_main.jpg) no-repeat 0 top; width:100%; height:275px; margin-bottom:17px;">
				<h2>전화번호 안내</h2>
				<h4 class="blind">
					천안시립노인전문병원은 노인성질환 전문병원의 새로운 기준을 만들어 갑니다.
				</h4>
				<p class="blind">
					각종 질병 및 노인이성 질환으로 고생하시는 어르신들을 위하여 천안시립노인전문병원은 어르신들을 위한 새롭고 효과적인 치료를 위한 전문병원으로 거듭성장하고 있습니다.
				</p>
			</div>

			<div style="width:580px;height:215px;">
				<h3 class="subtitle">원내 전화번호</h3> 
					<div class="top_contents">				
						<div class="phone_top left">
							<p class="phone_title">대표전화</p>
							<span class="phone_contents">(041) 521 - 1114</span>
						</div>	
						<div class="phone_top">						
							<p class="phone_title">입원상담문의</p>
							<span class="phone_contents">(041) 521 - 1260</span>
						</div>	
						<div class="phone_top left">
							<p class="phone_title">Fax</p>
							<span class="phone_contents">(041) 521 - 1239</span>
						</div>	
						<div class="phone_top">						
							<p class="phone_title">E-Mail</p>
							<span class="phone_contents">cagh@cheonangh.co.kr</span>
						</div>	
					</div>
					<div class="top_contents">
						<p>
							· 교환을 거치지 않고 해당 부·처·병동에 직접 통화하시려면 (041)521 - 1<span class="txt_ff7f41">XXX</span>로 걸어주시면 됩니다.<br/>
							 &nbsp;&nbsp;(뒤 XXX 세자리 숫자는 <span class="txt_ff7f41">내부전화번호</span>입니다.)
						</p>
					</div>
					<div class="top_contents">
						<p>
							· 병실로 바로 전화를 거시는 방법은 (041)521 - 1<span class="txt_ff7f41">XXX</span>로 걸어주시면 됩니다.<br/>
							 &nbsp;&nbsp;(뒤 XXX 세자리에 <span class="txt_ff7f41">호실 번호</span>를 입력하시면 연결됩니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ex : 305인 경우 041 - 521 - 1<span class="txt_ff7f41">305</span>)
						</p>
					</div>						
			</div>

			<div class="phone_list">
			    <ul>
					<p class="depart_name">진료부</p>
					<li>
						<img class="left" src="/images/page/use/phone_depart_01.jpg" alt=""/>
						<table style="background:url(/images/page/use/phone_tbl_bg01.jpg) no-repeat;" class="session_table" summary="진료부 전화번호 안내">
							<caption>진료부 전화번호 안내 </caption>
							<colgroup>
								<col width="130"></col>
								<col width="185"></col>
								<col width="130"></col>
								<col width="185"></col>
							</colgroup>							
							<tbody>
								<tr>
									<td>병원장(신경과)</td>
									<td>1101</td>
									<td>진료과장</td>
									<td>1103</td>
								</tr>
								<tr>
									<td>진료부장</td>
									<td>1102</td>
									<td>한방과</td>
									<td>1105</td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>


				<ul>
					<p class="depart_name">진료지원부서</p>
					<li>
						<img class="left" src="/images/page/use/phone_depart_02.jpg" alt=""/>
						<table style="background:url(/images/page/use/phone_tbl_bg03.jpg) no-repeat;" class="session_table" summary="진료지원부서 전화번호 안내">
							<caption>진료지원부서 전화번호 안내 </caption>
							<colgroup>
								<col width="130"></col>
								<col width="185"></col>
								<col width="130"></col>
								<col width="185"></col>
							</colgroup>							
							<tbody>
								<tr>
									<td>물리치료실장</td>
									<td>1127</td>
									<td>방사선실</td>
									<td>1170</td>
								</tr>
								<tr>
									<td>물리치료실</td>
									<td>1128</td>
									<td>사회사업실</td>
									<td>1280</td>
								</tr>
								<tr>
									<td>작업치료실</td>
									<td>1129</td>
									<td>약제실</td>
									<td>1290</td>
								</tr>
								<tr>
									<td>임상병리실</td>
									<td>1160</td>
									<td></td>
									<td></td>
								</tr>	
							</tbody>
						</table>
					</li>
				</ul>

				<ul>
					<p class="depart_name">홍보이사실</p>
					<li>
						<img class="left" src="/images/page/use/phone_depart_03.jpg" alt=""/>
						<table style="background:url(/images/page/use/phone_tbl_bg04.jpg) no-repeat;" class="session_table" summary="홍보이사실 전화번호 안내">
							<caption>홍보이사실 전화번호 안내 </caption>
							<colgroup>
								<col width="130"></col>
								<col width="185"></col>
								<col width="130"></col>
								<col width="185"></col>
							</colgroup>							
							<tbody>
								<tr>
									<td>홍보이사실</td>
									<td>1211</td>
									<td>원무과장</td>
									<td>1260</td>
								</tr>
								<tr>
									<td>총무과장</td>
									<td>1232</td>
									<td>원무과</td>
									<td>1261</td>
								</tr>
								<tr>
									<td>총 무</td>
									<td>1230</td>
									<td>수납 및 접수</td>
									<td>1262</td>
								</tr>
								<tr>
									<td>경 리</td>
									<td>1231</td>
									<td>입퇴원 수속</td>
									<td>1263</td>
								</tr>	
								<tr>
									<td>관리과장</td>
									<td>1250</td>
									<td>상담실</td>
									<td>1265</td>
								</tr>
								<tr>
									<td>중앙감시실</td>
									<td>1251</td>
									<td>영양실</td>
									<td>1295</td>
								</tr>
								<tr>
									<td>기관실</td>
									<td>1252</td>
									<td>식 당</td>
									<td>1296</td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>
					
				<ul>
					<p class="depart_name">간호부</p>
					<li>
						<img class="left" src="/images/page/use/phone_depart_04.jpg" alt=""/>
						<table style="background:url(/images/page/use/phone_tbl_bg02.jpg) no-repeat;" class="session_table" summary="간호부 전화번호 안내">
							<caption>간호부 전화번호 안내 </caption>
							<colgroup>
								<col width="130"></col>
								<col width="185"></col>
								<col width="130"></col>
								<col width="185"></col>
							</colgroup>							
							<tbody>
								<tr>
									<td>간호부장</td>
									<td>1550</td>
									<td>중앙공급실</td>
									<td rowspan="2">1552</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>린넨실</td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>
				 <ul>
					<p class="depart_name">병 동</p>
					<li>
						<img class="left" src="/images/page/use/phone_depart_06.jpg" alt=""/>
						<table style="background:url(/images/page/use/phone_tbl_bg02.jpg) no-repeat;" class="session_table" summary="병 동 전화번호 안내">
							<caption>병 동 전화번호 안내 </caption>
							<colgroup>
								<col width="130"></col>
								<col width="185"></col>
								<col width="130"></col>
								<col width="185"></col>
							</colgroup>							
							<tbody>
								<tr>
									<td>3병동</td>
									<td>1330, 1331</td>
									<td>중환자실</td>
									<td rowspan="2">1320</td>
								</tr>
								<tr>
									<td>5병동</td>
									<td>1530, 1531</td>
									<td>호스피스실</td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>

				 <ul>
					<p class="depart_name">기 타</p>
					<li>
						<img class="left" src="/images/page/use/phone_depart_05.jpg" alt=""/>
						<table style="background:url(/images/page/use/phone_tbl_bg01.jpg) no-repeat;" class="session_table" summary="기 타 전화번호 안내">
							<caption>기 타 전화번호 안내 </caption>
							<colgroup>
								<col width="130"></col>
								<col width="185"></col>
								<col width="130"></col>
								<col width="185"></col>
							</colgroup>							
							<tbody>
								<tr>
									<td>당직실</td>
									<td>1210</td>
									<td>프로그램실</td>
									<td>1555</td>
								</tr>
								<tr>
									<td>세미나실</td>
									<td>1235</td>
									<td>매 점</td>
									<td>1297</td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>



			</div>

			
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>