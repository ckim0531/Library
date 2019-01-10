$(function(){
	/* topMenu */
	$(".topMenu > ul > li > a").mouseover(function(){
		$(".topMenu > ul > li > ul").hide();
		$(this).parent().children("ul").slideDown("normal");
		$(".top_bg").slideDown("normal");
	});
	$(".topMenu > ul > li > ul").mouseleave(function(){
		$(this).hide();
		$(".top_bg").slideUp("normal");
	});

	// 탭
	$('.tab_menu li a').click(function(){
		$('.tabCont > div').hide().eq($(this).parent().index()).show();
		$('.tab_menu li').removeClass('active').eq($(this).parent().index()).addClass('active');
	});
	$('.tab_menu2 li a').click(function(){
		$('.tabCont2 > div').hide().eq($(this).parent().index()).show();
		$('.tab_menu2 li').removeClass('on').eq($(this).parent().index()).addClass('on');
	});
});

// 기본 팝업
function popup(url,id,width,height) {
	window.open(url,id,"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,left=0, top=0, resizable=no,width=" + width + "px,height=" + height + "px");
}

function MM_openBrWindow(theURL,winName,features) { 
	window.open(theURL,winName,features); 
}

// http: 변환
function protocolHTTPFn(){
	var _protocol	= location.protocol.toLowerCase();
	var _host		= location.host;
	var _pathname	= location.pathname;
	var _search		= location.search;
	
	if(_protocol == 'https:'){
		 location.href = 'http://'+_host+_pathname+_search;;
	}
}
//https: 변환
function protocolHTTPSFn(){
	/*		
	location.href		// http://localhost:8088/login/login.do?key=value
	location.protocol	// http:
	location.host		// localhost:8088 
	location.pathname	// /login/login.do
	location.search		// ?key=value
	*/	
	var _protocol	= location.protocol.toLowerCase();
	var _host		= location.host;
	var _returnStr	= _protocol+'//'+_host;
	
	if(_protocol == 'http:' && _host.indexOf('localhost') < 0){
		_returnStr	= 'https://'+_host;
	}
	
	return _returnStr;
}

function setCookie( name, value, expiredays ) { 
        var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() + expiredays ); 
        document.cookie = name + "=" + escape( value ) + "; path=/;expires=" + todayDate.toGMTString() + ";" 
}


function getCookie( name ) {
		var nameOfCookie = name + "=";
		var x = 0;
		while ( x <= document.cookie.length )
		{
			var y = (x+nameOfCookie.length);
			if ( document.cookie.substring( x, y ) == nameOfCookie ) {
				if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
					endOfCookie = document.cookie.length;
				return unescape( document.cookie.substring( y, endOfCookie ) );
			}
			x = document.cookie.indexOf( " ", x ) + 1;
			if ( x == 0 )
				break;
		}
		return "";
}