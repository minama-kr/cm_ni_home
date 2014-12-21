<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C06" '칭찬합시다
	If Len(intPage) = 0 Then
		intPage = 1
	End If
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>칭찬합시다</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.health_list{
			font-size:0;
			line-height: 0;
			width:357px;
			float:left;
			margin-top:10px;
		}
		div.health_list div.health_list_bg > h3{
			font-size:16px;
			line-height: 36px;
			font-weight: bold;
			color:#000;
			border-bottom: 1px solid #d0d0d0;
			text-overflow:ellipsis;
			white-space: nowrap;
			overflow : hidden;
		}

		div.health_list div.health_list_bg h3.title img{
			margin-top:10px;
			margin-left:5px;
		}

		div.health_list div.health_list_bg > div{
			margin-top:15px;
			font-size: 13px;
			line-height: 20px;
			height: 98px;
			overflow: hidden;
		}

		div.health_list div.health_list_bg ul.header{
			height:37px;
			border-top:1px solid #d0d0d0;
			margin-top:15px;
		}

		div.health_list div.health_list_bg ul.header li{
			float:left;
			font-size:13px;
		}
		div.health_list div.health_list_bg ul.header li.dvs{
			text-align: center;
			width:20px;
		}

		div.health_list div.health_list_bg ul.header li.title, div.health_list div.health_list_bg ul.header li.reply{
			font-size:13px;
			line-height: 37px;	
		}
		div.health_list div.health_list_bg ul.header li.reply{
			width: 80px;
		}
		div.health_list div.health_list_bg ul.header li.view_cnt{
			width: 100px;
			text-align: right;
		}

		div.health_list div.health_list_bg ul.header li img{
			margin-top:12px;
		}

		div.health_list div.health_list_bg ul.header li span{
			line-height: 37px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
</head>
<body>
	<input type="hidden" id="pEditKey" value="" />
	<input type="hidden" id="pEditType" value="q" />
	<input type="hidden" id="pDvs" value="<%=strBbsDvs%>" />

	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div class="wrap" style="overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2>칭찬합시다</h2>
		<%
			'DB 연결
			Set objConn = Server.CreateObject("ADOdb.Connection")
			objConn.Open IC_DB_CONN

			Set objRecord = Server.CreateObject("ADODB.RecordSet")
			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE, B.WRTR_ID, "&_
			                "                ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
			                "                ISNULL(C.REPLY_CNT, 0) AS REPLY_CNT, "&_
			                "                RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
			                "               ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE   "&_
		                      "     FROM NI_USER_BBS B "&_
		                      "                 INNER JOIN NI_USER_BBS_CNT C "&_
		                      "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
		                      "  WHERE B.BBS_DVS = '" & strBbsDvs & "' "

		 	strSQL = strSQL & " ORDER BY B.WRT_DTM DESC"

			objRecord.PageSize = intRowSize	'레코드에 페이지 사이즈 지정
			objRecord.Open strSQL, objConn, 1

			'paging 선언
			intTotRCnt = objRecord.RecordCount '총 row count
			intTotPage = objRecord.PageCount '총 page count
			If intTotRCnt > 0 Then
				objRecord.AbsolutePage = intPage '지정된 페이지로 레코드의 현재 위치를 이동
			End If
			intFristNum = Int((intPage-1)/intPageSize) * intPageSize + 1 'block에 보여줄 첫 페이지 숫자

			intCnt = 1
			'지정한 row count만큼 화면에 뿌려줌
			Do Until objRecord.EOF OR intCnt > intRowSize
				strStyle = ""
				If intCnt mod 2 <> 0 Then
					strStyle = "margin-right:10px;"
				End If

				strContent = objRecord("CNTE")
				If Len(strContent) > 145 Then
					strContent = Left(strContent, 145) & "..."
				End If
		%>
			<div class="health_list" style="<%=strStyle%>">
				<img src="/images/page/news/bg_list_health_top.jpg" alt="" />
				<div class="health_list_bg" style="background:url(/images/page/news/bg_list_health.jpg) repeat-y 0 top; padding:0 17px 0 20px;">
					<h3 class="title"><a href="/voc/praise_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>"><%=objRecord("TITLE")%></a>
						<% If objRecord("DUE") < 2 Then %>
							<img src="/images/icon/icon_list_new.png" alt="새로운 글" />
						<% End If %>
					</h3>
					<div><%=strContent%></div>
					<ul class="header">
						<li class="title"><%=objRecord("WRTR_ID")%></li>
						<li class="dvs"><img src="/images/page/news/dvs_list_health.jpg" alt="" /></li>
						<li class="reply">댓글 <%=objRecord("REPLY_CNT")%></li>
						<li class="view_cnt">
							<img src="/images/icon/view.jpg" alt="" />
							<span>&nbsp;조회수&nbsp;<span class="bold"><%=objRecord("SRCH_CNT")%></span></span>
						</li>
						<li class="dvs"><img src="/images/page/news/dvs_list_health.jpg" alt="" /></li>
						<li class="date"><span><%=objRecord("WRT_DTM")%></span></li>
					</ul>
				</div>
				<img src="/images/page/news/bg_list_health_botm.jpg" alt="" />
			</div>
		<% 	
				objRecord.MoveNext
				intCnt = intCnt + 1
				Loop

				If intTotRCnt = 0 Then
			%>
				<p class="null_list">데이터가 없습니다.</p>
			<%
				End If
				objRecord.Close
				Set objRecord = Nothing
		%>

			<div style="position:relative; clear:both;">
				<div class="left btn list_back" style="position:absolute; top:5px; right:0;">
					<a class="btn_big blue" href="/voc/praise_modify.asp">칭찬쓰기</a>
				</div>
				<!--#include virtual = "/comm/com_paging.asp"-->
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>
<%
	objConn.Close
	Set objConn = Nothing
%>
