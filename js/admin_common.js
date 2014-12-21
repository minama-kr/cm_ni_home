$(function () {	
	fncMenuDefault();

});


function fncMngGetMenuIndex() {

	var vArrUrl = location.href.split("/");
	if(vArrUrl.length > 4){
		var vMenu = vArrUrl[4].toLowerCase();
		var vSubMenu = vArrUrl[vArrUrl.length - 1].replace(/.asp/gi, "").replace(/#/gi, "").toLowerCase();
		if(vSubMenu.indexOf("_") != -1) {
			vSubMenu = vSubMenu.replace(/_main/gi,"_list").toLowerCase();
			var reg = /bbs?/;
			if(reg.test(vSubMenu)){
				vSubMenu = vSubMenu.substring(0,vSubMenu.indexOf("_"));
			}
		}
		var vsubMenuIdx = $(".sub_nav").index($(".sub_nav[data-value='"+vMenu+"']"));
		var vMenuIdx = $("#nav  #depth01 > li").index($("#nav #depth01 > li[data-value='"+vMenu+"']"));
		//left code
		var $sub = $(".sub_nav").eq(vsubMenuIdx);
		var vSubIdx = $sub.find("li").index($sub.find("li[data-value='"+vSubMenu+"']"));

	}else{
		vMenuIdx = -1;
		vsubMenuIdx = -1;
	}
	var data = {
		vIdx: vMenuIdx,
		subMenuIdx : vsubMenuIdx,
		subIdx : vSubIdx
	}	
	return data;
}

//메뉴 defalut 설정하기 & Left 네비게이션 설정
function fncMenuDefault() {
	var vIdx = fncMngGetMenuIndex().vIdx;

	var subMenuIdx = fncMngGetMenuIndex().subMenuIdx;
	var subIdx = fncMngGetMenuIndex().subIdx;
	if(subIdx != -1){
		/*
		$("#nav #depth01 > li").eq(vIdx).find("a").addClass("on");
		$("#nav #depth01 > li").eq(vIdx).addClass("on");
		*/

		$(".sub_nav").eq(subMenuIdx).show();
		var menuNm = $("#nav #depth01 > li > a").eq(vIdx).text();
		$(".main_name").text(menuNm);
		$(".sub_nav").eq(subMenuIdx).find("li").eq(subIdx).addClass("on");
		$(".sub_nav").eq(subMenuIdx).find("li").eq(subIdx).find("a").addClass("on");
	}
}

//페이징 처리 ex) fncShortList('mypage.asp',10,'mapage','','U01')
 function fncPaging(type, pageUrl, page, tabSeq, tabCd) { 
	//정렬
	var vSortVal = $("#hdnSortVal").val();
	var vDirection = $("#hdnDirection").val();

	//검색
	var cboType = $("#cboSelect").val(); //검색구분
	var dept = $("#cboDept").val(); //검색부서
	var stext = $("#txtSearch").val(); //검색단어
	var FromDate = $("#dtFromDate").val(); //fromdate
	var Todate = $("#dtToDate").val(); //todate

	var pageLink = pageUrl+"?page="+page;

	if(vSortVal && vSortVal != ""){
		pageLink = pageLink + "&hdnSortVal=" + vSortVal
	}
	if(vDirection && vDirection != ""){
		pageLink = pageLink + "&hdnDirection=" + vDirection
	}
	if(FromDate && FromDate != "" && Todate && Todate != ""){
		pageLink = pageLink + "&dtFromDate="+FromDate+ "&dtToDate="+Todate;
	}
	if(cboType && cboType != ""){
		pageLink = pageLink + "&cboSelect="+cboType;
	}
	if(stext && stext != ""){
		pageLink = pageLink + "&txtSearch="+stext;
	}
	if(dept && dept != ""){
		pageLink = pageLink + "&cboDept="+dept;
	}
	location.href = pageLink;
 }

// textarea에 입력된 문자수를 체크 : fncCheckTextLen(this.id)
function fncCheckTextLen(pId, limitText) {   
    var totalText = 0;
    //var message = frm.note.value;
    var text = $("#"+pId).text();

    //제한 숫자가 지정되지 않았을 때 초기값 지정
    if(!limitText){
    	limitText = 2000;
    }

    for(var i =0; i < text.length; i++) {
    	var currentText = text.charCodeAt(i);
        totalText++;
    }	
    if(totalText > limitText) {
        alert( limitText+" 자까지 입력가능합니다.");
		$("#"+pId).text(text.substring(0,limitText));
    }
}

//이미지 미리보기(원본)
function fncPreview(fId, prvId, wsize, hsize){
	if (window.FileReader) {
		$("#"+prvId).empty();
		var oPreviewImg = null, oFReader = new window.FileReader(),
		rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

		oFReader.onload = function (oFREvent) {
			if (!oPreviewImg) {
				var newPreview = document.getElementById(prvId);
				oPreviewImg = new Image();
				//oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px";
				//oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px";
				newPreview.appendChild(oPreviewImg);
			}
			oPreviewImg.src = oFREvent.target.result;
			oPreviewImg.style.width = wsize+"px";
			oPreviewImg.style.height = hsize+"px";
		};

		return function () {
			var aFiles = document.getElementById(fId).files;
			if (aFiles.length === 0) { return; }
			if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; }
			oFReader.readAsDataURL(aFiles[0]);
		};	
	}else if (navigator.appName === "Microsoft Internet Explorer"){ //ie일 때 사용
		return function () {
			if(document.getElementById(fId).value != ""){
				document.getElementById(prvId).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById(fId).value;
			}
		};
	}
}
//이미지 src 추출 ex) onchage = "fncGetImgSrc(this.id, 'hdnImgUrl')"
function fncGetImgSrc(fId, srcId){
	if (window.FileReader) {
		var oFReader = new window.FileReader(),
		rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

		oFReader.onload = function (oFREvent) {
			$("#"+srcId).val(oFREvent.target.result);
		};

		return function () {
			var aFiles = document.getElementById(fId).files;
			if (aFiles.length === 0) { return; }
			if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; }
			oFReader.readAsDataURL(aFiles[0]);
		};	
	}else if (navigator.appName === "Microsoft Internet Explorer"){ //ie9 이하 사용
		return function () {
			$("#"+srcId).val(document.getElementById(fId).value);
		};
	}
}
//이미지 미리보기 팝업(팝업화면에서 호출하는 함수)
function fncPreviewPop(fId, prvId, wsize, hsize){
	if (window.FileReader) {
		$("#"+prvId).empty();

		var oPreviewImg = null;
		if (!oPreviewImg) {
			var newPreview = document.getElementById(prvId);
			oPreviewImg = new Image();
			newPreview.appendChild(oPreviewImg);
		}
		oPreviewImg.src = document.getElementById(fId).value;
		oPreviewImg.style.width = wsize+"px";
		oPreviewImg.style.height = hsize+"px";		
	}else if (navigator.appName === "Microsoft Internet Explorer"){ //ie9 이하 사용
		if(document.getElementById(fId).value != ""){
			document.getElementById(prvId).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById(fId).value;
		}
	}
}
//게시판 정렬
function fncSortVal(pSortVal)
{
	var vSortVal = $("#hdnSortVal").val();
	var vDirection = $("#hdnDirection").val();

	// 기존과 동일한 필드명으로 정렬시 정방향 역방향만 설정.
	if (pSortVal == vSortVal)
	{
		// 방향 설정
		if (vDirection == "DESC"){
			$("#hdnDirection").val("ASC");
		} else {
			$("#hdnDirection").val("DESC");
		}
	// 기존과 상이한 필드명으로 정렬시 정방향으로 설정.
	} else {
		// 정렬필드명 설정
		$("#hdnSortVal").val(pSortVal);
		// 방향 설정
		$("#hdnDirection").val("DESC");
	}
	// 조회
	document.frmSearch.submit();
}
//게시판 검색 
function fncBbsSearch(){
	var dept = $("#cboDept").val();
	var stext = $("#txtSearch").val();
	var pageUrl = $("#hdnPageUrl").val(); 
	var chk = "N";
	var op;

	if(stext != ""){
		op = fncUrlOper(chk);
		chk = "Y";
		pageUrl = pageUrl + op + "txtSearch=" + stext;
	}
	if(dept && dept != ""){
		op = fncUrlOper(chk);
		chk = "Y";
		pageUrl = pageUrl + op + "cboDept="+dept;
	}
	location.href = pageUrl;
}
//게시판 목록 ex) fncBbsList('news','1')
function fncBbsList(bbsType, page){
	var dept = $("#cboDept").val();
	var stext = $("#txtSearch").val();
	var pageUrl = bbsType + "_bbs_list.asp";
	var chk = "N";
	var op;

	if(page && page != ""){	
		op = fncUrlOper(chk);
		chk = "Y";
		pageUrl = pageUrl + op + "page="+page;
	}
	if(stext && stext != ""){
		op = fncUrlOper(chk);
		chk = "Y";
		pageUrl = pageUrl + op + "txtSearch="+stext;
	}
	if(dept && dept != ""){
		op = fncUrlOper(chk);
		chk = "Y";
		pageUrl = pageUrl + op + "cboDept="+dept;
	}

	location.href = pageUrl;
}
// URL 기호 구별
function fncUrlOper(chk){
	var op;
	if(chk == "N"){
		op = "?";
	}else{
		op = "&";
	}
	return op
}
//게시판 상세 ex) fncAdmBbsDetail('news','1','1')
function fncBbsDetail(bbsType, bbsKey, page){
	var dept = $("#cboDept").val();
	var stext = $("#txtSearch").val();
	var pageUrl = bbsType + "_bbs_detail.asp?bbsKey=" + bbsKey;

	if(page && page != ""){
		pageUrl = pageUrl + "&page="+page;
	}
	if(stext && stext != ""){
		pageUrl = pageUrl + "&txtSearch="+stext;
	}
	if(dept && dept != ""){
		pageUrl = pageUrl + "&cboDept="+dept;
	}

	location.href = pageUrl;
}
//게시판 수정 ex) fncAdmBbsModify('news','1','1')
function fncBbsModify(bbsType, bbsKey, page){	
	var dept = $("#cboDept").val();
	var stext = $("#txtSearch").val();
	var pageUrl = bbsType + "_bbs_modify.asp?bbsKey=" + bbsKey;

	if(page && page != ""){
		pageUrl = pageUrl + "&page="+page;
	}
	if(stext && stext != ""){
		pageUrl = pageUrl + "&txtSearch="+stext;
	}
	if(dept && dept != ""){
		pageUrl = pageUrl + "&cboDept="+dept;
	}

	location.href = pageUrl;
}
//게시판 게시승인/취소
function fncBbsApproval(flag){
	$("#hdnMode").val("A");
	$("#hdnApprovalYN").val(flag);
	document.frmBoard.submit();
}

//게시판 삭제 ex) fncAdmBbsDelete()
function fncBbsDelete(bbsKey){
	if(confirm("삭제하시겠습니까?")){
		if(bbsKey && bbsKey != ""){
			$("#hdnBbsKey").val(bbsKey);
		}
		$("#hdnMode").val("D");
		document.frmBoard.submit();
	}
}
//사용자 게시판 답변 
function fncUserBbsAnswer(bbsType, bbsKey, page){
	var pageUrl = bbsType + "_bbs_answer.asp?bbsKey=" + bbsKey + "&page="+page;

	location.href = pageUrl;
}
//관리자 게시판 입력/수정 ex) fncAdmSave() // F : 프레임형, L : 리스트형, P : 고객감동메뉴
function fncAdmBbsSave(){
	var mode = $("#hdnMode").val();
	var bbsType = $("#hdnBbsType").val(); 
	if(bbsType == "F"){
		//제목
		$("#txtTitle").val($("#txtTitle").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtTitle").val() == ""){
			alert("제목을 입력해 주세요.");
			$("#txtTitle").focus();
			return;
		}		
		//썸네일 이미지
		var wrt_cls = $("input[name=rdoWrtCls]:checked").val();
		if(wrt_cls == 2){
			if(mode == "I"){
				$("#fileThmb").val($("#fileThmb").val().replace(/^\s*/, "").replace(/\s*$/, ""));		
				if($("#fileThmb").val() == ""){
					alert("썸네일 이미지를 선택해주세요.");
					$("#fileThmb").focus();
					return;
				}
			}
			$("#txtThmbDesc").val($("#txtThmbDesc").val().replace(/^\s*/, "").replace(/\s*$/, ""));
			if($("#txtThmbDesc").val() == ""){
				alert("썸네일 설명을 선택해주세요.");
				$("#txtThmbDesc").focus();
				return;
			}
		}
		//요약문
		$("#txtSmrCnte").val($("#txtSmrCnte").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtSmrCnte").val() == ""){
			alert("요약내용을 입력해 주세요.")
			$("#txtSmrCnte").focus();
			return;
		}
		//웹에디터 본문
		var txtContents = CKEDITOR.instances.txtContents.getData();
		if(txtContents == ""){
			alert("내용을 입력해 주세요.");
			CKEDITOR.instances.txtContents.focus();
			return;
		}
	}else if(bbsType == "P"){
		//제목
		$("#txtTitle").val($("#txtTitle").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtTitle").val() == ""){
			alert("소속을 입력해 주세요.");
			$("#txtTitle").focus();
			return;
		}
		//요약문
		$("#txtSmrCnte").val($("#txtSmrCnte").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtSmrCnte").val() == ""){
			alert("이름/직책을 입력해 주세요.")
			$("#txtSmrCnte").focus();
			return;
		}
		//썸네일 이미지
		if(mode == "I"){
			$("#fileThmb").val($("#fileThmb").val().replace(/^\s*/, "").replace(/\s*$/, ""));		
			if($("#fileThmb").val() == ""){
				alert("썸네일 이미지를 선택해주세요.");
				$("#fileThmb").focus();
				return;
			}
		}
		$("#txtThmbDesc").val($("#txtThmbDesc").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtThmbDesc").val() == ""){
			alert("썸네일 설명을 선택해주세요.");
			$("#txtThmbDesc").focus();
			return;
		}
		//내용 이미지
		if(mode == "I"){
			$("#fileImg").val($("#fileImg").val().replace(/^\s*/, "").replace(/\s*$/, ""));		
			if($("#fileImg").val() == ""){
				alert("내용 이미지를 선택해주세요.");
				$("#fileThmb").focus();
				return;
			}
		}
		$("#txtImgDesc").val($("#txtImgDesc").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtImgDesc").val() == ""){
			alert("내용 이미지 설명을 선택해주세요.");
			$("#txtImgDesc").focus();
			return;
		}		
	}else if(bbsType == "L"){
		//제목
		$("#txtTitle").val($("#txtTitle").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtTitle").val() == ""){
			alert("제목을 입력해 주세요.");
			$("#txtTitle").focus();
			return;
		}		
		//웹에디터 본문
		var txtContents = CKEDITOR.instances.txtContents.getData();
		if(txtContents == ""){
			alert("내용을 입력해 주세요.");
			CKEDITOR.instances.txtContents.focus();
			return;
		}
	}
	document.frmBoard.submit();
}
function fncUserBbsSave(){
	var mode = $("#hdnMode").val();
	var bbsType = $("#hdnBbsType").val(); 
	var bbsDvs = $("#hdnTblDvs").val();

	if(bbsType != "R"){
		//제목
		$("#txtTitle").val($("#txtTitle").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtTitle").val() == ""){
			alert("제목을 입력해 주세요.");
			$("#txtTitle").focus();
			return;
		}		
		//내용
		$("#txtContents").val($("#txtContents").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtContents").val() == ""){
			alert("내용을 입력해 주세요.");
			$("#txtContents").focus();
			return;
		}
	}

	//건강상담은 관리자가 입력/수정시 답변은 수정하지 않을 수 있음(답변부서만 수정 가능)
	if(bbsType != "N" && (bbsDvs != "U02" || bbsType != "T")){
		//답변
		$("#txtReContents").val($("#txtReContents").val().replace(/^\s*/, "").replace(/\s*$/, ""));
		if($("#txtReContents").val() == ""){
			alert("답변을 입력해 주세요.");
			$("#txtReContents").focus();
			return;
		}
	}

	//건강상담은 답변부서 선택
	var dept = $("#cboDept").val();
	if(!dept){
		if($("#cboDept").val() == ""){
			alert("답변부서를 선택해 주세요.");
			$("#cboDept").focus();
			return;
		}
	}

	//고객의 소리는 접수방법 선택
	var cnsl = $("#cboCnslMth").val();
	if(!cnsl){
		if($("#cboCnslMth").val() == ""){
			alert("접수방법를 선택해 주세요.");
			$("#cboCnslMth").focus();
			return;
		}
	}
	document.frmBoard.submit();
}

//프레임형 리스트 미리보기 팝업
function fncFrPreViewList(){
	var wrtCls = $("input[name=rdoWrtCls]:checked").val();

	var vheight = wrtCls == 1 ? 180 : 400 ;

	//window.open("/cmng/cms/fr_preview_pop.asp?wrtCls="+wrt_cls,"fr_preview_pop","width=400,height="+vheight);*/
	$("#txtTitle").val($("#txtTitle").val().replace(/^\s*/, "").replace(/\s*$/, ""));
	$("#txtSmrCnte").val($("#txtSmrCnte").val().replace(/^\s*/, "").replace(/\s*$/, ""));

	var prevPop = window.open("","fr_pview","width=357,height="+vheight+",toolbar=0,menubar=0,location=0,status=0");
	pviewPop.target = "fr_pview";
	pviewPop.hdnFrType.value = wrtCls;
	pviewPop.hdnFrTitle.value = $("#txtTitle").val();
	pviewPop.hdnFrCont.value = $("#txtSmrCnte").val();
	pviewPop.submit();
}

function fncCmsPreView(type) {
	$("#hdnprvwType").val(type);

	var cmsType = $("#hdnprvwType").val();

	if(cmsType == "main") {
		window.open("cms_preview.asp","cms_preview","width=963,height=400,toolbar=0,menubar=0,location=0,status=0");
	}
	else if (cmsType == "sub" )		{
		window.open("cms_preview.asp","cms_preview","width=725,height=660,toolbar=0,menubar=0,location=0,status=0");
	}
}
/* Enter Click 시 event 실행 */
function fncKeyEnter(fnc){
	if( event.keyCode == 13){
		eval(fnc);
	}
}

/* 파일 업로드 input창 추가 */
function fncFileAdd(e) { 
	if(e) {   
		if(e.children.length >= 10){
			alert("첨부파일은 최대 10개까지 첨부가능합니다.");
			return;
		}else if(e.children.length > 0){
			$(e).css("margin","5px 0");
			$(e).each(function(){
				$(this).find(".bbs_file_txt").css("margin-bottom","3px");
			});
		}
		var oFile = document.createElement('input');
		oFile.name = 'fileObj';
		oFile.type='file'
		oFile.className='input_txt bbs_file_txt'; 
		e.appendChild(oFile);
	}
}
/* 파일 업로드 input창 제거 */
function fncFileDel(e) {
	if(e.children.length > 1){
		e.removeChild(e.children[e.children.length - 1]); 
	}else{
		$(e).css("margin","0");
		$(e).find(".bbs_file_txt").eq(0).css("margin-bottom","0");
		alert("최소한 하나의 첨부파일은 존재해야 합니다.");
		return;
	}
}
/* 파일 열기/다운로드 */
function fncFileOpen(bbsDvs,bbsKey,fileSeq) {
	var url = "/comm/com_file_down.asp?bbsDvs="+bbsDvs+"&bbsKey="+bbsKey+"&fileSeq="+fileSeq;
	window.open( url, "Download", "width=1,height=1,scrollbars=yes,resizable=yes,status=yes" );	
}
/* 파일삭제 */
function fncFileDelete(fileSeq) {
	if (confirm("삭제하시겠습니까?") == true)
	{
		var frm = document.frmBoard;
		// 삭제할 파일순번 위치 저장.
		frm.hdnFileSeq.value	= fileSeq;

		frm.action = "/comm/com_file_delete.asp";
		frm.target = "frame_biz";
		frm.submit();

		frm.action = "mng_bbs_biz.asp";
		frm.target = "";
	}
}