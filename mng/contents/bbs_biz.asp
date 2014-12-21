<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%> 
<!--#include virtual = "/comm/com_constant.asp"-->
<%
	Response.Expires = 0
	Response.Buffer = True

	'on error resume next

	Set uploadform = Server.CreateObject("DEXT.FileUpload")   
	uploadform.DefaultPath = Server.MapPath("/images/upload/bbs") 

	uploadform.CodePage = 65001

	' 게시판 공통(공지사항, 건강상식, 채용공고
	nKey = uploadform("pKey")
	strDvs = uploadform("pDvs")
	strTitle = uploadform("pTitle")
	strSmrContent = uploadform("pSmrContent")
	strContent = uploadform("pContent")
	strMode = uploadform("pMode")
	strReturnUrl = uploadform("pUrl")

	' 썸네일 변수
	isThmb = false
	strThmbPath = ""
	strThmbUrl =""
	strThmbDesc = uploadform("pThmbDesc")

	' 건강상식 용 변수
	strDeptCd = uploadform("selDept")				'부서

	' 따옴표 처리 로직
	strTitle = Replace(strTitle,"'","''")
	strSmrContent = Replace(strSmrContent,"'","''")
	strContent = Replace(strContent,"'","''")
	strThmbDesc = Replace(strThmbDesc,"'","''")

	'DB 연결
	Set objConn = Server.CreateObject("ADOdb.Connection")
	objConn.Open IC_DB_CONN

	strMessage = ""

	' 저장 일때 입력할 키와 순번
	If strMode = "s" Then
		Set objRecord = Server.CreateObject("ADODB.Recordset")

		strSQL = "SELECT ISNULL(MAX(BBS_KEY) + 1, 0) as NO "&_
		              "    FROM NI_USER_BBS "&_
		              " WHERE BBS_DVS = '" & strDvs & "' "
					
		objRecord.Open strSQL, objConn, 1

		nKey = objRecord(0)
		objRecord.Close
		
		strSQL = "SELECT ISNULL(MAX(BBS_SEQ_NO) + 1, 1) as SEQ "&_
		              "    FROM NI_USER_BBS "&_
		              " WHERE BBS_DVS = '" & strDvs & "' "&_
		              "       AND (BBS_DPTH  = 0 OR BBS_DPTH IS NULL)"           
		objRecord.Open strSQL, objConn, 1

		nBbsSeqNo = objRecord(0)
		objRecord.Close

		set objRecord = Nothing
	End If

	'파일 업로드 : 입력(I) or 수정(U) 일경우만 실행
	If strMode = "s" Or strMode ="u" Then
		If Len(CStr(uploadform("fileThmb").FileName)) > 0 Then
			isThmb = true
			strGetFileName = CStr(uploadform("fileThmb").FileName)
			dblFileSize = CLng(uploadform("fileThmb").FileLen)
			strFullPath =  uploadform.DefaultPath&"/"&strGetFileName'uploadform("fileThmb").FilePath 

			getUploadImageSizeLimit(dblFileSize)

			If uploadform.FileExists(strFullPath) Then
				' Get FileName and FileExt
				If InStrRev(strGetFileName, ".") <> 0 Then 
					strFileNameOnly = Left(strGetFileName, InStrRev(strGetFileName, ".") - 1) 
					strFileExt = Mid(strGetFileName, InStrRev(strGetFileName, ".")) 
				Else 
					strFileNameOnly = strGetFileName
					strFileExt = "" 
				End If

				' Get Unique FileName
				n = 2
				Do While (1)
					strFullPath = uploadform.DefaultPath & "/"& strFileNameOnly & "[" & n & "]" & strFileExt 
					strFileName = strFileNameOnly & "[" & n & "]" & strFileExt 
					If Not uploadform.FileExists(strFullPath) Then Exit Do 
					n = n + 1
				Loop 
			Else 
				strFileName = strGetFileName 
			End If

			strFileUrl = "/images/upload/bbs/"&strFileName

		       uploadform("fileThmb").SaveAs strFullPath

			strThmbPath = strFullPath
			strThmbUrl =strFileUrl
		End If


    		' 파일 등록
		Dim Arr_Count
		' 업로드 파일 배열갯수
		Arr_Count = uploadform("fileObj").count
		If Arr_Count > 0 Then
			For i=1 to Arr_Count
				If Len(CStr(uploadform("fileObj")(i).FileName)) > 0 Then
					strGetFileName = CStr(uploadform("fileObj")(i).FileName)
					dblFileSize = CLng(uploadform("fileObj")(i).FileLen)
					strFullPath = uploadform.DefaultPath & "\" & strGetFileName

					If uploadform.FileExists(strFullPath) Then
						' Get FileName and FileExt
						If InStrRev(strGetFileName, ".") <> 0 Then 
							strFileNameOnly = Left(strGetFileName, InStrRev(strGetFileName, ".") - 1) 
							strFileExt = Mid(strGetFileName, InStrRev(strGetFileName, ".")) 
						 Else 
							strFileNameOnly = strGetFileName
							strFileExt = "" 
						 End If

						 ' Get Unique FileName
						 n = 2
						Do While (1)
							strFullPath = uploadform.DefaultPath & "\" & strFileNameOnly & "[" & n & "]" & strFileExt 
							strFileName = strFileNameOnly & "[" & n & "]" & strFileExt 
							If Not uploadform.FileExists(strFullPath) Then Exit Do 
							n = n + 1
						Loop 
					Else 
						strFileName = strGetFileName
					End If
					strFileUrl = "/filesdir/bbs/"&strFileName

			       	uploadform("fileObj")(i).SaveAs strFullPath

			       	'file 경로저장
					Set objRecord = Server.CreateObject("ADODB.RecordSet")

					strSQL = "select max(atch_file_seq) atch_file_seq from ni_bbs_atch_file "&_
							 "   where bbs_key="& nKey &" and bbs_dvs='"&strDvs&"' "
					objRecord.Open strSQL, objConn, 1

					If isnull(objRecord("atch_file_seq")) Then
						atch_file_seq = 1
					else
						atch_file_seq = CInt(objRecord("atch_file_seq")) + 1
					End If

					objRecord.Close
					set objRecord = Nothing

					strExecFileSQL = "insert into ni_bbs_atch_file(bbs_key, bbs_dvs, atch_file_seq, origin_file_path "&_
									 "     , save_file_path, file_nm, file_sz, reg_dtm) "&_
									 " values("&nKey&",'"&strDvs&"',"&atch_file_seq&", null "&_
									 ", '"&strFullPath&"' , '"&strFileName&"', "&dblFileSize&", getdate()); "
					objConn.Execute(strExecFileSQL)
				End If 
			Next
		End If
	End If
		
	If strMode = "s" Then
	      	strSQL = " INSERT INTO NI_USER_BBS (BBS_KEY, BBS_DVS, BBS_SEQ_NO, TITLE, SMR_CNTE, CNTE "&_
	      		          "                                                 , THMB_FILE_PATH, THMB_URL, THMB_DESC, WRTR_ID,  WRT_DTM, LST_MDF_DTM)  "&_
	                  	   " VALUES(" & nKey & ", '" & strDvs & "', " & nBbsSeqNo & ", '" & strTitle & "', '" & strSmrContent & "', '" & strContent & "' "&_
	                  	   "              , '" & strThmbPath & "','" & strThmbUrl & "','" & strThmbDesc & "', '" & strDeptCd & "', GETDATE(), GETDATE()) "
                  	    
		objConn.Execute(strSQL)

		strSQL = " INSERT INTO NI_USER_BBS_CNT (BBS_KEY, BBS_DVS) VALUES (" & nKey & ", '" & strDvs &"') "
		objConn.Execute(strSQL)		

		strMessage = "저장했습니다."

	ElseIf strMode = "d" Then
		strSQL = "DELETE NI_USER_BBS WHERE BBS_DVS = '" & strDvs & "' AND BBS_KEY = " & nKey
		objConn.Execute(strSQL)

		strSQL = "DELETE NI_USER_BBS_CNT WHERE BBS_DVS = '" & strDvs & "' AND BBS_KEY = " & nKey
		objConn.Execute(strSQL)

		strSQL = "DELETE NI_BBS_ATCH_FILE WHERE BBS_DVS = '" & strDvs & "' AND BBS_KEY = " & nKey
		objConn.Execute(strSQL)

		strMessage = "삭제했습니다."

	ElseIf  strMode = "u" Then
		strSQL = "UPDATE NI_USER_BBS "&_
			         "        SET TITLE = '" & strTitle & "'"&_
			         "             , CNTE = '" & strContent & "'"&_
			         "             , SMR_CNTE = '" & strSmrContent & "'"
		If isThmb Then
			strSQL = strSQL & "             , THMB_FILE_PATH = '" & strThmbPath & "'"&_			         			         
			         			      "             , THMB_URL = '" & strThmbUrl & "'"&_
			                                "             , THMB_DESC = '" & strThmbDesc & "'"
		End If
		strSQL = strSQL & "             , WRTR_ID = '" & strDeptCd & "'"&_
			                          "             , LST_MDF_DTM = GETDATE() "&_
			                          " WHERE BBS_DVS = '" & strDvs & "'"&_
			                          "       AND BBS_KEY = " & nKey
		objConn.Execute(strSQL)
		
		strMessage = "수정했습니다."
	End If

	objConn.Close
	Set objConn = Nothing

	If err <> 0 Then
	     Response.Write "오류 번호 : " & err.number & "<br>"
	     Response.Write "내용 : " & err.Description & "<br>"
	     Response.Write "쿼리 : " & strSQL & "<br>"
	Else
	%>
		<script type="text/javascript">
			alert("<%=strMessage%>");
			var strUrl = "<%=strReturnUrl%>";
			if("<%=strMode%>" != "d"){
				strUrl += "?key=" + "<%=nKey%>" + "&dvs=" + "<%=strDvs%>";
			}
			location.href = strUrl;
		</script>
	<%
	End If

	on error goto 0
%>