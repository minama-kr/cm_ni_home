<div class="paging">
<%
	' 이동할 페이지 번호 파라미터가 포함된 주소
	strPageUrl = ""
	' 현재 페이지 주소
	strPage = 	arrM(nSelMenuIndex).arrS(nSelSubMenuIndex).url
	intNum = intFristNum
	intLoop = 1

	If intNum = 1 Then
%>	
	<img src="/images/icon/first.jpg" alt="이전 <%=intPageSize%> 페이지로 이동" />

<% 
	Else 	
		intPreBNum = intNum-intPageSize
		strPageUrl = strPage & "?page=" & intPreNum & strAddParameter
%>	
	<a href="<%=strPageUrl%>" title="목록에서 처음페이지로 이동"><img src="/images/icon/first.jpg" alt="이전 <%=intPageSize%>페이지 이동" /></a>
<% 
	End If

	If CInt(intPage) = 1 Then
		strPageUrl = strPage & "?page=1" & strAddParameter
%>
	<a class="prev_n" href="<%=strPageUrl%>"><img src="/images/icon/first.jpg" alt="이전 페이지로 이동" /></a>
<%
	Else
		intPreNum = CInt(intPage)-1
		strPageUrl = strPage & "?page=" & intPreNum & strAddParameter
%>	
	<a class="prev_n" href="<%=strPageUrl%>" title="목록에서 이전 페이지로 이동"><img src="/images/icon/prev.jpg" alt="이전 페이지로 이동" /></a>
<%
	End If
%>
	<span class="paging_numbers">

<%
	Do Until intLoop > intPageSize OR intNum > intTotPage
		strPageUrl = strPage & "?page=" & intNum & strAddParameter


		If intNum = CInt(intPage) Then
%>
			<a href="<%=strPageUrl%>"  class="selected"><%=intNum%><span class="blind">페이지로 이동</span></a>
<%			
		Else
%>
		<a href="<%=strPageUrl%>"><%=intNum%><span class="blind">페이지로 이동</span></a>
<%
		End If
		intNum = intNum + 1
		intLoop = intLoop + 1

	Loop 
%>
	</span>
<%
	If intTotPage = CInt(intPage)  Then
%>
	<img class="next_n" src="/images/icon/next.jpg" alt="다음 페이지로 이동" />
<%
	Else
		intNextNum = CInt(intPage)+1
		strPageUrl = strPage & "?page=" & intNextNum & strAddParameter
%>
	<a class="next_n" href="<%=strPageUrl%>" title="목록에서 다음 페이지로 이동"><img src="/images/icon/next.jpg" alt="다음 페이지로 이동" /></a>
<%
	End If
	If intNum > intTotPage Then
%>
	<img src="/images/icon/last.jpg" alt="마지막 페이지로 이동" />
<%
	Else
		intNextBNum = intNum
		strPageUrl = strPage & "?page=" & intNextBNum & strAddParameter
%>
	<a href="<%=strPageUrl%>" title="목록에서 마지막 페이지로 이동"><img src="/images/icon/last.jpg" alt="마지막 페이지로 이동" /></a>
<%
	End If
%>
</div>