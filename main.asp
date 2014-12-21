<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>
<!--#include virtual = "/comm/com_const.asp"-->

<%

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	Set objRecord = Server.CreateObject("ADODB.RecordSet")
%>


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>천안시립노인전문병원</title> 
	<link rel="stylesheet" href="/css/common.css" />
	<link rel="stylesheet" href="/css/layout.css" />
	<style type="text/css">
		#tab_list{
			width:416px;
			height:136px;
			background:url(/images/main/bg_tab.jpg) no-repeat 0 top;
			position: relative;
		}
		.tab{
			position: absolute;
			top:0;
			left:0;
		}
		a.more{
			position: absolute;
			top:6px;
			right:15px;
			height: 33px;
		}
		.tab button.title{
			position: absolute;
			top:0px;
			height:36px;
			display: block;
			width:90px;
			border:1px solid #e0e0e0;
			background-color: #fff;
			font-size:13px;
			font-weight: bold;
			line-height: 36px;
			text-align: center;
			padding:0;
			margin:0;
		}
		.tab button.no1{
			left:0;
		}
		.tab button.no2{
			left:90px;
		}
		.tab button.on{
			background-color: #d1d1d1;
		}
		.tab ul{
			width: 376px;
			margin:46px 20px 0 20px;
		}
		.tab ul li{
			line-height: 27px;
			width: 100%;
		}
		.tab ul li span.date{
			float: right;
			font-size:13px;
			color:#000;
		}
		#album{
			margin-top:10px; 
			padding-left:17px; 
			position:relative;
			height:135px;
			border-bottom: 1px solid #e0e0e0;
		}

		#album p{
			padding:5px 0;
			font-size:11px;
			color:#676767;
		}
		#album li{
			float:left;
			width:8px;
		}
		#album li.photo{
			float:left;
			width:89px;
		}

		#album li.photo img{
			float:left;
			width:89px;
			height: 61px;
		}
		#main{
			width:100%; 
			height:560px;
			position: relative;
			z-index: 1;
		}
		#main_bg{
			position: absolute;
			top:0;
			left:0;
			width:100%;
			height:560px;
			background-color: #d6d6d6;
		}
		#main_bg li{
			width:100%;
			height:560px;
		}
		#main_bg1{
			background:url(/images/main/fade_img_01.jpg) no-repeat center top;
			z-index:2;
		}
		#main_bg2{
			background:url(/images/main/fade_img_01.jpg) no-repeat center top;
			z-index:1;
		}
		#controls{
			z-index: 10001;
			position:absolute;
			bottom:25px;
		}
		#controls ol li{
			width:25px;
			height:20px;
			float:left;
			padding-right: 5px;
			background: url(/images/main/select_on.png) no-repeat;
			text-decoration:none;
			cursor: pointer;
		}
		#controls ol li.current{
			background: url(/images/main/select_off.png) no-repeat;5
		}

		#controls span, #controls a{
			display: none;
		}
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script src="/js/jquery.sudoSlider.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){

			// Tab Script
			function fncTabSetting(this_obj){
				$("#tab_list button.title").removeClass("on");
				$(this_obj).addClass("on");
				var $parent = $(this_obj).parent();
				$("#tab_list > div").each(function(){
					$(this).css("z-index", "2").find("a.more, ul").css("display", "none");
				});
				$parent.css("z-index", "1").find("a.more, ul").css("display", "block");
			}
			$("#tab_list button.title").click(function(){
				fncTabSetting(this);
			}).focus(function(){
				fncTabSetting(this);
			});
			$("button.no1").click();
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
				fncResizecontrols();
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
	<!--#include virtual = "/comm/header.asp"-->
	<div id="main">
		<div id="main_bg">
			<ul>
				<li id="main_bg1"></li>
				<li id="main_bg2"></li>
			</ul>
		</div>
		<h2 class="skip_nav"><a href="#" id="content_link">컨텐츠 영역</a></h2>
		<div class="wrap">
			<div class="right" style="background:url(/images/main/bg_main_top.png) no-repeat 0 top; width:430px; height:124px; margin-top:20px;">
				<a href="/treat/treat_guide.asp"><img src="/images/main/subject_guide.png" alt="진료과목안내 바로가기" style="margin: 20px 45px 0 37px;" /></a>
				<a href="#"><img src="/images/main/accept_guide.png" alt="외래접수안내 바로가기" style="margin: 20px 20px 0 37px;" /></a>
				<a href="/treat/inout.asp"><img src="/images/main/in_guide.png" alt="입원안내 바로가기" style="margin: 20px 0px 0 57px;" /></a>
			</div>
			<div class="right" style="width:100%; text-align:right; margin-top:8px;">
				<a href="/introduce/idea.asp"><img src="/images/main/ideology_guide.png" alt="경영이념안내 바로가기" /></a>
			</div>
			<div class="right" style="width:100%; text-align:right; margin-top:8px;">
				<a href="/use/facilities_guide.asp"><img src="/images/main/facilities_guide.png" alt="병원시설안내 바로가기" style="margin-right:2px;" /></a>
				<a href="/use/application.asp"><img src="/images/main/certificate_issue .png" alt="제증명서 발급 바로가기" /></a>
			</div>
			<div class="right" style="width:430px; height:124px; margin-top:8px; background:url(/images/main/bg_health_sence.png) no-repeat center top;">

			<%										
					strSQL = " SELECT A.BBS_DVS, A.BBS_KEY, A.TITLE, A.SMR_CNTE "&_
							 "   FROM ("&_
							 "          SELECT BBS_DVS, BBS_KEY, TITLE, SUBSTRING(SMR_CNTE, 1, 65)+'...' SMR_CNTE"&_
							 "               , ROW_NUMBER() OVER (ORDER BY WRT_DTM DESC) RNUM "&_
							 "            FROM NI_USER_BBS"&_
							 "           WHERE BBS_DVS = 'C02'"&_
							 "        ) A "&_
							 "  WHERE A.RNUM = 1"&_
							 "  ORDER BY A.RNUM"

					objRecord.Open strSQL, objConn, 1

					noneCheck = "N"

					If objRecord.BOF OR objRecord.EOF Then
							noneCheck = "Y"
			%>

					<p style="padding-left:162px; margin-top:16px;">등록된 글이 없습니다.</p>	

			<%
					Else

					h_bbs_dvs = ""
					h_bbs_key = ""
					h_title   = ""
					h_smr_cnte = ""
					
					Do Until objRecord.EOF

					h_bbs_dvs  = objRecord("BBS_DVS")
					h_bbs_key  = objRecord("BBS_KEY")
					h_title    = objRecord("TITLE")
					h_smr_cnte = objRecord("SMR_CNTE")	
			%>
			
				<div class="fr_title">
					<h3 class="fr_txt" style="padding-left:162px;margin-top:16px;">
						<a href="/news/health_sence_detail.asp?key=<%=h_bbs_key%>&dvs=<%=h_bbs_dvs%>" style="font-weight:normal; font-size:16px; color:#006cb1;"><%=h_title%>
						</a>
					</h3>
					<div style="width:170px;height:67px;margin-left:162px;padding-top:38px;text-align:justify;line-height:17px;">
						<a href="/news/health_sence_detail.asp?key=<%=h_bbs_key%>&dvs=<%=h_bbs_dvs%>" style="font-size:13px; color:#343434;text-align:justify;">
						<%=h_smr_cnte%>
						</a>
					</div>
					<div class="right" style="margin-right:17px;margin-top:-18px;">
						<a href="/news/health_sence_detail.asp?key=<%=h_bbs_key%>&dvs=<%=h_bbs_dvs%>"><p style="width:81px;">&nbsp;</p></a>						
					</div>
				</div>			
					
			<%					
					objRecord.MoveNext
					Loop
					End If

					objRecord.Close
			%>

			</div>
		</div>	
	</div>
	<div id="content" class="wrap" style="margin-top:35px; overflow:hidden;">
		<div class="left" style="width:294px;">
			<img src="/images/main/banner_left_01.jpg" alt="재활전문 치료센터:전문적인 재활치료 프로그램을 운영해 어르신들에게 도움을 드리고 있습니다" />
			<img src="/images/main/banner_left_02.jpg" alt="보건복지부 요양병원 인증 합격:천안-아산 지역 최초로 보건복지부 요양병원 인증에 합격 하였습니다." style="margin-top:10px;" />
		</div>
		<div class="left" style="width:416px;">
			<div id="tab_list">
				<div class="tab">
					<button type="button" class="title no1">병원공지</button>
					<ul>
			<%										
					strSQL = " SELECT A.BBS_DVS, A.BBS_KEY, A.TITLE , A.WRT_DTM"&_
							 "   FROM ("&_
							 "          SELECT BBS_DVS, BBS_KEY, TITLE , RIGHT(REPLACE(CONVERT(VARCHAR, WRT_DTM, 111), '/', '.'), 5) WRT_DTM"&_
							 "               , ROW_NUMBER() OVER (ORDER BY WRT_DTM DESC) RNUM "&_
							 "            FROM NI_USER_BBS"&_
							 "           WHERE BBS_DVS = 'C01'"&_
							 "        ) A "&_
							 "  WHERE A.RNUM <= 3"&_
							 "  ORDER BY A.RNUM"

					objRecord.Open strSQL, objConn, 1

					noneCheck = "N"

					If objRecord.BOF OR objRecord.EOF Then
							noneCheck = "Y"
			%>
				<li style="text-align:center;">공지사항이 없습니다.</li>
			<%

					Else

					n_bbs_key = ""
					n_title   = ""
					n_wrt_dtm = ""

					Do Until objRecord.EOF

						n_bbs_dvs = objRecord("BBS_DVS")
						n_bbs_key = objRecord("BBS_KEY")
						n_title = objRecord("TITLE")
						n_wrt_dtm = objRecord("WRT_DTM")					
			%>
					<div class="fr_title">
						<li><span class="fr_txt"><a href="/news/notice_detail.asp?key=<%=n_bbs_key%>&dvs=<%=n_bbs_dvs%>"><%=n_title%></a></span><span class="date"><%=n_wrt_dtm%></span></li>
					</div>
			<%					
					objRecord.MoveNext
					Loop

					End If

					objRecord.Close
			%>
					</ul>
					<a href="/news/notice.asp" class="more"><img src="/images/main/more.jpg" alt=""></a>
				</div>
				<div class="tab">
					<button type="button" class="title no2">채용공고</button>
					<ul>
			<%										
					strSQL = " SELECT A.BBS_DVS, A.BBS_KEY, A.TITLE , A.WRT_DTM"&_
							 "   FROM ("&_
							 "          SELECT BBS_DVS, BBS_KEY, TITLE , RIGHT(REPLACE(CONVERT(VARCHAR, WRT_DTM, 111), '/', '.'), 5) WRT_DTM"&_
							 "               , ROW_NUMBER() OVER (ORDER BY WRT_DTM DESC) RNUM "&_
							 "            FROM NI_USER_BBS"&_
							 "           WHERE BBS_DVS = 'C03'"&_
							 "        ) A "&_
							 "  WHERE A.RNUM <= 3"&_
							 "  ORDER BY A.RNUM"

						objRecord.Open strSQL, objConn, 1

						noneCheck = "N"

					If objRecord.BOF OR objRecord.EOF Then
							noneCheck = "Y"
			%>
				<li style="text-align:center;">채용 공고가 없습니다.</li>
			<%
					Else

					e_bbs_key = ""
					e_title   = ""
					e_wrt_dtm = ""

					Do Until objRecord.EOF
						e_bbs_dvs = objRecord("BBS_DVS")
						e_bbs_key = objRecord("BBS_KEY")
						e_title = objRecord("TITLE")
						e_wrt_dtm = objRecord("WRT_DTM")					
			%>
					<div class="fr_title">
						<li><span class="fr_txt"><a href="/news/recruit_detail.asp?key=<%=e_bbs_key%>&dvs=<%=e_bbs_dvs%>"><%=e_title%></a></span><span class="date"><%=e_wrt_dtm%></span></li>
					</div>
			<%					
					objRecord.MoveNext
					Loop
					End If

					objRecord.Close
			%>
					</ul>
					<a href="/news/recruit.asp" class="more"><img src="/images/main/more.jpg" alt=""></a>
				</div>
			</div>
			<div id="album">
				<h4 style="line-height:36px;">병원앨범</h4>
				<ul>
			<%										
					strSQL = " SELECT A.BBS_DVS, A.BBS_KEY, A.TITLE, A.THMB_URL, A.SMR_CNTE, A.WRT_DTM" &_
							 "   FROM ("&_
							 "         SELECT BBS_DVS, BBS_KEY, TITLE, THMB_URL, SMR_CNTE, RIGHT(REPLACE(CONVERT(VARCHAR, WRT_DTM, 111), '/', '.'), 5) WRT_DTM"&_
							 "              , ROW_NUMBER() OVER (ORDER BY WRT_DTM DESC) RNUM "&_
							 "           FROM NI_USER_BBS"&_
							 "          WHERE BBS_DVS = 'C10'"&_
							 "        ) A "&_
							 "  WHERE A.RNUM <= 4"&_
							 "  ORDER BY A.RNUM"

					objRecord.Open strSQL, objConn, 1

					   noneCheck = "N"

					If objRecord.BOF OR objRecord.EOF Then
							noneCheck = "Y"
			%>
					<li style="text-align:center; width:380px;">등록된 글이 없습니다.</li>
			<%
					Else	

					Do Until objRecord.EOF
						a_bbs_dvs = objRecord("BBS_DVS")
						a_bbs_key = objRecord("BBS_KEY")
						a_title = objRecord("TITLE")
						a_thmb_url = objRecord("THMB_URL")
						a_smr_cnte = objRecord("SMR_CNTE")
						a_wrt_dtm = objRecord("WRT_DTM")					
			%>
					<li class="photo">
						<a href="/news/hospital_album_detail.asp?key=<%=a_bbs_key%>&dvs=<%=a_bbs_dvs%>"><img src="<%=a_thmb_url%>" alt="<%=a_smr_cnte%>" /></a>
						<div class="fr_txt" style="max-width:90px;">
							<p><%=a_smr_cnte%></p>
						</div>
					</li>
					<li>&nbsp;</li>
			<%					
					objRecord.MoveNext
					Loop
					End If

					objRecord.Close
			%>		
				</ul>
				<a href="/news/hospital_album.asp" class="more"><img src="/images/main/more.jpg" alt=""></a>
			</div>
		</div>
		<div class="right" style="width:238px;">
			
			<img src="/images/main/banner_right_01.jpg" alt="저희 병원에 대한 문의나 기타 문의를 남겨주시면 답변드리겠습니다." usemap="#banner_right_01"/>
			<map name ="banner_right_01">
				<area shape="rect" coords="17,96,126,118" href="/voc/qna.asp" alt="문의 게시판 이동">
			</map>
			
			<a href="/voc/complaint.asp" title="불만 및 고충처리 게시판 이동"><img src="/images/main/banner_right_02.jpg" alt="불만 및 고충처리 게시판 이동" style="margin-top:10px" /></a>
			<img src="/images/main/banner_right_03.jpg" alt="진료시간 및 상담문의. 041-521-1114" style="margin-top:10px" />
			<a href="/introduce/map.asp" title="찾아오는길 페이지 이동"><img src="/images/main/banner_right_04.jpg" alt="찾아오시는 길" style="margin-top:10px" /></a>
		</div>
		<div class="left" style="width:710px; margin-top:10px;">
			<img src="/images/main/partner.jpg" alt="" />
		</div>
	</div>
	<!-- 하단, 사이트 맵 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>
<%
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing
%>