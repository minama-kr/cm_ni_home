<!-- Skip 영역 -->
<div id="skip_nav" class="skip_nav">
	<h2>바로가기 안내</h2>
	<a href="#nav_link">주메뉴 바로가기</a>
<% If LCase(strMainDataValue) <> "main" Then %>	
	<a href="#left_link">하위메뉴 바로가기</a>
<% End If %>
	<a href="#content_link">메인콘텐츠 바로가기</a>
</div>
<!-- //Skip 영역 -->
<div id="header" style="border-top:4px solid #b0b0b0; width:100%;">
	<div class="wrap">
		<ul id="info">
			<li style="background:url(/images/top/btn_menu_open.jpg) no-repeat right top; width:103px; height:23px; text-align:right;">
				<a id="site_map_open" class="transparent" href="#site_map_link" onclick="fncLayerPopControl('site_map', true)" title="Site Map 바로가기">전체메뉴열기</a>
			</li>
		</ul>
		<div style="position:absolute; bottom:20px; left:0;"><a id="logo" href="/main.asp"><img src="/images/top/logo_top.jpg" alt="메인페이지로 이동"></a></div>
		<h2 class="skip_nav"><a href="#" id="nav_link">메인메뉴</a></h2>
		<ul id="nav">
	<%
		For i = 0 To UBound(arrM) - 1
			strSelected = ""
			If nSelMenuIndex = i And LCase(strMainDataValue) <> "main" Then
				strSelected = "class='selected'"
			End If
	%>
			<li <%=strSelected%>>
				<a href="<%=arrM(i).url%>"><%=arrM(i).menuNm%></a>
		<% If UBound(arrM(i).arrS) - 1 > 0 Then	%>
				<ul class="sub_nav">
			<% For x = 0 To UBound(arrM(i).arrS) - 1%>
					<li><a href="<%=arrM(i).arrS(x).url%>"><%=arrM(i).arrS(x).menuNm%></a></li>
			<% Next %>
					<li>
					<% If arrM(i).imgLink = "" Then %>
						<img src="<%=arrM(i).imgUrl%>" alt="<%=arrM(i).imgAlt%>" />
					<% Else %>
						<a href="<%=arrM(i).imgLink%>"><img src="<%=arrM(i).imgUrl%>" alt="<%=arrM(i).imgAlt%>" /></a>
					<% End If %>
					</li>
				</ul>
		<% End If %>
			</li>
	<%	Next %>
		</ul>
	</div>
</div>
