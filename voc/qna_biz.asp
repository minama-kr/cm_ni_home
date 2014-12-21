<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%> 
<!--#include virtual = "/comm/com_const.asp"-->
<%
	on error resume next

	' 게시판 공통(공지사항, 건강상식, 채용공고
	nKey = Request("pKey")
	nNewKey = Request("pNewKey")
	nBbsSeqNo = 0
	nBbsDpth = 0
	nBbsDpthSort = 0
	strSecretYn = Request("pSecretYn")
	strDvs = Request("pDvs")
	strTitle = Request("pTitle")
	strContent = Request("pContent")
	strMode = Request("pMode") ' d 삭제, s 입력, u 수정'
	strType = Request("pType") ' r 댓글, q 본글, a 답글
	strReturnUrl = Request("pUrl")
	strPwsd = Request("pPswd")
	strName = Request("pName")
	strEMail = Request("pEMail")

	If strSecretYn = "on" Then
		strSecretYn = "Y"
	Else
		strSecretYn = "N"
	End If
	' 따옴표 처리 로직
	strContent = Replace(strContent,"'","''")
	strName = Replace(strName,"'","''")
	strTitle = Replace(strTitle,"'","''")
	strPwsd = Replace(strPwsd,"'","''")
	strEMail = Replace(strEMail,"'","''")

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	strMessage = ""

	'  댓글저장 일때 입력할 키와 순번
	If strMode = "s" Then
		If strType = "q" Then
			
		ElseIf strType = "a" THen
			nBbsDpth = 1
		Else 
			nBbsDpth = 2
		End If

		strSQL = "SELECT ISNULL(MAX(BBS_KEY) + 1, 0) as NO "&_
		              "    FROM NI_USER_BBS "&_
		              " WHERE BBS_DVS = '" & strDvs & "' "
			
		Set objRecord = Server.CreateObject("ADODB.Recordset")
		objRecord.Open strSQL, objConn, 1

		nNewKey = objRecord(0)
		objRecord.Close

		
		strSQL = "SELECT ISNULL(MAX(BBS_SEQ_NO) + 1, 1) as SEQ "&_
		              "    FROM NI_USER_BBS "&_
		              " WHERE BBS_DVS = '" & strDvs & "' "&_
		              "       AND(BBS_DPTH IS NULL OR BBS_DPTH = " & nBbsDpth & ") "

      		objRecord.Open strSQL, objConn, 1

		nBbsSeqNo = objRecord(0)
		objRecord.Close

		strTemp = ""
		If strType = "q" OR strType = "a" Then
			strTemp = nNewKey
		Else
			strTemp = nKey
		End If 
		strSQL = "SELECT ISNULL(MAX(BBS_DPTH_SORT) + 1, 1) as SEQ "&_
		              "    FROM NI_USER_BBS "&_
		              " WHERE BBS_DVS = '" & strDvs & "' "&_
		              "       AND BBS_GRP = " & strTemp

		objRecord.Open strSQL, objConn, 1

		nBbsDpthSort = objRecord(0)
		objRecord.Close

		set objRecord = Nothing

		If nKey = "" Then
			nKey = nNewKey
		End If
	End If
	
	If strMode = "s" Then
		'Response.write nKey & "<br />"
		'Response.write nNewKey & "<br />"
		'Response.write strDvs & "<br />"
		'Response.write strMode & "<br />"
		'Response.write strType & "<br />"
		'Response.write strTitle & "<br />"
		'Response.write strContent & "<br />"
		'Response.write strSecretYn & "<br />"

	      	strSQL = " INSERT INTO NI_USER_BBS (BBS_KEY, BBS_DVS, BBS_SEQ_NO, TITLE, CNTE, PSWD, SCRT_YN, EMAIL "&_
	      		          "                                                 , BBS_GRP, BBS_DPTH, BBS_DPTH_SORT, WRTR_ID,  WRT_DTM, LST_MDF_DTM)  "&_
	                  	   " VALUES(" & nNewKey & ", '" & strDvs & "', " & nBbsSeqNo & ", '" & strTitle & "', '" & strContent & "', '" & strPwsd & "', '" & strSecretYn & "', '" & strEMail & "' "&_
	                  	   "              , " & nKey & ", " & nBbsDpth & ", " & nBbsDpthSort & ", '" & strName & "', GETDATE(), GETDATE()) "
      		objConn.Execute(strSQL)

		If strType = "q" Then
			strSQL = " INSERT INTO NI_USER_BBS_CNT (BBS_KEY, BBS_DVS) VALUES (" & nNewKey & ", '" & strDvs &"') "
			objConn.Execute(strSQL)		
		End If

		strMessage = "저장했습니다."
	ElseIf strMode = "d" Then

		If strType = "q" Then
			strSQL = "DELETE NI_USER_BBS WHERE BBS_DVS = '" & strDvs & "' AND BBS_KEY = " & nKey
			objConn.Execute(strSQL)

			strSQL = "DELETE NI_USER_BBS_CNT WHERE BBS_DVS = '" & strDvs & "' AND BBS_KEY = " & nKey
			objConn.Execute(strSQL)

			strSQL = "DELETE NI_USER_BBS WHERE BBS_DVS = '" & strDvs & "' AND BBS_GRP = " & nKey
			objConn.Execute(strSQL)	
		Else
			strSQL = "DELETE NI_USER_BBS WHERE BBS_DVS = '" & strDvs & "' AND BBS_KEY = " & nNewKey
			objConn.Execute(strSQL)			
		End If
		
		strMessage = "삭제했습니다."

	ElseIf  strMode = "u" Then
		If strType = "q" OR strType = "a" Then
			strSQL = "UPDATE NI_USER_BBS "&_
			         "        SET CNTE = '" & strContent & "'"&_
			         "             , TITLE = '" & strTitle & "'"&_
			         "             , PSWD = '" & strPwsd & "'"&_
			         "             , WRTR_ID = '" & strName & "'"&_
			         "             , EMAIL  = '" & strEMail & "' "&_
			         "             , SCRT_YN = '" & strSecretYn & "' " &_
			         "             , LST_MDF_DTM = GETDATE() "&_
			         " WHERE BBS_DVS = '" & strDvs & "'"&_
			         "       AND BBS_KEY = " & nKey			
		Else 
			strSQL = "UPDATE NI_USER_BBS "&_
			         "        SET CNTE = '" & strContent & "'"&_
			         "             , PSWD = '" & strPwsd & "'"&_
			         "             , WRTR_ID = '" & strName & "'"&_
			         "             , LST_MDF_DTM = GETDATE() "&_
			         " WHERE BBS_DVS = '" & strDvs & "'"&_
			         "       AND BBS_KEY = " & nNewKey
		End If
		objConn.Execute(strSQL)
		
		strMessage = "수정했습니다."
	' Password 확인
	ElseIf strMode = "p" Then
		Set objRecord = Server.CreateObject("ADODB.Recordset")

		strSQL = "SELECT COUNT(1) CNT "&_
			 	"      FROM NI_USER_BBS "&_
   				"   WHERE BBS_DVS = '" & strDvs & "' "&_
   				"          AND PSWD = '" & strPwsd & "' "&_
   				"          AND BBS_KEY = " & nKey	
		              
		objRecord.Open strSQL, objConn, 1

		strMessage = "true"
		If objRecord(0) = 0 Then
			strMessage = "false"
		End If

		objRecord.Close
		set objRecord = Nothing
	End If

	objConn.Close
	Set objConn = Nothing

	If err <> 0 Then
	     Response.Write "오류 번호 : " & err.number & "<br>"
	     Response.Write "내용 : " & err.Description & "<br>"
	     Response.Write "쿼리 : " & strSQL & "<br>"
	Else
		If strMode = "p" Then
			Response.write strMessage
		Else
	%>
		<script type="text/javascript">
			alert("<%=strMessage%>");
			var strUrl = "<%=strReturnUrl%>";
			var strMode = "<%=strMode%>";
			var strType = "<%=strType%>";
			if(strType == "r"){
				strUrl += "?key=" + "<%=nKey%>" + "&dvs=" + "<%=strDvs%>";
			}else{
				if(strMode != "d"){
					strUrl += "?key=" + "<%=nKey%>" + "&dvs=" + "<%=strDvs%>";
				}
			}
			location.href = strUrl;
		</script>
	<%
		End If
	End If

	on error goto 0
%>