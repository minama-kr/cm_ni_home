<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C03" '채용공고
	If Len(intPage) = 0 Then
		intPage = 1
	End If

	strSearchWord = Request("txtSearchWord") ' 검색 단어'
	strAddParameter = "&txtSearchWord=" & strSearchWord

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN
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
		div.list ul li.title{
			width: 430px;
			text-align: left;
		}
		div.list ul li.file{
			width: 60px;
			text-align: center;
		}
		div.list ul li.file img{
			padding-top:6px;
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
			var $search = $("#txtSearchWord");
			var vPlaceHolder = $search.attr("placeholder");
			var vValue = $search.val();
			if(vPlaceHolder == vValue){
				vValue = "";
			}
			location.href = "/mng/contents/recruit.asp?txtSearchWord=" + vValue; 
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
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header_adm.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left_adm.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">채용공고</h2>
			<div class="right" style="padding-top:15px;">
				<input id="txtSearchWord" name="txtSearchWord" class="left placeholder" type="text" placeholder="검색하실 단어를 입력하세요." value="<%=strSearchWord%>" onkeypress="fncKeySearch()" onkeyup="fncKeySearch()" style="border:1px solid #d0d0d0; width:253px; height:25px; line-height:25px; padding-left:8px;" />
				<button class="left" type="button" onclick="fncGetList()" style="margin-left:0;"><img class="left" src="/images/btn/search.jpg" alt="채용공고 검색 버튼" /></button>
			</div>
			<div class="list">
				<ul class="list_header">
					<li class="date">날짜</li>
					<li class="file">&nbsp;</li>
					<li class="title">제목</li>
					<li class="view_cnt">조회</li>
					<li class="edit">수정</li>
				</ul>
		<%
			Set objRecord = Server.CreateObject("ADODB.RecordSet")
			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE, "&_
			               "              ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
			               "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM, F.CNT   "&_
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

		 	strSQL = strSQL & " ORDER BY B.WRT_DTM ASC"
		 
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
					<li class="date"><%=objRecord("WRT_DTM")%></li>
					<li class="file"><% If objRecord("CNT") > 0 Then %><img src="/images/page/news/file.jpg" alt="" /><% Else Response.write "&nbsp;" End If%></li>
					<li class="title">
						<a href="/mng/contents/recruit_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="상세정보 페이지로 이동"><%=objRecord("TITLE")%></a>
					</li>
					<li class="view_cnt"><%=objRecord("SRCH_CNT")%></li>
					<li class="edit">
						<a href="/mng/contents/recruit_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="수정 페이지로 이동">
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
				objRecord.Close
				Set objRecord = Nothing
		%>				
			</div>
			<div style="position:relative;">
				<div class="left btn list_back" style="position:absolute; top:5px; right:0;">
					<a class="btn_big blue" href="/mng/contents/recruit_detail.asp">새글쓰기</a>
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

		