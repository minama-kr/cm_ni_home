<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_constant.asp"-->
<%
	cType = request("type") ' H : 조회수, S : 공유수, T : 감사드려요

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	If cType = "H" Then 
		tbl_cd = request("tbl_cd")
		bbs_key = request("bbs_key")


		'조회수 upate
		objConn.BeginTrans

		If tbl_cd = "U" Then
			strSQL = "update cm_user_bbs_cnt set srch_cnt = srch_cnt + 1, lst_mdf_dtm = getdate() where bbs_key = " & bbs_key
		ElseIf tbl_cd = "M" Then
			strSQL = "update cm_mng_bbs_cnt set srch_cnt = srch_cnt + 1, lst_mdf_dtm = getdate() where bbs_key = " & bbs_key
		End If

		objConn.Execute(strSQL)

		if objConn.Errors.Count > 0 then
			objConn.RollbackTrans
		else
			objConn.CommitTrans
		end if
	Elseif cType = "T" then	
		empNo = request("emp_no")
		userId = request("id")

		Set objRecord = Server.CreateObject("ADODB.RecordSet")
		strSQL = "SELECT (CASE WHEN count(*) >=  1 THEN 'Y' ELSE 'N' END) AS DUP_YN " &_ 
		          "FROM CM_THANK_CNT WHERE EMP_NO = '"&empNo&"' and ID ='"&userId&"'"
		
		objRecord.Open strSQL, objConn, 1

		If objRecord("DUP_YN") = "Y" Then

			Response.write "한번 이상 감사를 드릴수 없습니다."

		else

			objConn.BeginTrans

			strSQL = "INSERT INTO CM_THANK_CNT (EMP_NO, ID, THK_CNT, REG_DTM) VALUES ('"&empNo&"','"&userId&"',1,getdate())"

			objConn.Execute(strSQL)

			if objConn.Errors.Count > 0 then
				objConn.RollbackTrans
			else
				objConn.CommitTrans
			end if

			Response.write "감사를 드렸습니다"

		End if
		objRecord.Close		

	End If
	objConn.Close
	Set objConn = Nothing
	
	Response.end

%>