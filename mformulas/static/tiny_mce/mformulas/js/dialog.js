tinyMCEPopup.requireLangPack();

function getXmlHttp(){
	var xmlhttp;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function get_options(el) {
	var req = getXmlHttp();
	req.onreadystatechange = function() {  
		if (req.readyState == 4) { 
			if(req.status == 200) el.innerHTML = req.responseText; else el.innerHTML = 'Error';
		}
	}
	req.open('GET', '/mformulas/select/', true);  
	req.send(null);
}

var MFormulasDialog = {
	init : function() {
		get_options(document.getElementById("mformulas_id"));
	},

	insert : function() {
		var el_id = document.forms[0].mformulas_select.value;
		var el_type = document.forms[0].mformulas_type_link.value;
		var el_str = '{{mformulas:'+el_id+'}}';
		if (el_type*1 == 0){
			el_str = '<a id="mformulas_link_'+el_id+'" href="/formula/click/'+el_id+'/">'+el_str+'</a>';
		}
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, el_str);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(MFormulasDialog.init, MFormulasDialog);
