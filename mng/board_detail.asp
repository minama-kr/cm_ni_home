<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>게시글 상세</title> 
	<link rel="stylesheet" href="/css/layout.css" />
	<link rel="stylesheet" href="/css/mng.css" />
	<style type="text/css">
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
</head>
<body id="mng">
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">게시글 상세</h2>
			<div class="list_detail">
				<img src="/images/page/news/bg_list_detail_top.jpg" alt="" />
				<div class="list_detail_bg">
					<ul class="header">
						<li class="title"><h3>천안, 아산지역 최초 보건복지부 요양병원 인증합격<img src="/images/icon/icon_list_new.png" alt="새로운 글" /></h3></li>
						<li class="view_cnt"><img src="/images/icon/view.jpg" alt="" /></li>
						<li class="view_cnt">
							<span>&nbsp;조회수<span class="bold"> 671</span></span>
						</li>
						<li class="dvs"><img src="/images/page/news/dvs_list_detail.jpg" alt="" /></li>
						<li class="date"><span>2014.12.10</span></li>
					</ul>

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
				<img src="/images/page/news/bg_list_detail_botm.jpg" alt="" />
			</div>

			<div class="left btn">
				<button class="left btn_big gray" type="button" onclick="fncEdit('com', 'd')">목록</button>
			</div>
			<div class="right btn">
				<button class="left btn_big gray" type="button" onclick="fncInit('com')">삭제</button>
				<button class="left btn_big gray" type="button" onclick="fncInit('com')">새글쓰기</button>
				<button name="btn_edit" class="left btn_big gray" type="button" onclick="fncEdit('com', '')">게시완료</button>
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>