<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	'paging 선언(리스트)
	intRowSize = 10 	'한페이지에 보여줄 row count
	intPageSize = 10	'한 블럭에 보여줄 page count
	intPage = Request("page")	'현재 페이지
	strBbsDvs = "C11"
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
		.thmb_img img{
			width: 320px;
		}
		div.hospital_list{
			font-size:0;
			line-height: 0;
			width:357px;
			float:left;
			margin-top:10px;
		}

		div.hospital_list div.hospital_list_bg > h3{
			font-size:16px;
			line-height: 36px;
			font-weight: bold;
			color:#000;
			text-overflow:ellipsis;
			white-space: nowrap;
			overflow : hidden;
		}

		div.hospital_list div.hospital_list_bg > p{
			font-size:13px;
			line-height: 20px;
			margin-top:10px;
		}

		div.hospital_list div.hospital_list_bg h3.title img{
			margin-top:10px;
			margin-left:10px;
		}

		div.hospital_list div.hospital_list_bg ul.header{
			height:37px;
			border-top:1px solid #d0d0d0;
			margin-top:10px;
		}

		div.hospital_list div.hospital_list_bg ul.header li{
			float:left;
		}

		div.hospital_list div.hospital_list_bg ul.header li.title{
			width:135px;
		}
		div.hospital_list div.hospital_list_bg ul.header li.dvs{
			text-align: center;
			width:20px;
		}

		div.hospital_list div.hospital_list_bg ul.header li a{
			font-size:13px;
			line-height: 37px;
			font-weight: bold;
			color:#00bcde;
		}

		div.hospital_list div.hospital_list_bg ul.header li img{
			margin-top:12px;
			margin-right:4px;
		}

		div.hospital_list div.hospital_list_bg ul.header li.view_cnt img{
			margin-top:13px;
		}

		div.hospital_list div.hospital_list_bg ul.header li span{
			line-height: 37px;
			font-size:13px;
		}		
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/com0mon.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<div style="background:url(/images/page/news/elder_album_bg_top.jpg) no-repeat 0 top; width:100%; height:246px; margin-bottom:22px;">
				<h2>어르신앨범</h2>
				<h4 class="blind">
					천안시립노인전문병원은 어르신들이 편안과 행복이 함께하길 기원합니다
				</h4>
				<p class="blind">
					어르신들의 쾌유와 건강, 행복을 되찾고 삶의 가치를 높이실 수 있도록 천안시립노인전문병원이 함꼐 할 것입니다. 어르신앨범에서는 어르신들의 즐거운 병원생활을 확인하실 수 있습니다.
				</p>
			</div>
	<%
		'DB 연결
		Set objConn = Server.CreateObject("ADOdb.Connection")
		objConn.Open IC_DB_CONN

		Set objRecord = Server.CreateObject("ADODB.RecordSet")
		strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.SMR_CNTE, B.CNTE, ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
		                "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
		                "               ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE, B.THMB_URL, THMB_DESC   "&_
	                      "     FROM NI_USER_BBS B LEFT OUTER JOIN NI_USER_BBS_CNT C "&_
	                      "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
	                      "   WHERE B.BBS_DVS = '" & strBbsDvs &"'" 

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
		'지정한 row count만큼 화면에 뿌려줌
		Do Until objRecord.EOF OR intCnt > intRowSize
			strMargin = ""
			If intCnt Mod 2 = 1 Then
				strMargin = "margin-right:10px;"
			End If
	%>
			<div class="hospital_list" style="<%=strMargin%>">
				<img src="/images/page/news/bg_list_health_top.jpg" alt="" />
				<div class="hospital_list_bg" style="background:url(/images/page/news/bg_list_health.jpg) repeat-y 0 top; padding:0 17px 0 20px;">
					<h3 class="title">
						<%=objRecord("TITLE")%>
					<% If objRecord("DUE") < CONTENT_NEW_DUE Then %>
						<img src="/images/icon/icon_list_new.png" alt="새로운 글" />
					<% End If %>
					</h3>
					<a href="/news/elder_album_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" class="thmb_img">
						<% If objRecord("THMB_URL") <> "" Then %>
							<img src="<%=objRecord("THMB_URL") %>" alt="<%=objRecord("THMB_DESC")%>" />	
						<%End If%>
					</a>
					<p class="smr_content"><%=Replace(objRecord("SMR_CNTE"), Chr(13), "<br>")%></p>
					<ul class="header">
						<li class="title"><a href="/news/elder_album_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="어르신앨범 상세보기 이동"><img src="/images/page/news/icon_readMore.jpg" alt="">Read More</a></li>
						<li class="view_cnt"><img src="/images/icon/view.jpg" alt="" /></li>
						<li class="view_cnt">
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