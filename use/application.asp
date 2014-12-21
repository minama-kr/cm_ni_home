<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>제증명서 발급안내</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">

		.section{
			margin-bottom:28px; 
		}

		.chk{
			vertical-align: middle;
		}

		.blue_sq{
			color:#000;
		}


		/*탭 선택 영역*/
		#tab_area{
			width:725px;
			height: 40px;
			margin-bottom:13px;
		}

		#tab_area ul li{
			width:240px;
			height: 35px;
			float:left;
			margin-right: 1px;
			background-color: #eaeaeb;
			text-align: center;
			font-size:16px;
			margin-top: 4px;
			line-height: 2;
		}
		/*//탭 선택 영역*/


		/*table 전체*/
		.application_table{
			width:100%;
			margin-bottom: 5px;
		}

		.application_table thead tr th{
			height:36px;
			text-align: center;
		}

		.application_table tbody tr td{
			text-align: center;
			height:37px;
		}
		/*//table 전체*/
		

		/* 탭2 */

		#tab2 table tbody tr td{
			text-align: left;
			padding-left:10px;
			padding-right:10px;
			text-align: justify;
		}


		
		.txt_left{
			text-align: left !important;
			padding-left:20px;
		}

		.txt_right{
			text-align: right!important;
			padding-right:20px;
		}
		.stress{
			font-weight: bold;
			color:#000;
		}

		.txt_0fa8bc{
			color:#0fa8bc;
		}

		.tab2_dia_contents{
			width:175px;
			padding-left:25px;
			margin-right:60px;
			overflow:hidden;
			text-align:center;
		}
		/* //탭2 */


		/* 탭3 */

		#tab3 table thead tr th{
			border-top:1px solid #5ac5d9;
			border-bottom:1px solid #e4e4e4;
			background-color: #f9f9f9;
		}


		#tab3 table tbody tr td{
			border-top:1px solid #ededed;
		}

		.tab3_top{
			margin-top:-11px;
			width:725px;
			height:93px;
			border-top:1px solid #5ac5d9;
			border-bottom:1px solid #ededed;
			background-color: #fbfbfb;
			margin-bottom:20px;
		}

		.tab3_top p{
			width:700px;
			margin-bottom:20px;
			padding:18px 15px 20px 15px;
		}

		.bdr_b_ade8f0{
			border-bottom:1px solid #ade8f0 !important;
		}

		.bdr_t_ade8f0{
			border-top:1px solid #ade8f0 !important;
		}

		.bdr_r_ade8f0{
			border-right:1px solid #ade8f0 !important;
		}

		.bdr_r_e4e4e4{
			border-right:1px solid #e4e4e4 !important;
		}

		.divide{
			float:left;
			padding-top:4px;
		}

		/* //탭3 */

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){

			$("#tab3 table tbody tr td:last").css("border-right","none");

			$("#tab1 .section:last").css("margin-bottom","0px");
			$("#tab2 .section:last").css("margin-bottom","0px");
			$("#tab3 .section:last").css("margin-bottom","0px");

			fncTabSelect('1');
		});


		function fncTabSelect(flag){


   			if (flag==1) {
	   			$("#tab1").show();
	   			$("#tab2").hide();
	   			$("#tab3").hide();

	   			$("#top_tab1").css("background-color","#00bcde");
	   			$("#top_tab1 a").css("color","#fff");
	   			$("#top_tab2").css("background-color","#eaeaeb");
	   			$("#top_tab2 a").css("color","#000");
	   			$("#top_tab3").css("background-color","#eaeaeb");
	   			$("#top_tab3 a").css("color","#000");

   			}
   			else if (flag==2) {
	   			$("#tab1").hide();
	   			$("#tab2").show();
	   			$("#tab3").hide();
	   			
	   			$("#top_tab1").css("background-color","#eaeaeb");
	   			$("#top_tab1 a").css("color","#000");
	   			$("#top_tab2").css("background-color","#00bcde");
	   			$("#top_tab2 a").css("color","#fff");
	   			$("#top_tab3").css("background-color","#eaeaeb");
	   			$("#top_tab3 a").css("color","#000");

   			}else if (flag==3) {
	   			$("#tab1").hide();
	   			$("#tab2").hide();
	   			$("#tab3").show();

	   			$("#top_tab2").css("background-color","#eaeaeb");
	   			$("#top_tab2 a").css("color","#000");
	   			$("#top_tab1").css("background-color","#eaeaeb");
	   			$("#top_tab1 a").css("color","#000");
	   			$("#top_tab3").css("background-color","#00bcde");
	   			$("#top_tab3 a").css("color","#fff");
   			}
	   	}


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
			<div style="background:url(/images/page/use/application_main.jpg) no-repeat 0 top; width:100%; height:277px; margin-bottom:17px;">
				<h2>제증명서 발급안내</h2>
				<h4 class="blind">
					병마에 시달리는 어르신들과 가족분들께 늘 위로와 웃음이 함께하시길 기원합니다.
				</h4>
				<p class="blind">
					천안시립노인전문병원은 최고의 전문 의료진과 임직원 모두 성심을 다하는 진료와 깨끗한 주변 자연환경을 갖추고 있어 어르신들의 빠른 건강 쾌유에 크게 작용하고 있습니다.
				</p>
			</div>
			<!--tab select area-->
			<div id="tab_area">
				<ul >
					<li id="top_tab1"><a href="javascript:fncTabSelect('1')" >진단서 및 제증명서 발급안내</a></li>
					<li id="top_tab2"><a href="javascript:fncTabSelect('2')"  >의무기록 사본 발급안내</a></li>
					<li id="top_tab3"><a href="javascript:fncTabSelect('3')"  >비급여 진료비용 고시</a></li>
					
				</ul>
			</div>


			<!--//tab select area-->

			<!--첫번째 탭-->
			<div id ="tab1">
				<div class="section">
					<span class="blue_sq">진단서 등 제증명서 발급비용</span>
					<div style="background:url(/images/page/use/application_tbl_01.jpg) no-repeat 0 top; width:100%; height:448px;">
						<table class="application_table" summary="진단서 등 제증명서 발급비용">
							<caption>진단서 등 제증명서 발급비용</caption>
							<colgroup>
								<col width="*"></col>
								<col width="241"></col>
								<col width="331"></col>
							</colgroup>
							<thead>
								<tr>
									<th>구분</th>
									<th>증명서종별</th>
									<th>수수료</th>
								</tr>	
							</thead>
							<tbody>						
						<%
							'DB 연결
							Set objConn = Server.CreateObject("ADOdb.Connection")
							objConn.Open IC_DB_CONN

							Set objRecord = Server.CreateObject("ADODB.RecordSet")

							strSQL = "SELECT C.DVS_NM, C.COM_NM, C.NOTE, G.CNT "&_
									"       FROM NI_DVS_CD_MST D INNER JOIN NI_COM_CD_MST C ON D.DVS_CD = C.DVS_CD "&_
									"       INNER JOIN (SELECT D.DVS_CD, COUNT(1) CNT "&_
  									"				        FROM NI_DVS_CD_MST D INNER JOIN NI_COM_CD_MST C ON D.DVS_CD = C.DVS_CD  "&_
                      						"				     WHERE D.SEQ_NO BETWEEN 100 AND 199  "&_
 									"				      GROUP BY D.DVS_CD, D.SEQ_NO) G "&_
									"                       ON D.DVS_CD = G.DVS_CD "&_
									"    WHERE D.SEQ_NO BETWEEN 100 AND 199 "&_
									"    ORDER BY D.SEQ_NO ASC, C.SEQ_NO ASC "

							objRecord.Open strSQL, objConn, 1
							strDvsNm = ""
							Do Until objRecord.EOF
						%>
								<tr>
						<%
								If strDvsNm <> objRecord("DVS_NM")  Then
							%>
									<td rowspan="<%=objRecord("CNT")%>"><%=objRecord("DVS_NM")%></td>
							<%
								End If
								strDvsNm = objRecord("DVS_NM")
						%>								
									<td class="txt_left"><%=objRecord("COM_NM")%></td>
									<td class="txt_right"><%=objRecord("NOTE")%></td>
								</tr>
						<%
								objRecord.MoveNext
							Loop

							objRecord.Close
						%>									
							</tbody>
						</table>
					</div>
				</div>

				<div class="section">
					<span class="blue_sq">제증명 발급 시 구비서류</span>
					<div style="background:url(/images/page/use/application_tbl_02.jpg) no-repeat 0 top; width:100%; height:230px;">
						<table class="application_table" summary="제증명 발급 시 구비서류">
							<caption>제증명 발급 시 구비서류</caption>
							<colgroup>
								<col width="*"></col>
								<col width="114"></col>
								<col width="115"></col>
								<col width="115"></col>
								<col width="114"></col>
								<col width="114"></col>
							</colgroup>
							<thead>
								<tr>
									<th>사본발급 신청자</th>
									<th>환자신분증</th>
									<th>신청자 신분증</th>
									<th>가족관계 증명서</th>
									<th>위임장</th>
									<th>동의서</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>증명서종별</td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr style="height:74px;">											
									<td>환자의 배우자,<br/>직계존속·비속,<br/>배우자의 직계 존속</td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td></td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
								</tr>
								<tr>											
									<td>대리인</td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td></td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
									<td><img class="chk" src="/images/icon/icon_circle_blue.png" alt=""/></td>
								</tr>
							</tbody>
						</table>
						<img class="right" src="/images/page/use/application_logo.jpg" alt="의료법인 영서의료재단 천안시립노인전문병원"/>
					</div>
				</div>
				<div class="section">
					<span class="blue_sq">제증명 발급관련 문의</span>
					<div style="background:url(/images/page/use/application_bg.jpg) no-repeat 0 top; width:725px; height:46px; padding:12px 30px; 10px 30px;">
						<p>제증명서 발급에 관한 문의 사항은 아래 연락처로 문의 주시면 자세히 설명 드리도록 하겠습니다.</p>
						<span style="margin-right:150px;"><span class="stress">문의전화 </span>: (041)521 - 0114</span>
						<span class="stress">문의 Mail </span>: <a href="mailto:cagh@cheonangh.co.kr">cagh@cheonangh.co.kr</a>
					</div>
				</div>
			</div>
			<!--//첫번째 탭-->
			<!--두번째 탭-->
			<div id ="tab2">
				<div class="section">
					<span class="blue_sq">의무기록 사본 발급 시 구비서류</span>
					<span class="right"><span class="txt_00bcde">※의료법 시행규칙</span><span class="txt_0fa8bc"> 제 13조</span>(기록열람 동의 요건)</span>
					<div style="background:url(/images/page/use/application_tab2_tbl1.jpg) no-repeat 0 top; width:100%; height:448px;">
						<table class="application_table" summary="의무기록 사본 발급 시 구비서류">
							<caption>의무기록 사본 발급 시 구비서류</caption>
							<colgroup>
								<col width="*"></col>
								<col width="360"></col>
							</colgroup>
							<tbody>
								<tr>
									<td colspan="2"><span class="stress">신청자</span> 환자본인</td>
								</tr>
								<tr>
									<td colspan="2">신분증, 사본발급신청서</td>
								</tr>
								<tr>
									<td colspan="2" style="letter-spacing:-0.3px;"><span class="stress">신청자</span> 1.배우자 2.직계존속(부모, 조부모, 외조부모) 3.직계 비속(자녀, 손자녀, 외손자녀) 4.배우자의 직계존속(시부모, 장인, 장모)</td>
								</tr>
								<tr style="height:148px !important;">											
									<td >
										<p>· 신청자의 신분증 사본</p>
										<p>· 환자의 신분증 사본</p>
										<p>· 가족관계증명서, 주민등록 등본 등 친족관계임을 증명할 서류</p>
										<p>· 환자 자필서명 동의서</p>
										<p>· 사본발급신청서</p>
									</td>
									<td>
										<p>동의서 및 위임장의 자필서명은 도장 및 지장은 인정되지 않음</p>
										<p class="txt_0fa8bc">(반드시 서명이어야함)</p>
									</td>
								</tr>
								<tr>
									<td colspan="2"><span class="stress">신청자</span> 대리인 (형제, 자매, 며느리, 사위, 사촌, 삼촌, 고모, 이모, 보험회사 등)</td>
								</tr>
								<tr style="height:148px !important;">											
									<td>
										<p>· 신청자의 신분증 사본</p>
										<p>· 환자의 신분증 사본</p>
										<p>· 환자 자필서명 동의서</p>
										<p>· 환자 자필서명 위임장</p>
										<p>· 사본발급신청서</p>
									</td>
									<td>
										<p>동의서 및 위임장의 자필서명은 도장 및 지장은 인정되지 않음</p>
										<p class="txt_0fa8bc">(반드시 서명이어야함)</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


				<div class="section">
					<span class="blue_sq">환자의 동의를 받을 수 없는 경우</span>
					<span class="right">
						※<span class="txt_00bcde">의료법 시행규칙</span>
						  <span class="txt_0fa8bc"> 13조의 제 2제 3항</span>
						  <span class="txt_00bcde">관련</span>
					</span>
					<div style="background:url(/images/page/use/application_tab2_tbl2.jpg) no-repeat 0 top; width:100%; height:225px;">
						<table class="application_table" summary="환자의 동의를 받을 수 없는 경우">
							<caption>환자의 동의를 받을 수 없는 경우</caption>
							<colgroup>
								<col width="*"></col>
								<col width="360"></col>
							</colgroup>
							<tbody>
								<tr>
									<td colspan="2">환자가 사망한경우, 환자가 의식부루명 또는 의식불명은 아니지만 중증질환, 부상으로 자필서명을 할 수 없는 경우</td>
								</tr>
								<tr style="height:185px !important;">											
									<td >
										<p>· 신청자의 신분증 사본</p>
										<p>· 가족관계증명서, 주민등록 등본 등 친족관계임을 증명 할 수 있는 서류</p>
										<p>· 가족관계증명서, 사망진단서 등 사망사실을 확인 할 수 있는 서류</p>
										<p>· 환자가 의식불명 또는 중증의 질환, 부상으로 자필서명을 할 수 없음을 확인할 수 있는 서류</p>
									</td>
									<td>
										<p>제 3자의 대리인 <span class="txt_0fa8bc">신청불가</span></p>
										<p>환자의 친족이 제 3자에게 열람권<span class="txt_0fa8bc">위임불가</span></p>
									</td>
								</tr>	
							</tbody>
						</table>
					</div>
				</div>

				<div class="section" style="margin-bottom:72px;">
					<span class="blue_sq">의무기록 사본발급 절차</span>					
					<div style="background:url(/images/page/use/application_tab2_diagram.jpg) no-repeat 0 top; width:100%; height:80px;">
						<p class="left tab2_dia_contents" style="padding-top:20px;">원무과 제출<br/>(구비서류제출)</p>
						<p class="left tab2_dia_contents" style="padding-top:28px;">주치의 면담</p>
						<p class="tab2_dia_contents" style="padding-top:28px;">원무과 수납</p>
					</div>
					<img class="right" src="/images/page/use/application_logo.jpg" alt="의료법인 영서의료재단 천안시립노인전문병원"/>
				</div>
				<div class="section">
					<span class="blue_sq">의무기록 사본 발급관련 문의</span>
					<div style="background:url(/images/page/use/application_bg.jpg) no-repeat 0 top; width:735px; height:46px; padding:12px 30px; 10px 30px;">
						<p>의무기록 사본 발급에 관한 문의 사항은 아래 연락처로 문의 주시면 자세히 설명 드리도록 하겠습니다.</p>
						<span style="margin-right:150px;"><span class="stress">문의전화 </span>: (041)521 - 0114</span>
						<span class="stress">문의 Mail </span>: <a href="mailto:cagh@cheonangh.co.kr">cagh@cheonangh.co.kr</a>
					</div>
				</div>
			</div>
			<!--//두번째 탭-->
			<!--세번째 탭-->
			<div id ="tab3">
				<div class="tab3_top">
					<p>의료법 제 45조 및 동법 시행규칙 제 42조의2의 규정에 따라 환자로부터 징수하는 항목을 게시합니다.<br/>
					국민건강보험법 제 39조, 제3항, 의료급여법 제 7조 제3항에 따른 요양급여 또는 의료급여대상에서 제외되는 비용(비급여진료비용)은 다음과 같습니다.</p>
				</div>
				<div class="section">
					<span class="blue_sq">비급여 진료비용 고시</span>
					<span class="right">※ 2014년 11월 1일자 고시</span>
					<div style="width:100%;overflow:hidden;margin-bottom:30px;">
						<table class="application_table" summary="비급여 진료비용 고시">
							<caption>비급여 진료비용 고시</caption>
							<colgroup>
								<col width="*"></col>
								<col width="260"></col>
								<col width="250"></col>
							</colgroup>
							<thead>
								<tr>
									<th>구분</th>
									<th><img class="divide" src="/images/page/use/application_divide.jpg" alt=""/>비급여 항목</th>
									<th><img class="divide" src="/images/page/use/application_divide.jpg" alt=""/>본인부담금액</th>
								</tr>
							</thead>
							<tbody>
						<%
							strSQL = "SELECT C.DVS_NM, C.COM_NM, C.NOTE, G.CNT "&_
									"       FROM NI_DVS_CD_MST D INNER JOIN NI_COM_CD_MST C ON D.DVS_CD = C.DVS_CD "&_
									"       INNER JOIN (SELECT D.DVS_CD, COUNT(1) CNT "&_
  									"				        FROM NI_DVS_CD_MST D INNER JOIN NI_COM_CD_MST C ON D.DVS_CD = C.DVS_CD  "&_
                      						"				     WHERE D.SEQ_NO BETWEEN 200 AND 299  "&_
 									"				      GROUP BY D.DVS_CD, D.SEQ_NO) G "&_
									"                       ON D.DVS_CD = G.DVS_CD "&_
									"    WHERE D.SEQ_NO BETWEEN 200 AND 299 "&_
									"    ORDER BY D.SEQ_NO ASC, C.SEQ_NO ASC "

							objRecord.Open strSQL, objConn, 1
							intCnt = 0
							strDvsNm = ""
							Do Until objRecord.EOF
						%>
								<tr>
						<%
								strLeftClass = ""
								strRightClass = ""
								If strDvsNm <> objRecord("DVS_NM")  Then
									If intCnt <> 0 Then
										strLeftClass = "bdr_t_ade8f0"
										strRightClass = "bdr_t_ade8f0"
									End If
							%>
									<td rowspan="<%=objRecord("CNT")%>" class="bdr_b_ade8f0 bdr_r_ade8f0"><%=objRecord("DVS_NM")%></td>
							<%
								End If
								strDvsNm = objRecord("DVS_NM")
								intCnt = intCnt + 1
								If intCnt = objRecord.RecordCount Then
									strLeftClass = strLeftClass & "bdr_b_ade8f0"
									strRightClass = strRightClass & "bdr_b_ade8f0"
								End If
						%>								
									<td class="txt_left bdr_r_e4e4e4 <%=strLeftClass%>"><%=objRecord("COM_NM")%></td>
									<td class="txt_right <%=strRightClass%>"><%=objRecord("NOTE")%></td>
								</tr>
						<%
								
								objRecord.MoveNext
							Loop
							objRecord.Close
						%>			
							</tbody>
						</table>
						<img class="right" src="/images/page/use/application_logo.jpg" alt="의료법인 영서의료재단 천안시립노인전문병원"/>
					</div>
				</div>
				<div class="section">
					<span class="blue_sq">비급여 진료비용 관련 문의</span>
					<div style="background:url(/images/page/use/application_bg.jpg) no-repeat 0 top; width:725px; height:46px; padding:12px 30px; 10px 30px;">
						<p>비급여 진료비용에 관한 문의 사항은 아래 연락처로 문의 주시면 자세히 설명 드리도록 하겠습니다.</p>
						<span style="margin-right:150px;"><span class="stress">문의전화 </span>: (041)521 - 0114</span>
						<span class="stress">문의 Mail </span>: <a href="mailto:cagh@cheonangh.co.kr">cagh@cheonangh.co.kr</a>
					</div>
				</div>
			</div>
			<!--//세번째 탭-->
		</div><!--//content-->
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>
<%
	
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing
%>