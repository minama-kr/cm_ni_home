<%
	Const IC_DB_CONN = "Provider=SQLOLEDB;Data Source=pjy6211.cafe24.com;Initial Catalog=pjy6211;User ID=pjy6211;Password=nibw1010235c;"
	Const CONTENT_NEW_DUE = 2
	' 메뉴 처리'
	' 메인 메뉴 개수 설정'

	Dim arrM(3)
	For i = 0 to UBound(arrM) - 1
		Set arrM(i) = new Menu
	Next
	' 메뉴 클래스
	Class Menu
		public menuNm '메뉴명
		public url '이동 주소
		public title '문서 제목
		public dvsNm '구분명
		public arrS '하위 메뉴
		' 하위 메뉴 개수 설정
		Function SetArrCnt(pMenuCnt)
			Redim arrS(pMenuCnt)
		End Function
		' 하위 메뉴 배열 초기화
		Function AddArrS(index)
			nCnt = UBound(arrS)
			For i = 0 to nCnt - 1
				Set arrM(index).arrS(i) = new Menu
			Next
		End Function
	End Class

	arrM(0).menuNm = "게시판관리"
	arrM(0).url = "/mng/board/bbs.asp"
	arrM(0).SetArrCnt(1)
	arrM(0).AddArrS(0)

	arrM(0).arrS(0).menuNm = "통합 관리"
	arrM(0).arrS(0).url= "/mng/board/bbs.asp"

	arrM(1).menuNm = "시스템 관리"
	arrM(1).url = "/mng/code.asp"
	arrM(1).SetArrCnt(1)
	arrM(1).AddArrS(1)

	arrM(1).arrS(0).menuNm = "공통코드 관리"
	arrM(1).arrS(0).url= "/mng/code.asp"

	arrM(2).menuNm = "컨텐츠 관리"
	arrM(2).url = "/mng/contents/notice.asp"
	arrM(2).SetArrCnt(6)
	arrM(2).AddArrS(2)

	arrM(2).arrS(0).menuNm = "공지사항"
	arrM(2).arrS(0).url= "/mng/contents/notice.asp"	
	arrM(2).arrS(0).dvsNm= "병원소식"
	arrM(2).arrS(1).menuNm = "건강상식"
	arrM(2).arrS(1).url= "/mng/contents/health_sence.asp"	
	arrM(2).arrS(2).menuNm = "병원앨범"
	arrM(2).arrS(2).url= "/mng/contents/hospital_album.asp"
	arrM(2).arrS(3).menuNm = "어르신앨범"
	arrM(2).arrS(3).url= "/mng/contents/elder_album.asp"
	arrM(2).arrS(4).menuNm = "채용공고"
	arrM(2).arrS(4).url= "/mng/contents/recruit.asp"

	arrM(2).arrS(5).menuNm = "자주하는질문"
	arrM(2).arrS(5).url= "/mng/contents/faq.asp"	
	arrM(2).arrS(5).dvsNm= "고객의소리"


	' Url 정보 가공
	strUrlInfo = Request.ServerVariables("PATH_INFO")
	strMainDataValue = ""
	strSubDataValue = ""
	arrUrlInfo = Split(Replace(strUrlInfo, ".asp", ""), "/")
	strHtmlTitle = ""


	If  UBound(arrUrlInfo) > 2 Then
		strMainDataValue = arrUrlInfo(2)
		strSubDataValue = arrUrlInfo(3)
	End If

	' 현재 이동한 메뉴와 하위메뉴의 index 추출
	nSelMenuIndex = 0
	nSelSubMenuIndex = 0
	For i = 0 To UBound(arrM) - 1

		For x = 0 To UBound(arrM(i).arrS) - 1
			If instr(LCase(strUrlInfo), Replace(LCase(arrM(i).arrS(x).url), ".asp", "")) > 0 Then
				nSelMenuIndex = i
				nSelSubMenuIndex = x
				strHtmlTitle = arrM(i).menuNm & " > " & arrM(i).arrS(x).menuNm
			End If

		Next
	Next
%>