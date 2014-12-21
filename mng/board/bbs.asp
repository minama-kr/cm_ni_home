<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	'통합관리'
	If Len(intPage) = 0 Then
		intPage = 1
	End If

	strSearchWord = Request("txtSearchWord")

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	Set objRecord = Server.CreateObject("ADODB.RecordSet")
	strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE, ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
	              "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM, M.COM_CD, M.COM_NM   "&_
                   "     FROM NI_USER_BBS B LEFT OUTER JOIN NI_USER_BBS_CNT C "&_
                   "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
                   "                 INNER JOIN NI_COM_CD_MST M "&_
                   "          ON B.BBS_DVS = M.COM_CD AND M.DVS_CD = 'C01' "&_
                   "   WHERE B.BBS_DVS IN('C04', 'C05', 'C06') " &_
                   "          AND B.BBS_GRP = B.BBS_KEY"

 	If strSearchWord <> "" Then
 		strSQL = strSQL & " AND TITLE LIKE '%" & strSearchWord & "%' "
 	End If

 	strSQL = strSQL & " ORDER BY WRT_DTM DESC"

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
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title><%=strHtmlTitle%></title> 
	<link rel="stylesheet" href="/css/layout.css" />
	<link rel="stylesheet" href="/css/mng.css" />
	<style>
		div.list ul li.date{
			width: 70px;
		}
		div.list ul li.dvs{
			width: 100px;
			margin-right:20px;
		}
		div.list ul li.title{
			width: 370px;
			text-align: left;
		}
		div.list ul li.title a{
			text-decoration: underline;
		}
		div.list ul li.view_cnt{
			width:80px;
		}
		div.list ul li.edit{
			width:80px;
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
	<script>
		function fncGetList(){
			$("#frm").submit();
		}

		function fncKeySearch(){
			if(window.event.keyCode === 13){
				fncGetList();
			}else{
				return false;
			}
		}
	</script>
</head>
<body id="mng">
	<form id="frm" action="/mng/board/bbs.asp" method="post">
		<!-- 상단 메뉴 -->
		<!--#include virtual = "/comm/header_adm.asp"-->
		<div style="width:958px; margin:0 auto; overflow:hidden;">
			<!-- 왼쪽 사이드 메뉴 -->
			<!--#include virtual = "/comm/left_adm.asp"-->
			<div id="content" class="right_wrap">
			<!-- 서브 페이지 컨텐츠 입력 -->
				<h2 class="left">통합관리</h2>
				<div class="right" style="padding-top:15px;">
					<input id="txtSearchWord" name="txtSearchWord" class="left placeholder" type="text" style="border:1px solid #d0d0d0; width:253px; height:25px; line-height:25px; padding-left:8px;" placeholder="검색하실 단어를 입력하세요." onkeypress="fncKeySearch()" value="<%=strSearchWord%>" />
					<button class="left" type="button" onclick="fncGetList()" style="margin-left:0;"><img class="left" src="/images/btn/search.jpg" alt="통합관리 검색 버튼" /></button>
				</div>
				<div class="list">
					<ul class="list_header">
						<li class="date">날짜</li>
						<li class="dvs">구분</li>
						<li class="title">제목</li>
						<li class="view_cnt">조회</li>
						<li class="edit">수정</li>
					</ul>
			<%
				'지정한 row count만큼 화면에 뿌려줌
				Do Until objRecord.EOF OR intCnt > intRowSize
				%>
					<ul class="list_item">
						<li class="date"><%=objRecord("WRT_DTM")%></li>
						<li class="dvs"><%=objRecord("COM_NM")%></li>
						<li class="title">
							<a href="/mng/board/bbs_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="상세정보 페이지로 이동"><%=objRecord("TITLE")%></a>
						</li>
						<li class="view_cnt"><%=objRecord("SRCH_CNT")%></li>
						<li class="edit">
							<a href="/mng/board/bbs_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="수정 페이지로 이동">
								<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
							</a>
						</li>
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
				<div style="position:relative;">
					<!--#include virtual = "/comm/com_paging.asp"-->
				</div>
			</div>
		</div>
		<!-- 하단 -->
		<!--#include virtual = "/comm/footer.asp"-->
	</form>
</body>
</html>
<%
	objRecord.Close
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing
%>

		