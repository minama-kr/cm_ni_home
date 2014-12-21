<%
	DIM IC_SERVER_IP

	'response.write Request.ServerVariables("Remote_addr")
	'response.end

	Const IC_DB_CONN = "Provider=SQLOLEDB;Data Source=pjy6211.cafe24.com;Initial Catalog=pjy6211;User ID=pjy6211;Password=nibw1010235c;"
	' Const IC_DB_CONN = "Provider=SQLOLEDB;Data Source=eliocmhos.cafe24.com, 1433;Initial Catalog=eliocmhos ;User ID=eliocmhos;Password=cjsdkscndan041;"


%>
<%
    '======================================================
    ' 사용할때, getRefererPage 함수를 호출하면 이전 페이지 이름만 리턴합니다.
    '======================================================
    Function getRefererPage
    
        Dim refererValue, chkPos
        
        ' 호출한 페이지값을 받습니다.
        refererValue = Request.ServerVariables("HTTP_REFERER")
        ' 호출한 페이지 값이 없을 경우
        IF Len(refererValue) = 0 Then
            getRefererPage = "/cmhos/main.asp"
            Exit Function
        End IF
        
        getRefererPage = refererValue
    
    End Function

    '======================================================
    ' 세션체크(홈페이지용)
    '======================================================
    Function fncSessionCheck(check)
        If check = "" Then
            Response.Write "<script language='javascript'>alert('로그인 후 사용하실 수 있는 메뉴입니다.');top.location.href = '/cmhos/main.asp';</script>"
            Response.End
        End If
    End Function

    'Front Page 세션 체크
    Function fncAuthCheck(check)
        If check = "M" Then 
            Response.Write "<script language='javascript'>alert('관리자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmng/bbs/total_bbs_list.asp';</script>"
            Response.End
        ElseIf check = "D" Then 
            Response.Write "<script language='javascript'>alert('의료진은 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmdoc/total_bbs_list.asp';</script>"
            Response.End
        ElseIf check = "C" Then 
            Response.Write "<script language='javascript'>alert('콜센터 관리자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmcall/call_bbs_list.asp';</script>"
            Response.End

        End If
    End Function

    '관리자 Page 세션 체크
    Function fncAdminCheck(check)
        If check = "H" Then 
            Response.Write "<script language='javascript'>alert('일반사용자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmhos/main.asp';</script>"
            Response.End
        ElseIf check = "D" Then 
            Response.Write "<script language='javascript'>alert('의료진은 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmdoc/total_bbs_list.asp';</script>"
            Response.End
        ElseIf check = "C" Then 
            Response.Write "<script language='javascript'>alert('콜센터 관리자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmcall/call_bbs_list.asp';</script>"
            Response.End

        End If
    End Function

    '의료진 Page 세션 체크
    Function fncDoctorCheck(check)
        If check = "H" Then 
            Response.Write "<script language='javascript'>alert('일반사용자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmhos/main.asp';</script>"
            Response.End
        ElseIf check = "M" Then 
            Response.Write "<script language='javascript'>alert('관리자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmng/bbs/total_bbs_list.asp';</script>"
            Response.End
        ElseIf check = "C" Then 
            Response.Write "<script language='javascript'>alert('콜센터 관리자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmcall/call_bbs_list.asp';</script>"
            Response.End

        End If
    End Function

     '콜센터 Page 세션 체크
    Function fncCallCheck(check)
        If check = "H" Then 
            Response.Write "<script language='javascript'>alert('일반사용자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmhos/main.asp';</script>"
            Response.End
        ElseIf check = "M" Then 
            Response.Write "<script language='javascript'>alert('관리자는 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmng/bbs/total_bbs_list.asp';</script>"
            Response.End
        ElseIf check = "D" Then 
            Response.Write "<script language='javascript'>alert('의료진은 사용하실 수 없는 페이지 입니다.');top.location.href = '/cmdoc/total_bbs_list.asp';</script>"
            Response.End

        End If
    End Function


    '======================================================
    ' 게시판 상세페이지에서 key값이 없을 때 목록으로 이동
    '======================================================
    Function getBbsDetailCheck(key)
        If key = "" Then
            Dim refererValue
            ' 호출한 페이지값을 받습니다.
            refererValue = Request.ServerVariables("HTTP_REFERER")
            If Len(refererValue) = 0 Then
                refererValue = Request.ServerVariables("path_info")
                If Len(refererValue) = 0 Then
                    getRefererPage = "/cmhos/main.asp"
                End If
            End If

            refererValue = replace(refererValue,"detail","list")
            'response.write refererValue
            Response.Redirect refererValue
            Response.End
        End If    
    End Function

    '======================================================
    ' 업로드 이미지 파일사이즈 제한
    '======================================================
    Function getUploadImageSizeLimit(filesize)
        If filesize > 50000000 Then
                Response.Write "<Script Language='JavaScript'>"
                Response.Write "    alert('이미지 업로드가 취소되었습니다.이미지 사이즈를  50MB이내로 업로드 시켜주세요.');"
                Response.Write "    history.back();" 
                Response.Write "</Script>"
                Response.End
        End IF
    End Function

    '======================================================
    ' 글쓴이 id replace(ex) ad****in)
    '======================================================
    Function getIdReplace(id)
        lenId = len(id)-4
        i = 1

        replaceId = left(id,2)
        do until i > lenId
            replaceId = replaceId & "*"
            i = i+1
        Loop
        replaceId = replaceId & right(id,2) 
    End Function

    '-------------------------------------------------------------
    'nMin ~ nMax 범위 내에서 임의 숫자를 산출한다.
    '-------------------------------------------------------------

    public function makeRand(nMin, nMax)

        Randomize

        makeRand = Int((nMax - nMin + 1) * Rnd + nMin)

    end function 

    '-------------------------------------------------------------
    'nLenMin ~ nLenMax 범위 내에서 임의 숫자를 산출한다.
    '랜덤 숫자를 산출하는 makeRand 사용자 정의 함수를 사용한다.
    '-------------------------------------------------------------

    public function makePassword(nLenMin, nLenMax)

        Dim idx, nEnd, nStat, resultStr

        nEnd = makeRand(nLenMin, nLenMax)
        resultStr = ""

        for idx=1 to nEnd
            nStat = makeRand(0,2)
            select case nStat
                case 0 : resultStr = resultStr & Chr(makeRand(Asc("a"),Asc("z")))
                case 1 : resultStr = resultStr & Chr(makeRand(Asc("A"),Asc("Z")))
                case 2 : resultStr = resultStr & Chr(makeRand(Asc("0"),Asc("9")))
            end select
        next

        makePassword = resultStr

    end function


%>
