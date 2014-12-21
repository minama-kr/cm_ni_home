<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C02"
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
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
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
			margin-left:10px;
		}

		div.health_list div.health_list_bg p{
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

		div.health_list div.health_list_bg ul.header li.title{
			width:140px;
		}
		div.health_list div.health_list_bg ul.header li.dvs{
			text-align: center;
			width:20px;
		}

		div.health_list div.health_list_bg ul.header li h3{
			font-size:13px;
			line-height: 37px;
			font-weight: bold;
			color:#00bcde;
		}

		div.health_list div.health_list_bg ul.header li img{
			margin-top:15px;
		}

		div.health_list div.health_list_bg ul.header li.view_cnt{
			width: 100px;
			text-align: right;
		}

		div.health_list div.health_list_bg ul.header li.view_cnt img{
			margin-top:12px;
		}

		div.health_list div.health_list_bg ul.header li span{
			line-height: 37px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		function fncGetList(){
			var $search = $("#txtSearchWord");
			var vPlaceHolder = $search.attr("placeholder");
			var vValue = $search.val();
			if(vPlaceHolder == vValue){
				vValue = "";
			}
			location.href = "/news/health_sence.asp?dept=" + "<%=strDept%>" + "&txtSearchWord=" + vValue; 
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
						<a class="<%=strSelectClass%>" title="전체 자료 보기" href="/news/health_sence.asp?dept=">전체(<%=objRecord("CNT")%>)</a>
				<%
					Else
				%>
						<img src="/images/page/news/dvs_list_health.jpg" alt="" />
						<a class="<%=strSelectClass%>" title="<%=objRecord("COM_NM")%> 건강 상식 보기" href="/news/health_sence.asp?dept=<%=objRecord("COM_CD")%>"><%=objRecord("COM_NM")%>(<%=objRecord("CNT")%>)</a>
				<%
			    		End If
					nIndex = nIndex + 1
					objRecord.MoveNext
				Loop
			Else
		%>
				<a class="<%=strSelectClass%>" title="전체 자료 보기" href="/news/health_sence.asp?dept=">전체(0)</a>
		<%
			End If
		%>
			</div>
		<%
			objRecord.Close

			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.SMR_CNTE, B.CNTE, M.COM_CD, M.COM_NM, "&_
			                "                ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
			                "                RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
			                "               ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE   "&_
		                      "     FROM NI_USER_BBS B "&_
		                      "                 INNER JOIN NI_COM_CD_MST M "&_
		                      "          ON B.WRTR_ID = M.COM_CD AND M.DVS_CD = 'C02' "&_
		                      "                 INNER JOIN NI_USER_BBS_CNT C "&_
		                      "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
		                      "  WHERE B.BBS_DVS = 'C02' " 

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
				strStyle = ""
				If intCnt mod 2 <> 0 Then
					strStyle = "margin-right:10px;"
				End If

				strContent = objRecord("SMR_CNTE")
				If Len(strContent) > 145 Then
					strContent = Left(strContent, 145) & "..."
				End If
		%>
			<div class="health_list" style="<%=strStyle%>">
				<img src="/images/page/news/bg_list_health_top.jpg" alt="" />
				<div class="health_list_bg" style="background:url(/images/page/news/bg_list_health.jpg) repeat-y 0 top; padding:0 17px 0 20px;">
					<h3 class="title"><a href="/news/health_sence_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>"><%=objRecord("TITLE")%></a>
						<% If objRecord("DUE") < 2 Then %>
							<img src="/images/icon/icon_list_new.png" alt="새로운 글" />
						<% End If %>
					</h3>
					<p><a href="/news/health_sence_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>"><%=Replace(strContent, Chr(13), "<br>")%></a></p>
					<ul class="header">
						<li class="title"><h3><%=objRecord("COM_NM")%></h3></li>
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
				<!--#include virtual = "/comm/com_paging.asp"-->
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>