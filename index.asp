<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>천안시립노인전문병원</title> 
	<link rel="stylesheet" href="/css/global.css" />
	<style type="text/css">
		#header{
			position:absolute;
			top:0;
			left:0;
			background:url(/images/intro/bg_menu.png) repeat-x 0 top;
			height:55px;
			width:100%;
		}		
		#header .wrap{
			height:55px;
		}
		#header #menu{
			position:absolute;
			bottom:3px;
			right:0;
		}
		#header #menu li{
			float:left;
			text-align: center;
			padding:4px 6px;
		}
		#header #menu li.dvs{
			padding:4px 0;
		}
		#header #menu li a{
			color:#868686;
		}
		#header #menu li img{
			margin-top:6px;
		}
		#main{
			margin-top:52px;
			height:740px;
			position:relative;
		}
		#main_bg{
			position: absolute;
			top:0;
			left:0;
			width:100%;
			height:740px;
		}
		#main_bg li{
			width:100%;
			height:740px;
		}
		#main_bg1{
			background:url(/images/intro/bg_main_ni_01.jpg) no-repeat center top;
			z-index:2;
		}
		#main_bg2{
			background:url(/images/intro/bg_main_ni_02.jpg) no-repeat center top;
			z-index:1;
		}
		.mg_auto{
			margin:0 auto;
		}
		.wrap{
			width:961px;
			margin:0 auto;
			position: relative;
			z-index:99999;
		}
		#move_hospital a{
			display: block;
			float:left;
			margin:0 10px;
		}
		#move_hospital .move_off{
			margin-top:70px;
		}
		#move_hospital .move_on{
			margin-top:0;
		}
		#footer ul{
			height:102px;
		}
		#footer li{
			float:left;
		}
		#controls{
			display: none;
		}
	</style>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="/js/jquery.sudoSlider.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#footer li img").mouseover(function(){
				$(this).attr("src", $(this).attr("src").replace("_off", "_on"));
			}).mouseout(function(){
				$(this).attr("src", $(this).attr("src").replace("_on", "_off"));
			});
			var sudoSlider = $("#main_bg").sudoSlider({ 
	       		effect: "fade"
	     		});

		    	if($("#main_bg > ul > li").length > 0){  	
					//fncFadeBanner();
					var sudoSlider2 = $("#main_bg").sudoSlider({ 
			    		effect:"fade",
			    		responsive: true,
			    		numeric:true,
			    		speed: 1000,
			    		prevNext:false,
			    		pause: 5000,
			    		auto:true		
			    	});
		       }
		       $(window).resize(function() {
				if($("#main_bg > ul > li").length > 0){  	
					fncResizecontrols();
				}			
			});
		});

		function fncResizecontrols() {
			var vInfo = fncBrowserInfo();
			var vleft = vInfo.width / 2 - $("#controls").width()/ 2 - 53;

			vleft = vleft <= 400 ? 400 : vleft;
			$("#controls").css("left", vleft.toString() + "px");
			$("#main_bg").css("width", vInfo.width);
		}
	</script>
</head>
<body>
	<div id="header">
		<div class="wrap">
			<a href="/index.asp"><img src="/images/intro/logo_top_ys.jpg" alt="첫페이지로 돌아가기" /></a>
			<ul id="menu">	
				<li style="border-bottom:1px solid #ff662a"><a href="/main.asp">천안시립노인전문병원</a></li>
				<li class="dvs" style="border-bottom:1px solid #89dae7"><img src="/images/intro/dvs.jpg" alt="" /></li>
				<li style="border-bottom:1px solid #89dae7"><a href="#">영서원</a></li>
				<li class="dvs" style="border-bottom:1px solid #89dae7"><img src="/images/intro/dvs.jpg" alt="" /></li>
				<li style="border-bottom:1px solid #89dae7"><a href="#">충무원</a></li>
				<li class="dvs"><img src="/images/intro/dvs.jpg" alt="" /></li>
				<li><a href="#">천안충무병원</a></li>
				<li class="dvs"><img src="/images/intro/dvs.jpg" alt="" /></li>
				<li><a href="#">충무노인복지센터</a></li>
				<li class="dvs"><img src="/images/intro/dvs.jpg" alt="" /></li>
				<li><a href="#">노인의전화</a></li>
			</ul>
		</div>
	</div>
	<div id="main">
		<div id="main_bg">
			<ul>
				<li id="main_bg1"></li>
				<li id="main_bg2"></li>
			</ul>
		</div>
		<div class="wrap">
			<div class="mg_auto" style="width:861px; padding-top:40px;"><img src="/images/intro/intro_wording.png" alt="자연과 함께 숨쉬는 노인전문재단 천안 노인의료 복합단지 입니다." /></div>
			<div id="move_hospital" class="mg_auto" style="width:682px; padding-top:40px;">
				<a href="/main.asp"><img class="move_on" src="/images/intro/enter_hospital_on.png" alt="전문적인 재활치료 프로그램 운영을 통해 어르신에게 최고의 의료 서비스를 제공하는 천안시립 노인전문병원 홈페이지 바로가기" /></a>
				<a href="http://192.168.10.140:8085"><img class="move_off" src="/images/intro/enter_ys_off.png" alt="천안 최대의 고품격 요양시설 질 높은 의료 서비스 청정 자연환경을 자랑하는 영서요양원 홈페이지 바로가기" /></a>
				<a href="http://192.168.10.140:8086"><img class="move_off" src="/images/intro/enter_cm_off.png" alt="최상의 시설과 질높고 개별화된 요양서비스. 청청의 자연환경을 자랑하는 충무요양원 홈페이지 바로가기" /></a>
			</div>
		</div>
	</div>
	<div style="position:absolute; top:791px; left:0; border-top:1px solid #e8e8e8;width:100%; height:1px;z-index:-1"></div>
	<div id="footer">
		<ul class="wrap">
			<li><a href="#"><img src="/images/intro/introduce_off.jpg" alt="병원소개 바로가기" /></a></li>
			<li><a href="#"><img src="/images/intro/subject_off.jpg" alt="진료과목안내 바로가기" /></a></li>
			<li><a href="#"><img src="/images/intro/rehabilitation_off.jpg" alt="재활전문치료센터소개 바로가기" /></a></li>
			<li><a href="#"><img src="/images/intro/society_off.jpg" alt="사회사업실소개 바로가기" /></a></li>
			<li><a href="#"><img src="/images/intro/album_off.jpg" alt="병원엘범 바로가기" /></a></li>
			<li><a href="#"><img src="/images/intro/qna_off.jpg" alt="질문 및 답변 바로가기" /></a></li>
		</ul>
		<div style="height:75px; width:100%; background: #e2e2e2;">
			<div class="wrap">
				<img src="/images/intro/logo_grand.jpg" alt="천안시립노인전문병원" style="float:left; margin-top:17px; margin-left:100px;" />
				<p style="float:right; color:#484848; margin-top:17px; margin-right:100px;">
					충청남도 천안시 동남구 목천읍 송전리 431&nbsp; 대표전화 042.521.1114&nbsp; 팩스 041.521.1239 <br/>
					Copyright ⓒ 2014 Cheonan City Geriatrics Hospital. All right reserved.
				</p>
			</div>
		</div>
	</div>
</body>
</html>
				