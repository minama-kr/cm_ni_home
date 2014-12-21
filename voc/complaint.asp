<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C05" '불만 및 고충처리
	If Len(intPage) = 0 Then
		intPage = 1
	End If

	strSearchWord = Request("txtSearchWord") ' 검색 단어'

	strAddParameter = "&txtSearchWord=" & strSearchWord
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>불만 및 고충처리</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.list ul li.no{
			width: 50px;
			margin-right:60px;
			text-align: right;
		}
		div.list ul li.title{
			width: 400px;
			text-align: left;
		}
		div.list ul li.title a{
			text-decoration: underline;
		}
		div.list ul li.title img{
			margin:13px 0 0 15px;
		}
		div.list ul li.reply_cnt{
			width: 70px;
			text-align: center;
		}
		div.list ul li.writer{
			width: 70px;
			text-align: center;
		}
		div.list ul li.date{
			width: 70px;
			float:right;
			text-align: center;
		}
		p.null_list{
			text-align: center;
			font-size:13px;
			font-weight: bold;
			line-height: 40px;
		}
		/* 관리자 버튼 */
		div.btn{
			margin-top:10px;
		}

		button.left{
			margin-left:5px;
		}
		.btn_big{
			width:74px; 
			height:27px;
			display: inline-block;
			line-height: 27px;
			text-align: center;
		}
		.gray{
			background:url(/images/btn/bg_btn_gray.jpg) no-repeat 0 top; 
			color:#fff !important;
		}
		.blue{
			background:url(/images/btn/bg_btn_blue.jpg) no-repeat 0 top; 
			color:#fff !important;
		}
		.orange{
			background:url(/images/btn/bg_btn_orange.jpg) no-repeat 0 top; 
			color:#fff !important;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script>
		function fncGetList(){
			var $search = $("#txtSearchWord");
			var vPlaceHolder = $search.attr("placeholder");
			var vValue = $search.val();
			if(vPlaceHolder == vValue){
				vValue = "";
			}
			location.href = "/voc/qna.asp?txtSearchWord=" + vValue; 
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
<body>
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div class="wrap" style="overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">불만 및 고충처리</h2>
			<div class="right" style="padding-top:15px;">
				<input id="txtSearchWord" name="txtSearchWord" class="left placeholder" type="text" placeholder="검색하실 단어를 입력하세요." value="<%=strSearchWord%>" onkeypress="fncKeySearch()" onkeyup="fncKeySearch()" style="border:1px solid #d0d0d0; width:253px; height:25px; line-height:25px; padding-left:8px;" />
				<button class="left" type="button" onclick="fncGetList()" style="margin-left:0;"><img class="left" src="/images/btn/search.jpg" alt="불만 및 고충처리 검색 버튼" /></button>
			</div>
			<div class="list recruit_list">
				<ul class="list_header">
					<li class="no">번호</li>
					<li class="title">제목</li>
					<li class="reply_cnt">답글</li>
					<li class="writer">글쓴이</li>
					<li class="date">작성일</li>
				</ul>
		<%

			'DB 연결
			Set objConn = Server.CreateObject("ADOdb.Connection")
			objConn.Open IC_DB_CONN
			
			Set objRecord = Server.CreateObject("ADODB.RecordSet")
			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE, B.BBS_SEQ_NO, B.WRTR_ID, B.SCRT_YN, "&_
			               "              ISNULL(C.REPLY_CNT, 0) AS REPLY_CNT,  "&_
			               "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
			               "             ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE   "&_
		                     "     FROM NI_USER_BBS B "&_
		                     "                INNER JOIN NI_USER_BBS_CNT C "&_
		                     "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
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
					<li class="title">
						<a href="/voc/qna_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>"><%=objRecord("TITLE")%>
						<% If objRecord("DUE") < 2 Then %>
							<img src="/images/icon/icon_list_new.png" alt="새로운 글" />
						<% End If %>
						</a>
					</li>
					<li class="reply_cnt"><%=objRecord("REPLY_CNT")%></li>
					<li class="writer"><%=objRecord("WRTR_ID")%></li>
					<li class="date"><%=objRecord("WRT_DTM")%></li>
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
				<div class="left btn list_back" style="position:absolute; top:5px; right:0;">
					<a class="btn_big blue" href="/voc/complaint_modify.asp">새글쓰기</a>
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
	objRecord.Close
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing
%>
