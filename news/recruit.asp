<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C03" '채용공고
	If Len(intPage) = 0 Then
		intPage = 1
	End If
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title><%=strHtmlTitle%></title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.list ul li.date{
			width: 70px;
			text-align: center;
		}
		div.list ul li.title{
			width: 430px;
			text-align: left;
		}
		div.list ul li.title img{
			margin:13px 0 0 15px;
		}
		div.list ul li.file{
			width: 60px;
			text-align: center;
		}
		div.list ul li.file img{
			padding-top:1px;
		}
		div.list ul li.title a{
			text-decoration: underline;
		}
		div.list ul li.view_cnt{
			width:80px;
			text-align: right;
		}
		p.null_list{
			text-align: center;
			font-size:13px;
			font-weight: bold;
			line-height: 40px;
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
			<h2 class="left">채용공고</h2>
			<div class="right" style="padding-top:25px;">
				<img class="left" src="/images/page/news/alarm.jpg" alt="" style="margin-right:10px;" />	
				<p class="left">채용관련 문의는 041-521-114로 문의 주시기 바랍니다.</p>
			</div>
			<div class="list recruit_list">
				<ul class="list_header">
					<li class="no">번호</li>
					<li class="file">&nbsp;</li>
					<li class="title">제목</li>
					<li class="date">작성일</li>
					<li class="view_cnt">조회수</li>
				</ul>
		<%

			'DB 연결
			Set objConn = Server.CreateObject("ADOdb.Connection")
			objConn.Open IC_DB_CONN
			
			Set objRecord = Server.CreateObject("ADODB.RecordSet")
			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE, B.BBS_SEQ_NO, "&_
			               "              ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
			               "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM, F.CNT   "&_
			               "             ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE   "&_
		                     "     FROM NI_USER_BBS B "&_
		                     "                INNER JOIN NI_USER_BBS_CNT C "&_
		                     "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
		                     "                LEFT OUTER JOIN "&_
		                     "               (SELECT BBS_KEY, BBS_DVS, COUNT(1) CNT FROM NI_BBS_ATCH_FILE GROUP BY BBS_KEY, BBS_DVS) F "&_
		                     "          ON B.BBS_DVS = F.BBS_DVS AND B.BBS_KEY = F.BBS_KEY "&_
		                     "   WHERE B.BBS_DVS = '" & strBbsDvs &"'"   

        	 	If strSearchWord <> "" Then
		 		strSQL = strSQL & " AND B.TITLE LIKE '%" & strSearchWord & "%'"
		 	End If

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
		%>
				<ul class="list_item">
					<li class="no"><%=objRecord("BBS_SEQ_NO")%></li>
					<li class="file"><% If objRecord("CNT") > 0 Then %><img src="/images/page/news/file.jpg" alt="" /><% Else Response.write "&nbsp;" End If%></li>
					<li class="title">
						<a href="/news/recruit_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>"><%=objRecord("TITLE")%>
						<% If objRecord("DUE") < 2 Then %>
							<img src="/images/icon/icon_list_new.png" alt="새로운 글" />
						<% End If %>
						</a>
					</li>
					<li class="date"><%=objRecord("WRT_DTM")%></li>
					<li class="view_cnt"><%=objRecord("SRCH_CNT")%></li>
				</ul>
			<% 	
				objRecord.MoveNext
				intCnt = intCnt + 1
				Loop

				If intTotRCnt = 0 Then
			%>
				<p class="null_list">데이터가 없습니다.</p>
			<%
				End If
		%>	
			</div>
			<div style="position:relative; clear:both;">
				<!--#include virtual = "/comm/com_paging.asp"-->
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>
<%
	objRecord.Close
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing
%>
