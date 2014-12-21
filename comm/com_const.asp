<%
	'DIM IC_SERVER_IP

	'response.write Request.ServerVariables("Remote_addr")
	'response.end

	Const IC_DB_CONN = "Provider=SQLOLEDB;Data Source=pjy6211.cafe24.com;Initial Catalog=pjy6211;User ID=pjy6211;Password=nibw1010235c;"
	Const CONTENT_NEW_DUE = 2
	'Set objConn = Server.CreateObject("ADOdb.Connection")
	'objConn.Open IC_DB_CONN

	' 메뉴 처리'
	' 메인 메뉴 개수 설정'
	Dim arrM(7)
	For i = 0 to UBound(arrM) - 1
		Set arrM(i) = new Menu
	Next
	' 메뉴 클래스
	Class Menu
		public menuNm '메뉴명
		public url '이동 주소
		public imgUrl '이미지 경로
		public imgAlt ' 이미지 설명
		public imgLink '링크 주소
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

	arrM(0).menuNm = "진료안내"
	arrM(0).url = "/treat/treat_guide.asp"
	arrM(0).imgUrl = "/images/top/menu_aside_treat.png"
	arrM(0).imgAlt = "진료문의전화 041.521.1114"
	arrM(0).imgLink = ""
	arrM(0).SetArrCnt(4)
	arrM(0).AddArrS(0)

	arrM(0).arrS(0).menuNm = "진료과목 안내"
	arrM(0).arrS(0).url= "/treat/treat_guide.asp"
	arrM(0).arrS(1).menuNm = "진료시간 안내"
	arrM(0).arrS(1).url= "/treat/doctor_session.asp"
	arrM(0).arrS(2).menuNm = "외래접수 안내"
	arrM(0).arrS(2).url= "/treat/accept.asp"
	arrM(0).arrS(3).menuNm = "입·퇴원 안내"
	arrM(0).arrS(3).url= "/treat/inout.asp"

	arrM(1).menuNm = "이용안내"
	arrM(1).url = "/use/facilities_guide.asp"
	arrM(1).imgUrl = "/images/top/menu_aside_use.png"
	arrM(1).imgAlt = "비급여항목안내 페이지 이동"
	arrM(1).imgLink = "/use/application.asp"
	arrM(1).SetArrCnt(5)
	arrM(1).AddArrS(1)

	arrM(1).arrS(0).menuNm = "시설안내"
	arrM(1).arrS(0).url= "/use/facilities_guide.asp"
	arrM(1).arrS(1).menuNm = "전화번호안내"
	arrM(1).arrS(1).url= "/use/phone.asp"
	arrM(1).arrS(2).menuNm = "층별안내"
	arrM(1).arrS(2).url= "/use/floor.asp"
	arrM(1).arrS(3).menuNm = "입원생활안내"
	arrM(1).arrS(3).url= "/use/life_guide.asp"
	arrM(1).arrS(4).menuNm = "제증명서 발급안내"
	arrM(1).arrS(4).url= "/use/application.asp"

	arrM(2).menuNm = "재활전문센터"
	arrM(2).url = "/rhbl/rhbl_intro.asp"
	arrM(2).imgUrl = "/images/top/menu_aside_pro.png"
	arrM(2).imgAlt = "전문의료진구성 안내 페이지 이동"
	arrM(2).imgLink = "/treat/doctor_session.asp"
	arrM(2).SetArrCnt(5)
	arrM(2).AddArrS(2)

	arrM(2).arrS(0).menuNm = "센터소개"
	arrM(2).arrS(0).url= "/rhbl/rhbl_intro.asp"
	arrM(2).arrS(1).menuNm = " 운동치료"
	arrM(2).arrS(1).url= "/rhbl/exercise.asp"
	arrM(2).arrS(2).menuNm = "작업치료"
	arrM(2).arrS(2).url= "/rhbl/work.asp"
	arrM(2).arrS(3).menuNm = "통증치료"
	arrM(2).arrS(3).url= "/rhbl/pain.asp"
	arrM(2).arrS(4).menuNm = "전문클리닉"
	arrM(2).arrS(4).url= "/rhbl/clinic.asp"

	arrM(3).menuNm = "사회사업실"
	arrM(3).url = "/social/social_intro.asp"
	arrM(3).imgUrl = "/images/top/menu_aside_volunteer.png"
	arrM(3).imgAlt = "자원봉사 문의 041.521.1114"
	arrM(3).imgLink = ""
	arrM(3).SetArrCnt(3)
	arrM(3).AddArrS(3)

	arrM(3).arrS(0).menuNm = "사회사업실소개"
	arrM(3).arrS(0).url= "/social/social_intro.asp"
	arrM(3).arrS(1).menuNm = " 자원봉사활동"
	arrM(3).arrS(1).url= "/social/voluntary.asp"
	arrM(3).arrS(2).menuNm = "프로그램안내"
	arrM(3).arrS(2).url= "/social/program.asp"	

	arrM(4).menuNm = "병원소식"
	arrM(4).url = "/news/notice.asp"
	arrM(4).imgUrl = "/images/top/menu_aside_notice.png"
	arrM(4).imgAlt = "병원 최근행사 안내 페이지 이동"
	arrM(4).imgLink = "/news/notice.asp"
	arrM(4).SetArrCnt(5)
	arrM(4).AddArrS(4)

	arrM(4).arrS(0).menuNm = "공지사항"
	arrM(4).arrS(0).url= "/news/notice.asp"
	arrM(4).arrS(1).menuNm = " 건강상식"
	arrM(4).arrS(1).url= "/news/health_sence.asp"
	arrM(4).arrS(2).menuNm = "병원앨범"
	arrM(4).arrS(2).url= "/news/hospital_album.asp"
	arrM(4).arrS(3).menuNm = "어르신앨범"
	arrM(4).arrS(3).url= "/news/elder_album.asp"
	arrM(4).arrS(4).menuNm = "채용공고"
	arrM(4).arrS(4).url= "/news/recruit.asp"	

	arrM(5).menuNm = "고객의소리"
	arrM(5).url = "/voc/faq.asp"
	arrM(5).imgUrl = "/images/top/menu_aside_voc.png"
	arrM(5).imgAlt = "병원 문의 FAQ 페이지 이동"
	arrM(5).imgLink = "/voc/faq.asp"
	arrM(5).SetArrCnt(4)
	arrM(5).AddArrS(5)

	arrM(5).arrS(0).menuNm = "자주하는질문"
	arrM(5).arrS(0).url= "/voc/faq.asp"
	arrM(5).arrS(1).menuNm = " 질문 및 답변"
	arrM(5).arrS(1).url= "/voc/qna.asp"
	arrM(5).arrS(2).menuNm = "불만 및 고충처리"
	arrM(5).arrS(2).url= "/voc/complaint.asp"
	arrM(5).arrS(3).menuNm = "칭찬합시다"
	arrM(5).arrS(3).url= "/voc/praise.asp"	

	arrM(6).menuNm = "병원소개"
	arrM(6).url = "/introduce/use_guide.asp"
	arrM(6).imgUrl = "/images/top/menu_aside_introduce.png"
	arrM(6).imgAlt = "병원장인사말 안내 페이지 이동"
	arrM(6).imgLink = "/introduce/greeting.asp"
	arrM(6).SetArrCnt(5)
	arrM(6).AddArrS(6)

	arrM(6).arrS(0).menuNm = "설립목적"
	arrM(6).arrS(0).url= "/introduce/use_guide.asp"
	arrM(6).arrS(1).menuNm = " 경영이념"
	arrM(6).arrS(1).url= "/introduce/idea.asp"
	arrM(6).arrS(2).menuNm = "인사말"
	arrM(6).arrS(2).url= "/introduce/greeting.asp"
	arrM(6).arrS(3).menuNm = "병원연혁"
	arrM(6).arrS(3).url= "/introduce/history.asp"
	arrM(6).arrS(4).menuNm = "오시는길"
	arrM(6).arrS(4).url= "/introduce/map.asp"

	' Url 정보 가공
	strUrlInfo = Request.ServerVariables("PATH_INFO")
	strMainDataValue = ""
	strSubDataValue = ""
	arrUrlInfo = Split(Replace(strUrlInfo, ".asp", ""), "/")
	strHtmlTitle = ""

	If UBound(arrUrlInfo) = 1 Then
		strMainDataValue = arrUrlInfo(1)
	ElseIf UBound(arrUrlInfo) > 1 Then
		strMainDataValue = arrUrlInfo(1)
		strSubDataValue = arrUrlInfo(2)
	End If

	' 현재 이동한 메뉴와 하위메뉴의 index 추출
	nSelMenuIndex = 0
	nSelSubMenuIndex = 0
	For i = 0 To UBound(arrM) - 1
		arrMenuUrlInfo = Split(Replace(LCase(arrM(i).url), ".asp", ""), "/")
		If LCase(strMainDataValue) = arrMenuUrlInfo(1) Then
			nSelMenuIndex = i
			For x = 0 To UBound(arrM(i).arrS) - 1
				If instr(LCase(strUrlInfo), LCase(Replace(arrM(i).arrS(x).url, ".asp", ""))) > 0 Then
					nSelSubMenuIndex = x
					strHtmlTitle = arrM(i).menuNm & " > " & arrM(i).arrS(x).menuNm
				End If
			Next
		End If
	Next
%>