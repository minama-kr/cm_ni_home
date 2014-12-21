$(document).ready(function(){
	fncMenuEventBinding();
	fncPlaceHolderHanddler();
});

function fncMenuEventBinding(){
	var $nav = $("#nav");
	$("#nav > li").mouseenter(function(){
		$("#nav > li").removeClass("on");
		$(this).addClass("on");
	});
	$("#main, #content").mouseenter(function(){
		$("#nav > li").removeClass("on");
	});
}

function fncPlaceHolderInit(pSelector){
	$(pSelector + " .placeholder").each(function(){
		var strPlaceHolder = $(this).attr("placeholder");
		var strValue = $(this).val();
		if(strValue == strPlaceHolder){
			$(this).val("");
		}
	});
}

function fncPlaceHolderHanddler(){
	var i = document.createElement("input");
	if(!("placeholder" in i)){
		$(".placeholder").each(function(){
			var strPlaceHolder = $(this).attr("placeholder");
			if($(this).val() == ""){
				$(this).val(strPlaceHolder);	
			}
			$(this).focus(function(){
				if(strPlaceHolder == $(this).val()){
					$(this).val("");	
				}
			}).blur(function(){
				var value = $(this).val();
				if(value == ""){
					$(this).val(strPlaceHolder);	
				}
			});
		});
	}
}


function fncLayerPopControl(pDivId, isOpen){
	$layer = $("#"+pDivId);
	if(isOpen){
		$(document).scrollTop(0);
		$layer.css("display", "block");
		$("body").bind("wheel.body mousewheel.body", function(){
			fncLayerPopSizeSet(pDivId);
		});
	}else{
		$layer.css("display", "none");
		$("body").unbind("wheel.body mousewheel.body");
	}
	$(window).resize(function() {
		fncLayerPopSizeSet(pDivId);
	});
}

function fncLayerPopSizeSet(pDivId){
	$layer = $("#"+pDivId);
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width()-1;	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$layer.css({'width':maskWidth,'height':maskHeight});  		
}


/* 사이트맵(전체메뉴) */
// 브라우저 해상도 정보
function fncBrowserInfo() {
	var vWidth, vHeight;
	if (typeof (window.innerWidth) == 'number') {
		vWidth = window.innerWidth;
		vHeight = window.innerHeight;
	} else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
		vWidth = document.documentElement.clientWidth;
		vHeight = document.documentElement.clientHeight;
	} else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
		vWidth = document.body.clientWidth;
		vHeight = document.body.clientHeight;
	}

	var vInfo = {
		width: vWidth,
		height: vHeight
	}
	return vInfo;
}


function Request(id, defualtValue) {
    ///	<summary>
    ///          작성자 : 이민주
    ///     &#10;작성일 : 2014.08.05
    ///     &#10;설  명 : javascript request Func
    ///	</summary>
    ///	<param name="id" type="String">
    ///     1: 리퀘스트 id 입력.
    ///	</param>
    ///	<param name="defualtValue" type="String">
    ///     2: 주소값에 id 값이 없을 때 return Value
    ///	</param>
    ///	<returns type="String" />
    var rtnval;
    var nowAddress = unescape(location.href);
    var parameters = new Array();
    parameters = (nowAddress.slice(nowAddress.indexOf("?") + 1, nowAddress.length)).split("&");
    for (var i = 0; i < parameters.length; i++) {
        if (parameters[i].indexOf(id) != -1) {
            rtnval = parameters[i].split("=")[1];
            if (rtnval == undefined || rtnval == null) {
                rtnval = "";
            }
            return rtnval;
        }
    }
    return defualtValue;
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

// Bytes Check Logic ( maxlength를 1Byte로 잡고 데이터 유효성을 검사한다. )
function fncByteCheck(pInputId){
	var $input = $("#" + pInputId);
	var strTemp = $input.val();
	var nMaxLength = isNaN($input.attr("maxlength")) ? 0 : Number($input.attr("maxlength"));

	if(nMaxLength < fncGetByte(strTemp)){
		alert(nMaxLength + "Bytes 를 초과할 수 없습니다.");
		return false;
	}else{
		return true;
	}
}
// String Value => int Bytes Cnt
function fncGetByte(str){
	var resultSize = 0;
	if(str == null){
		return 0;
	}
	for(var i = 0 ; i < str.length; i ++){
		var c = escape(str.charAt(i));
		if(c.length == 1){ // 기본 아스키코드
			resultSize++;
		}else if(c.indexOf("%u") != -1){ // 한글 혹은 기타
			resultSize += 2;
		}else{
			resultSize ++;
		}
	}
	return resultSize;
}

/* 파일 업로드 input창 추가 */
function fncFileAdd(e) { 
	if(e) {   
		if(e.children.length >= 10){
			alert("첨부파일은 최대 10개까지 첨부가능합니다.");
			return;
		}else if(e.children.length > 0){
			//$(e).css("margin","5px 0");
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