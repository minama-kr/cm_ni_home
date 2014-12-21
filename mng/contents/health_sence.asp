<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C02" '건강상식
	If Len(intPage) = 0 Then
		intPage = 1
	End If

	strDept = Request("dept") ' 부서 분류
	strSearchWord = Request("txtSearchWord") ' 검색 단어'

	strAddParameter = "&dept=" & strDept & "&txtSearchWord=" & strSearchWord

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
		div.list ul li.dept{
			width: 100px;
		}
		div.list ul li.title{
			width: 390px;
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
		div.health_categoty{
			background:url(/images/page/news/bg_list_health_dvs.jpg) no-repeat 0 top;
			height:29px;
			text-align:center;
			clear:both;
			margin-bottom: 21px;
			border-top:1px solid #8d8d8d;
		}

		div.health_categoty a{
			line-height: 27px;
			color:#000;
		}

		div.health_categoty a.selected{
			color:#ff7f41;
		}

		div.health_categoty img{
			margin:9px 15px 0 15px;
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
			location.href = "/mng/contents/health_sence.asp?dept=" + "<%=strDept%>" + "&txtSearchWord=" + vValue; 
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
			<h2 class="left">건강상식</h2>
			<div class="right" style="padding-top:15px;">
				<input id="txtSearchWord" name="txtSearchWord" class="left placeholder" type="text" placeholder="검색하실 단어를 입력하세요." value="<%=strSearchWord%>" onkeypress="fncKeySearch()" onkeyup="fncKeySearch()" style="border:1px solid #d0d0d0; width:253px; height:25px; line-height:25px; padding-left:8px;" />
				<button class="left" type="button" onclick="fncGetList()" style="margin-left:0;"><img class="left" src="/images/btn/search.jpg" alt="건강상식 검색 버튼" /></button>
			</div>
		<%
			' 상단 부서 분류 SQL'
			Set objRecord = Server.CreateObject("ADODB.RecordSet")
			strSQL = "SELECT  ISNULL(A.COM_CD, '') COM_CD, M.COM_NM, A.CNT "&_
					    "   FROM(SELECT  WRTR_ID AS COM_CD, COUNT(1) AS CNT "&_
              			    "                 FROM  NI_USER_BBS AS B   "&_
              			    "              WHERE  BBS_DVS = 'C02' "&_
                              "               GROUP BY WRTR_ID WITH ROLLUP) AS A "&_
                              "     LEFT OUTER JOIN NI_COM_CD_MST AS M "&_
                              "        ON A.COM_CD = M.COM_CD AND M.DVS_CD = 'C02' "&_
                              "  ORDER BY 1"
		    	objRecord.Open strSQL, objConn, 1
		    	nIndex = 0
	    	%>
			<div class="health_categoty">
	    	<%
	    		If objRecord.RecordCount > 0 Then 
			    	Do Until objRecord.EOF
			    		strSelectClass = ""
			    		If objRecord("COM_CD") = strDept Then
			    			strSelectClass = "selected"
			    		End If

			    		If nIndex = 0 Then
				%>
						<a class="<%=strSelectClass%>" title="전체 자료 보기" href="/mng/contents/health_sence.asp?dept=">전체(<%=objRecord("CNT")%>)</a>
				<%
					Else
				%>
						<img src="/images/page/news/dvs_list_health.jpg" alt="" />
						<a class="<%=strSelectClass%>" title="<%=objRecord("COM_NM")%> 건강 상식 보기" href="/mng/contents/health_sence.asp?dept=<%=objRecord("COM_CD")%>"><%=objRecord("COM_NM")%>(<%=objRecord("CNT")%>)</a>
				<%
			    		End If
					nIndex = nIndex + 1
					objRecord.MoveNext
				Loop
			Else
		%>
				<a class="<%=strSelectClass%>" title="전체 자료 보기" href="/mng/contents/health_sence.asp?dept=">전체(0)</a>
		<%
			End If
		%>
			</div>
			<div class="list">
				<ul class="list_header">
					<li class="date">날짜</li>
					<li class="dept">부서</li>
					<li class="title">제목</li>
					<li class="view_cnt">조회</li>
					<li class="edit">수정</li>
				</ul>
		<%
			objRecord.Close

			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE, M.COM_CD, M.COM_NM, "&_
			              "              ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
			              "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
		                   "     FROM NI_USER_BBS B "&_
		                   "                INNER JOIN NI_COM_CD_MST M "&_
		                   "          ON B.WRTR_ID = M.COM_CD AND M.DVS_CD = 'C02' "&_
		                   "                INNER JOIN NI_USER_BBS_CNT C "&_
		                   "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
		                   "   WHERE B.BBS_DVS = '" & strBbsDvs &"'"

                  	If strDept <> "" Then
                  		strSQL = strSQL & " AND B.WRTR_ID = '" & strDept & "' "
                  	End If
		 	If strSearchWord <> "" Then
		 		strSQL = strSQL & " AND B.TITLE LIKE '%" & strSearchWord & "%' OR M.COM_NM LIKE '%" & strSearchWord & "%' "
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
					<li class="date"><%=objRecord("WRT_DTM")%></li>
					<li class="dept"><%=objRecord("COM_NM")%></li>
					<li class="title">
						<a href="/mng/contents/health_sence_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="상세정보 페이지로 이동"><%=objRecord("TITLE")%></a>
					</li>
					<li class="view_cnt"><%=objRecord("SRCH_CNT")%></li>
					<li class="edit">
						<a href="/mng/contents/health_sence_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="수정 페이지로 이동">
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
					<a class="btn_big blue" href="/mng/contents/health_sence_detail.asp">새글쓰기</a>
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

		