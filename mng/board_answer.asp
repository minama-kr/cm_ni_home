<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>게시글 답변</title> 
	<link rel="stylesheet" href="/css/layout.css" />
	<link rel="stylesheet" href="/css/mng.css" />
	<style type="text/css">
	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
</head>
<body id="mng">
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<h2 class="left">게시글 답변</h2>
			<div class="right" style="padding-top:15px;">
				<input class="left placeholder" type="text" style="border:1px solid #d0d0d0; width:180px; height:25px; line-height:25px; padding-left:8px;" placeholder="검색하실 단어를 입력하세요." />
				<img class="left" src="/images/btn/search.jpg" alt="공지사항 검색 버튼" />	
			</div>
			<div class="list">
				<ul class="list_header">
					<li class="date">날짜</li>
					<li class="dvs">구분</li>
					<li class="title">제목</li>
					<li class="answer">답변</li>
					<li class="confirm">게시</li>
					<li class="view_cnt">조회</li>
					<li class="interval">인터벌</li>
					<li class="edit">수정</li>
				</ul>
				<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
								<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
								<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
								<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
								<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
								<ul class="list_item">
					<li class="date">14.11.29</li>
					<li class="dvs">병원소식</li>
					<li class="title">
						<a href="/mng/board_detail.asp" title="상세정보 페이지로 이동">정형외과 정의혁 선생님의 진료시간이 궁금합니다</a>
					</li>
					<li class="answer">
						<a href="/mng/board_answer.asp" title="답변 페이지로 이동">
							<img src="/images/btn/btn_list_answer.gif" alt="답변 페이지로 이동" />
						</a>
					</li>
					<li class="confirm">Y</li>
					<li class="view_cnt">602</li>
					<li class="interval">11일</li>
					<li class="edit">
						<a href="/mng/board_modify.asp" title="수정 페이지로 이동">
							<img src="/images/btn/btn_list_modify.gif" alt="수정 페이지로 이동" />
						</a>
					</li>
				</ul>
			</div>
			<div class="paging">
				<a class="" href="#" title="목록에서 처음페이지로 이동"><img src="/images/icon/first.jpg" alt="첫 페이지로 이동" /></a>
				<a class="prev_n" href="#" title="목록에서 이전 페이지로 이동"><img src="/images/icon/prev.jpg" alt="이전 페이지로 이동" /></a>
				<span class="paging_numbers">
					<a class="selected" href="#">1<span class="blind">페이지로 이동</span></a>
					<a href="#">2<span class="blind">페이지로 이동</span></a>
					<a href="#">3<span class="blind">페이지로 이동</span></a>
					<a href="#">4<span class="blind">페이지로 이동</span></a>
					<a href="#">5<span class="blind">페이지로 이동</span></a>
					<a href="#">6<span class="blind">페이지로 이동</span></a>
					<a href="#">7<span class="blind">페이지로 이동</span></a>
					<a href="#">8<span class="blind">페이지로 이동</span></a>
					<a href="#">9<span class="blind">페이지로 이동</span></a>
				</span>
				<a class="next_n" href="#" title="목록에서 다음 페이지로 이동"><img src="/images/icon/next.jpg" alt="다음 페이지로 이동" /></a>
				<a href="#" title="목록에서 마지막 페이지로 이동"><img src="/images/icon/last.jpg" alt="마지막 페이지로 이동" /></a>
			</div>
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>