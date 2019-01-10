<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/login.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">


<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>회원서비스</h2>
			<ul>
				<li class="on">
					<a href="../../jsp/member/login.jsp">로그인</a>
				</li>
				<li>
					<a href="../../jsp/member/join_main.jsp">회원가입</a>
				</li>
				<li>
					<a href="../../jsp/member/join_find.jsp">아이디/비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>로그인</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 회원서비스 > 로그인
			</p>
			<p class="summary">도서관 회원으로 가입하셔서 다양한 혜택을 누리세요.</p>
			<form name="f_login" id="f_login" method="post" action="loginProc.jsp">
				<div class="loginBox">
					<p class="tit">LOGIN</p>
					<div>
						<div>
							<label>
								<span>아이디</span>
								<input type="text" name="id" id="id">
								<span id="loginText"></span>
							</label>
							<label>
								<span>비밀번호</span>
								<input type="password" name="pass" id="pass" class="mt10">
							</label>
						</div>
						<input type="submit" value="Submit" class="btnLogin">
						<!-- <a href="javascript:login_chk();" class="btnLogin">로그인</a> -->
					</div>
				</div>
			</form>
			<p class="infoTxt fl">
				아직 회원이 아니세요? 
				<a href="../../jsp/member/join_main.jsp" class="btn btn01 ml10">회원가입</a>
			</p>
			<p class="infoTxt fr">
				아이디/비밀번호를 잊으셨나요? 
				<a href="../../jsp/member/id_pass_find.jsp" class="btn btn01 ml10">
					아이디/비밀번호 찾기</a>
			</p>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>