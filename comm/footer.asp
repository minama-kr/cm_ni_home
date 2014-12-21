<div id="footer">	
	<div class="wrap" style="background-color:#f1f1f1;height:34px;">
		<ul class="left">
			<li><a class="bold" href="#">영서재단사이트</a></li>
			<li><a href="/main.asp">천안시립노인전문병원</a></li>
			<li><img src="/images/main/dvs.jpg" alt="" /></li>
			<li><a target="_blank" href="http://www.youngseowon.co.kr/">영서원</a></li>
			<li><img src="/images/main/dvs.jpg" alt="" /></li>
			<li><a target="_blank" href="http://www.cmyoyang.co.kr/">충무원</a></li>
		</ul>
		<ul class="right">
			<li><a class="bold" href="#">패밀리사이트</a></li>
			<li><a target="_blank" href="http://cmhos.co.kr/cmhos/main.asp">천안충무병원</a></li>
			<li><img src="/images/main/dvs.jpg" alt="" /></li>
			<li><a target="_blank" href="http://www.cmnoin.co.kr/">충무노인복지센터</a></li>
			<li><img src="/images/main/dvs.jpg" alt="" /></li>
			<li><a target="_blank" href="http://www.5799988.co.kr/">노인의전화</a></li>
		</ul>
	</div>
	<div class="wrap">
		<img class="left" src="/images/main/logo_bottom.jpg" alt="천안시립노인전문병원" />
		<p class="right" style="text-align:left; margin-top:8px;">
			충청남도 천안시 동남구 목천읍 송전리 431&nbsp; 대표전화 041.521.1114&nbsp; 팩스 041.521.1239
		</p>
		<p class="right" style="600px;text-align:right;">
			Copyright ⓒ 2014 Cheonan City Geriatrics Hospital. All right reserved.
			<a id="personal_info_policy_open" href="#personal_info_policy_link" onclick="fncLayerPopControl('personal_info_policy', true)" title="개인정보 취급방침 바로가기">
				<img src="/images/main/personal_info_policy.png" alt="개인정보 취급방침 바로가기" />
			</a>
		</p>
	</div>
</div>
<div id="site_map" class="bg_transparent_black">
	<h2 class="blind"><a href="#" id="site_map_link">Site Map</a></h2>
	<div class="wrap">
		<img class="left" src="/images/footer/site_map_title.png" alt="천안시립노인전문병원 Site Map" />
		<a class="right" href="#site_map_open" title="SIte Map 닫기" onclick="fncLayerPopControl('site_map', false);"><img src="/images/footer/close.png" alt="천안시립노인전문병원 닫기" /></a>
		<div>
			<ul id="site_map_nav">
		<%
			For i = 0 To UBound(arrM) - 1
				strSelected = ""
				If nSelMenuIndex = i AND LCase(strMainDataValue) <> "main" Then
					strSelected = "class='selected'"
				End If
		%>
				<li <%=strSelected%>>
					<a href="<%=arrM(i).url%>"><%=arrM(i).menuNm%></a>
			<% If UBound(arrM(i).arrS) - 1 > 0 Then	
				strStyle = ""
				If i = 4 Then
					strStyle = "style='border-right:0;'"
				End IF
			%>
					<ul class="site_map_sub_nav" <%=strStyle%>>
				<% 
					For x = 0 To UBound(arrM(i).arrS) - 1
						strSubSelected = ""
						If x = nSelSubMenuIndex And nSelMenuIndex = i AND LCase(strMainDataValue) <> "main" Then
							strSubSelected = "class='selected'"
						End If
				%>
						<li <%=strSubSelected%>><a href="<%=arrM(i).arrS(x).url%>"><%=arrM(i).arrS(x).menuNm%></a></li>
				<% Next %>
					</ul>
			<% End If %>
				</li>
		<%	Next %>					
			</ul>
		</div>
		<ul>
			<li><a href="/treat/doctor_session.asp" title="의료진안내 페이지로 이동"><img src="/images/footer/site_map_footer_1.jpg" alt="노인중증질환 최고의 전문가들을 소개합니다."></a></li>
			<li><a href="/use/application.asp" title="제증명서 발급안내 페이지로 이동"><img src="/images/footer/site_map_footer_2.jpg" alt="의무기록 사본 / 비급여고시 진단서등 제증명서 수수료 안내"></a></li>
			<li><a href="/use/phone.asp" title="원내 전화번호 안내 페이지로 이동"><img src="/images/footer/site_map_footer_3.jpg" alt="직통번호 안내"></a></li>
			<li><img src="/images/footer/site_map_footer_4.jpg" alt="진료예약 및 기타 문의사항을 주시면 자세히 안내해 드리겠습니다. Tel.041.521.1114 / Fax.041.554.1239"></li>
		</ul>
	</div>
</div>
<div id="personal_info_policy" class="bg_transparent_black">
	<h2 class="blind"><a href="#" id="personal_info_policy_link">개인정보 취급방침</a></h2>
	<div class="wrap">
		<img class="left" src="/images/footer/personal_information_title.png" alt="개인정보 취급방침" />
		<a class="right" href="#personal_info_policy_open" title="개인정보 취급방침 닫기" onclick="fncLayerPopControl('personal_info_policy', false);"><img src="/images/footer/close.png" alt="개인정보 취급방침 닫기" /></a>
		<div>
			<div id="personal_info_policy_content">
				<p>의료법인 영서의료재단 천안시립노인전문병원(이하 본원 이라 함) 귀하의 개인정보보호를 매우 중요시하며, 『개인정보보호법』을 준수하고 있습니다. 본원은 개인정보처리방침을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>

				<h4>가. 수집하는 개인정보의 항목 및 수집방법</h4>
				<p>본원은 회원가입 시 서비스 이용을 위해 필요한 최소한의 개인정보만을 수집합니다. 진료를 위한 필수정보는 의료법에 따라 별도의 동의 없이 진료카드 작성을 통해 수집하며, 진료외의 추가 서비스를 위해서는 별도의 수집·이용 동의서를 작성하셔야 하며, 동의서를 작성하지 않더라도 진료에는 전혀 불이익이 없습니다.</p>
				<ul>
					<li>▶ 진료정보 수집항목 : 성명, 주민등록번호, 주소, 연락처, 진료기록</li>
					<li>▶ 추가 서비스 정보 수집항목 : 성명, 주소, 연락처(전화번호, 휴대폰번호)</li>
				</ul>

				<h4>나. 개인정보 수집 및 이용목적</h4>
				<p>본원은 수집한 개인정보를 다음의 목적을 위해 활용합니다.
	이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 것입니다.</p>
				<ul>
					<li>▶ 진료정보 : 진단 및 치료를 위한 진료서비스와 청구, 수납 및 환급 등의 원무서비스 제공</li>
					<li>▶ 추가 서비스 정보 : 진료정보, 학술정보, 병원정보 안내</li>
				</ul>

				<h4>다. 개인정보 제3자 제공</h4>
				<p>본원은 의료법에서 정한 보유기간 동안 개인정보를 보유하며 그 이후에는 개인정보를 지체없이 파기합니다.</p>
				<ul>
					<li>▶ 보유기간 : 진료기록부 10년 (추가 서비스 정보는 환자정보 파기 시 함께 파기하거나 정보주체의 파기요청시 파기)</li>
					<li>▶ 파기절차 : 법정 보유기간 후 파기방법에 의하여 즉시 파기</li>
					<li class="bold">*진료기록이 최종 기록된 후 10년이 경과한 해당 개인정보는 즉시 파기함</li>
					<li>▶ 파기방법 : 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제하고 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기</li>
				</ul>		

				<h4>라. 이용자 및 법정대리인의 권리와 그 행사방법</h4>
				<p>만 14세 미만 아동(이하 "아동" 이라 함)의 회원가입은 개인정보 수집시 반드시 법정대리인의 동의를 구하고 있습니다. 본원은 법정대리인의 동의를 받기 위하여 아동으로부터 법정대리인의 성명과 연락처 등 최소한의 정보를 수집하고 있으며, 개인정보처리방침에서 규정하고 있는 방법에 따라 법정대리인의 동의를 받고 있습니다. 이용자 및 법정대리인은 개인정보와 관련하여 인터넷, 전화, 서면 등을 이용하여 병원에 연락을 하여 권리를 행사할 수 있으며, 본원은 지체없이 필요한 조치를 합니다.</p>
				<p>* 법에 의해 보관이 의무화된 개인정보는 요청이 있더라도 보관 기간내에 수정, 삭제할 수 없습니다.</p>

				<h4>마.동의철회 / 회원탈퇴 방법</h4>
				<p>귀하는 회원가입 시 개인정보의 수집, 이용 및 제공에 대해 동의하신 내용을 언제든지 철회 하실 수 있습니다. 회원탈퇴는 탈퇴신청서를 작성하시거나 개인정보보호책임자로 서면, 전화 또는 Fax 등으로 연락하시면 지체 없이 귀하의 개인정보를 파기하는 등 필요한 조치를 하겠습니다. </p>

				<h4>바. 개인정보의 제3자 제공</h4>
				<p>본원은 국민건강보험법에 의거 건강보험심사평가원에 요양급여비용 청구를 위해 진료기록을 제출합니다.</p>

				<h4>사. 개인정보 처리의 위탁</h4>
				<p>본원은 개인정보의 관리시스템의 관리를 위해 다음의 회사에 개인정보를 위탁하고 있습니다.</p>
				<ul>
					<li>▶ 전자진료기록 관리 : 본원의무기록실(보관소)</li>
					<li>▶ 병원관리시스템 운영 및 유지보수 : 유진의료정보</li>
				</ul>

				<h4>아. 개인정보 보호책임자</h4>
				<p>본원은 귀하의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 개인정보보호책임자를 두고 있습니다. </p>
				<ul>
					<li>▶ 쿠키 등 사용목적
						<p>회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 횟수 파악 등을 통한 개인 맞춤 서비스 제공<br/>
귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부 할 수도 있습니다. </p>
					</li>
					<li>▶ 천안시립노인전문병원장 문태순 041)521-1232   cmhos@cmhos.co.kr</li>
				</ul>

				<h4>자. 개인정보의 안전성 확보조치</h4>
				<p>본원은 이용자의 개인정보보호를 위한 기술적 대책으로서 여러 보안장치를 마련하고 있습니다. 이용자께서 제공하신 모든정보는 방화벽 등 보안장비에 의해 안전하게 보호/관리되고 있습니다. 또한 본원은 이용자의 개인정보보호를 위한 관리적 대책으로서 이용자의 개인정보에 대한 접근 및 관리에 필요한 절차를 마련하고, 이용자의 개인정보를 처리하는 인원을 최소한으로 제한하여 지속적인 보안교육을 실시하고 있습니다. 또한 개인정보를 처리하는 시스템의 사용자를 지정하여 사용자 비밀번호를 부여하고 이를 정기적으로 갱신하겠습니다.</p>

				<h4>차. 정책 변경에 따른 공지의무</h4>
				<p>이 개인정보처리방침은 2012년 3월 29일에 제정되었으며 법령, 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 시에는 변경되는 개인정보처리방침을 시행하기 최소 7일전에 병원 홈페이지를 통해 변경이유 및 내용 등을 공지하도록 하겠습니다.</p>
				<ul>
					<li> 공고일자 : 2012년 3월 30일</li>
					<li> 시행일자 : 2012년 4월 01일</li>
				</ul>
			</div>
		</div>
	</div>
</div>