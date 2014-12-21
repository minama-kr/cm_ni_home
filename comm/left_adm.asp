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

				If arrM(nSelMenuIndex).arrS(i).dvsNm <> "" Then
			%>
				<li class="side_dvs"><%=arrM(nSelMenuIndex).arrS(i).dvsNm%></li>
			<%
				End If
		%>
				<li <%=strSelected%>><a href="<%=arrM(nSelMenuIndex).arrS(i).url%>"><%=arrM(nSelMenuIndex).arrS(i).menuNm%></a><img src="/images/left/selected.jpg" alt="" /></li>
		<% Next %>
			</ul>
		</div>
	</div>
</div>