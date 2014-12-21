<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<%
	strBbsDvs = Request("DVS")
	If strBbsDvs = "" Then
		strBbsDvs = "C07" '자주하는질문
	End If
	strBbsKey = Request("key")
	strMode = "u"
	If strBbsKey = "" Then
		strMode = "s"
	End If
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title><%=strHtmlTitle%></title> 
	<link rel="stylesheet" href="/css/mng.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style>
		div.list ul li.no{
			width: 50px;
			margin-right:40px;
			text-align: right;
		}
		div.list ul li.title{
			width: 634px;
			text-align: left;
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
		}
		div.faq ul.selected li a,div.faq ul.selected li span{
			color:#58c2d5;
		}
		div.faq ul li.content img{
			position: absolute;
			top:20px;
			left:30px;
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
		div.edit div{
			min-height: 44px;
		}
		div.edit div.textarea{
			height:330px;
		}
		div.edit input, div.edit textarea{
			width:600px;
			line-height: 24px;
			padding-left:8px;
			display: inline-block;
			float: left;
			margin-top:8px;
		}		
		div.edit textarea{
			height:312px;
		}
		div.edit input{
			height: 24px;
		}
		div.edit input.error{
			border:1px solid red;
		}
		div.list_detail div.contents{
			font-size:13px;
			line-height: 16px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			vMode = $("#pMode").val();
			if(vMode.toLowerCase() == "s"){
				$("button[name='btn_new']").addClass("none");
			}
		});

		function fncInit() {
			$("#pMode").val("s");
			$("#pContent").val("");
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
			var content = $("#pContent").val();
			if(content == ""){
				alert("내용을 입력해 주세요.");
				$("#pContent").focus();
				return false;
			}
			document.frm.submit();
		}
	</script>
</head>
<body id="mng">
	<form id="frm" name="frm" action="bbs_biz.asp" method="post" onsubmit="return false" enctype="multipart/form-data" >
		<input type="hidden" id="pMode" name="pMode" value="<%=strMode%>" />
		<input type="hidden" id="pKey" name="pKey" value="<%=strBbsKey%>" />
		<input type="hidden" id="pDvs" name="pDvs" value="<%=strBbsDvs%>" />
		<input type="hidden" id="pUrl" name="pUrl" value="<%=strUrlInfo%>" />
		<!-- 상단 메뉴 -->
		<!--#include virtual = "/comm/header_adm.asp"-->
		<div class="wrap" style="overflow:hidden;">
			<!-- 왼쪽 사이드 메뉴 -->
			<!--#include virtual = "/comm/left_adm.asp"-->
			<div id="content" class="right_wrap">
			<!-- 서브 페이지 컨텐츠 입력 -->
				<h2>자주하는질문 작성</h2>
				<%
					'DB 연결
					Set objConn = Server.CreateObject("ADOdb.Connection")
					objConn.Open IC_DB_CONN

					Set objRecord = Server.CreateObject("ADODB.RecordSet")
					strSQL = " SELECT B.BBS_SEQ_NO, B.TITLE, B.CNTE "&_
				                      "     FROM NI_USER_BBS B "&_
				                      "   WHERE B.BBS_DVS = '" & strBbsDvs &"'" 
					If strBbsKey <> "" Then
						strSQL = strSQL & "       AND B.BBS_KEY = " & strBbsKey
					End If

				 	objRecord.Open strSQL, objConn, 1

				 	strTitle = ""
				 	strCnte = ""
				 	strClass = ""

				 	If objRecord.RecordCount > 0 AND strBbsKey <> "" Then 
						strTitle = objRecord("TITLE")
						strCnte = objRecord("CNTE")
					Else 
						strClass = "none" 
					End If 
					objRecord.Close			 

					intCnt = 1
					'지정한 row count만큼 화면에 뿌려줌
					%>
						<div class="edit">
							<div class="top_bd_black">
								<label for="pTitle">질문사항</label>
								<input type="text" id="pTitle" name="pTitle" class="placeholder" placeholder="제목을 입력해주세요.." maxlength="300" value="<%=strTitle%>" />
								<span class="blind">* 필수입력란 입니다.</span>
							</div>
							<div class="top_bd_silver botm_bd_black textarea">
								<label for="pContent">답변</label>
								<textarea id="pContent" name="pContent" rows="13"><%=strCnte%></textarea>
							</div>
						</div>
						<div class="left btn list_back">
							<a class="btn_big gray" href="/mng/contents/faq.asp">목록</a>
						</div>
						<div class="right btn">
							<button name="btn_del" class="left btn_big gray" type="button" onclick="fncEdit('d')">삭제</button>
							<button name="btn_new" class="left btn_big blue" type="button" onclick="fncInit()">새글쓰기</button>
							<button name="btn_edit" class="left btn_big gray" type="button" onclick="fncEdit()">완료</button>	
						</div>					
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
