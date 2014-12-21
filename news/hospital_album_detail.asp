<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	strBbsDvs = Request("dvs")
	If strBbsDvs = "" Then
		strBbsDvs = "C10"
	End If
	strBbsKey = Request("key")
	strMode = "u"
	If strBbsKey = "" Then
		strMode = "s"
	End If

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	If strBbsKey <> "" Then
		strSQL = "UPDATE NI_USER_BBS_CNT SET SRCH_CNT = (SRCH_CNT + 1), LST_MDF_DTM = GETDATE() "&_
		                " WHERE BBS_DVS = '" & strBbsDvs & "' "&_
			         "        AND BBS_KEY = " & strBbsKey
		objConn.Execute(strSQL)
	End If	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>병원앨범 상세</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.list_detail div.list_detail_bg ul.header li.title{
			width:485px;
		}
		div.list_detail div.list_detail_bg ul.header li.dvs{
			width:20px;
			text-align: center;
		}	
		div.list_detail div.list_detail_bg ul.header li.view_cnt {
			width: 110px;
			text-align: right;
		}
		div.list_detail div.list_detail_bg ul.header li.date{
			float: right;
		}

		/* 병원앨범 디테일 */
		div.hospital_detail div.list_detail_bg{
			background: url(/images/page/news/bg_list_detail.jpg) repeat-y 0 top; 
			padding:0 19px 0 18px;
		}

		div.hospital_detail div.list_detail_bg > img{
			width:100%;
			margin-bottom: 10px;
		}
		div.hospital_detail div.list_detail_bg ul.header li.title{
			width:491px;
		}

		div.hospital_detail div.list_detail_bg p{
			font-size:13px;
			line-height: 22px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div class="wrap" style="overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">병원앨범 상세</h2>
	<%
		Set objRecord = Server.CreateObject("ADODB.RecordSet")
		strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE,  B.NTC_YN, B.BLTN_YN, B.SCRT_YN, "&_
		                "                B.PRCS_FG, ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
		                "                RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
		                "               ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE   "&_
	                      "     FROM NI_USER_BBS B LEFT OUTER JOIN NI_USER_BBS_CNT C "&_
	                      "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
	                      " WHERE B.BBS_DVS = '" & strBbsDvs & "'"
		If strBbsKey <> "" Then
				strSQL = strSQL & "       AND B.BBS_KEY = " & strBbsKey
		End If
		objRecord.Open strSQL, objConn, 1

		strTitle = "&nbsp;"
		strCnte = ""
		nSrchCnt = 0
		nDue = 0
		strWrtDtm = ""
		strClass = ""

  		If objRecord.RecordCount > 0 AND strBbsKey <> "" Then 
			strTitle = objRecord("TITLE")
			strCnte = objRecord("CNTE")
			nSrchCnt = objRecord("SRCH_CNT")
			strWrtDtm = objRecord("WRT_DTM")
			nDue = objRecord("DUE")
		End If
		objRecord.Close
	%>		

			<div class="list_detail hospital_detail" style="border-top:0; padding-top:10px;">
				<img src="/images/page/news/bg_list_detail_top.jpg" alt="" />
				<div class="list_detail_bg">
					<ul class="header">
						<li class="title"><h3><%=strTitle%><% If nDue < 2 Then %><img src="/images/icon/icon_list_new.png" alt="새로운 글" /><% End If %></h3></li>
						<li class="view_cnt">
							<img src="/images/icon/view.jpg" alt="" />
							<span>&nbsp;조회수&nbsp;<span class="bold"><%=nSrchCnt%></span></span>
						</li>
						<li class="dvs"><img src="/images/page/news/dvs_list_detail.jpg" alt="" /></li>
						<li class="date"><span><%=strWrtDtm%></span></li>
					</ul>
					<div class="contents"><%=strCnte%></div>
				</div>
				<img src="/images/page/news/bg_list_detail_botm.jpg" alt="" />
			</div>
			<div style="text-align:right;">
				<a href="/news/hospital_album.asp" title="공지사항 목록으로 돌아가기" style="background:url(/images/btn/bg_list_btn.jpg) no-repeat 0 top; width:74px; height:27px; line-height:27px; display:inline-block; text-align:center; font-size:13px; font-weight:bold; margin-top:13px;">목록</a>
			</div>
			<div class="near_list">
				<ul>
					<li>이전글</li>
					<li class="dvs_img"><img src="/images/icon/up.jpg" alt="이전글" /></li>
					<li class="title"><a href="#" title="이전글로 이동">2014년 10월 1일 천안충무병원 관절, 척추 센터 오픈</a></li>
				</ul>
				<ul>
					<li>다음글</li>
					<li class="dvs_img"><img src="/images/icon/down.jpg" alt="다음글" /></li>
					<li class="title"><a href="#" title="다음글로 이동">심장병 어린이 돕기 자선 기부 바자회</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>