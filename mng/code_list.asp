<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%> 
<%
	on error resume next

	Const IC_DB_CONN = "Provider=SQLOLEDB;Data Source=pjy6211.cafe24.com;Initial Catalog=pjy6211;User ID=pjy6211;Password=nibw1010235c;"

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	strMode = Request.Form("pType")
	strSearchWord = Request.Form("pSearchWord")

	Set objRecord = Server.CreateObject("ADODB.RecordSet")

	Dim strSQL


	If strMode = "dvs" Then
		strSQL = "SELECT  DVS_CD, DVS_NM, SEQ_NO, NOTE, REG_DTM, LST_MDF_DTM "&_
                       "    FROM NI_DVS_CD_MST "

		If strSearchWord <> "" Then
			strSQL = strSQL & " WHERE DVS_NM LIKE '%" & strSearchWord & "%'  "
			strSQL = strSQL & " OR DVS_CD LIKE '%" & strSearchWord & "%'  "
		End If	

		strSQL = strSQL & " ORDER BY SEQ_NO ASC"

		objRecord.Open strSQL, objConn, 1
		
		nRowCnt = 0
		if not objRecord.Eof then
			nRowCnt = objRecord.RecordCount
		else
			nRowCnt = 0
		end if
		
		'지정한 row count만큼 화면에 뿌려줌
		Do Until objRecord.EOF
			strWidth = ""
			If nRowCnt > 5 then
				strWidth = "style='width:150px'"
			End if
		%>
			<ul class="list_item">
				<li class="code"><a href="#dvs_edit_link" onclick="fncSelectDvsCd('<%=objRecord("DVS_CD")%>', this)" title="선택 항목 수정"><%=objRecord("DVS_CD")%></a></li>
				<li class="name"><a href="#dvs_edit_link" onclick="fncSelectDvsCd('<%=objRecord("DVS_CD")%>', this)" title="선택 항목 수정"><%=objRecord("DVS_NM")%></a></li>
				<li class="seq"><a href="#dvs_edit_link" onclick="fncSelectDvsCd('<%=objRecord("DVS_CD")%>', this)" title="선택 항목 수정"><%=objRecord("SEQ_NO")%></a></li>
				<li class="comment" <%=strWidth%>><a href="#dvs_edit_link" onclick="fncSelectDvsCd('<%=objRecord("DVS_CD")%>', this)" title="선택 항목 수정"><%=objRecord("NOTE")%></a></li>
			</ul>
		<% 	
			objRecord.MoveNext
		Loop

		If nRowCnt = 0 Then
	%>
		<p class="null_list">데이터가 없습니다.</p>
	<%
		End If		
	Else

		strDvsCd = Request.Form("pDvsCd")

		strSQL = "SELECT  DVS_CD, COM_CD, DVS_NM, COM_NM, SEQ_NO, LINK_FILE_NM, NOTE, REG_DTM, LST_MDF_DTM  "&_
                             "    FROM  NI_COM_CD_MST "&_
                             " WHERE DVS_CD = '" & strDvsCd & "' "

             If strSearchWord <> "" Then
			strSQL = strSQL & " AND COM_NM LIKE '%" & strSearchWord & "%'  "
			strSQL = strSQL & " OR COM_CD LIKE '%" & strSearchWord & "%'  "
		End If	

		strSQL = strSQL & " ORDER BY SEQ_NO ASC"

		objRecord.Open strSQL, objConn, 1
		
		nRowCnt = 0
		if not objRecord.Eof then
			nRowCnt = objRecord.RecordCount
		else
			nRowCnt = 0
		end if

		'지정한 row count만큼 화면에 뿌려줌
		Do Until objRecord.EOF
			strWidth = ""
			If nRowCnt > 5 then
				strWidth = "style='width:150px'"
			End if
		%>
			<ul class="list_item">
				<li class="code"><a href="#com_edit_link" onclick="fncSelectComCd('<%=objRecord("COM_CD")%>', this, '<%=objRecord("LINK_FILE_NM")%>')" title="선택 항목 수정"><%=objRecord("COM_CD")%></a></li>
				<li class="name"><a href="#com_edit_link" onclick="fncSelectComCd('<%=objRecord("COM_CD")%>', this, '<%=objRecord("LINK_FILE_NM")%>')" title="선택 항목 수정"><%=objRecord("COM_NM")%></a></li>
				<li class="seq"><a href="#com_edit_link" onclick="fncSelectComCd('<%=objRecord("COM_CD")%>', this, '<%=objRecord("LINK_FILE_NM")%>')" title="선택 항목 수정"><%=objRecord("SEQ_NO")%></a></li>
				<li class="comment" <%=strWidth%>><a href="#com_edit_link" onclick="fncSelectComCd('<%=objRecord("COM_CD")%>', this, '<%=objRecord("LINK_FILE_NM")%>')" title="선택 항목 수정"><%=objRecord("NOTE")%></a></li>
			</ul>
		<% 	
			objRecord.MoveNext
		Loop

		If nRowCnt = 0 Then
	%>
		<p class="null_list">데이터가 없습니다.</p>
	<%
		End If
	End If

	objRecord.Close
	Set objRecord = Nothing
	objConn.Close
	Set objConn = Nothing

	If err <> 0 Then
	     Response.Write "오류 번호 : " & err.number & "<br>"
	     Response.Write "내용 : " & err.Description & "<br>"
	     'Response.Write "쿼리 : " & strSQL & "<br>"
	End If

	on error goto 0
%>		
