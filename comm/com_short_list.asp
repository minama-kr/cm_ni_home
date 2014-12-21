<table id="nav_list">
	<colgroup>
		<col width="100"/>
		<col width=""/>
	</colgroup>
	<tbody>
	<%
		'tbl_cd = Left(bbs_dvs,1)

		strTblNm = ""
		strbbsDpth = "" '사용자 테이블만 사용하는 조건
		If tbl_cd = "U" Then
			strTblNm = "cm_user_bbs"
			strbbsDpth = " and bbs_dpth = 0 "
		ElseIf tbl_cd = "M" Then
			strTblNm = "cm_mng_bbs"
		End If

		If bbs_type = "mypage" Then
			strSQL = ";with tbl as "&_
					 "(select row_number() over(order by ntc_yn desc, wrt_dtm desc) rnum " &_
					 "      , bbs_key, title from "& strTblNm &" " &_
					 "  where bbs_dvs='"& bbs_dvs &"' and wrtr_id = '"&strUserID&"' "& strbbsDpth &") "&_
					 " select chk, rnum, bbs_key, title "&_
					 "   from ( select case when (select rnum-1 from tbl where bbs_key = "& bbs_key &") = rnum then 'A' "&_
					 "     					when (select rnum+1 from tbl where bbs_key = "& bbs_key &") = rnum then 'B' "&_
					 "						else 'N' end chk, rnum, bbs_key, title from tbl ) a "  &_
					 "  where a.chk <> 'N' order by chk"
		Else
			strSQL = ";with tbl as "&_
					 "(select row_number() over(order by ntc_yn desc, wrt_dtm desc) rnum " &_
					 "      , bbs_key, title from "& strTblNm &" " &_
					 "  where bbs_dvs='"& bbs_dvs &"' and bltn_yn = 'Y' "& strWhere & strbbsDpth &") "&_
					 " select chk, rnum, bbs_key, title "&_
					 "   from ( select case when (select rnum-1 from tbl where bbs_key = "& bbs_key &") = rnum then 'A' "&_
					 "     					when (select rnum+1 from tbl where bbs_key = "& bbs_key &") = rnum then 'B' "&_
					 "						else 'N' end chk, rnum, bbs_key, title from tbl ) a "  &_
					 "  where a.chk <> 'N' order by chk"
		End If

		If bbs_type = "medical" Then
			strTabCd = tab_cd
		Else			
			strTabCd = bbs_dvs
		End If

		objRecord.Open strSQL, objConn, 1

		If objRecord.EOF OR objRecord.BOF Then
	%>
		<tr>
			<td colspan="2" class="t_center">조회결과가 없습니다.</td>
		</tr>
	<%
		Else
			Do Until objRecord.EOF	
				If objRecord("chk") = "A" Then					
	%>
		<tr>
			<th>다음글<img src="/images/icon/icon_arrow_up_s.gif" class="bbs_arrow_icon" alt="다음글"/></th>
			<td class="tbl_hide"><a href="javascript:fncShortList('<%=bbs_type%>','<%=tbl_cd%>','<%=strTabCd%>','<%=objRecord("bbs_key")%>')"><%=objRecord("title")%></a></td>
		</tr>
	<%
				ElseIf objRecord("chk") ="B" Then
	%>
		<tr>
			<th>이전글<img src="/images/icon/icon_arrow_down_s.gif" class="bbs_arrow_icon"  alt="이전글"/></th>
			<td class="tbl_hide"><a href="javascript:fncShortList('<%=bbs_type%>','<%=tbl_cd%>','<%=strTabCd%>','<%=objRecord("bbs_key")%>')"><%=objRecord("title")%></a></td>
		</tr>
	<%
				End If
			objRecord.MoveNext
			Loop
		End If
		objRecord.Close
	%>
	</tbody>
</table>			