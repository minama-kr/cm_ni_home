<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	strBbsDvs = "C07" '자주하는질문
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title><%=strHtmlTitle%></title> 
	<link rel="stylesheet" href="/css/mng.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.list ul li.no{
			width: 50px;
			margin-right:40px;
			text-align: right;
		}
		div.list ul li.title{
			width: 554px;
			text-align: left;
		}
		div.list ul li.edit{
			width:80px;
		}
		div.faq ul li.content{
			float:none; 
			background-color:#fafafa; 
			border-top:1px solid #4ebcd0; 
			position:relative; 
			clear:both; 
			padding:20px 30px 20px 90px; 
			line-height:19px;
			min-height: 38px;
			white-space: normal;
			text-overflow:normal;
			overflow : auto;
			text-align: left;
		}
		div.faq ul.selected li button,div.faq ul.selected li span, div.faq ul li button:focus{
			color:#58c2d5;
		}
		div.faq ul li.content img{
			position: absolute;
			top:20px;
			left:30px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".list ul li.title a").click(function(){
				$div = $(this).parent().parent().parent();
				$ul = $(this).parent().parent();
				$div.find("ul.list_item").removeClass("selected").find("li.reply").addClass("blind").removeClass("content");
				$ul.addClass("selected").find(".reply").addClass("content").removeClass("blind");
			});
		});
	</script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header_adm.asp"-->
	<div class="wrap" style="overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left_adm.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">자주하는질문</h2>
			<div class="list faq">
				<ul class="list_header">
					<li class="no">번호</li>
					<li class="title">질문사항</li>
				</ul>
			<%
				'DB 연결
				Set objConn = Server.CreateObject("ADOdb.Connection")
				objConn.Open IC_DB_CONN

				Set objRecord = Server.CreateObject("ADODB.RecordSet")
				strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.BBS_SEQ_NO, B.TITLE, B.CNTE "&_
			                      "     FROM NI_USER_BBS B "&_
			                      "   WHERE B.BBS_DVS = '" & strBbsDvs &"'" 

			 	strSQL = strSQL & " ORDER BY BBS_SEQ_NO ASC"

			 	objRecord.Open strSQL, objConn, 1

				intCnt = 1
				'지정한 row count만큼 화면에 뿌려줌
				Do Until objRecord.EOF
				%>
					<ul class="list_item">
						<li class="no"><span><%=objRecord("BBS_SEQ_NO")%></span></li>
						<li class="title"><button type="button" title="질문에 대한 답변을 확인합니다."><%=objRecord("TITLE")%></button></li>
						<li class="edit">
							<a href="/mng/contents/faq_detail.asp?key=<%=objRecord("BBS_KEY")%>&dvs=<%=objRecord("BBS_DVS")%>" title="수정 페이지로 이동">
								<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
							</a>
						</li>
					<%
						strContent = objRecord("CNTE")
						If isNull(strContent) = false AND strContent <> "" Then
					%>
							<li class="reply blind" id="description_<%=intCnt%>"><img src="/images/page/voc/reply.jpg" alt="" /><%=strContent%></li>
					<%
						End If
					%>
					</ul>
				<% 	
					objRecord.MoveNext
					intCnt = intCnt + 1
				Loop

					If intCnt = 1 Then
				%>
					<p class="null_list">데이터가 없습니다.</p>
				<%
					End If
			%>								
			</div>
			<div class="btn right">
				<a class="btn_big blue" href="/mng/contents/faq_detail.asp">새글쓰기</a>	
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
