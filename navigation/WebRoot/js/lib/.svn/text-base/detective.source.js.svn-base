$.detective = {
	DEF:[{name:'taobao',link:'taobao.com'}],
	de: function(array){
		var list = array||$.detective.DEF,t='';
		$.each(list,function(i,n){t+= "<a name='one' href='http://www."+n.link+"'>"+n.name+"</a>";});
		$("#urlContent").append('<div style="display:none;" id="de">'+t+'</div>');
		$.detective.test(list);
	},
	test : function(array){
		var result = [];
		$("a[name='one']").each(function(i,n){if($.detective.getStyle(document.getElementsByName("one")[i],"padding-left")=='1px') result.push($(n).text());});
		$("#urlContent").append("<p>检测网站 "+list.length+"个，您经常访问的有 "+result.length+"个：<p>"+result.join('，')+"</p></p>").find("#de").remove();
	},
	getStyle:function(elem, property){
		if (property=='class') property='className';
		else property=$.detective.camelize(property);
		if (elem.currentStyle)
		return elem.currentStyle[property];
		if(elem.style[property])
		return elem.style[property];
		if (document.defaultView.getComputedStyle)
		var currentStyle = document.defaultView.getComputedStyle(elem, null);
		else if (window.getComputedStyle)
		var currentStyle = window.getComputedStyle(elem, null);
		return currentStyle[property] || currentStyle.getPropertyValue($.detective.uncamelize(property));
	},
	camelize:function(s) {
	    return s.replace(/-(\w)/g, function (strMatch, p1){
	        return p1.toUpperCase();
	    });
	},
	uncamelize:function(s, sep) {
	    sep = sep || '-';
	    return s.replace(/([a-z])([A-Z])/g, function (strMatch, p1, p2){
	        return p1 + sep + p2.toLowerCase();
	    });
	}
};
