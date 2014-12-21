<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const.asp"-->
<%
	bbs_dvs = request("bbsDvs")
	bbs_key = request("bbsKey")
	atch_file_seq = request("fileSeq")

	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	strSQL = "select atch_file_seq, file_nm, file_sz, save_file_path from ni_bbs_atch_file "&_
			 " where bbs_dvs='"&bbs_dvs&"' and bbs_key="&bbs_key&" and atch_file_seq="& atch_file_seq

	Set objRecord = Server.CreateObject("ADODB.Recordset")
	objRecord.Open strSQL, objConn, 1

	If NOT(objRecord.BOF AND objRecord.EOF) Then
		file_name = objRecord("file_nm")
		file_size = objRecord("file_sz")
		file_path = objRecord("save_file_path")
	End If

	'file_path =  Server.MapPath(file_path)'현재위치 d:\CM_HOS..

	objRecord.Close
	Set objRecord = nothing
	objConn.Close
	Set objConn = Nothing
	
	Response.write file_path
	Response.Clear 
	Response.Buffer = False 

	Response.AddHeader "Content-Disposition","attachment;filename=" & file_name 
	Response.AddHeader "Content-Length", file_size 
	Response.ContentType = "application/unknown" 
	Response.CacheControl = "public" 

	Set objDown = Server.CreateObject("DEXT.FileDownload") 
	objDown.Download file_path 
	Set objDown = Nothing 
%>