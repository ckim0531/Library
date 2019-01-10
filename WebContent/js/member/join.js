/*---------------------------------------------------------------------*
 *	1. 확장문자 (: backslash)											   *
 *	   - s : 공백 문자(스페이스, 탭, 폼 피드, 라인 피드)						   *
 *	   - b : 단어의 경계												   *
 *	   - B 이를 제외한 모든 문자 매칭										   *
 *	   - d : 숫자													   *
 *	   - D : 숫자가 아닌 문자 [^0-9] 와 동일								   *
 *	   - w : 알파벳, 숫자로 된 문자, 밑줄 기호(_) [A-Za-z0-9]				   *
 *	   - W : w의 반대 문자 [^A-Za-z0-9]									   *
 *	   - 특수문자 : 특수문자 자체를 의미 예) + (+ 기호 자체)					   *
 *																	   *
 *	2. 특수문자														   *
 *	   - * : 0회 이상 반복												   *
 *	   - + : 1회 이상 반복												   *
 *	   - ? : 0 또는 1개의 문자 매칭										   *
 *	   - . : 정확히 1개 문자 매칭											   *
 *																	   *
 *	3. 플래그															   *
 *	   - g : 전역매칭													   *
 *	   - i : 대소문자 무시												   *
 *	   - m : 여러 줄 매칭												   *
 *																	   *
 *	4. 기타															   *
 *	   - () : 괄호로 묶인 패턴은 매칭된 다음, 그 부분을 기억한다.					   *
 *	   - $1,...,$9 : 괄호로 갭처한 부분 문자열이 저장 됨.						   *
 *	   - | : ~ 또는 ~													   *
 *	   - {} : 반복 횟수												   *
 *																	   *
 *	간단한 정규 표현식													   *
 *	   - var a = /a/			 --a 가 있는 문자열						   *
 *	   - var a = /a/i			 --a 가 있는 문자열, 대소문자 구분 안함		   *
 *	   - var a = /apple/		 -- apple이 있는 문자열					   *
 *	   - var a = /[a-z]/		 -- a ~ z 사이의 모든 문자				   *
 *	   - var a = /[a-zA-Z0-9]/	 -- a ~ z, A ~ Z, 0 ~ 9 사이의 모든 문자	   *
 *	   - var a = /[a-z]|[0-9]/	 -- a ~ z 혹은 0 ~ 9사이의 문자			   *
 *	   - var a = /a|b|c/		 -- a 혹은 b 혹은 c인 문자				   *
 *	   - var a = /[^a-z]/		 -- a~z까지의 문자가 아닌 문자("^" 부정)	   *
 *	   - var a = /^[a-z]/		 -- 문자의 처음이 a ~ z로 시작되는 문장		   *
 *	   - var a = /[a-z]$/		 -- 문자가 a ~ z로 끝남					   *
 *	   - var a = /^[0-9]+$/		 -- 숫자만							   *
 *	   - var a = /^[a-zA-Z]+$/	 -- 영문자만							   *
 *	   - var a = /^[ㄱ-힣]+$/		 -- 한글만						   *
 *	   - var a = /^[a-zA-Z0-9]*$/	 -- 영어, 숫자만					   *
 *---------------------------------------------------------------------*/

 /*--------------------------------------------------------------------*
 * 아이디 체크 ( ajax )													   *
 *																	   *
 * 입력받은 아이디와 member 디비 아이디가 같으면 -> 아이디가 있습니다				   *
 *　　　　　　　　　　　　　　			  다르면 -> 사용가능한 아이디입니다			   *
 * 입력받은 아이디 제한													   *
 *	-> 6 ~ 12 글자													   *
 *	-> 첫글자 영어														   *
 *	-> 영어, 숫자만 사용 가능												   *
 *---------------------------------------------------------------------*/

function joinIdCheck() {
	// 입력받은 아이디가 없을 때
	if($('#id').val().length == "") {
		$('#joinCheckIdText').html("아이디를 입력해주세요.");
	}
	// 입력받은 아이디가 6 ~ 12글자일 때 
	else if (!($('#id').val().length >= 6 && $('#id').val().length <= 12)) {
		$('#joinCheckIdText').html("아이디는 6 ~ 12글자 입니다.");
		
		// 입력한 id값 없애기 
		$('#id').val("");
	}
	else if(!($('#id').val().equals("/^[a-zA-Z]+$/")) ) {
		// 첫글자 영어 /^[a-zA-Z]+$/
		// 첫 글자가 영어가 아닐 때
		$('#joinCheckIdText').html("첫 글자는 영어로 시작해주세요.");
		
		// 입력한 id값 없애기 
		$('#id').val("");
	}
	else if($('id').val().equals("/^[0-9]/")) {
		// 첫 글자가 숫자일 때 /^[0-9]+$/
		$('joinCheckIdText').html("첫 글자는 영어로 시작해주세요.");
		
		// 입력한 id값 없애기
		$('#id').val("");
	}
	else if($('id').val().equals("")) {
		// 첫 글자가 특수문자일 때 /^[
		$('joinCheckIdText').html("첫 글자는 영어로 시작해주세요.");
		
		// 입력한 id값 없애기
		$('#id').val("");
	}
	else if(!($('#id').val().equals("^[a-zA-Z0-9]*$"))) {
		// 영어, 숫자만 사용 가능 /^[A-Za-z0-9]+$/
		$('#joinCheckIdText').html("영어, 숫자만 사용 가능합니다.");
		
		// 입력한 id값 없애기 
		$('#id').val("");
	}
	else {
		$.ajax({
			type : "POST", // method="POST" 방식으로 출력 
			url : "../../jsp/join/joinCheckId.jsp", // id 체크하는 jsp 파일 주소 불러오기 
			data : {
				// <input type="text" id="id"> 값 불러와서 inputID에 대입 
				// inputID : ajax 변수명 
				inputID : $('#id').val()
			},
			success : function(data) { // data를 가져오는 것이 성공하였을 때
				if (data == 1) { // data 값이 check 1일 때
					// 웹페이지에 아이디 중복이라고 표시 
					$('#joinCheckIdText').html("아이디 중복입니다.");

					// 입력한 id값 없애기 
					$('#id').val("");
				} else if (data == 0) {  // data 값이 check 0일 때
					// 웹페이지에 사용 가능한 아이디라고 표시 
					$('#joinCheckIdText').html("사용 가능한 아이디입니다.");
				}
			},
			error : function(xhr, status, error) { // 에러났을 때
				alert("error : " + error);
			}
		});
	}
}

/*---------------------------------------------------------------------*
 * 비밀번호 체크 ( ajax )												   *
 *																	   *
 * 입력받은 비밀번호 제한													   *
 *	-> 10 ~ 20 글자													   *
 *	-> 영어, 숫자, 특수문자 같이 사용										   *
 *		-> 하나라도 없으면												   *
 *			-> 영어, 숫자, 특수문자 같이 사용하여야 합니다						   *
 *																	   *
 * 입력받은 아이디와 member 디비 아이디가 같으면 -> 아이디가 있습니다				   *
 *　　　　　　　　　　　				  다르면 -> 사용가능한 아이디입니다			   *
 *---------------------------------------------------------------------*/

function joinPassCheck() {
	var pass = document.getElementById("pass").value;

	// 비밀번호 10 ~ 20글자 인지 검사
	if(!(pass.length >= 10 && pass.length <= 20)) {
		document.getElementById('joinCheckPassText').innerHTML = '비밀번호는 10 ~ 20글자 입니다.';
	}
	else if(pass.length >= 10 && pass.length <= 20) {
		document.getElementById('joinCheckPassText').innerHTML = '사용 가능한 비밀번호입니다.';
	}
	else if(pass.equals("")) {
		// 영어, 숫자, 특수문자 같이 사용하여야 함
		// 하나라도 없으면 -> 영어, 숫자, 특수문자 같이 사용하여야 합니다
		// 영어만 있으면
		// 숫자만 있으면
		// 특수문자만 있으면
		// 영어, 숫자만 있으면
		// 영어, 특수문자만 있으면
		// 숫자, 특수문자만 있으면
	}
}

function joinPassSameCheck() {
	joinPassCheck();
	
	var pass = document.getElementById("pass").value;
	var passSame = document.getElementById("passSame").value;
	
	// 비밀번호 같은지 검사
	if(pass != passSame) {
		document.getElementById('joinCheckPassSameText').innerHTML = '비밀번호가 다릅니다.';
	}
	else {
		document.getElementById('joinCheckPassSameText').innerHTML = '비밀번호가 같습니다.';
		
		passSum = " ";
	}
}