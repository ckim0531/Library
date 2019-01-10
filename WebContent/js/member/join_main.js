function frmCheck() {
	/* 한 개씩 클릭시 */
	if ($("#joinCheck1").is(":checked") == false) {
		alert("도서관 이용약관에 동의하셔야 합니다.");
		$("#joinCheck1").focus();
		return;
	}
	if ($("#joinCheck2").is(":checked") == false) {
		alert("회원가입 이용약관에 동의하셔야 합니다.");
		$("#joinCheck2").focus();
		return;
	}
	if ($("#joinCheck3").is(":checked") == false) {
		alert("개인정보취급방침에 동의하셔야 합니다.");
		$("#joinCheck3").focus();
		return;
	}
	if ($("#joinCheck4").is(":checked") == false) {
		alert("개인정보 수집·이용에 동의하셔야 합니다.");
		$("#joinCheck4").focus();
		return;
	}
	if ($("#joinCheck5").is(":checked") == false) {
		alert("개인정보의 제3자 제공에 동의하셔야 합니다.");
		$("#joinCheck5").focus();
		return;
	}

	$("#frm").attr("action", "../../jsp/member/join.jsp");
	$("#frm").submit();
}