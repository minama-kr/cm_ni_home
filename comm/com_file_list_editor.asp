<% 
If strBbsKey <> "" Then 
	strSQL = "select atch_file_seq, file_nm, file_sz, save_file_path from ni_bbs_atch_file "&_
				 " where bbs_dvs='"&strBbsDvs&"' and bbs_key="&strBbsKey&" order by atch_file_seq"

	Set objRecordFile = Server.CreateObject("ADODB.Recordset")
	objRecordFile.Open strSQL, objConn, 1 
		
	IF NOT(objRecordFile.BOF and objRecordFile.EOF) Then 
		Do until objRecordFile.EOF
%>

		<p>	
		<% If isManager = false Then %>
			<img src="/images/page/news/file.jpg" alt="" class="left" />	
		<% End If%>
			<a href="javascript:fncFileOpen('<%=strBbsDvs%>','<%=strBbsKey%>','<%=objRecordFile("atch_file_seq")%>')" title="파일다운로드" class="left">
				<%=objRecordFile("file_nm")%>
				<% If isManager Then %>
					( <%=objRecordFile("file_sz")%> byte )
				<% End If%>
			</a>
			<% If isManager Then %>
				<a href="javascript:fncFileDelete('<%=objRecordFile("atch_file_seq")%>');"><img src="/images/btn/btn_file_delete.gif" class="btn_file_delete" alt="파일삭제"></a>
			<% End If%>
		</p>
<%
		objRecordFile.MoveNext
		Loop
	End IF 
objRecordFile.Close
End If 

%>