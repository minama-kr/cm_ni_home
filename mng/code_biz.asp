<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%> 
<%
	on error resume next

	Const IC_DB_CONN = "Provider=SQLOLEDB;Data Source=pjy6211.cafe24.com;Initial Catalog=pjy6211;User ID=pjy6211;Password=nibw1010235c;"

	strDvsCd = Request.Form("pDvsCd")
	strDvsNm = Request.Form("pDvsNm")

	strComCd = Request.Form("pComCd")
	strComNm = Request.Form("pComNm")

	strSeq = Request.Form("pSeq")
	strFileNm = Request.Form("pFileNm")
	strComment = Request.Form("pComment")

	strMode = Request.Form("pMode")
	strType = Request.Form("pType")

	strDvsNm = Replace(strDvsNm,"'","''")
	strComNm = Replace(strComNm,"'","''")
	strFileNm = Replace(strFileNm,"'","''")
	strComment = Replace(strComment,"'","''")

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

 	strSql = ""
 	strMessage = ""
	If strMode = "s" Then
		If strType = "dvs" Then
			strSQL = "SELECT COUNT(1) as CNT FROM NI_DVS_CD_MST WHERE DVS_CD = '" & strDvsCd & "'"
		Else
			strSQL = "SELECT COUNT(1) as CNT FROM NI_COM_CD_MST WHERE DVS_CD = '" & strDvsCd & "' AND COM_CD = '" & strComCd & "'"
		End If

		Set objRecord = Server.CreateObject("ADODB.Recordset")
		objRecord.Open strSQL, objConn, 1

		If CInt(objRecord(0)) = 0 Then
			If strType = "dvs" Then
				strSQL = " INSERT INTO NI_DVS_CD_MST (DVS_CD, DVS_NM, SEQ_NO, NOTE)  "&_
	                   		          " VALUES('" & strDvsCd & "', '" & strDvsNm & "', " & strSeq & ", '" & strComment & "') "
	             Else
	             	strSQL = " INSERT INTO NI_COM_CD_MST (DVS_CD, COM_CD, DVS_NM, COM_NM, SEQ_NO, LINK_FILE_NM, NOTE)  "&_
	                   		          " VALUES('" & strDvsCd & "', '" & strComCd & "', '" & strDvsNm & "', '" & strComNm & "', " & strSeq & ", '" & strFileNm & "', '" & strComment & "') "	          

	             	objConn.Execute(strSQL)       

	                  	strSQL = "UPDATE NI_COM_CD_MST " &_
				                "        SET DVS_NM = (SELECT DVS_NM FROM NI_DVS_CD_MST WHERE DVS_CD = '" & strDvsCd & "') "&_
				                " WHERE DVS_CD = '" & strDvsCd & "' "&_
				                "        AND COM_CD = '" & strComCd & "' "
	             End If
			objConn.Execute(strSQL)
			strMessage = "저장했습니다."
		Else
			strMessage = "중복된 코드값이 있습니다."
		End If

		objRecord.Close
		Set objRecord = nothing

	ElseIf strMode = "d" Then
		If strType = "dvs" Then
			strSQL = "DELETE NI_DVS_CD_MST WHERE DVS_CD = '" & strDvsCd & "'"
			objConn.Execute(strSQL)
			strSQL = "DELETE NI_COM_CD_MST WHERE DVS_CD = '" & strDvsCd & "'"
			objConn.Execute(strSQL)
		Else
			strSQL = "DELETE NI_COM_CD_MST WHERE DVS_CD = '" & strDvsCd & "' AND COM_CD = '" & strComCd & "' "
			objConn.Execute(strSQL)
		End If
		strMessage = "삭제했습니다."

	ElseIf  strMode = "u" Then
		If strType = "dvs" Then
			strSQL = "UPDATE NI_DVS_CD_MST "&_
				   "       SET DVS_NM = '" & strDvsNm & "'"&_
				   "             , SEQ_NO = '" & strSeq & "'"&_
				   "             , NOTE = '" & strComment & "'"&_
				   " WHERE DVS_CD = '" & strDvsCd & "'"
			objConn.Execute(strSQL)
		Else
			strSQL = "UPDATE NI_COM_CD_MST "&_
				   "       SET COM_NM = '" & strComNm & "'"&_
				   "             , SEQ_NO = '" & strSeq & "'"&_
				   "             , LINK_FILE_NM = '" & strFileNm & "'"&_
				   "             , NOTE = '" & strComment & "'"&_
				   " WHERE DVS_CD = '" & strDvsCd & "'"&_
				   "       AND COM_CD = '" & strComCd & "'"
			objConn.Execute(strSQL)
		End If
		
		strMessage = "수정했습니다."
	End If
	objConn.Close
	Set objConn = Nothing

	If err <> 0 Then
	     Response.Write "오류 번호 : " & err.number & "<br>"
	     Response.Write "내용 : " & err.Description & "<br>"
	     'Response.Write "쿼리 : " & strSQL & "<br>"
	Else
		Response.write strMessage
	End If

	on error goto 0
%>