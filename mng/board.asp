<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	bbsType = "mypage"
	If Len(intPage) = 0 Then
		intPage = 1
	End If

	bbs_dvs = Request("bbs_dvs")
	'paging에 사용됨
	strTabCd = bbs_dvs

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	Set objRecord = Server.CreateObject("ADODB.RecordSet")
	strSQL = " SELECT BBS_KEY, BBS_DVS, BS_WRT_CLS, TITLE,  NTC_YN, BLTN_YN, SCRT_YN,  PRCS_FG,  WRT_DTM   "&_
                       "    FROM CM_USER_BBS"&_
                       " WHERE BBS_DPTH = 0 " 
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
	<title>전체게시판 관리</title> 
	<link rel="stylesheet" href="/css/layout.css" />
	<link rel="stylesheet" href="/css/mng.css" />
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
</head>
<body id="mng">
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header_adm.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left_adm.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">전체게시판 관리</h2>
			<div class="right" style="padding-top:15px;">
				<input class="left placeholder" type="text" style="border:1px solid #d0d0d0; width:180px; height:25px; line-height:25px; padding-left:8px;" placeholder="검색하실 단어를 입력하세요." />
				<img class="left" src="/images/btn/search.jpg" alt="공지사항 검색 버튼" />	
			</div>
			<div class="list">
				<ul class="list_header">
					<li class="date">날짜</li>
					<li class="dvs">구분</li>
					<li class="title">제목</li>
					<li class="answer">답변</li>
					<li class="confirm">게시</li>
					<li class="view_cnt">조회</li>
					<li class="interval">인터벌</li>
					<li class="edit">수정</li>
				</ul>
		<%
			'지정한 row count만큼 화면에 뿌려줌
			Do Until objRecord.EOF OR intCnt > intRowSize
			%>
				<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
			<% 	
				objRecord.MoveNext
				intCnt = intCnt + 1
				Loop
		%>				
			</div>
			<div class="paging">
				<a class="" href="#" title="목록에서 처음페이지로 이동"><img src="/images/icon/first.jpg" alt="첫 페이지로 이동" /></a>
				<a class="prev_n" href="#" title="목록에서 이전 페이지로 이동"><img src="/images/icon/prev.jpg" alt="이전 페이지로 이동" /></a>
				<span class="paging_numbers">
					<a class="selected" href="#">1<span class="blind">페이지로 이동</span></a>
					<a href="#">2<span class="blind">페이지로 이동</span></a>
					<a href="#">3<span class="blind">페이지로 이동</span></a>
					<a href="#">4<span class="blind">페이지로 이동</span></a>
					<a href="#">5<span class="blind">페이지로 이동</span></a>
					<a href="#">6<span class="blind">페이지로 이동</span></a>
					<a href="#">7<span class="blind">페이지로 이동</span></a>
					<a href="#">8<span class="blind">페이지로 이동</span></a>
					<a href="#">9<span class="blind">페이지로 이동</span></a>
				</span>
				<a class="next_n" href="#" title="목록에서 다음 페이지로 이동"><img src="/images/icon/next.jpg" alt="다음 페이지로 이동" /></a>
				<a href="#" title="목록에서 마지막 페이지로 이동"><img src="/images/icon/last.jpg" alt="마지막 페이지로 이동" /></a>
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

		