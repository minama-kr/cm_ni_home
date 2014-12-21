<% @CODEPAGE="65001" language="vbscript" %> 
<%Response.charset="utf-8"%>  
<!--#include virtual = "/comm/com_const_adm.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA=Compatible" content="IE=Edge"/>
	<title>공통코드 관리</title>
	<link rel="stylesheet" href="/css/layout.css" />
	<link rel="stylesheet" href="/css/mng.css" />
	<style type="text/css">
		/* 공통코드 관리 리스트 넓이 설정 */
		div.list ul li.code{
			width:60px;
		}
		div.list ul li.name{
			width:80px;
		}
		div.list ul li.seq{
			width:50px;
		}
		div.list ul li.comment{
			width:167px;
		}
		div.edit input{
			height: 24px;
		}
		div.edit input.error{
			border:1px solid red;
		}
		div.btn{
			margin-top:10px;
		}
		button.left{
			margin-left:5px;
		}
		button.btn_big{
			width:74px; height:27px;
		}
		button.gray{
			background:url(/images/btn/bg_btn_gray.jpg) no-repeat 0 top; 
			color:#fff;
		}
		button.blue{
			background:url(/images/btn/bg_btn_blue.jpg) no-repeat 0 top; 
		}
		button.orange{
			background:url(/images/btn/bg_btn_orange.jpg) no-repeat 0 top; 
		}
		ul.select{
			background-color: #a3ddeb;
		}
		div.edit div{
			vertical-align: middle;
			line-height: 0;
		}

		div.dvs_edit div{
			min-height: 60px;
		}

		div.com_edit div{
			min-height:40px;
		}

		div.top_bd_silver{
			border-top:1px solid #d0d0d0;
		}

		div.top_bd_black{
			border-top:1px solid #000;
		}

		div.botm_bd_black{
			border-bottom:1px solid #000;
		}
		div.dvs_edit div.textarea{
			height:107px;
		}
		div.com_edit div.textarea{
			height:82px;
		}

		div.edit label{
			display: inline-block;
			width: 80px;
			text-align: center;
			font-weight: bold;
			margin-top:0px;
			float: left;
		}

		div.dvs_edit label{
			padding-top:30px
		}
		div.com_edit label{
			padding-top:20px
		}

		div.edit span{
			display: block;
			height: 20px;
			line-height: 20px;
			clear: both;
			padding-left:89px;
			color:red;
		}

		div.edit input, div.edit textarea{
			width:200px;
			line-height: 24px;
			padding-left:8px;
			display: inline-block;
			float: left;
		}

		div.dvs_edit input, div.dvs_edit textarea{
			margin-top:16px;
		}
		div.com_edit input, div.com_edit textarea{
			margin-top:6px;
		}

		p.null_list{
			text-align: center;
			font-size:13px;
			font-weight: bold;
			line-height: 60px;
		}

	</style>
	<script type="text/javascript" src="/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script src="/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function fncGetList(pType, pDvsCd){
			var wordSelector = "#txtDvsSearchWord";
			wordSelector = pType == "com" ? "#txtComSearchWord" : wordSelector;
			var vText = $(wordSelector).val();
			vText = vText == $(wordSelector).attr("placeholder") ? "" : vText;
			pDvsCd = pDvsCd == "" ? $("#txtSupDvsCd").val() : pDvsCd;
			$.ajax({
				type:"POST",
				data:{
					pType : pType,
					pSearchWord : vText,
					pDvsCd : pDvsCd
				},
				url: "/mng/code_list.asp",
				success : function(html){
					var selectorName = "div.dvs_list div.scroll";
					if(pType == "com"){
						selectorName = "div.com_list div.scroll";
						if(pDvsCd == ""){
							alert("구분 코드를 선택해 주세요");
						}
					}
					$(selectorName).html(html);
					fncInit(pType);
				}
			})
		}

		function fncAlertSpan(pInputId){
			var $input = $("#" + pInputId);
			if(!$input.parent().find("span").is("blind")){
				$input.parent().find("span").addClass("blind");
				$input.removeClass("error");
			}
		}

		function fncValidationCheck(pInputId){
			var $input = $("#" + pInputId);
			var val = $input.val();
			var placeHolder = $input.attr("placeholder");

			if(pInputId == "txtDvsCd" || pInputId == "txtComCd"){
				if(val == placeHolder || val == ""){
					$input.parent().find("span").removeClass("blind");
					$input.addClass("error");
				}		
			}else if(pInputId == "txtSeq" || pInputId == "txtComSeq"){
				if(isNaN(val) || val == ""){
					$input.parent().find("span").removeClass("blind");
					$input.addClass("error");
				}
			}
		}

		function fncSelectDvsCd(pDvsCd, pThisObj){
			$("#hdnDvsCdMode").val("u");
			$("div.dvs div.delete").removeClass("none");
			$("div.dvs ul.select").removeClass("select");
			$("#txtDvsCd").attr("disabled", "disabled");
			$("button[name='btn_edit']").eq(0).text("수정");
			var $ul = $(pThisObj).parent().parent();
			$ul.addClass("select");
			var array = new Array();
			$ul.find("a").each(function(){
				array.push($(this).text());
			});
			$(".dvs_edit").find("input").each(function(index){
				
				if(index == 0){
					$("input[name='pDvsCd']").val(array[index]);
				}else{
					$(this).val(array[index]);	
				}
			});
			$("#txtComment").val(array[array.length - 1]);

			fncGetList("com", pDvsCd);
		}

		function fncSelectComCd(pComCd, pThisObj, pFileLinkNm){
			$("#hdnComCdMode").val("u");
			$("div.com div.delete").removeClass("none");
			$("div.com ul.select").removeClass("select");
			$("#txtComCd").attr("disabled", "disabled");
			$("button[name='btn_edit']").eq(1).text("수정");
			var $ul = $(pThisObj).parent().parent();
			$ul.addClass("select");
			var array = new Array();
			$ul.find("a").each(function(){
				array.push($(this).text());
			});
			$(".com_edit").find("input").each(function(index){
				
				if(index == 0){
					
				}else{
					$(this).val(array[index - 1]);	
				}
			});
			$("#txtLinkFileNm").val(pFileLinkNm);
			$("#txtComComment").val(array[array.length - 1]);
		}

		function fncInit(pType){
			if(pType == "dvs"){
				$("#hdnDvsCdMode").val("s");
				$("div.dvs .delete").addClass("none");
				$("div.dvs ul.select").removeClass("select");
				$("#txtDvsCd").removeAttr("disabled");
				$("button[name='btn_edit']").eq(0).text("저장");
				$(".dvs_edit input, .dvs_edit textarea").each(function(){
					if(!("placeholder" in this)){
						$(this).val($(this).attr("placeholder"));
					}else{
						$(this).val("");
					}
				});
				$("#dvs_list_link").focus();	
			}else{
				$("#hdnComCdMode").val("s");
				$("div.com .delete").addClass("none");
				$("div.com ul.select").removeClass("select");
				$("#txtComCd").removeAttr("disabled");
				$("button[name='btn_edit']").eq(1).text("저장");
				$(".com_edit input, .com_edit textarea").each(function(index){
					if(!("placeholder" in this)){
						if(index != 0){
							$(this).val($(this).attr("placeholder"));
						}
					}else{
						if(index != 0){
							$(this).val("");
						}
					}
				});
				$("#com_list_link").focus();	
			}
			
		}

		function fncEdit(pType, pMode){
			var isError = false;
			var arrValue = new Array();
			var params;
			var editSelector;
			var modeSelector;
			var txtCdId;
			var nCdIndex = 0;

			if(pType === "dvs"){
				txtCdId = "#txtDvsCd" ;
				editSelector = ".dvs_edit";
				modeSelector = "#hdnDvsCdMode";
			}else{
				nCdIndex = 1;
				txtCdId = "#txtComCd";
				editSelector = ".com_edit";
				modeSelector = "#hdnComCdMode";
			}

			pMode = pMode == "" || pMode == undefined ? $(modeSelector).val().toLowerCase() : pMode;
			if(pMode === "s" || pMode === "u"){
				if($(editSelector + " input.error").length > 0){
					alert("코드나 정렬순서를 확인해 주세요.");
					isError = true;
				}
			}else if(pMode === "d"){
				if(!confirm("선택한 항목을 삭제하시겠습니까?")){
					isError = true;
				}
			}

			$(editSelector + " input, " + editSelector + " textarea").each(function(index){
				var strPlaceHolder = $(this).attr("placeholder");
				var strValue = $(this).val();
				if(strValue == strPlaceHolder){
					if(index == nCdIndex){
						alert("코드를 입력해주세요.");
						$(txtCdId).focus();
						isError = true;
					}
					arrValue.push("");
				}else{
					isError = !fncByteCheck($(this).attr("id"));
					arrValue.push($(this).val());	
				}
			});
			if(pType === "dvs"){
				params = {
					pType : pType,
					pMode : pMode,
					pDvsCd : arrValue[0],
					pDvsNm : arrValue[1],
					pSeq : arrValue[2],
					pComment : arrValue[3]
				};	
			}else{
				params = {
					pType : pType,
					pMode : pMode,
					pDvsCd : arrValue[0],
					pDvsNm : "",
					pComCd : arrValue[1],
					pComNm : arrValue[2],
					pSeq : arrValue[3],
					pFileNm : arrValue[4],
					pComment : arrValue[5]
				};
			}
			
			if(!isError){
				$.ajax({
					type: "POST",
					data: params,
					url : "/mng/code_biz.asp",
					success : function(html){
						alert(html);
						if(pMode == "s" || pMode == "u"){
							fncGetList(pType, arrValue[0]);
						}else if(pMode == "d"){
							$("div." + pType + " .list_item").each(function(){
								$(this).find("li:eq(0) a").each(function(){
									var vText = $(this).text();
									if(vText == arrValue[0]){
										$(this).parent().parent().remove();
									}
								});
							});
							fncGetList("com", arrValue[0]);	
						}
					}
				});
			}
			
		}

		function fncKeySearch(pType){
			if(window.event.keyCode === 13){
				fncGetList(pType, '')
			}else{
				return false;
			}
		}

		$(document).ready(function(){
			$("#txtDvsCd, #txtComCd").focus(function(){
				fncAlertSpan($(this).attr("id"));
			}).blur(function(){
				fncValidationCheck($(this).attr("id"));
			});
			$("#txtSeq, #txtComSeq").focus(function(){
				fncAlertSpan($(this).attr("id"));
			}).blur(function(){
				fncValidationCheck($(this).attr("id"));
			});
			fncGetList("dvs", '');
		});
	</script>
</head>
<body id="mng">
	<input type="hidden" id="hdnDvsCdMode" value="s" />
	<input type="hidden" id="hdnComCdMode" value="s" />
	<!-- 상단 메뉴 -->
	<!--#include virtual = "/comm/header_adm.asp"-->
	<div style="width:958px; margin:0 auto; overflow:hidden;">
		<!-- 왼쪽 사이드 메뉴 -->
		<!--#include virtual = "/comm/left_adm.asp"-->
		<div id="content" class="right_wrap">
		<!-- 서브 페이지 컨텐츠 입력 -->
			<div class="dvs">
				<h2 class="left">구분코드 관리</h2>
				<h3 class="skip_nav"><a href="#" id="dvs_list_link">구분코드 리스트 영역</a></h3>
				<div class="right" style="padding-top:15px;">
					<input id="txtDvsSearchWord" class="left placeholder" type="text" style="border:1px solid #d0d0d0; width:253px; height:25px; line-height:25px; padding-left:8px;" placeholder="검색하실 단어를 입력하세요." onkeypress="fncKeySearch('dvs')" />
					<button class="left" type="button" onclick="fncGetList('dvs', '')" style="margin-left:0;"><img class="left" src="/images/btn/search.jpg" alt="구분코드 검색 버튼" /></button>
				</div>
				<div style="clear:both;">
					<div class="left" style="width:417px;">
						<div class="list dvs_list" >
							<ul class="list_header">
								<li class="code">코드</li>
								<li class="name">이름</li>
								<li class="seq">순서</li>
								<li class="comment">비고</li>
							</ul>
							<div class="scroll" style="height:248px; overflow:auto;">
				
							</div>
						</div>
					</div>
					<div class="edit right">
						<div class="dvs_edit">
							<h3 class="skip_nav"><a href="#" id="dvs_edit_link">선택 구분코드 수정영역</a></h3>
							<div class="top_bd_black">
								<label for="txtDvsCd">구분코드</label>
								<input type="text" id="txtDvsCd" name="pDvsCd" class="placeholder" placeholder="영문 숫자의 조합입니다." maxlength="3" value="" />
								<span class="blind">* 필수입력란 입니다.</span>
							</div>
							<div class="top_bd_silver">
								<label for="txtDvsNm">코드명</label>
								<input type="text" id="txtDvsNm" class="placeholder" placeholder="코드명을 입력해주세요." maxlength="50" value="" />
							</div>
							<div class="top_bd_silver">
								<label for="txtSeq">정렬순서</label>
								<input type="text" id="txtSeq" class="placeholder" placeholder="숫자를 입력해주세요." maxlength="8" value="" />
								<span class="blind">* 숫자를 입력해주세요.</span>
							</div>
							<div class="top_bd_silver botm_bd_black textarea">
								<label for="txtComment" style="padding-top:50px;">비고</label>
								<textarea rows="3" id="txtComment" class="placeholder" placeholder="비고를 입력해주세요." maxlength="500" value="" style="height:70px;"></textarea>
							</div>
						</div>
						<div class="left btn delete none">
							<button class="left btn_big gray" type="button" onclick="fncEdit('dvs', 'd')">삭제</button>
						</div>
						<div class="right btn">
							<button class="left btn_big gray" type="button" onclick="fncInit('dvs')">초기화</button>
							<button name="btn_edit" class="left btn_big gray" type="button" onclick="fncEdit('dvs', '')">저장</button>	
						</div>
					</div>
				</div>
			</div>
			
			<div class="com" style="clear:both;">
				<h2 class="left">공통코드 관리</h2>
				<h3 class="skip_nav"><a href="#" id="dvs_list_link">공통코드 리스트 영역</a></h3>
				<div class="right" style="padding-top:15px;">
					<input id="txtComSearchWord" class="left placeholder" type="text" style="border:1px solid #d0d0d0; width:253px; height:25px; line-height:25px; padding-left:8px;" placeholder="검색하실 단어를 입력하세요." onkeypress="fncKeySearch('com')" />
					<button class="left" type="button" onclick="fncGetList('com', '')" style="margin-left:0;"><img class="left" src="/images/btn/search.jpg" alt="공통코드 검색 버튼" /></button>
					
				</div>
				<div style="clear:both;">
					<div class="left" style="width:417px;">
						<div class="list com_list">
							<ul class="list_header">
								<li class="code">코드</li>
								<li class="name">이름</li>
								<li class="seq">순서</li>
								<li class="comment">비고</li>
							</ul>
							<div class="scroll" style="height:287px; overflow:auto;">
								<p class="null_list">구분코드를 선택해 주세요.</p>
							</div>
						</div>
					</div>
					<div class="edit right">
						<div class="com_edit">
							<h3 class="skip_nav"><a href="#" id="com_edit_link">선택 공통코드 수정영역</a></h3>
							<div class="top_bd_black">
								<label for="txtSupDvsCd">구분코드</label>
								<input type="text" id="txtSupDvsCd" name="pDvsCd" maxlength="3" value="" disabled="disabled" />
							</div>
							<div class="top_bd_silver">
								<label for="txtComCd">공통코드</label>
								<input type="text" id="txtComCd" class="placeholder" placeholder="영문 숫자의 조합입니다." maxlength="10" value="" />
								<span class="blind">* 필수입력란 입니다.</span>
							</div>
							<div class="top_bd_silver">
								<label for="txtComNm">코드명</label>
								<input type="text" id="txtComNm" class="placeholder" placeholder="코드명을 입력해주세요." maxlength="50" value="" />
							</div>
							<div class="top_bd_silver">
								<label for="txtComSeq">정렬순서</label>
								<input type="text" id="txtComSeq" class="placeholder" placeholder="숫자를 입력해주세요." maxlength="8" value="" />
								<span class="blind">* 숫자를 입력해주세요.</span>
							</div>
							<div class="top_bd_silver textarea">
								<label for="txtLinkFileNm" style="padding-top:40px;">링크파일명</label>
								<textarea rows="3" id="txtLinkFileNm" class="placeholder" placeholder="링크파일명을 입력해주세요." maxlength="255" value="" style="height:70px;"></textarea>
							</div>
							<div class="top_bd_silver botm_bd_black textarea">
								<label for="txtComment" style="padding-top:40px;">비고</label>
								<textarea rows="3" id="txtComComment" class="placeholder" placeholder="비고를 입력해주세요." maxlength="500" value="" style="height:70px;"></textarea>
							</div>
						</div>
						<div class="left btn delete none">
							<button class="left btn_big gray" type="button" onclick="fncEdit('com', 'd')">삭제</button>
						</div>
						<div class="right btn">
							<button class="left btn_big gray" type="button" onclick="fncInit('com')">초기화</button>
							<button name="btn_edit" class="left btn_big gray" type="button" onclick="fncEdit('com', '')">저장</button>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
	<!-- 하단 -->
	<!--#include virtual = "/comm/footer.asp"-->
</body>
</html>
		