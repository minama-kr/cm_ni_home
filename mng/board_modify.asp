<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>게시글 수정</title> 
	<link rel="stylesheet" href="/css/layout.css" />
	<link rel="stylesheet" href="/css/mng.css" />
	<style type="text/css">
		div.edit div{
			vertical-align: middle;
			line-height: 0;
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
			display: inline-block;
			float: left;
		}
		
		div.edit input{
			height: 24px;
		}
		div.edit input.error{
			border:1px solid red;
		}
		div.edit input, div.edit textarea, div.edit select{
			margin-top:8px;
		}

		select{
			width:150px;
			height:26px;
			line-height: 26px;
		}

		p.null_list{
			text-align: center;
			font-size:13px;
			font-weight: bold;
			line-height: 60px;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
</head>
<body id="mng">
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header_adm.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left_adm.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2>공지사항 수정</h2>
			<div class="edit">
				<div class="top_bd_black">
					<label for="txtDvsCd">분류</label>
					<select name="" id="">
						<option value="1">병원소식</option>
						<option value="2">공지사항</option>
						<option value="3">행사소식</option>
					</select>
				</div>
				<div class="top_bd_silver">
					<label for="txtTitle">제목</label>
					<input type="text" id="txtTitle" class="placeholder" placeholder="제목을 입력해주세요.." maxlength="3" value="" />
					<span class="blind">* 필수입력란 입니다.</span>
				</div>
				<!-- 건강 소식 -->
				<div class="top_bd_silver botm_bd_black">
					<label for="txtContents">내용작성</label>
				</div>	
			</div>
			<div>
				<textarea id="txtContents" name="txtContents">
					<p>평균 수명이 증가하면서 정형외과에서는 인공 관절수술을 많이 하게 되었습니다. 그 중 무릎 관절염으로 인공 관절 수술이 제일 많은데, 그만큼 많은 환자들이 퇴행성 무릎 관절염 통증으로 고생하고 있습니다.</p>

					<p>평균 수명이 증가하면서 정형외과에서는 인공 관절수술을 많이 하게 되었습니다. 그 중 무릎 관절염으로 인공 관절 수술이 제일 많은데, 그만큼 많은 환자들이 퇴행성 무릎 관절염 통증으로 고생하고 있습니다.</p>

					<p>허벅지의 앞쪽에 위치한 근육을 돼퇴 사두근이라 하는데 이는 슬관절을 신전 시키는 일을 하면서 서있거나 걸을 때 하지의 밸런스를 유지 시켜주는 역할을 합니다. 사두근을 강화 시켜주면 무릎 관절로 가는 하중을 줄여서 관절에 미치는 스트레스를 줄여주고, 결국 퇴행성 관절 질환을 예방해줍니다.</p>
				</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('txtContents', {                     
					    filebrowserUploadUrl : 	   '/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Files',
						filebrowserImageUploadUrl :'/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Images&NewFolderName=upload',
						filebrowserFlashUploadUrl :'/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Flash' //업로드                 

					});
				</script>
			</div>
			<div class="left btn delete none">
				<button class="left btn_big gray" type="button" onclick="fncEdit('dvs', 'd')">삭제</button>
			</div>
			<div class="right btn">
				<button class="left btn_big gray" type="button" onclick="fncInit('dvs')">초기화</button>
				<button name="btn_edit" class="left btn_big gray" type="button" onclick="fncEdit('dvs', '')">저장</button>	
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>