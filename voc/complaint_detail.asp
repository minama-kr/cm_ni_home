<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	strBbsDvs = Request("dvs")
	If strBbsDvs = "" Then
		strBbsDvs = "C04"
	End If
	strBbsKey = Request("key")
	strMode = "s"

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	If strBbsKey <> "" Then
		strSQL = "UPDATE NI_USER_BBS_CNT SET SRCH_CNT = (SRCH_CNT + 1), LST_MDF_DTM = GETDATE() "&_
		                " WHERE BBS_DVS = '" & strBbsDvs & "' "&_
			         "        AND BBS_KEY = " & strBbsKey
		objConn.Execute(strSQL)
	End If
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>질문 및 답변 상세</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.list_detail ul.header_reply li{
			float:left;
			font-size:13px;
		}
		div.list_detail ul li.writer{
			width: 150px;
			text-align: right;
		}
		div.list_detail ul li.title{
			width:445px;
		}
		div.list_detail ul li.title .reply_title{
			font-size:14px;
			color:#000;
		}
		div.list_detail ul li.dvs{
			width:20px;
			text-align: center;
		}	
		div.list_detail ul li.reply_cnt{
			width: 110px;
			text-align: right;
		}
		div.list_detail ul li.date{
			float: right;
			text-align: center;
		}
		div.list_detail ul.header{
			height:42px;
			border-bottom:1px solid #d0d0d0;
			position: relative;
		}

		div.list_detail ul.header_reply{
			height:30px;
			border-top:1px solid #d0d0d0;
			padding-top:10px;
			margin-top:20px;
			position: relative;
		}
		
		div.list_detail ul.header li.writer button.setup{
			float:right;
			margin-top:12px;
		}
		div.list_detail ul.header_reply li.writer button.setup{
			float:right;
			margin-top:6px;
		}
		div.list_detail ul.header li.writer button.setup img{
			margin-top:0px !important;
		}
		div.list_detail ul.header_reply li.writer button.setup img{
			margin-top:0px !important;	
		}

		div.list_detail div.list_detail_bg ul.header_reply li img{
			margin-top:9px;
		}

		div.list_detail div.list_detail_bg ul.header_reply li span{
			line-height: 30px;
		}
		div.edit {
			padding-top:20px;
			clear:both;
		}
		div.edit h4{
			color:#00bcde;
			font-size:15px;
			padding-bottom:5px;
		}
		div.edit label{
			display: inline-block;
			width: 100px;
			text-align: center;
			font-weight: bold;
			margin-top:0px;
			float: left;
		}

		div.edit label{
			padding-top:13px
		}

		div.edit span{
			display: block;
			height: 20px;
			line-height: 20px;
			clear: both;
			padding-left:89px;
			color:red;
		}

		div.edit div{
			min-height: 44px;
		}
		div.edit div.textarea{
			height:88px;
		}

		div.edit input, div.edit textarea{
			width:600px;
			line-height: 24px;
			padding-left:8px;
			height:80px;
			display: inline-block;
			float: left;
		}
		
		div.edit input{
			height: 24px;
		}
		div.edit input, div.edit textarea{
			margin-top:8px;
		}

		div.list_detail div.contents{
			font-size:13px;
			line-height: 16px;
		}

		div.edit div.textarea label{
			line-height: 70px;
		}

		div.edit div.textarea{
			height:100px;
		}

		#reply_edit{
			display: none;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		function fncInit (state) {
			if(state.toLowerCase() == "open"){
				$("#reply_edit").css("display", "block");
			}else{
				$("#reply_edit").css("display", "none").find("input, textarea").val("");
				$("#btn_del").addClass("none");
				$("#pMode").val("s");
			}
		}

		function	 fncEditReply(key, name, type, thisObj){
			$ul = $(thisObj).parent().parent();
			$ul.append($("#setup").css("display", "block"));
			$("#pNewKey").val(key);
			$("#pEditType").val(type);
			$("#pEditName").val(name);
			$("#pEditPwsd").focus();
		}

		function fncEditReplyPswdCheck(){
			var key = $("#pNewKey").val();
			var type = $("#pEditType").val();
			var pswd = $("#pEditPwsd").val(); 

			$.ajax({
				type:"POST",
				data:{
					pKey : key,
					pDvs : $("#pDvs").val(),
					pType : type,
					pPswd : pswd,
					pMode : "p"	
				},
				url:"/voc/qna_biz.asp",
				success : function(result){
					if(result == "true"){
						fncInit("open");
						if(type == "r"){
							$("#pMode").val("u");
							$("#pName").val($("#pEditName").val());
							$("#pPswd").val(pswd);
							$("#pContent").val($("#div_contents_" + key).html()).focus();
							$("#setup").css("display", "none").find("input").val("");
							$("#btn_del").removeClass("none");	
						}else{
							window.location =  "/voc/complaint_modify.asp?key=" + $("#pKey").val() + "&dvs=" +$("#pDvs").val() + "&pswd=" + pswd;
						}
					}else{
						alert("비밀번호가 일치 하지 않습니다.");
						$("#pEditPwsd").val("").focus(); 
					}
				},
				error : function(request, status, error){
					alert("code : " + request.status + "\n" + "message: " + request.responseText + "\n" + "error : " + error);
				}
			});
		}

		function fncEditReplyClose() {
			$("#setup").css("display", "none");
			var newKey = $("#pNewKey").val();
			$("#btn_reply_" + newKey).focus();
			$("#pEditPwsd").val("");
			$("#pMode").val("s");
		}

		function fncEdit(pMode){
			pMode = pMode == "" || pMode == undefined ? $("#pMode").val() : pMode;
			if(pMode.toLowerCase() == "d"){
				if(!confirm("선택한 항목을 삭제하시겠습니까?")){
					return false;
				}
				$("#pMode").val("d");
			}else{
				var name = $("#pName").val();
				if(name == ""){
					alert("이름을 입력해 주세요.");
					$("#pName").focus();
					return false;
				}
				var pwsd = $("#pPswd").val();
				if(pwsd == ""){
					alert("비밀번호를 입력해 주세요.");
					$("#pPswd").focus();
					return false;
				}
				var content = $("#pContent").val();
				if(content == ""){
					alert("내용을 입력해 주세요.");
					$("#pContent").focus();
					return false;
				}	
			}
			document.frm.submit();
		}
	</script>
</head>
<body>
	<input type="hidden" id="pEditKey" value="" />
	<input type="hidden" id="pEditType" value="" />
	<input type="hidden" id="pEditName" value="" />

	<form id="frm" name="frm" action="qna_biz.asp" method="post" onsubmit="return false">
		<input type="hidden" id="pMode" name="pMode" value="<%=strMode%>" />
		<input type="hidden" id="pType" name="pType" value="r" />
		<input type="hidden" id="pKey" name="pKey" value="<%=strBbsKey%>" />
		<input type="hidden" id="pNewKey" name="pNewKey" value="<%=strBbsKey%>" />
		<input type="hidden" id="pDvs" name="pDvs" value="<%=strBbsDvs%>" />
		<input type="hidden" id="pUrl" name="pUrl" value="<%=strUrlInfo%>" />
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div class="wrap" style="overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">질문 및 답변 상세</h2>
		<%
			Set objRecord = Server.CreateObject("ADODB.RecordSet")
			strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE,  B.WRTR_ID, BBS_DPTH, BBS_DPTH_SORT, "&_
			              "                  RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
			              "                 ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE   "&_			              
		                    "      FROM NI_USER_BBS B "&_
		                    "   WHERE B.BBS_DVS = '" & strBbsDvs & "'"
			If strBbsKey <> "" Then
				strSQL = strSQL & "       AND B.BBS_GRP = " & strBbsKey
			End If
			
			strSQL = strSQL & " ORDER BY B.BBS_DPTH ASC, B.BBS_DPTH_SORT ASC "
			objRecord.Open strSQL, objConn, 1

		%>				
			<div class="list_detail">
				<img src="/images/page/news/bg_list_detail_top.jpg" alt="" />
				<div class="list_detail_bg">
			<%
				'지정한 row count만큼 화면에 뿌려줌
			Do Until objRecord.EOF
				strKey = objRecord("BBS_KEY")
				strTitle = objRecord("TITLE")
				strCnte = objRecord("CNTE")
				nDepth = objRecord("BBS_DPTH")
				strWrtDtm = objRecord("WRT_DTM")
				nDue = objRecord("DUE")
				strWrtrId = objRecord("WRTR_ID")

			%>
				<% If nDepth = 0 Then %>
					<ul class="header">
						<li class="title">
							<h3><%=strTitle%><% If nDue < 2 Then %><img src="/images/icon/icon_list_new.png" alt="새로운 글" /><% End If %>	</h3>
						</li>
						<li class="writer">
							<img src="/images/page/voc/customer.jpg" alt="" />
							<span>&nbsp;<%=strWrtrId%>&nbsp;</span>
							<button type="button" id="btn_reply_<%=strKey%>" class="setup" title="본문 수정" onclick="fncEditReply('<%=strKey%>', '<%=strWrtrId%>', 'q', this)"><img src="/images/page/voc/setup.jpg" alt="" /></button> 
						</li>
						<li class="dvs"><img src="/images/page/news/dvs_list_detail.jpg" alt="" /></li>
						<li class="date"><span><%=strWrtDtm%></span></li>
					</ul>
					<div id="div_contents_<%=strKey%>" class="contents"><%=strCnte%></div>
				<% 
					Else 
						strClass = "class='reply_title'"
						strTitle = "[댓글]"
						strImgName = "customer"
						If nDepth = 1 Then 
							strTitle = "[답글]"
							strClass = "class='reply_title txt_00bcde'"
							strImgName = "manager"
						End If
				%>
					<ul class="header_reply">
						<li class="title">
							<span <%=strClass%>><%=strTitle%></span>
						</li>
						<li class="writer">
							<img src="/images/page/voc/<%=strImgName%>.jpg" alt="" />
							<span <%=strClass%>>&nbsp;<%=strWrtrId%>&nbsp;</span>
						<% If nDepth > 1 Then %>
						 	<button type="button" id="btn_reply_<%=strKey%>" class="setup" title="댓글 수정" onclick="fncEditReply('<%=strKey%>', '<%=strWrtrId%>', 'r', this)"><img src="/images/page/voc/setup.jpg" alt="" /></button> 
						<% End If%>
						</li>
						<li class="dvs"><img src="/images/page/news/dvs_list_detail.jpg" alt="" /></li>
						<li class="date"><span><%=strWrtDtm%></span></li>
					</ul>
					<div id="div_contents_<%=strKey%>" class="contents"><%=Replace(strCnte, Chr(13), "<br>")%></div>
				<% End If
				objRecord.MoveNext
				intCnt = intCnt + 1
			Loop
			objRecord.Close()
		%>
				</div>
				<img src="/images/page/news/bg_list_detail_botm.jpg" alt="" />
			</div>

			<div class="left btn list_back">
				<button name="btn_new" class="left btn_big orange" type="button" onclick="fncInit('open')">댓글쓰기</button>
			</div>
			<div class="right btn">
				<a class="btn_big blue" href="/voc/qna_modify.asp" title="질문 및 답변 목록으로 돌아가기">새글쓰기</a>
				<a class="btn_big gray" href="/voc/qna.asp" title="질문 및 답변 목록으로 돌아가기">목록</a>
			</div>

			<div id="reply_edit">
				<div class="edit">
					<h4>댓글쓰기</h4>
					<div class="top_bd_black">
						<label for="pName">이름</label>
						<input type="text" id="pName" name="pName" class="placeholder" placeholder="이름을 입력해주세요.." maxlength="8" value="" />
					</div>
					<div class="top_bd_silver">
						<label for="pPswd">비밀번호</label>
						<input type="password" id="pPswd" name="pPswd" class="placeholder" maxlength="30" value="" />
					</div>
					<div class="top_bd_silver botm_bd_black textarea">
						<label for="pContent">내용작성</label>
						<textarea id="pContent" name="pContent"></textarea>
					</div>	
				</div>
				<div class="left btn">
					<button id="btn_del" name="btn_new" class="left btn_big blue none" type="button" onclick="fncEdit('d')">삭제</button>
				</div>
				<div class="right btn">
					<button name="btn_new" class="left btn_big gray" type="button" onclick="fncInit('close')">취소</button>
					<button name="btn_new" class="left btn_big gray" type="button" onclick="fncEdit()">완료</button>
				</div>
			</div>

			<div class="near_list">
			<%
				strNearKey = ""
				strNearDvs = ""
				strLinkUrl = "#"
				strTitle = "이전글이 없습니다."
				strSQL = " SELECT TOP(1) B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE,  B.NTC_YN, B.BLTN_YN, B.SCRT_YN, "&_
				              "              B.PRCS_FG, ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
				              "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
			                   "     FROM NI_USER_BBS B LEFT OUTER JOIN NI_USER_BBS_CNT C "&_
			                   "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
			                   " WHERE B.BBS_DVS = '" & strBbsDvs & "' AND B.BBS_DPTH = 0 "
				If strBbsKey <> "" Then
					strSQL = strSQL & "       AND B.BBS_KEY > " & strBbsKey
				End If
				strSQL = strSQL & " ORDER BY B.BBS_KEY ASC "
				objRecord.Open strSQL, objConn, 1

				If objRecord.RecordCount = 1 Then
					strNearKey = objRecord("BBS_KEY")
					strNearDvs = objRecord("BBS_DVS")
					strTitle = objRecord("TITLE") 
					strLinkUrl = "/news/recruit_detail.asp?key=" & strNearKey & "&dvs=" & strNearDvs
				End If

				objRecord.Close
			%>
				<ul>
					<li>이전글</li>
					<li class="dvs_img"><img src="/images/icon/up.jpg" alt="이전글" /></li>
					<li class="title"><a href="<%=strLinkUrl%>" title="이전글로 이동"><%=strTitle%></a></li>
				</ul>
			<%
				strNearKey = ""
				strNearDvs = ""
				strLinkUrl = "#"
				strTitle = "다음글이 없습니다."
				strSQL = " SELECT TOP(1) B.BBS_KEY, B.BBS_DVS, B.TITLE, B.CNTE,  B.NTC_YN, B.BLTN_YN, B.SCRT_YN, "&_
				              "              B.PRCS_FG, ISNULL(C.SRCH_CNT, 0) AS SRCH_CNT, "&_
				              "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
			                   "     FROM NI_USER_BBS B LEFT OUTER JOIN NI_USER_BBS_CNT C "&_
			                   "          ON B.BBS_DVS = C.BBS_DVS AND B.BBS_KEY = C.BBS_KEY "&_
			                   " WHERE B.BBS_DVS = '" & strBbsDvs & "'  AND B.BBS_DPTH = 0 "
				If strBbsKey <> "" Then
					strSQL = strSQL & "       AND B.BBS_KEY < " & strBbsKey
				End If
				strSQL = strSQL & " ORDER BY B.BBS_KEY DESC "
				objRecord.Open strSQL, objConn, 1

				If objRecord.RecordCount = 1 Then
					strNearKey = objRecord("BBS_KEY")
					strNearDvs = objRecord("BBS_DVS")
					strTitle = objRecord("TITLE") 
					strLinkUrl = "/news/recruit_detail.asp?key=" & strNearKey & "&dvs=" & strNearDvs
				End If
			%>
				<ul>
					<li>다음글</li>
					<li class="dvs_img"><img src="/images/icon/down.jpg" alt="다음글" /></li>
					<li class="title"><a href="<%=strLinkUrl%>" title="다음글로 이동"><%=strTitle%></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
	<style>
		#setup{
			width:320px;
			height:23px;
			line-height: 21px;
			position: absolute;
			right:155px;
			display: none;
		}
		.header #setup{
			top:11px;
		}
		.header_reply #setup{
			top:14px;
		}
		#setup button{
			margin:0;
			line-height: 23px;
			color:#000;
		}
		#setup label{
			padding:0 10px;
			font-size:13px;
		}
		#setup input{
			width:100px;
			height: 19px;
			margin-top:0;
			padding-left:10px;
			border:1px solid #dfdfdf;
		}
	</style>
	<div id="setup">
		<label class="left" for="pEditPwsd">비밀번호</label>
		<input class="left" type="password" id="pEditPwsd" value="" style="" />
		<button class="left" type="button" onclick="fncEditReplyPswdCheck()" title="댓글 비밀번호 확인" style="background-color:#d0d0d0; width:45px; height:21px; margin-right:2px;">확인</button>
		<button class="left" type="button" title="댓글 비밀번호 확인창 닫기" onclick="fncEditReplyClose()"><img src="/images/page/voc/close_silver.jpg" alt="닫기" /></button>
	</div>
</body>
</html>
<%
	objRecord.Close
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing
%>			