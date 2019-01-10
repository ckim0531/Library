<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/join_welcome.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>회원서비스</h2>
			<ul>
				<li>
					<a href="../../jsp/member/join_login.jsp">로그인</a>
				</li>
				<li class="on">
					<a href="../../jsp/member/join_main.jsp">회원가입</a>
				</li>
				<li>
					<a href="../../jsp/member/join_find.jsp">아이디/비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>회원가입</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 회원서비스 > 회원가입
			</p>
			<div class="joincom">
				<div>
					<p>
						<strong>가입완료</strong> 회원 가입이 완료 되었습니다.
					</p>
				</div>
			</div>
			<a href="../../jsp/member/login.jsp" class="btnLoginGo">로그인하기</a>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>