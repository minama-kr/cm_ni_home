<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_constant.asp"-->
<%
	Set uploadform = Server.CreateObject("DEXT.FileUpload") 
	uploadform.DefaultPath = Server.MapPath("/filesdir/bbs") 

	bbs_dvs = uploadform("hdnTblDvs")
	bbs_key = uploadform("hdnBbsKey")
	atch_file_seq = uploadform("hdnFileSeq")

	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	strSQL = "select file_nm, save_file_path from cm_bbs_atch_file "&_
			 " where bbs_dvs='"&bbs_dvs&"' and bbs_key="&bbs_key&" and atch_file_seq="& atch_file_seq

	Set objRecord = Server.CreateObject("ADODB.Recordset")
	objRecord.Open strSQL, objConn, 1

	If NOT(objRecord.BOF AND objRecord.EOF) Then
		file_name = objRecord("file_nm")
		file_path = objRecord("save_file_path")
	End If

	objRecord.Close
	Set objRecord = nothing

	strSQL = "delete cm_bbs_atch_file where bbs_dvs='"&bbs_dvs&"' and bbs_key="&bbs_key&" and atch_file_seq="& atch_file_seq

	objConn.BeginTrans
	objConn.Execute(strSQL)

	if objConn.Errors.Count > 0 then
		objConn.RollbackTrans
	Else
		' If you want to delete this file
		If uploadform.FileExists(file_path) Then 
			uploadform.DeleteFile file_path
		End If 

		objConn.CommitTrans
	end if
	Set uploadform = Nothing 
%>
	<div id="divFileEditor">
<%
	If bbs_key <> "" Then 
		strSQL = "select atch_file_seq, file_nm, file_sz, save_file_path from cm_bbs_atch_file "&_
					 " where bbs_dvs='"&bbs_dvs&"' and bbs_key="&bbs_key&" order by atch_file_seq"

		Set objRecordFile = Server.CreateObject("ADODB.Recordset")
		objRecordFile.Open strSQL, objConn, 1 

		IF NOT(objRecordFile.BOF and objRecordFile.EOF) Then 
			Do until objRecordFile.EOF
%>
		<p>		
		<a href="javascript:fncFileOpen('<%=bbs_dvs%>','<%=bbs_key%>','<%=objRecordFile("atch_file_seq")%>')" title="파일다운로드" class="left"><%=objRecordFile("file_nm")%>( <%=objRecordFile("file_sz")%> byte )</a>
		<a href="javascript:fncFileDelete('<%=objRecordFile("atch_file_seq")%>');"><img src="/images/btn/btn_file_delete.gif" class="btn_file_delete" alt="파일삭제"></a>
		</p>
<%
			objRecordFile.MoveNext
			Loop
		End IF 
		objRecordFile.Close
	End If 
	objConn.Close
	Set objConn = Nothing

%>
	</div>

<script language='javascript'>
<!--
	parent.document.getElementById("divFileEditor").innerHTML = document.getElementById("divFileEditor").innerHTML;
//-->
</script>