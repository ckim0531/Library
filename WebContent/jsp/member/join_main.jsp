<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/join_main.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../../js/member/join_main.js" charset="utf-8"></script>
<script type="text/javascript" src="../../js/member/join_main_checkAll.js" charset="utf-8"></script>
		
<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>회원서비스</h2>
			<ul>
				<li>
					<a href="../../jsp/member/login.jsp">로그인</a>
				</li>
				<li class="on">
					<a href="../../jsp/member/join_main.jsp">회원가입</a>
				</li>
				<li>
					<a href="../../jsp/member/join_find.jsp">아이디/비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		<form name="frm" id="frm" method="post">
			<div class="conts">
				<h3>약관동의</h3>
				<p id="nav">
					<img src="../../images/common/icon_home.png" alt="메인"> 회원서비스 > 약관동의
				</p>
				<p class="summary"> 약관 및 개인정보 수집·이용에 대한 안내를 읽으시고 동의여부를 결정하시기바랍니다.</p>
				<br>
				<div class="btnBoxR">
					<label id="joinAgreeAll">
						<input type="checkbox" name="joinCheckAll" id="joinCheckAll" value="Y"> 전체 이용약관에 동의합니다.
					</label>
				</div>
				<div class="temsBox mt30" tabindex="0">
					<p class="tit">(필수) 약관동의</p>
					약관동의
				</div>
				<div class="btnBoxR">
					<label>
						<input type="checkbox" name="joinCheck" id="joinCheck1" value="Y"> 도서관 이용약관에 동의합니다.
					</label>
				</div>
				<div class="temsBox" tabindex="0">
					<p class="tit">(필수) 회원가입 이용약관</p>
					<strong class="b">[ 제1장 총칙 ]</strong>
				</div>
				<div class="btnBoxR">
					<label>
						<input type="checkbox" name="joinCheck" id="joinCheck2" value="Y"> 이용약관에 동의합니다.
					</label>
				</div>
				<div class="temsBox" tabindex="0">
					<p class="tit">(필수) 개인정보 취급 방침</p>
					개인정보 취급 방침
				</div>
				<div class="btnBoxR">
					<label>
						<input type="checkbox" name="joinCheck" id="joinCheck3" value="Y"> 개인정보 취급방침에 동의합니다.
					</label>
				</div>
				<div class="temsBox" tabindex="0">
					<p class="tit">(필수) 개인정보 수집, 이용동의</p>
					<strong>1. 개인정보의 수집항목 및 수집방법</strong>
				</div>
				<div class="btnBoxR">
					<label>
						<input type="checkbox" name="joinCheck" id="joinCheck4" value="Y"> 개인정보 수집, 이용동의에 동의합니다.
					</label>
				</div>
				<div class="temsBox" tabindex="0">
					<p class="tit">(필수) 수집한 개인정보의 제 3자 제공 동의</p>
					수집한 개인정보의 제 3자 제공 동의
				</div>
				<div class="btnBoxR">
					<label>
						<input type="checkbox" name="joinCheck" id="joinCheck5" value="Y"> 수집한 개인정보의 제 3자 제공 동의에 동의합니다.
					</label>
				</div>
				<div class="temsBox type2">
					<p class="tit">SMS 서비스 수신 동의</p>
					SMS 서비스 수신 동의
				</div>
				<div class="btnBoxR">
					<label>
						<input type="checkbox" name="joinCheck" id="joinCheck6" value="Y"> SMS서비스 수신동의에 동의합니다.
					</label>
				</div>
				<div class="temsOk">
					<a href="javascript:frmCheck();">확인</a>
				</div>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>