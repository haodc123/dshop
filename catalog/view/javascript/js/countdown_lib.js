var DataType = {
	text: 1,
	number: 2,
	date: 3,
	combo: 4,
	bool: 5,
	richText: 6,
	mutiLine: 7,
	password: 8,
	email: 9,
	arrayInt: 10,
	table: 11,
	tripleBox: 12,
	radio: 13,
	file: 14
};

var ErrorCode = {
	noLogin: "NoLogin",
	noPermission: "NoPermission",
	verification: "Verification",
	data: "Data",
	noData: "NoData",
	noError: "NoError",
	itemExist: "ItemExist",
	itemMore: "ItemMore"
};

String.prototype.addslashes = function () {
	return this.replace(/(["\\\.\|\[\]\^\*\+\?\$\(\)])/g, '\\$1');
};

String.prototype.isEmail = function () {
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(this)) return true;
	else return false;
}


String.prototype.trim = function () {
	return this.replace(/^\s*/, "").replace(/\s*$/, "");
};

String.prototype.removeDuplicates = function (sep) {
	var result = this;
	var arr = result.split(sep);

	for (var i = 0; i < arr.length; i++) {
		var item = arr[i];
		var start = result.indexOf(item, 0) + item.length;
		var start1 = result.indexOf(item, start);
		if (start1 != -1) {
			result = result.substring(0, start1) + result.substring(start1 + item.length + 1, result.length);
		}
	}
	return result;
};

Date.stringFormat =
{
	dateTime: "xs:dateTime",
	date: "xs:date",
	time: "xs:time",
	gYearMonth: "xs:gYearMonth",
	gYear: "xs:gYear",
	gMonthDay: "xs:gMonthDay",
	gMonth: "xs:gMonth",
	gDay: "xs:gDay"
};

Date.prototype.toVNString = function (strFormat) {
	var a_pm = "AM";
	var hours = this.getHours();
	if (hours > 12) {
		hours = hours - 12;
		a_pm = "PM";
	}
	var minutes = this.getMinutes();
	var seconds = this.getSeconds();
	var day = this.getDate();
	var month = this.getMonth() + 1;
	var fullYear = this.getFullYear();
	var re = "";
	switch (strFormat) {
		case Date.stringFormat.date:
			re += day + "/" + month + "/" + fullYear;
			break;
		case Date.stringFormat.time:
			re += hours + ":" + minutes + ":" + seconds + " " + a_pm;
			break;
		case Date.stringFormat.gYearMonth:
			re += month + "/" + fullYear;
			break;
		case Date.stringFormat.gYear:
			re += fullYear;
			break;
		case Date.stringFormat.gMonthDay:
			re += day + "/" + month;
			break;
		case Date.stringFormat.gMonth:
			re += month;
			break;
		case Date.stringFormat.gDay:
			re += day;
			break;
		default:
			re += day + "/" + month + "/" + fullYear + " " + hours + ":" + minutes + ":" + seconds + " " + a_pm;
			break;
	}
	return re;
};

Date.prototype.subtract = function (d) {
	return (this - d) / (1000 * 60 * 60 * 24);
};

Date.maxDateInMonth = function (month, year) {
	var d = 0;
	switch (month) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			d = 31;
			break;
		case 4: case 6: case 9: case 11:
			d = 30;
			break;
		case 2:
			if (((year % 400) == 0) || (((year % 4) == 0) && ((year % 100) != 0)))
				d = 29;
			else
				d = 28;
			break;
	}
	return d;
};

Date.check = function (day, month, year) {
	if (isNaN(day) || isNaN(month) || isNaN(year)) return false;
	if (day <= 0 || month <= 0 || year <= 1753 || year >= 9999) return false;
	else {
		var dayspermonth = Date.maxDateInMonth(month, year);
		if (day <= dayspermonth) {
			return true;
		}
		else {
			return false;
		}
	}
};
Date.checkStringVN = function (dateString) {
	var arrDate = dateString.split("/");
	if (arrDate.length < 3) return false;
	return Date.check(parseInt(arrDate[0], 10), parseInt(arrDate[1], 10), parseInt(arrDate[2], 10));
};

Date.parseDateVN = function (strDateVN) {
	var arrDate = strDateVN.split("/");
	if (arrDate.length <= 1) {
		arrDate = strDateVN.split("-");
	}
	return new Date(parseInt(arrDate[2], 10), parseInt(arrDate[1], 10) - 1, parseInt(arrDate[0], 10));
};

Date.parseDate = function (strDate, strFormat) {
	if (strDate instanceof Date) {
		return strDate;
	}
	if(strDate instanceof Number) {
		return new Date(strDate);  
	}
	strDate = strDate.split(".")[0];
	var oDate = new Date(-62135596800000); // Mon Jan 1 00:00:00 UTC 1
	var parts;
	try {
		switch (strFormat) {
			case Date.stringFormat.dateTime: //(CCYY-MM-DDThh:mm:ss) - 2009-10-05T16:38:15.3600000+07:00
				var re = new RegExp("^([0-9]{4})-([0-9]{2})-([0-9]{2})(T([0-9]{2})(:([0-9]{2})(:([0-9]{2}))?)?)?(Z)?([\+\-][0-9]{2}:[0-9]{2})?$");
				if (parts = re.exec(strDate)) {
					if (parts[10] == "Z") {
						oDate.setFullYear(parts[1], parts[2] - 1, parts[3]);
						oDate.setHours(parts[5], parts[7], parts[9]);
						oDate.setMinutes(oDate.getMinutes() - oDate.getTimezoneOffset());
						return oDate;
					} else {
						oDate.setFullYear(parts[1], parts[2] - 1, parts[3]);
						oDate.setHours(parts[5], parts[7], parts[9]);
						return oDate;
					}
				}
				break;
			case Date.stringFormat.date: //(CCYY-MM-DD) 
				var re = new RegExp("^([0-9]{4})-([0-9]{2})-([0-9]{2})$");
				if (parts = re.exec(strDate)) {
					oDate.setFullYear(parts[1], parts[2] - 1, parts[3]);
					return oDate;
				}
				break;
			case Date.stringFormat.time: //(hh:mm:ss)
				var re = new RegExp("^([0-9]{2})(:([0-9]{2})(:([0-9]{2}))?)?(Z)?$");
				if (parts = re.exec(strDate)) {
					if (parts[9] == "Z") {
						oDate.setHours(parts[1], parts[3], parts[5]);
						oDate.setMinutes(oDate.getMinutes() - oDate.getTimezoneOffset());
						return oDate;
					} else {
						oDate.setHours(parts[1], parts[3], parts[5]);
						return oDate;
					}
				}
				break;
			case Date.stringFormat.gYearMonth: //(CCYY-MM)
				var re = new RegExp("^([0-9]{4})-([0-9]{2})$");
				if (parts = re.exec(strDate)) {
					oDate.setFullYear(parts[1], parts[2] - 1);
					return oDate;
				}
				break;
			case Date.stringFormat.gYear: //(CCYY)
				var re = new RegExp("^([0-9]{4})$");
				if (parts = re.exec(strDate)) {
					oDate.setFullYear(parts[1]);
					return oDate;
				}
				break;
			case Date.stringFormat.gMonthDay: //(^--MM-DD)
				var re = new RegExp("--([0-9]{2})-([0-9]{2})");
				if (parts = re.exec(strDate)) {
					oDate.setMonth(parts[1] - 1, parts[2]);
					return oDate;
				}
				break;
			case Date.stringFormat.gMonth: //(--MM--)
				var re = new RegExp("^--([0-9]{2})--$");
				if (parts = re.exec(strDate)) {
					oDate.setMonth(parts[1] - 1);
					return oDate;
				}
				break;
			case Date.stringFormat.gDay: //(---DD)
				var re = new RegExp("^---([0-9]{2})$");
				if (parts = re.exec(strDate)) {
					oDate.setDate(parts[1]);
					return oDate;
				}
				break;
		}
	}
	catch (e) {
		return null;
	}
};

// Remove IE mouse flickering.
try {
	document.execCommand("BackgroundImageCache", false, true);
}
catch (e) {
	// We have been reported about loading problems caused by the above
	// line. For safety, let's just ignore errors.
}

var Encoder = {

	// When encoding do we convert characters into html or numerical entities
	EncodeType: "entity",  // entity OR numerical

	isEmpty: function (val) {
		if (val) {
			return ((val === null) || val.length == 0 || /^\s+$/.test(val));
		} else {
			return true;
		}
	},
	// Convert HTML entities into numerical entities
	HTML2Numerical: function (s) {
		var arr1 = new Array('&nbsp;', '&iexcl;', '&cent;', '&pound;', '&curren;', '&yen;', '&brvbar;', '&sect;', '&uml;', '&copy;', '&ordf;', '&laquo;', '&not;', '&shy;', '&reg;', '&macr;', '&deg;', '&plusmn;', '&sup2;', '&sup3;', '&acute;', '&micro;', '&para;', '&middot;', '&cedil;', '&sup1;', '&ordm;', '&raquo;', '&frac14;', '&frac12;', '&frac34;', '&iquest;', '&agrave;', '&aacute;', '&acirc;', '&atilde;', '&Auml;', '&aring;', '&aelig;', '&ccedil;', '&egrave;', '&eacute;', '&ecirc;', '&euml;', '&igrave;', '&iacute;', '&icirc;', '&iuml;', '&eth;', '&ntilde;', '&ograve;', '&oacute;', '&ocirc;', '&otilde;', '&Ouml;', '&times;', '&oslash;', '&ugrave;', '&uacute;', '&ucirc;', '&Uuml;', '&yacute;', '&thorn;', '&szlig;', '&agrave;', '&aacute;', '&acirc;', '&atilde;', '&auml;', '&aring;', '&aelig;', '&ccedil;', '&egrave;', '&eacute;', '&ecirc;', '&euml;', '&igrave;', '&iacute;', '&icirc;', '&iuml;', '&eth;', '&ntilde;', '&ograve;', '&oacute;', '&ocirc;', '&otilde;', '&ouml;', '&divide;', '&oslash;', '&ugrave;', '&uacute;', '&ucirc;', '&uuml;', '&yacute;', '&thorn;', '&yuml;', '&quot;', '&amp;', '&lt;', '&gt;', '&oelig;', '&oelig;', '&scaron;', '&scaron;', '&yuml;', '&circ;', '&tilde;', '&ensp;', '&emsp;', '&thinsp;', '&zwnj;', '&zwj;', '&lrm;', '&rlm;', '&ndash;', '&mdash;', '&lsquo;', '&rsquo;', '&sbquo;', '&ldquo;', '&rdquo;', '&bdquo;', '&dagger;', '&dagger;', '&permil;', '&lsaquo;', '&rsaquo;', '&euro;', '&fnof;', '&alpha;', '&beta;', '&gamma;', '&delta;', '&epsilon;', '&zeta;', '&eta;', '&theta;', '&iota;', '&kappa;', '&lambda;', '&mu;', '&nu;', '&xi;', '&omicron;', '&pi;', '&rho;', '&sigma;', '&tau;', '&upsilon;', '&phi;', '&chi;', '&psi;', '&omega;', '&alpha;', '&beta;', '&gamma;', '&delta;', '&epsilon;', '&zeta;', '&eta;', '&theta;', '&iota;', '&kappa;', '&lambda;', '&mu;', '&nu;', '&xi;', '&omicron;', '&pi;', '&rho;', '&sigmaf;', '&sigma;', '&tau;', '&upsilon;', '&phi;', '&chi;', '&psi;', '&omega;', '&thetasym;', '&upsih;', '&piv;', '&bull;', '&hellip;', '&prime;', '&prime;', '&oline;', '&frasl;', '&weierp;', '&image;', '&real;', '&trade;', '&alefsym;', '&larr;', '&uarr;', '&rarr;', '&darr;', '&harr;', '&crarr;', '&larr;', '&uarr;', '&rarr;', '&darr;', '&harr;', '&forall;', '&part;', '&exist;', '&empty;', '&nabla;', '&isin;', '&notin;', '&ni;', '&prod;', '&sum;', '&minus;', '&lowast;', '&radic;', '&prop;', '&infin;', '&ang;', '&and;', '&or;', '&cap;', '&cup;', '&int;', '&there4;', '&sim;', '&cong;', '&asymp;', '&ne;', '&equiv;', '&le;', '&ge;', '&sub;', '&sup;', '&nsub;', '&sube;', '&supe;', '&oplus;', '&otimes;', '&perp;', '&sdot;', '&lceil;', '&rceil;', '&lfloor;', '&rfloor;', '&lang;', '&rang;', '&loz;', '&spades;', '&clubs;', '&hearts;', '&diams;');
		var arr2 = new Array('&#160;', '&#161;', '&#162;', '&#163;', '&#164;', '&#165;', '&#166;', '&#167;', '&#168;', '&#169;', '&#170;', '&#171;', '&#172;', '&#173;', '&#174;', '&#175;', '&#176;', '&#177;', '&#178;', '&#179;', '&#180;', '&#181;', '&#182;', '&#183;', '&#184;', '&#185;', '&#186;', '&#187;', '&#188;', '&#189;', '&#190;', '&#191;', '&#192;', '&#193;', '&#194;', '&#195;', '&#196;', '&#197;', '&#198;', '&#199;', '&#200;', '&#201;', '&#202;', '&#203;', '&#204;', '&#205;', '&#206;', '&#207;', '&#208;', '&#209;', '&#210;', '&#211;', '&#212;', '&#213;', '&#214;', '&#215;', '&#216;', '&#217;', '&#218;', '&#219;', '&#220;', '&#221;', '&#222;', '&#223;', '&#224;', '&#225;', '&#226;', '&#227;', '&#228;', '&#229;', '&#230;', '&#231;', '&#232;', '&#233;', '&#234;', '&#235;', '&#236;', '&#237;', '&#238;', '&#239;', '&#240;', '&#241;', '&#242;', '&#243;', '&#244;', '&#245;', '&#246;', '&#247;', '&#248;', '&#249;', '&#250;', '&#251;', '&#252;', '&#253;', '&#254;', '&#255;', '&#34;', '&#38;', '&#60;', '&#62;', '&#338;', '&#339;', '&#352;', '&#353;', '&#376;', '&#710;', '&#732;', '&#8194;', '&#8195;', '&#8201;', '&#8204;', '&#8205;', '&#8206;', '&#8207;', '&#8211;', '&#8212;', '&#8216;', '&#8217;', '&#8218;', '&#8220;', '&#8221;', '&#8222;', '&#8224;', '&#8225;', '&#8240;', '&#8249;', '&#8250;', '&#8364;', '&#402;', '&#913;', '&#914;', '&#915;', '&#916;', '&#917;', '&#918;', '&#919;', '&#920;', '&#921;', '&#922;', '&#923;', '&#924;', '&#925;', '&#926;', '&#927;', '&#928;', '&#929;', '&#931;', '&#932;', '&#933;', '&#934;', '&#935;', '&#936;', '&#937;', '&#945;', '&#946;', '&#947;', '&#948;', '&#949;', '&#950;', '&#951;', '&#952;', '&#953;', '&#954;', '&#955;', '&#956;', '&#957;', '&#958;', '&#959;', '&#960;', '&#961;', '&#962;', '&#963;', '&#964;', '&#965;', '&#966;', '&#967;', '&#968;', '&#969;', '&#977;', '&#978;', '&#982;', '&#8226;', '&#8230;', '&#8242;', '&#8243;', '&#8254;', '&#8260;', '&#8472;', '&#8465;', '&#8476;', '&#8482;', '&#8501;', '&#8592;', '&#8593;', '&#8594;', '&#8595;', '&#8596;', '&#8629;', '&#8656;', '&#8657;', '&#8658;', '&#8659;', '&#8660;', '&#8704;', '&#8706;', '&#8707;', '&#8709;', '&#8711;', '&#8712;', '&#8713;', '&#8715;', '&#8719;', '&#8721;', '&#8722;', '&#8727;', '&#8730;', '&#8733;', '&#8734;', '&#8736;', '&#8743;', '&#8744;', '&#8745;', '&#8746;', '&#8747;', '&#8756;', '&#8764;', '&#8773;', '&#8776;', '&#8800;', '&#8801;', '&#8804;', '&#8805;', '&#8834;', '&#8835;', '&#8836;', '&#8838;', '&#8839;', '&#8853;', '&#8855;', '&#8869;', '&#8901;', '&#8968;', '&#8969;', '&#8970;', '&#8971;', '&#9001;', '&#9002;', '&#9674;', '&#9824;', '&#9827;', '&#9829;', '&#9830;');
		return this.swapArrayVals(s, arr1, arr2);
	},

	// Convert Numerical entities into HTML entities
	NumericalToHTML: function (s) {
		var arr1 = new Array('&#160;', '&#161;', '&#162;', '&#163;', '&#164;', '&#165;', '&#166;', '&#167;', '&#168;', '&#169;', '&#170;', '&#171;', '&#172;', '&#173;', '&#174;', '&#175;', '&#176;', '&#177;', '&#178;', '&#179;', '&#180;', '&#181;', '&#182;', '&#183;', '&#184;', '&#185;', '&#186;', '&#187;', '&#188;', '&#189;', '&#190;', '&#191;', '&#192;', '&#193;', '&#194;', '&#195;', '&#196;', '&#197;', '&#198;', '&#199;', '&#200;', '&#201;', '&#202;', '&#203;', '&#204;', '&#205;', '&#206;', '&#207;', '&#208;', '&#209;', '&#210;', '&#211;', '&#212;', '&#213;', '&#214;', '&#215;', '&#216;', '&#217;', '&#218;', '&#219;', '&#220;', '&#221;', '&#222;', '&#223;', '&#224;', '&#225;', '&#226;', '&#227;', '&#228;', '&#229;', '&#230;', '&#231;', '&#232;', '&#233;', '&#234;', '&#235;', '&#236;', '&#237;', '&#238;', '&#239;', '&#240;', '&#241;', '&#242;', '&#243;', '&#244;', '&#245;', '&#246;', '&#247;', '&#248;', '&#249;', '&#250;', '&#251;', '&#252;', '&#253;', '&#254;', '&#255;', '&#34;', '&#38;', '&#60;', '&#62;', '&#338;', '&#339;', '&#352;', '&#353;', '&#376;', '&#710;', '&#732;', '&#8194;', '&#8195;', '&#8201;', '&#8204;', '&#8205;', '&#8206;', '&#8207;', '&#8211;', '&#8212;', '&#8216;', '&#8217;', '&#8218;', '&#8220;', '&#8221;', '&#8222;', '&#8224;', '&#8225;', '&#8240;', '&#8249;', '&#8250;', '&#8364;', '&#402;', '&#913;', '&#914;', '&#915;', '&#916;', '&#917;', '&#918;', '&#919;', '&#920;', '&#921;', '&#922;', '&#923;', '&#924;', '&#925;', '&#926;', '&#927;', '&#928;', '&#929;', '&#931;', '&#932;', '&#933;', '&#934;', '&#935;', '&#936;', '&#937;', '&#945;', '&#946;', '&#947;', '&#948;', '&#949;', '&#950;', '&#951;', '&#952;', '&#953;', '&#954;', '&#955;', '&#956;', '&#957;', '&#958;', '&#959;', '&#960;', '&#961;', '&#962;', '&#963;', '&#964;', '&#965;', '&#966;', '&#967;', '&#968;', '&#969;', '&#977;', '&#978;', '&#982;', '&#8226;', '&#8230;', '&#8242;', '&#8243;', '&#8254;', '&#8260;', '&#8472;', '&#8465;', '&#8476;', '&#8482;', '&#8501;', '&#8592;', '&#8593;', '&#8594;', '&#8595;', '&#8596;', '&#8629;', '&#8656;', '&#8657;', '&#8658;', '&#8659;', '&#8660;', '&#8704;', '&#8706;', '&#8707;', '&#8709;', '&#8711;', '&#8712;', '&#8713;', '&#8715;', '&#8719;', '&#8721;', '&#8722;', '&#8727;', '&#8730;', '&#8733;', '&#8734;', '&#8736;', '&#8743;', '&#8744;', '&#8745;', '&#8746;', '&#8747;', '&#8756;', '&#8764;', '&#8773;', '&#8776;', '&#8800;', '&#8801;', '&#8804;', '&#8805;', '&#8834;', '&#8835;', '&#8836;', '&#8838;', '&#8839;', '&#8853;', '&#8855;', '&#8869;', '&#8901;', '&#8968;', '&#8969;', '&#8970;', '&#8971;', '&#9001;', '&#9002;', '&#9674;', '&#9824;', '&#9827;', '&#9829;', '&#9830;');
		var arr2 = new Array('&nbsp;', '&iexcl;', '&cent;', '&pound;', '&curren;', '&yen;', '&brvbar;', '&sect;', '&uml;', '&copy;', '&ordf;', '&laquo;', '&not;', '&shy;', '&reg;', '&macr;', '&deg;', '&plusmn;', '&sup2;', '&sup3;', '&acute;', '&micro;', '&para;', '&middot;', '&cedil;', '&sup1;', '&ordm;', '&raquo;', '&frac14;', '&frac12;', '&frac34;', '&iquest;', '&agrave;', '&aacute;', '&acirc;', '&atilde;', '&Auml;', '&aring;', '&aelig;', '&ccedil;', '&egrave;', '&eacute;', '&ecirc;', '&euml;', '&igrave;', '&iacute;', '&icirc;', '&iuml;', '&eth;', '&ntilde;', '&ograve;', '&oacute;', '&ocirc;', '&otilde;', '&Ouml;', '&times;', '&oslash;', '&ugrave;', '&uacute;', '&ucirc;', '&Uuml;', '&yacute;', '&thorn;', '&szlig;', '&agrave;', '&aacute;', '&acirc;', '&atilde;', '&auml;', '&aring;', '&aelig;', '&ccedil;', '&egrave;', '&eacute;', '&ecirc;', '&euml;', '&igrave;', '&iacute;', '&icirc;', '&iuml;', '&eth;', '&ntilde;', '&ograve;', '&oacute;', '&ocirc;', '&otilde;', '&ouml;', '&divide;', '&oslash;', '&ugrave;', '&uacute;', '&ucirc;', '&uuml;', '&yacute;', '&thorn;', '&yuml;', '&quot;', '&amp;', '&lt;', '&gt;', '&oelig;', '&oelig;', '&scaron;', '&scaron;', '&yuml;', '&circ;', '&tilde;', '&ensp;', '&emsp;', '&thinsp;', '&zwnj;', '&zwj;', '&lrm;', '&rlm;', '&ndash;', '&mdash;', '&lsquo;', '&rsquo;', '&sbquo;', '&ldquo;', '&rdquo;', '&bdquo;', '&dagger;', '&dagger;', '&permil;', '&lsaquo;', '&rsaquo;', '&euro;', '&fnof;', '&alpha;', '&beta;', '&gamma;', '&delta;', '&epsilon;', '&zeta;', '&eta;', '&theta;', '&iota;', '&kappa;', '&lambda;', '&mu;', '&nu;', '&xi;', '&omicron;', '&pi;', '&rho;', '&sigma;', '&tau;', '&upsilon;', '&phi;', '&chi;', '&psi;', '&omega;', '&alpha;', '&beta;', '&gamma;', '&delta;', '&epsilon;', '&zeta;', '&eta;', '&theta;', '&iota;', '&kappa;', '&lambda;', '&mu;', '&nu;', '&xi;', '&omicron;', '&pi;', '&rho;', '&sigmaf;', '&sigma;', '&tau;', '&upsilon;', '&phi;', '&chi;', '&psi;', '&omega;', '&thetasym;', '&upsih;', '&piv;', '&bull;', '&hellip;', '&prime;', '&prime;', '&oline;', '&frasl;', '&weierp;', '&image;', '&real;', '&trade;', '&alefsym;', '&larr;', '&uarr;', '&rarr;', '&darr;', '&harr;', '&crarr;', '&larr;', '&uarr;', '&rarr;', '&darr;', '&harr;', '&forall;', '&part;', '&exist;', '&empty;', '&nabla;', '&isin;', '&notin;', '&ni;', '&prod;', '&sum;', '&minus;', '&lowast;', '&radic;', '&prop;', '&infin;', '&ang;', '&and;', '&or;', '&cap;', '&cup;', '&int;', '&there4;', '&sim;', '&cong;', '&asymp;', '&ne;', '&equiv;', '&le;', '&ge;', '&sub;', '&sup;', '&nsub;', '&sube;', '&supe;', '&oplus;', '&otimes;', '&perp;', '&sdot;', '&lceil;', '&rceil;', '&lfloor;', '&rfloor;', '&lang;', '&rang;', '&loz;', '&spades;', '&clubs;', '&hearts;', '&diams;');
		return this.swapArrayVals(s, arr1, arr2);
	},


	// Numerically encodes all unicode characters
	numEncode: function (s) {

		if (this.isEmpty(s)) return "";

		var e = "";
		for (var i = 0; i < s.length; i++) {
			var c = s.charAt(i);
			if (c < " " || c > "~") {
				c = "&#" + c.charCodeAt() + ";";
			}
			e += c;
		}
		return e;
	},

	// HTML Decode numerical and HTML entities back to original values
	htmlDecode: function (s) {

		var c, m, d = s;

		if (this.isEmpty(d)) return "";

		// convert HTML entites back to numerical entites first
		d = this.HTML2Numerical(d);

		// look for numerical entities &#34;
		arr = d.match(/&#[0-9]{1,5};/g);

		// if no matches found in string then skip
		if (arr != null) {
			for (var x = 0; x < arr.length; x++) {
				m = arr[x];
				c = m.substring(2, m.length - 1); //get numeric part which is refernce to unicode character
				// if its a valid number we can decode
				if (c >= -32768 && c <= 65535) {
					// decode every single match within string
					d = d.replace(m, String.fromCharCode(c));
				} else {
					d = d.replace(m, ""); //invalid so replace with nada
				}
			}
		}

		return d;
	},

	// encode an input string into either numerical or HTML entities
	htmlEncode: function (s, dbl) {

		if (this.isEmpty(s)) return "";

		// do we allow double encoding? E.g will &amp; be turned into &amp;amp;
		dbl = dbl | false; //default to prevent double encoding

		// if allowing double encoding we do ampersands first
		if (dbl) {
			if (this.EncodeType == "numerical") {
				s = s.replace(/&/g, "&#38;");
			} else {
				s = s.replace(/&/g, "&amp;");
			}
		}

		// convert the xss chars to numerical entities ' " < >
		s = this.XSSEncode(s, false);

		if (this.EncodeType == "numerical" || !dbl) {
			// Now call function that will convert any HTML entities to numerical codes
			s = this.HTML2Numerical(s);
		}

		// Now encode all chars above 127 e.g unicode
		s = this.numEncode(s);

		// now we know anything that needs to be encoded has been converted to numerical entities we
		// can encode any ampersands & that are not part of encoded entities
		// to handle the fact that I need to do a negative check and handle multiple ampersands &&&
		// I am going to use a placeholder

		// if we don't want double encoded entities we ignore the & in existing entities
		if (!dbl) {
			s = s.replace(/&#/g, "##AMPHASH##");

			if (this.EncodeType == "numerical") {
				s = s.replace(/&/g, "&#38;");
			} else {
				s = s.replace(/&/g, "&amp;");
			}

			s = s.replace(/##AMPHASH##/g, "&#");
		}

		// replace any malformed entities
		s = s.replace(/&#\d*([^\d;]|$)/g, "$1");

		if (!dbl) {
			// safety check to correct any double encoded &amp;
			s = this.correctEncoding(s);
		}

		// now do we need to convert our numerical encoded string into entities
		if (this.EncodeType == "entity") {
			s = this.NumericalToHTML(s);
		}

		return s;
	},

	// Encodes the basic 4 characters used to malform HTML in XSS hacks
	XSSEncode: function (s, en) {
		if (!this.isEmpty(s)) {
			en = en || true;
			// do we convert to numerical or html entity?
			if (en) {
				s = s.replace(/\'/g, "&#39;"); //no HTML equivalent as &apos is not cross browser supported
				s = s.replace(/\"/g, "&quot;");
				s = s.replace(/</g, "&lt;");
				s = s.replace(/>/g, "&gt;");
			} else {
				s = s.replace(/\'/g, "&#39;"); //no HTML equivalent as &apos is not cross browser supported
				s = s.replace(/\"/g, "&#34;");
				s = s.replace(/</g, "&#60;");
				s = s.replace(/>/g, "&#62;");
			}
			return s;
		} else {
			return "";
		}
	},

	// returns true if a string contains html or numerical encoded entities
	hasEncoded: function (s) {
		if (/&#[0-9]{1,5};/g.test(s)) {
			return true;
		} else if (/&[A-Z]{2,6};/gi.test(s)) {
			return true;
		} else {
			return false;
		}
	},

	// will remove any unicode characters
	stripUnicode: function (s) {
		return s.replace(/[^\x20-\x7E]/g, "");

	},

	// corrects any double encoded &amp; entities e.g &amp;amp;
	correctEncoding: function (s) {
		return s.replace(/(&amp;)(amp;)+/, "$1");
	},


	// Function to loop through an array swaping each item with the value from another array e.g swap HTML entities with Numericals
	swapArrayVals: function (s, arr1, arr2) {
		if (this.isEmpty(s)) return "";
		var re;
		if (arr1 && arr2) {
			//ShowDebug("in swapArrayVals arr1.length = " + arr1.length + " arr2.length = " + arr2.length)
			// array lengths must match
			if (arr1.length == arr2.length) {
				for (var x = 0, i = arr1.length; x < i; x++) {
					re = new RegExp(arr1[x], 'g');
					s = s.replace(re, arr2[x]); //swap arr1 item with matching item from arr2	
				}
			}
		}
		return s;
	},

	inArray: function (item, arr) {
		for (var i = 0, x = arr.length; i < x; i++) {
			if (arr[i] === item) {
				return i;
			}
		}
		return -1;
	},

	MD5: function (string) {

		function RotateLeft(lValue, iShiftBits) {
			return (lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
		}

		function AddUnsigned(lX, lY) {
			var lX4, lY4, lX8, lY8, lResult;
			lX8 = (lX & 0x80000000);
			lY8 = (lY & 0x80000000);
			lX4 = (lX & 0x40000000);
			lY4 = (lY & 0x40000000);
			lResult = (lX & 0x3FFFFFFF) + (lY & 0x3FFFFFFF);
			if (lX4 & lY4) {
				return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
			}
			if (lX4 | lY4) {
				if (lResult & 0x40000000) {
					return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
				} else {
					return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
				}
			} else {
				return (lResult ^ lX8 ^ lY8);
			}
		}

		function F(x, y, z) { return (x & y) | ((~x) & z); }
		function G(x, y, z) { return (x & z) | (y & (~z)); }
		function H(x, y, z) { return (x ^ y ^ z); }
		function I(x, y, z) { return (y ^ (x | (~z))); }

		function FF(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		};

		function GG(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		};

		function HH(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		};

		function II(a, b, c, d, x, s, ac) {
			a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
			return AddUnsigned(RotateLeft(a, s), b);
		};

		function ConvertToWordArray(string) {
			var lWordCount;
			var lMessageLength = string.length;
			var lNumberOfWords_temp1 = lMessageLength + 8;
			var lNumberOfWords_temp2 = (lNumberOfWords_temp1 - (lNumberOfWords_temp1 % 64)) / 64;
			var lNumberOfWords = (lNumberOfWords_temp2 + 1) * 16;
			var lWordArray = Array(lNumberOfWords - 1);
			var lBytePosition = 0;
			var lByteCount = 0;
			while (lByteCount < lMessageLength) {
				lWordCount = (lByteCount - (lByteCount % 4)) / 4;
				lBytePosition = (lByteCount % 4) * 8;
				lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount) << lBytePosition));
				lByteCount++;
			}
			lWordCount = (lByteCount - (lByteCount % 4)) / 4;
			lBytePosition = (lByteCount % 4) * 8;
			lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80 << lBytePosition);
			lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
			lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
			return lWordArray;
		};

		function WordToHex(lValue) {
			var WordToHexValue = "", WordToHexValue_temp = "", lByte, lCount;
			for (lCount = 0; lCount <= 3; lCount++) {
				lByte = (lValue >>> (lCount * 8)) & 255;
				WordToHexValue_temp = "0" + lByte.toString(16);
				WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length - 2, 2);
			}
			return WordToHexValue;
		};

		function Utf8Encode(string) {
			string = string.replace(/\r\n/g, "\n");
			var utftext = "";

			for (var n = 0; n < string.length; n++) {

				var c = string.charCodeAt(n);

				if (c < 128) {
					utftext += String.fromCharCode(c);
				}
				else if ((c > 127) && (c < 2048)) {
					utftext += String.fromCharCode((c >> 6) | 192);
					utftext += String.fromCharCode((c & 63) | 128);
				}
				else {
					utftext += String.fromCharCode((c >> 12) | 224);
					utftext += String.fromCharCode(((c >> 6) & 63) | 128);
					utftext += String.fromCharCode((c & 63) | 128);
				}

			}

			return utftext;
		};

		var x = Array();
		var k, AA, BB, CC, DD, a, b, c, d;
		var S11 = 7, S12 = 12, S13 = 17, S14 = 22;
		var S21 = 5, S22 = 9, S23 = 14, S24 = 20;
		var S31 = 4, S32 = 11, S33 = 16, S34 = 23;
		var S41 = 6, S42 = 10, S43 = 15, S44 = 21;

		string = Utf8Encode(string);

		x = ConvertToWordArray(string);

		a = 0x67452301; b = 0xEFCDAB89; c = 0x98BADCFE; d = 0x10325476;

		for (k = 0; k < x.length; k += 16) {
			AA = a; BB = b; CC = c; DD = d;
			a = FF(a, b, c, d, x[k + 0], S11, 0xD76AA478);
			d = FF(d, a, b, c, x[k + 1], S12, 0xE8C7B756);
			c = FF(c, d, a, b, x[k + 2], S13, 0x242070DB);
			b = FF(b, c, d, a, x[k + 3], S14, 0xC1BDCEEE);
			a = FF(a, b, c, d, x[k + 4], S11, 0xF57C0FAF);
			d = FF(d, a, b, c, x[k + 5], S12, 0x4787C62A);
			c = FF(c, d, a, b, x[k + 6], S13, 0xA8304613);
			b = FF(b, c, d, a, x[k + 7], S14, 0xFD469501);
			a = FF(a, b, c, d, x[k + 8], S11, 0x698098D8);
			d = FF(d, a, b, c, x[k + 9], S12, 0x8B44F7AF);
			c = FF(c, d, a, b, x[k + 10], S13, 0xFFFF5BB1);
			b = FF(b, c, d, a, x[k + 11], S14, 0x895CD7BE);
			a = FF(a, b, c, d, x[k + 12], S11, 0x6B901122);
			d = FF(d, a, b, c, x[k + 13], S12, 0xFD987193);
			c = FF(c, d, a, b, x[k + 14], S13, 0xA679438E);
			b = FF(b, c, d, a, x[k + 15], S14, 0x49B40821);
			a = GG(a, b, c, d, x[k + 1], S21, 0xF61E2562);
			d = GG(d, a, b, c, x[k + 6], S22, 0xC040B340);
			c = GG(c, d, a, b, x[k + 11], S23, 0x265E5A51);
			b = GG(b, c, d, a, x[k + 0], S24, 0xE9B6C7AA);
			a = GG(a, b, c, d, x[k + 5], S21, 0xD62F105D);
			d = GG(d, a, b, c, x[k + 10], S22, 0x2441453);
			c = GG(c, d, a, b, x[k + 15], S23, 0xD8A1E681);
			b = GG(b, c, d, a, x[k + 4], S24, 0xE7D3FBC8);
			a = GG(a, b, c, d, x[k + 9], S21, 0x21E1CDE6);
			d = GG(d, a, b, c, x[k + 14], S22, 0xC33707D6);
			c = GG(c, d, a, b, x[k + 3], S23, 0xF4D50D87);
			b = GG(b, c, d, a, x[k + 8], S24, 0x455A14ED);
			a = GG(a, b, c, d, x[k + 13], S21, 0xA9E3E905);
			d = GG(d, a, b, c, x[k + 2], S22, 0xFCEFA3F8);
			c = GG(c, d, a, b, x[k + 7], S23, 0x676F02D9);
			b = GG(b, c, d, a, x[k + 12], S24, 0x8D2A4C8A);
			a = HH(a, b, c, d, x[k + 5], S31, 0xFFFA3942);
			d = HH(d, a, b, c, x[k + 8], S32, 0x8771F681);
			c = HH(c, d, a, b, x[k + 11], S33, 0x6D9D6122);
			b = HH(b, c, d, a, x[k + 14], S34, 0xFDE5380C);
			a = HH(a, b, c, d, x[k + 1], S31, 0xA4BEEA44);
			d = HH(d, a, b, c, x[k + 4], S32, 0x4BDECFA9);
			c = HH(c, d, a, b, x[k + 7], S33, 0xF6BB4B60);
			b = HH(b, c, d, a, x[k + 10], S34, 0xBEBFBC70);
			a = HH(a, b, c, d, x[k + 13], S31, 0x289B7EC6);
			d = HH(d, a, b, c, x[k + 0], S32, 0xEAA127FA);
			c = HH(c, d, a, b, x[k + 3], S33, 0xD4EF3085);
			b = HH(b, c, d, a, x[k + 6], S34, 0x4881D05);
			a = HH(a, b, c, d, x[k + 9], S31, 0xD9D4D039);
			d = HH(d, a, b, c, x[k + 12], S32, 0xE6DB99E5);
			c = HH(c, d, a, b, x[k + 15], S33, 0x1FA27CF8);
			b = HH(b, c, d, a, x[k + 2], S34, 0xC4AC5665);
			a = II(a, b, c, d, x[k + 0], S41, 0xF4292244);
			d = II(d, a, b, c, x[k + 7], S42, 0x432AFF97);
			c = II(c, d, a, b, x[k + 14], S43, 0xAB9423A7);
			b = II(b, c, d, a, x[k + 5], S44, 0xFC93A039);
			a = II(a, b, c, d, x[k + 12], S41, 0x655B59C3);
			d = II(d, a, b, c, x[k + 3], S42, 0x8F0CCC92);
			c = II(c, d, a, b, x[k + 10], S43, 0xFFEFF47D);
			b = II(b, c, d, a, x[k + 1], S44, 0x85845DD1);
			a = II(a, b, c, d, x[k + 8], S41, 0x6FA87E4F);
			d = II(d, a, b, c, x[k + 15], S42, 0xFE2CE6E0);
			c = II(c, d, a, b, x[k + 6], S43, 0xA3014314);
			b = II(b, c, d, a, x[k + 13], S44, 0x4E0811A1);
			a = II(a, b, c, d, x[k + 4], S41, 0xF7537E82);
			d = II(d, a, b, c, x[k + 11], S42, 0xBD3AF235);
			c = II(c, d, a, b, x[k + 2], S43, 0x2AD7D2BB);
			b = II(b, c, d, a, x[k + 9], S44, 0xEB86D391);
			a = AddUnsigned(a, AA);
			b = AddUnsigned(b, BB);
			c = AddUnsigned(c, CC);
			d = AddUnsigned(d, DD);
		}

		var temp = WordToHex(a) + WordToHex(b) + WordToHex(c) + WordToHex(d);

		return temp.toLowerCase();
	}
};

function UtilBTD() {
	this.wd = window;
	this.d = this.wd.document;
	var ua = navigator.userAgent.toLowerCase();
	this.isSafari = (ua.indexOf("safari") != -1);
	this.isOpera = (ua.indexOf("opera") != -1);
	this.isMaxthon = (ua.indexOf("maxthon") != -1);
	this.isIE = ((ua.indexOf("msie") != -1) && (!this.isOpera) && (ua.indexOf("webtv") == -1));
	this.isFF = (ua.indexOf("firefox") != -1);
	this.isDoctype = (this.d.compatMode && this.d.compatMode != "BackCompat");
	if (this.isIE) {
		this.appVersion = parseFloat(ua.substr(ua.indexOf("msie") + 4, 2));
	}
	else {
		this.appVersion = parseFloat(navigator.appVersion.substr(0, navigator.appVersion.indexOf("(")));
	}

	this.listActionsOnScroll = [];
	this.listActionsOnReady = [];
	this.isReady = false;
	this.initOnReady();
};

UtilBTD.prototype =
{
	cloneObject: function (obj) {
		function clone(v) {
			var re = new Object();
			if (v instanceof Array) {
				var arr = new Array();
				for (var i = 0; i < v.length; i++) {
					arr.push(clone(v[i]));
				}
				re = arr;
			}
			else if (v instanceof Date) {
				re = new Date(v.getTime());
			}
			else if (v instanceof Object) {
				for (var key in v) {
					re[key] = clone(v[key]);
				}
			}
			else {
				re = v;
			}
			return re;
		}
		return clone(obj);
	},

	convertArrayToString: function (arr, sep) {
		var s = "";
		for (var i = 0; i < arr.length; i++) {
			if (s != "") s += ",";
			s += arr[i];
		}
		return s;
	},

	convertArrayToDictionary: function (arr) {
		var d = new Object();
		for (var i = 0; i < arr.length; i++) {
			var value = arr[i] + "";
			d[value] = value;
		}
		return d;
	},

	setHomepage: function (website) {
		if (document.all) {
			document.body.style.behavior = 'url(#default#homepage)';
			document.body.setHomePage('http://' + website);
		}
		else if (window.sidebar) {
			if (window.netscape) {
				try {
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				} catch (e) {
					alert("this action was aviod by your browser,if you want to enable,please enter about:config in your address line,and change the value of signed.applets.codebase_principal_support to true");
				}
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage', 'http://' + website);
		}
	},

	/*
	* Get element by id
	*/
	getElById: function (strId) {
		return this.d.getElementById(strId);
	},

	/*
	* Get element by id
	*/
	isStringEmpty: function (s) {
		return ((s == null) || (s.trim() == ""));
	},

	/*
	* Create Element
	*/
	createEl: function (tagName) {
		return this.d.createElement(tagName);
	},

	/*
	* Set Title Document
	*/
	setTitleDocument: function (title) {
		this.d.title = title;
	},

	/*
	* Get Style Element
	*/
	getStyleEl: function (el, styleProperty) {
		var value = "";
		if (!this.isFF && !this.isSafari) {
			var posFound = -1;
			var posStart = 0;
			while (true) {
				posFound = styleProperty.indexOf("-", posStart);
				if (posFound == -1) {
					break;
				}
				styleProperty = styleProperty.substring(0, posFound) +
					styleProperty.charAt(posFound + 1).toUpperCase() +
					styleProperty.substring(posFound + 2, styleProperty.length);
				posStart = posFound;
			}
		}
		if (el.currentStyle) {
			value = el.currentStyle[styleProperty];
		}
		else if (window.getComputedStyle) {
			value = document.defaultView.getComputedStyle(el, null).getPropertyValue(styleProperty);
		}
		return value;
	},

	/*
	* Create Script
	*/
	createScript: function (id, src) {
		try {
			var o = this.getElById(id);
			if (o == null) {
				var o = this.createEl("SCRIPT");
				o.id = id;
				o.type = "text/javascript";
				o.src = src;
				this.d.getElementsByTagName("HEAD")[0].appendChild(o);
			}
		}
		catch (e)
		{ }
	},

	cutStringByNum: function (content, numberChar) {
		content = this.stripHtmlTags(content);
		if (content.length <= numberChar) return content.trim();

		for (var i = 0; i < 10; i++) {
			numberChar = numberChar + 1;
			if ((numberChar >= content.length)
				|| (numberChar < content.length && content.charAt(numberChar) == " ")
				) {
				break;
			}
		}
		return content.substring(0, numberChar) + "...";
	},

	/*
	* Append Element to body
	*/
	addChildToBody: function (el) {
		this.d.body.appendChild(el);
	},

	appendStyleSheet: function (documentElement, cssFileUrl) {
		var e = documentElement.createElement("LINK");
		e.rel = "stylesheet";
		e.type = "text/css";
		e.href = cssFileUrl;
		documentElement.getElementsByTagName("HEAD")[0].appendChild(e);
		return e;
	},

	/*
	* Create Style
	*/
	createStyle: function (cssStr) {
		try {
			var eStyle = this.createEl("STYLE");
			eStyle.setAttribute("type", "text/css");
			this.d.getElementsByTagName("HEAD")[0].appendChild(eStyle);
			if (eStyle.styleSheet) {
				eStyle.styleSheet.cssText = cssStr;
			}
			else {
				// w3c
				var cssText = this.createElText(cssStr);
				eStyle.appendChild(cssText);
			}
		}
		catch (e)
		{ }
	},

	createElText: function (text) {
		return this.d.createTextNode(text);
	},

	stripHtmlTags: function (strText) {
		strText = strText.replace(/\r|\n/g, "");
		var regEx = /\<style.*\<\/style>/g;
		strText = strText.replace(regEx, "");
		regEx = /<[^>]*>/g;
		return strText.replace(regEx, "");
	},

	insertAfter: function (newNode, refNode) {
		var parent = refNode.parentNode;
		if (refNode.nextSibling) {
			return parent.insertBefore(newNode, refNode.nextSibling);
		}
		else {
			return parent.appendChild(newNode);
		}
	},

	encodeTagUL: function (con) {
		con = this.stripHtmlTags(con.trim());
		con = con.replace(/\r\n/g, "\n");
		var lines = con.split("\n");
		if (lines.length == 0) return "";
		if (lines.length == 1) return con.trim();
		var re = "<ul>";
		for (var i = 0; i < lines.length; i++) {
			if (lines[i].trim() != "")
				re += "<li>" + lines[i] + "</li>";
		}
		re += "</ul>";
		return re;
	},

	decodeTagUL: function (con) {
		con = con.replace(/\r\n/g, "\n");
		con = con.replace(/\n/g, "");
		con = con.replace(/<UL>/gi, "");
		con = con.replace(/<\/UL>/gi, "");
		con = con.replace(/<LI>/gi, "");
		con = con.replace(/<\/LI>/gi, "\n");
		return con;
	},

	/*
	* Add Attribute for Element
	*/
	createAttribute: function (obj, atb_name, value) {
		obj[atb_name] = value;
	},

	/*
	* Get Document
	*/
	getDocument: function () {
		return (this.isDoctype ? this.d.documentElement : this.d.body);
	},

	/*
	* Get Document Scroll
	*/
	getDocumentScroll: function () {
		return (!this.isSafari ? this.d.documentElement : this.d.body);
	},

	/*
	* Get Document Scroll
	*/
	getScrollWithoutBody: function (el) {
		var parent = el;
		var re = { X: 0, Y: 0, isFixed: false };
		while (parent != null && parent.tagName != null && parent.tagName != "BODY") {
			re.Y += parent.scrollTop;
			re.X += parent.scrollLeft;
			var propertyPos = this.getStyleEl(parent, "position");
			if (propertyPos == "fixed") {
				re.isFixed = true;
			}
			parent = parent.parentNode;
		}
		return re;
	},

	//----------------Add or Remove Event of Element------------------
	createEventOnScroll: function () {
		var self = this;
		if (self.isIE && self.appVersion == 7) {
			self.d.body.onscroll = function () {
				self.doActionOnScroll();
			}
		}
		else {
			self.wd.onscroll = function () {
				self.doActionOnScroll();
			}
		}

	},

	doActionOnScroll: function () {
		for (var i = 0; i < this.listActionsOnScroll.length; i++) {
			this.listActionsOnScroll[i]();
		}
	},

	numeric: function (id) {
		var me = this;
		var el = typeof (id) == 'string' ? this.getElById(id) : id;
		var nm = "1234567890";
		this.addEvent(el, 'keypress', function (e) {
			e = me.getWindowEvent(e);
			if (!e.charCode) k = String.fromCharCode(e.which);
			else k = String.fromCharCode(e.charCode);

			if (nm.indexOf(k) == -1) me.stopEvent();
			if (e.ctrlKey && k == 'v') me.stopEvent();
		});
		this.disableContextMenu(el);
	},

	isNumber: function (v) {
		return (typeof (v) == 'number' && isFinite(v)) || (v != '' && !isNaN(v));
	},

	isUserName: function (v) {
		var filter = /^([a-zA-Z0-9_\.\-])+$/;
		if (filter.test(v)) return true;
		else return false;
	},

	isEmail: function (v) {
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (filter.test(v)) return true;
		else return false;
	},

	isDateVN: function (v) {
		var filter = /^([0-9]{1,2})+\/([0-9]{1,2})+\/([0-9]{4,4})+$/;
		if (!filter.test(v)) return false;
		var arr = v.split("/");
		var d = parseInt(arr[0], 10);
		var m = parseInt(arr[1], 10);
		var y = parseInt(arr[2], 10);
		if (d > Date.maxDateInMonth(m, y) || d < 1) return false;
		if (m > 12 || m < 1) return false;
		return true;
	},

	deleteActionOnScroll: function (func) {
		try {
			for (var i = 0; i < this.listActionsOnScroll.length; i++) {
				if (this.listActionsOnScroll[i] == func) break;
			}
			this.listActionsOnScroll.splice(i, 1);
		}
		catch (er) { }
	},

	deleteActionOnReady: function (func) {
		try {
			for (var i = 0; i < this.listActionsOnReady.length; i++) {
				if (this.listActionsOnReady[i] == func) break;
			}
			this.listActionsOnReady.splice(i, 1);
		}
		catch (er) { }
	},

	initOnReady: function () {
		var me = this;
		function doReady() {
			if (me.isReady) return;
			me.isReady = true;
			for (var i = 0; i < me.listActionsOnReady.length; i++) {
				me.listActionsOnReady[i]();
			}
		}

		if (document.readyState === "complete") {
			setTimeout(function () { me.initOnReady(); }, 1);
			return;
		}
		if (document.addEventListener) {
			document.addEventListener("DOMContentLoaded", doReady, false);
		} else if (document.attachEvent) {
			document.attachEvent("onreadystatechange", doReady);
			var toplevel = false;
			try {
				toplevel = window.frameElement == null;
			} catch (e) { }

			if (document.documentElement.doScroll && toplevel) {
				function doScrollCheck() {
					if (me.isReady) return;
					try {
						document.documentElement.doScroll("left");
					} catch (e) {
						setTimeout(doScrollCheck, 1);
						return;
					}
					doReady();
				}
				doScrollCheck();
			}
		}
	},

	addEvent: function (obj, eventName, func) {
		if (obj.isBTD) {
			obj.addEvent(eventName, func);
			return;
		}
		eventName = eventName.toLowerCase();
		if (eventName == "ready") {
			this.listActionsOnReady.push(func);
		}
		else {
			if (eventName == "scroll") {
				if (!this.firstCallOnScroll) {
					this.firstCallOnScroll = true;
					this.createEventOnScroll();
				}
				this.listActionsOnScroll[this.listActionsOnScroll.length] = func;
				return;
			}
			if (obj.attachEvent) {
				obj.attachEvent("on" + eventName, func);
			}
			else if (obj.addEventListener) {
				obj.addEventListener(eventName, func, true);
			}
			else {
				obj["on" + eventName] = func;
			}
		}
	},

	removeEvent: function (obj, eventName, func) {
		if (obj.isBTD) {
			obj.removeEvent(eventName, func);
			return;
		}
		if (eventName == "ready") {
			this.deleteActionOnReady(func);
		}
		else {
			if (eventName.toLowerCase() == "scroll") {
				this.deleteActionOnScroll(func);
				return;
			}
			if (obj.detachEvent) {
				obj.detachEvent("on" + eventName, func);
			}
			else if (obj.removeEventListener) {
				obj.removeEventListener(eventName, func, true);
			}
			else {
				obj["on" + eventName] = null;
			}
		}
	},

	stopEvent: function (e) {
		var evt = (typeof (e) != "undefined") ? e : this.getWindowEvent();
		if (typeof (evt.stopPropagation) != "undefined") {
			evt.stopPropagation();
			evt.preventDefault();
		}
		else if (typeof (evt.cancelBubble) != "undefined") {
			evt.cancelBubble = true;
			evt.returnValue = false;
		}
	},

	disableContextMenu: function (element) {
		element.oncontextmenu = function () {
			return false;
		}
	},

	enableContextMenu: function (element) {
		element.oncontextmenu = null;
	},

	disableSelection: function (target) {
		if (this.isIE || this.isOpera || this.isSafari) //IE route
		{
			target.onselectstart = function () { return false; }
		}
		else if (typeof (target.style.MozUserSelect) != "undefined") {
			target.style.MozUserSelect = "none";
		}
		target.style.cursor = "default";
	},

	rand: function (n) {
		return (Math.floor(Math.random() * n + 1));
	},

	enableSelection: function (target) {
		if (this.isIE || this.isOpera) //IE route
		{
			target.onselectstart = null;
		}
		else if (typeof (target.style.MozUserSelect) != "undefined") {
			target.style.MozUserSelect = "";
		}
		target.style.cursor = "default";
	},

	mouseCoords: function (ev) {
		if (ev.pageX && ev.pageY) {
			return { X: ev.pageX, Y: ev.pageY };
		}
		var de = this.getDocument();
		var deScroll = this.getDocumentScroll();
		return { X: ev.clientX + deScroll.scrollLeft, Y: ev.clientY + deScroll.scrollTop };
	},

	mouseCoordsAndPosEl: function (e, el) {
		var clientX = e.clientX, clientY = e.clientY;
		var oW = el.offsetWidth, oH = el.offsetHeight;
		var de = this.getDocument();
		var deScroll = this.getDocumentScroll();
		var posX = clientX + oW > de.clientWidth ? clientX - oW - 10 : 10 + clientX;
		var posY = clientY + oH > de.clientHeight ? clientY - oH - 10 : 10 + clientY;
		return { X: posX + deScroll.scrollLeft, Y: posY + deScroll.scrollTop };
	},

	getPositionMenuByMouse: function (e, pos) {
		var de = this.getDocument();
		switch (pos) {
			case "top":
				if (e.clientY < de.clientHeight / 2)
					pos = "bottom";
				break;
			case "bottom":
				if (e.clientY >= de.clientHeight / 2)
					pos = "top";
				break;
			case "left":
				if (e.clientX < de.clientWidth / 2)
					pos = "right";
				break;
			case "right":
				if (e.clientX >= de.clientWidth / 2)
					pos = "left";
				break;
		}
		return pos;
	},

	checkParentHaxFixed: function (el) {
		var parent = el;
		while (parent != null && parent.tagName != null && parent.tagName.toLowerCase() != "body") {
			var propertyPos = this.getStyleEl(parent, "position");
			if (propertyPos == "fixed") {
				return true;
			}
			parent = parent.parentNode;
		}
		return false;
	},

	coordsElChildByParentIntelligent: function (elChild, elParent) {
		var sizeElParent = this.getElementSize(elParent);
		var posElParent = this.getElementPosition(elParent);
		var sizeElChild = this.getElementSize(elChild);
		var sizeDoc = this.getDocument();
		var clientHeight = this.d.body.clientHeight > sizeDoc.clientHeight ? this.d.body.clientHeight : sizeDoc.clientHeight;
		var clientWidth = this.d.body.clientWidth > sizeDoc.clientWidth ? this.d.body.clientWidth : sizeDoc.clientWidth;
		var deScroll = this.getDocumentScroll();
		var height = ((sizeElParent.height + posElParent.Y) - deScroll.scrollTop) + sizeElChild.height;
		var width = ((sizeElParent.width + posElParent.X) - deScroll.scrollLeft) + sizeElChild.width;
		var pos = height > clientHeight ? "top" : "bottom";
		pos += width > clientWidth ? "Left" : "Right";
		return this.coordsElChildByParent(elChild, elParent, pos);
	},

	coordsElChildByParent: function (elChild, elParent, pos) {
		var posParent = this.getElementPosition(elParent);
		var size = null;
		var p = { X: 0, Y: 0, posCase: pos };
		if (this.checkParentHaxFixed(elParent)) {
			var deScroll = this.getDocumentScroll();
			p.X = deScroll.scrollLeft;
			p.Y = deScroll.scrollTop;
		}
		switch (pos) {
			case "top":
				p.X += posParent.X;
				p.Y += posParent.Y - this.getElementSize(elChild).height;
				break;
			case "bottom":
				p.X += posParent.X;
				p.Y += posParent.Y + this.getElementSize(elParent).height;
				break;
			case "left":
				p.X += posParent.X - this.getElementSize(elChild).width;
				p.Y += posParent.Y;
				break;
			case "right":
				p.X += posParent.X + this.getElementSize(elParent).width;
				p.Y += posParent.Y;
				break;
			case "topLeft":
				size = this.getElementSize(elChild);
				p.X += posParent.X - size.width;
				p.Y += posParent.Y - size.height;
				break;
			case "topRight":
				p.X += posParent.X + this.getElementSize(elParent).width;
				p.Y += posParent.Y - this.getElementSize(elChild).height;
				break;
			case "bottomLeft":
				var sizeElParent = this.getElementSize(elParent);
				p.X += posParent.X - this.getElementSize(elChild).width;
				p.Y += posParent.Y + sizeElParent.height;
				break;
			case "bottomRight":
				size = this.getElementSize(elParent);
				p.X += posParent.X + size.width;
				p.Y += posParent.Y + size.height;
				break;
		}
		return p;
	},

	getElPosCenterWebPage: function (el) {
		var s = this.getElementSize(el);
		var de = this.getDocument();
		var deScroll = this.getDocumentScroll();
		return {
			X: (s.width > de.clientWidth ? deScroll.scrollLeft : (de.clientWidth - s.width) / 2 + deScroll.scrollLeft),
			Y: (s.height > de.clientHeight ? deScroll.scrollTop : (de.clientHeight - s.height) / 2 + deScroll.scrollTop)
		};
	},

	getElementSize: function (el) {
		if (el.isBTD) {
			return el.getSize();
		}
		var result = { width: 0, height: 0 };
		var dip = this.getStyleEl(el, "display");
		if (dip == "none") {
			el.style.display = "";
		}
		result.width = el.offsetWidth;
		result.height = el.offsetHeight;
		el.style.display = dip;

		return result;
	},

	getElementPositionView: function (el) {
		if (el.isBTD) {
			return el.getPositionView();
		}
		var posParent = this.getElementPosition(el);
		var scroll = this.getScrollWithoutBody(el);
		var docScroll = this.getDocumentScroll();
		var pos = { X: 0, Y: 0 };
		pos.Y = scroll.Y == 0 ? posParent.Y : posParent.Y - scroll.Y;
		pos.X = scroll.X == 0 ? posParent.X : posParent.X - scroll.X;
		if (scroll.isFixed) {
			pos.Y += docScroll.scrollTop;
			pos.X += docScroll.scrollLeft;
		}
		return pos;
	},

	getElementPosition: function (el) {
		var c = { X: 0, Y: 0 };
		while (el) {
			c.X += el.offsetLeft;
			c.Y += el.offsetTop;
			el = el.offsetParent;
		}
		return c;
	},

	getElement: function () {
		var e = this.getWindowEvent();
		if (e != null)
			return this.isIE || this.isOpera ? e.srcElement : e.currentTarget;
		else
			return null;
	},

	getTargetElement: function (e) {
		e = this.getWindowEvent(e);
		if (e != null)
			return this.isIE || this.isOpera ? e.srcElement : e.target;
		else
			return null;
	},

	isRightClick: function (e) {
		e = this.getWindowEvent(e);
		if ((this.isOpera && e.button != 0)
		|| (this.isSafari && e.button != 0)
		|| (this.isFF && e.button != 0)
		|| (this.isIE && e.button != 1)
		|| (this.isMaxthon && e.button != 1)) {
			return true;
		}
		return false;
	},

	getWindowEvent: function () {
		if (this.isIE || this.isOpera) return this.wd.event;
		func = this.getWindowEvent.caller;
		while (func != null) {
			var arg0 = func.arguments[0];
			if (arg0) {
				if ((arg0.constructor == Event || arg0.constructor == MouseEvent)
					|| (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
					return arg0;
				}
			}
			func = func.caller;
		}
		return null;
	},

	changeStyleAll: function (o, styleDefault, style, word) {
		for (var i = 0; i < o.childNodes.length; i++) {
			var child = o.childNodes[i];
			var className = child.className;
			if (className) {
				if (className != "" && className.indexOf(word) != -1) {
					child.className = className.replace(styleDefault, style);
				}
			}
			this.changeStyleAll(child, styleDefault, style, word);
		}
	},

	getCookie: function (name) {
		var results = this.d.cookie.match(name + '=(.*?)(;|$)');
		if (results)
			return (unescape(results[1]));
		else
			return null;
	},

	setCookie: function (name, value, expires, path, domain, secure) {
		var date = new Date();
		date.setTime(date.getTime() + (365 * 24 * 60 * 60 * 1000));
		this.d.cookie = name + "=" + escape(value) +
			((expires) ? ";expires=" + expires.toGMTString() : ";expires=" + date.toGMTString()) +
			((path) ? ";path=" + path : ";path=/") +
			((domain) ? ";domain=" + domain : "") +
			((secure) ? ";secure" : "");
	},

	deleteCookie: function (name, path, domain) {
		if (this.getCookie(name)) this.d.cookie = name + "=" +
			((path) ? ";path=" + path : "") +
			((domain) ? ";domain=" + domain : "") +
			";expires=Thu, 01-Jan-70 00:00:01 GMT";
	},

	getQueryStringByCharSharp: function () {
		var pos = location.href.indexOf("#");
		if (pos != -1) {
			var queryString = location.href.substr(pos + 1);
			if (queryString != "") {
				return queryString;
			}
			else {
				return "Home";
			}
		}
		else {
			return "Home";
		}
	},

	analyseURL: function (url, tail) {
		if (typeof (tail) == "undefined") tail = "";
		var para = [];
		var arrTemp = url.split("+");
		arrTemp = arrTemp.length == 1 ? url.split("?") : arrTemp;

		if (arrTemp.length > 1) {
			var arrPara = arrTemp[1].split("&");
			for (var i = 0; i < arrPara.length; i++) {
				var arrSub = arrPara[i].split("=");
				para[arrSub[0]] = arrSub[1];
			}
		}
		return { page: (arrTemp[0].indexOf(tail) == -1 ? arrTemp[0] + tail : arrTemp[0]), paramater: para };
	},

	isSelected: function (o) {
		for (var i = 0; i < o.length; i++) {
			if (o[i].selected) return true;
		}
		return false;
	},

	isImage: function (file) {
		if (file.trim() == "") return false;
		var pos = file.lastIndexOf(".") + 1;
		var tail = file.substring(pos, file.length).toLowerCase();
		if ((tail != "gif") && (tail != "jpg") && (tail != "png") && (tail != "bmp"))
			return false;
		return true;
	},
	isFlash: function (file) {
		if (file.trim() == "") return false;
		var pos = file.lastIndexOf(".") + 1;
		var tail = file.substring(pos, file.length).toLowerCase();
		if (tail != "swf")
			return false;
		return true;
	},

	// myField accepts an object reference, myValue accepts the text strint to add 
	insertTextAtCursor: function (myField, myValue) {
		//IE support 
		if (this.d.selection) {
			myField.focus();
			var sel = this.d.selection.createRange();
			sel.text = myValue;
		}
		//Mozilla/Firefox/Netscape 7+ support 
		else if (myField.selectionStart || myField.selectionStart == '0') {
			var startPos = myField.selectionStart;
			var endPos = myField.selectionEnd;
			myField.value = myField.value.substring(0, startPos) + myValue + myField.value.substring(endPos, myField.value.length);
		}
		else {
			myField.value += myValue;
		}
	},

	changeBackgroundColor: function (o, checked) {
		while (o.tagName != "TR" && o != null) {
			o = o.parentNode;
		}
		o.style.backgroundColor = checked ? "#F2FEC5" : "#fff";
	},

	addItemToSelectBox: function (elSel, text, value) {
		var elOption = this.createEl("OPTION");
		elOption.value = value;
		elOption.text = text;
		try {
			elSel.add(elOption, null); // standards compliant
		}
		catch (ex) {
			elSel.add(elOption); // IE only
		}
		return elOption;
	},

	addListItemToSelectBox: function (elSel, list, textField, valueField) {
		for (var i = 0; i < list.length; i++) {
			var op = this.addItemToSelectBox(elSel, list[i][textField], list[i][valueField]);
			op.item = list[i];
		}
	},

	checkOrSelect: function (o, value) {
		for (var i = 0; i < o.length; i++) {
			if (value == o[i].value) {
				if (o.tagName.toLowerCase() == "select") {
					o[i].selected = true;
				}
				else {
					o[i].checked = true;
				}
				return;
			}
		}
	},

	clearItemSelect: function (oSel) {
		for (var i = oSel.length - 1; i >= 0; i--) {
			oSel.remove(i);
		}
	},

	doCheck: function (oElAll, oElItems, objChk, isAll) {
		if (isAll == 0) {
			this.changeBackgroundColor(objChk, objChk.checked);
		}
		var flag = true;
		var len = oElItems.length;
		if (len != null) {
			if (isAll == 0) {
				if (objChk.checked == true) {
					for (var i = 0; i < len; i++) {
						if (oElItems[i].checked == false) {
							flag = false;
							break;
						}
					}
					oElAll.checked = flag;
				}
				else {
					oElAll.checked = false;
				}
			}
			else {
				for (var i = 0; i < len; i++) {
					if (!oElItems[i].checked) this.changeBackgroundColor(oElItems[i], objChk.checked);
					oElItems[i].checked = objChk.checked;
				}
			}
		}
		else {
			if (isAll == 0) {
				oElAll.checked = objChk.checked;
			}
			else {
				oElItems.checked = objChk.checked;
				this.changeBackgroundColor(oElItems, oElItems.checked);
			}
		}
	},

	// ---------------------------Use for insert or remove value have comma---------------------------------
	removeStrIncludeComma: function (str, v) {
		if (str.indexOf(v) != 0) {
			v = "," + v;
		}
		else {
			v = (str.indexOf(",") != -1) ? v + "," : v;
		}
		return str.replace(v, "");
	},

	addStrIncludeComma: function (str, v) {
		if (str != "") {
			str += ",";
		}
		str += v;
		return str;
	},

	//
	// ---------------------------Find the parent by tagname of element---------------------------------
	//
	getParentByTagName: function (element, tagName) {
		while (element) {
			if (element.tagName == tagName) {
				return element;
			}
			element = element.parentNode;
		}
		return null;
	},

	formatNumber: function (num, charSep) {
		var s = num + "";
		var arrTemp = s.split(".");
		var re = arrTemp[0];
		if (arrTemp[0].length > 3) {
			var first = arrTemp[0].length % 3;
			first = first == 0 ? 3 : first;
			re = "";
			var counter = 0;
			for (var i = 0; i < arrTemp[0].length; i++) {
				re += arrTemp[0].charAt(i);
				if (i + 1 > first) {
					counter++;
					if (counter == 3 && arrTemp[0].length > i + 1) {
						re += charSep;
						counter = 0;
					}
				}
				else if (i + 1 == first) {
					re += charSep;
				}
			}
		}
		if (arrTemp[1] != null && arrTemp[1].trim().length > 0) {
			re += (charSep == "." ? "," : ".") + arrTemp[1];
		}
		return re;
	}
};

var utilObj = new UtilBTD();

var Tip = {
	elTip: null,

	createElTip: function () {
		if (this.elTip == null) {
			var strCss = ".tipCss { border: solid 1px #000; background-color: #FFFFD2; padding: 5px; max-width: 300px; -webkit-box-shadow: 2px 2px 2px #A0A0A0; -moz-box-shadow: 2px 2px 2px #A0A0A0; box-shadow: 2px 2px 2px #A0A0A0; z-index:100000; }";
			utilObj.createStyle(strCss);
			this.elTip = utilObj.createEl("DIV");
			this.elTip.className = "tipCss";
			this.elTip.style.display = "block";
			this.elTip.style.position = "absolute";
			utilObj.addChildToBody(this.elTip);
		}
	},

	displayData: function (data) {
		this.createElTip();
		this.elTip.innerHTML = data;
	},

	show: function (e, funcData, css) {
		this.createElTip();
		if (funcData != null) {
			if (funcData instanceof Function) {
				this.elTip.innerHTML = funcData();
			}
			else if (typeof funcData == "string") {
				this.elTip.innerHTML = funcData;
			}
			else {
				this.elTip.innerHTML = "";
				funcData.style.display = "";
				this.elTip.appendChild(funcData);
			}
		}
		if (this.elTip.innerHTML.trim() != "") {
			var pos = utilObj.mouseCoordsAndPosEl(e, this.elTip);
			this.elTip.className = css != null ? css : "tipCss";
			this.elTip.style.display = "block";
			this.elTip.style.top = pos.Y + "px";
			this.elTip.style.left = pos.X + "px";
		}
	},

	hide: function () {
		this.createElTip();
		this.elTip.style.display = "none";
		this.elTip.style.top = "-1000px";
		this.elTip.style.left = "-1000px";
	},

	register: function (el, funcData, css) {
		var self = this;
		utilObj.addEvent(el, "mousemove", function (e) {
			self.show(e, funcData, css);
		});
		utilObj.addEvent(el, "mouseout", function (e) {
			self.hide();
		});
	}
};



function CountTimer(dateVN, id) {

			if (Date.checkStringVN(dateVN)) {

				this.dateVN = Date.parseDateVN(dateVN);
			}

			this.id = id;

			this.timer = null;

		}



		CountTimer.prototype =

		{

			run: function () {

				var me = this;

				function showTime() {
					var d = new Date();
					
					var oneMilliseconds = 1000;

					var oneMinuteMilliseconds = oneMilliseconds * 60;

					var oneHourMilliseconds = oneMinuteMilliseconds * 60;

					var oneDayMilliseconds = oneHourMilliseconds * 24;

					var milliseconds = me.dateVN.getTime() + oneDayMilliseconds - d.getTime();

					var day = parseInt(milliseconds / oneDayMilliseconds, 10);

					if (day < 0) {

						clearInterval(me.timer);

						return;

					}

					var milliRemain = milliseconds % oneDayMilliseconds;

					var h = (parseInt(milliRemain / oneHourMilliseconds, 10) + (day * 24)).toString();

					milliRemain = milliRemain % oneHourMilliseconds;

					var m = parseInt(milliRemain / oneMinuteMilliseconds, 10).toString();

					milliRemain = milliRemain % oneMinuteMilliseconds;

					var s = parseInt(milliRemain / oneMilliseconds, 10).toString();



					document.getElementById("hours" + me.id).innerHTML = h;

					if (m.length < 2) {

						m = "0" + m;

					}

					document.getElementById("minutes" + me.id).innerHTML = m;

					if (s.length < 2) {

						s = "0" + s;

					}

					document.getElementById("seconds" + me.id).innerHTML = s;

				}

				this.timer = setInterval(function () { showTime(); }, 1000);

			}


};


function CountTimerbtm(dateVN, id) {

    if (Date.checkStringVN(dateVN)) {

        this.dateVN = Date.parseDateVN(dateVN);
    }

    this.id = id;

    this.timer = null;

}



CountTimerbtm.prototype =

		{

		    run: function () {

		        var me = this;

		        function showTime() {
		            var d = new Date();

		            var oneMilliseconds = 1000;

		            var oneMinuteMilliseconds = oneMilliseconds * 60;

		            var oneHourMilliseconds = oneMinuteMilliseconds * 60;

		            var oneDayMilliseconds = oneHourMilliseconds * 24;

		            var milliseconds = me.dateVN.getTime() + oneDayMilliseconds - d.getTime();

		            var day = parseInt(milliseconds / oneDayMilliseconds, 10);

		            if (day < 0) {

		                clearInterval(me.timer);

		                return;

		            }

		            var milliRemain = milliseconds % oneDayMilliseconds;

		            var h = (parseInt(milliRemain / oneHourMilliseconds, 10) + (day * 24)).toString();

		            milliRemain = milliRemain % oneHourMilliseconds;

		            var m = parseInt(milliRemain / oneMinuteMilliseconds, 10).toString();

		            milliRemain = milliRemain % oneMinuteMilliseconds;

		            var s = parseInt(milliRemain / oneMilliseconds, 10).toString();



		            document.getElementById("hoursbtm" + me.id).innerHTML = h;

		            if (m.length < 2) {

		                m = "0" + m;

		            }

		            document.getElementById("minutesbtm" + me.id).innerHTML = m;

		            if (s.length < 2) {

		                s = "0" + s;

		            }

		            document.getElementById("secondsbtm" + me.id).innerHTML = s;

		        }

		        this.timer = setInterval(function () { showTime(); }, 1000);

		    }

		};
