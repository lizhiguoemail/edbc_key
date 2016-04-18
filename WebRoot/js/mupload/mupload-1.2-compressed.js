
function MUpload() {
}
MUpload.version = "1.2";
MUpload.prototype = {_isIE:(/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent)), options:{name:"MUpload\u93c2\u56e6\u6b22\u6d93\u5a41\u7d36\u93ba\u0442\u6b22", limitTypes:false, limitSize:-1, uploadType:"http-form", appWidth:480, appHeight:220, jarPath:".", onComplete:null, onFailed:null, onSelect:null, httpURL:null, layout:"table"}, _ui_layouts:{"simple":{width:400, height:150, entry:"cc.mzone.mupload.ui.simple.MUploadClient.class"}, "table":{width:480, height:220, entry:"cc.mzone.mupload.ui.table.MUploadClient.class"}}, _jarName:"mupload-{0}.jar", _appDomId:"_cc_mzone_mupload_", run:function (options) {
	if (options) {
		this._setOptions(options);
	}
	this._appDomId += Math.random();
	this._setObjectHtml();
}, status:function () {
	var stat = document.getElementById(this._appDomId + (this._isIE ? "_ie" : "_nf")).getStatus();
	return eval("(" + stat + ")");
}, _setOptions:function (options) {
	for (var prop in this.options) {
		if (options[prop]) {
			this.options[prop] = options[prop];
		}
	}
}, _setObjectHtml:function () {
	var param = this._getParameter();
	var layout = this._ui_layouts["table"];
	if (this._ui_layouts[this.options.layout]) {
		layout = this._ui_layouts[this.options.layout];
	}
	var jarName = this._jarName.replace("{0}", MUpload.version);
	var html = "<OBJECT CLASSID=\"clsid:8AD9C840-044E-11D1-B3E9-00805F499D93\" " + "CODEBASE=\"http://java.sun.com/update/1.5.0/jinstall-1_5-windows-i586.cab#Version=5,0,0,3\" " + "WIDTH=\"" + layout.width + "\" HEIGHT=\"" + layout.height + "\" NAME=\"" + this._appDomId + "_ie\" ID=\"" + this._appDomId + "_ie\">" + "<PARAM NAME=\"CODEBASE\" VALUE=\"" + this.options.jarPath + "\">" + "<PARAM NAME=\"ARCHIVE\" VALUE=\"" + jarName + "\">" + "<PARAM NAME=\"CODE\" VALUE=\"" + layout.entry + "\">" + "<PARAM NAME=\"NAME\" VALUE=\"" + this.options.name + "\">" + "<PARAM NAME=\"TYPE\" VALUE=\"application/x-java-applet;version=1.5\">" + "<PARAM NAME=\"SCRIPTABLE\" VALUE=\"true\">" + param.ie + "<EMBED TYPE=\"application/x-java-applet;version=1.5\" ID=\"" + this._appDomId + "_nf\" " + "CODE=\"" + layout.entry + "\" JAVA_CODEBASE=\"" + this.options.jarPath + "\" " + "ARCHIVE=\"" + jarName + "\" NAME=\"" + this.options.name + "\" " + "WIDTH=\"" + layout.width + "\" HEIGHT=\"" + layout.height + "\" " + param.nf + "MAYSCRIPT=\"true\" pluginspage=\"http://java.sun.com/products/plugin/index.html#download\">" + "<NOEMBED></NOEMBED></EMBED></OBJECT>";
	document.write(html);
}, _getParameter:function () {
	var object_str = "", embed_str = "";
	if (typeof (this.options.limitTypes) == "object") {
		var propStr = "";
		for (var prop in this.options.limitTypes) {
			propStr += prop + "=" + this.options.limitTypes[prop] + "&";
		}
		object_str += "<PARAM NAME=\"limitTypes\" VALUE=\"" + propStr + "\">";
		embed_str += " limitTypes=\"" + propStr + "\" ";
	}
	if (!isNaN(this.options.limitSize) && this.options.limitSize > 0) {
		object_str += "<PARAM NAME=\"limitSize\" VALUE=\"" + this.options.limitSize + "\">";
		embed_str += " limitSize=\"" + this.options.limitSize + "\" ";
	}
	if (this.options.onComplete && typeof (this.options.onComplete) == "string") {
		object_str += "<PARAM NAME=\"onComplete\" VALUE=\"" + this.options.onComplete + "\">";
		embed_str += " onComplete=\"" + this.options.onComplete + "\" ";
	}
	if (this.options.onFailed && typeof (this.options.onFailed) == "string") {
		object_str += "<PARAM NAME=\"onFailed\" VALUE=\"" + this.options.onFailed + "\">";
		embed_str += " onFailed=\"" + this.options.onFailed + "\" ";
	}
	if (this.options.onSelect && typeof (this.options.onSelect) == "string") {
		object_str += "<PARAM NAME=\"onSelect\" VALUE=\"" + this.options.onSelect + "\">";
		embed_str += " onSelect=\"" + this.options.onSelect + "\" ";
	}
	if (this.options.uploadType == "http-form") {
		object_str += "<PARAM NAME=\"httpURL\" VALUE=\"" + this.options.httpURL + "\">";
		embed_str += " httpURL=\"" + this.options.httpURL + "\" ";
	}
	object_str += "<PARAM NAME=\"uploadType\" VALUE=\"" + this.options.uploadType + "\">";
	embed_str += " uploadType=\"" + this.options.uploadType + "\" ";
	return {"ie":object_str, "nf":embed_str};
}};

