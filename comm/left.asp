<h2 class="skip_nav"><a href="#" id="left_link">하위 메뉴</a></h2>
<div id="side_nav" style="">
	<img src="/images/left/side_menu_top.jpg" alt="" />
	<div style="background:url(/images/left/bg_side_menu.jpg) repeat-y 0 top; width:100%;">
		<div class="side_nav" data-value="treat">
			<h2><%=arrM(nSelMenuIndex).menuNm%></h2>
			<ul>
		<% 			
			For i = 0 To UBound(arrM(nSelMenuIndex).arrS) - 1 
				strSelected = ""
				If i = nSelSubMenuIndex Then
					strSelected = "class='selected'"
				End If
		%>
				<li <%=strSelected%>><a href="<%=arrM(nSelMenuIndex).arrS(i).url%>"><%=arrM(nSelMenuIndex).arrS(i).menuNm%></a><img src="/images/left/selected.jpg" alt="" /></li>
		<% Next %>
			</ul>
		</div>
	</div>
	<img src="/images/left/call.jpg" alt="진료시간 및 상담문의 041.521.1114" />
	<a href="/introduce/map.asp" title="찾아오시는 길 안내 페이지 이동"><img src="/images/left/contact.jpg" alt="천안시내에서 15분" /></a>
	<img src="/images/left/pass.jpg" alt="" style="margin-top:12px;" />
	<a href="http://cafe.naver.com/cagh" title="천안시립노인병원 네이버 카페 새창 띄우기" target="_blank"><img src="/images/left/banner_naver_cafe.jpg" alt="" style="margin-top:12px;" /></a>
</div>