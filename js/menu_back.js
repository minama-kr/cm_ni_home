function fncMenuSetting(dvs_cd){
	// 메뉴 스크립트 - json 파일을 불러와 메뉴 태그 직접 생성
	$.getJSON("/js/menu.json", function(json){
		json.sort(function(a, b){	return a.seq - b.seq; });
		var strTag = "";
		$(json).each(function(){
			strTag += "<li><a href='" + this.url + "'>" + this.menu_nm + "</a>"
			if(dvs_cd == "main"){
				strTag += fncSubMenuSetting(this, dvs_cd);
			}
			strTag += "</li>";
			strTag += "</ul>";
		});
		//$("#nav").append(strTag);
		$("#nav > li").eq(0).addClass("on selected");

		fncMenuEventBinding();
	});
}

function fncSubMenuSetting(this_obj, dvs_cd){
	var strTag = "";
	if(dvs_cd == "main"){
		var strImgTemp = "";
		strTag += "<ul class='sub_menu'>";
		if(this_obj.sup_menu.length > 0){
			this_obj.sup_menu.sort(function(a,b){ return a.seq - b.seq; });
			$(this_obj.sup_menu).each(function(){
				strTag += "<li><a href='" + this.url + "'>" + this.menu_nm + "</a></li>";
			});
		}
		strTag += "<li>";
		strImgTemp = "<img src='/images/main/" + this_obj.img_url+ "' alt='" + this_obj.img_alt + "' />";
		if(this_obj.img_link != ""){
			strTag += "<a href='" + this_obj.img_link + "'>";
			strTag += strImgTemp;
			strTag += "</a>";
		}else{
			strTag += strImgTemp;
		}
	}
	return strTag;
}