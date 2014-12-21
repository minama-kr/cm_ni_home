<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	strBbsDvs = Request("dvs")
	strBbsKey = Request("key")
	strMode = "u"
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>통합 관리</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		div.list_detail div.list_detail_bg ul.header li.title{
			width:535px;
		}
		div.list_detail div.list_detail_bg ul.header li.dvs{
			width:20px;
			text-align: center;
		}
		div.list_detail div.list_detail_bg ul.header li.date{
			float:right;
		}
		div.edit div{
			vertical-align: middle;
			line-height: 0;
			min-height: 44px;
		}
		div.top_bd_silver{
			border-top:1px solid #d0d0d0;
		}
		div.top_bd_black{
			border-top:1px solid #000;
		}
		div.botm_bd_black{
			border-bottom:1px solid #000;
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
			padding-top:23px
		}
		div.edit span{
			display: block;
			height: 20px;
			line-height: 20px;
			clear: both;
			padding-left:89px;
			color:red;
		}
		div.edit input[type=text]{
			width:600px;
			line-height: 24px;
			padding-left:8px;
			display: inline-block;
			float: left;
		}
		div.edit input{
			height: 24px;
		}
		div.edit input.error{
			border:1px solid red;
		}
		div.edit input[type=text], div.edit input[type=password]{
			margin-top:8px;
		}
		div.edit input[type=checkbox]{
			margin-top:11px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
	<script src="/ckfinder/ckfinder.js"></script>	
	<script>
		$(document).ready(function(){
			vMode = $("#pMode").val();
			if(vMode.toLowerCase() == "s"){
				$(".edit").css("margin-top", "0");
				$("button[name='btn_new']").addClass("none");
			}else{
				$(".edit").css("margin-top", "30px");
			}
		});

		function fncInit() {
			$(".list_detail").addClass("none");
			$(".edit").css("margin-top", "0");
			$("#pMode").val("s");
			$("#pEMail, #pPswd, #pName").val("");
			CKEDITOR.instances.pContent.setData("");
			$("#pTitle").val("").focus();
			$("button[name='btn_del']").addClass("none");
		}

		function fncEdit(pMode){
			pMode = pMode == "" || pMode == undefined ? $("#pMode").val() : pMode;
			if(pMode.toLowerCase() == "d"){
				if(!confirm("선택한 항목을 삭제하시겠습니까?")){
					return false;
				}
			}
			$("#pMode").val(pMode);
			var title = $("#pTitle").val();
			if(title == ""){
				alert("제목을 입력해 주세요.");
				$("#pTitle").focus();
				return false;
			}
			var content = CKEDITOR.instances.pContent.getData();
			if(content == ""){
				alert("내용을 입력해 주세요.");
				CKEDITOR.instances.pContent.focus();
				return false;
			}
			document.frm.submit();
		}
	</script>
</head>
<body>
	<form id="frm" name="frm" action="qna_biz.asp" method="post" onsubmit="return false">
		<input type="hidden" id="pMode" name="pMode" value="<%=strMode%>" />
		<input type="hidden" id="pType" name="pType" value="q" />
		<input type="hidden" id="pKey" name="pKey" value="<%=strBbsKey%>" />
		<input type="hidden" id="pDvs" name="pDvs" value="<%=strBbsDvs%>" />
		<input type="hidden" id="pUrl" name="pUrl" value="<%=strUrlInfo%>" />
		<!-- 상단 메뉴 -->
		<!--#include virtual = "/comm/header_adm.asp"-->
		<div style="width:958px; margin:0 auto; overflow:hidden;">
			<!-- 왼쪽 사이드 메뉴 -->
			<!--#include virtual = "/comm/left_adm.asp"-->
			<div id="content" class="right_wrap">
			<!-- 서브 페이지 컨텐츠 입력 -->
	<%
		'DB 연결
		Set objConn = Server.CreateObject("ADOdb.Connection")
		objConn.Open IC_DB_CONN

		Set objRecord = Server.CreateObject("ADODB.RecordSet")
		strSQL = " SELECT B.BBS_KEY, B.BBS_DVS, B.TITLE, B.SMR_CNTE, B.CNTE,  B.NTC_YN, B.BLTN_YN, B.SCRT_YN, "&_
		                "              RIGHT(REPLACE(CONVERT(VARCHAR, B.WRT_DTM, 111), '/', '.'), 8) WRT_DTM   "&_
		                "             ,DATEDIFF(day, B.WRT_DTM, GETDATE()) DUE, B.WRTR_ID, B.PSWD, B.EMAIL   "&_
	                      "     FROM NI_USER_BBS B "&_
	                      " WHERE B.BBS_DVS = '" & strBbsDvs & "'"
		If strBbsKey <> "" Then
			strSQL = strSQL & "       AND B.BBS_KEY = " & strBbsKey
		End If
		objRecord.Open strSQL, objConn, 1

		strTitle    = ""
		strCnte     = ""
		strName = ""
		strPswd = ""
		strEMail = ""
		strScrtYn = "N"
		nDue        = 0
		strWrtDtm   = ""
		strClass    = ""
	%>	
				<h2>질문 및 답변 작성</h2>
			<% 
				If objRecord.RecordCount > 0 AND strBbsKey <> ""  Then 
					strTitle = objRecord("TITLE")
					strCnte = objRecord("CNTE")
					strName = objRecord("WRTR_ID")
					strPswd = objRecord("PSWD")
					strEMail = objRecord("EMAIL")
					strScrtYn = "N"
					nDue = objRecord("DUE")
					strWrtDtm = objRecord("WRT_DTM")
				Else 
					strClass = "none"
				End If
			%>
				<div class="list_detail <%=strClass%>">
					<img src="/images/page/news/bg_list_detail_top.jpg" alt="" />
					<div class="list_detail_bg">
						<ul class="header">
							<li class="title">
								<h3>
									<%=strTitle%>
								<% If nDue < CONTENT_NEW_DUE Then %>
									<img src="/images/icon/icon_list_new.png" alt="새로운 글" />
								<% End If %>
								</h3>
							</li>
							<li class="writer">
								<img src="/images/page/voc/customer.jpg" alt="" />
								<span>&nbsp;<%=strName%>&nbsp;</span>
							</li>
							<li class="dvs"><img src="/images/page/news/dvs_list_detail.jpg" alt="" /></li>
							<li class="date"><span><%=strWrtDtm%></span></li>
						</ul>
						<div class="contents"><%=strCnte%></div>
					</div>
					<img src="/images/page/news/bg_list_detail_botm.jpg" alt="" />
				</div>
				<div class="edit">
					<div class="top_bd_black">
						<label for="pName">작성자</label>
						<input type="text" id="pName" name="pName" class="placeholder" placeholder="작성자를 입력해주세요." maxlength="50" value="<%=strName%>" />
						<span class="blind">* 필수입력란 입니다.</span>
					</div>
					<div class="top_bd_silver">
						<label for="pEMail">이메일</label>
						<input type="text" id="pEMail" name="pEMail" class="placeholder" placeholder="이메일을 입력해주세요." maxlength="100" value="<%=strEMail%>" />
						<span class="blind">* 필수입력란 입니다.</span>
					</div>
					<div class="top_bd_silver">
						<label for="pTitle">제목</label>
						<input type="text" id="pTitle" name="pTitle" class="placeholder" placeholder="제목을 입력해주세요.." maxlength="300" value="<%=strTitle%>" />
						<span class="blind">* 필수입력란 입니다.</span>
					</div>
					<div class="top_bd_silver">
						<label for="pContent">내용작성</label>
					</div>
				</div>
				<div class="botm_bd_black">
					<textarea id="pContent" name="pContent"><%=strCnte%></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('pContent', {                     
						    filebrowserUploadUrl : 	   '/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Files',
							filebrowserImageUploadUrl :'/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Images',
							filebrowserFlashUploadUrl :'/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Flash' //업로드                 
						});
					</script>
				</div>
				<div class="left btn list_back">
					<a class="btn_big gray" href="/board/bbs.asp">목록</a>
				</div>
				<div class="right btn">
					<button name="btn_del" class="left btn_big gray" type="button" onclick="fncEdit('d')">삭제</button>
					<button name="btn_edit" class="left btn_big gray" type="button" onclick="fncEdit()">완료</button>	
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