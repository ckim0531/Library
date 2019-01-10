<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/loginFind.css">

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
				<li>
					<a href="../../jsp/member/login.jsp">로그인</a>
				</li>
				<li>
					<a href="../../jsp/member/join_main.jsp">회원가입</a>
				</li>
				<li class="on">
					<a href="../../jsp/member/join_find.jsp">아이디/비밀번호 찾기</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>아이디/비밀번호 찾기</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 회원서비스 > 아이디/비밀번호 찾기
			</p>
			<p class="summary">도서관 회원으로 가입하셔서 다양한 혜택을 누리세요.</p>
			<ul class="tab_menu2 tabList03">
				<li class="on">
					<a href="javascript:hpgpin('handphone');">본인 확인(휴대폰)</a>
				</li>
				<li>
					<a href="javascript:hpgpin('gpin');">아이핀 확인(i-pin)</a>
				</li>
			</ul>
			<div class="tabCont2">
				<form name="form_ipin" id="form_ipin" method="post">
					<input type="hidden" name="param_r1" value="I">
					<input type="hidden" name="param_r2" value="">
					<input type="hidden" name="param_r3" value="">
				</form>

				<form name="form_ipin_pw" method="post">
					<input type="hidden" name="m" value="pubmain">
					<!-- 필수 데이타로, 누락하시면 안됩니다. -->
					<input type="hidden" name="param_r1" value="PW"> <input
						type="hidden" name="param_r2" value=""> <input
						type="hidden" name="param_r3" value="">
				</form>

				<form id="FindID" name="FindID" method="post">
					<input type="hidden" name="UTYPE" value="I" /> <input
						type="hidden" name="m" value="" /> <input type="hidden"
						name="EncodeData"
						value="AgAFRzY3NjWJP0gVx4/Hgs7XB5C/wbAzWSBVEwyXx1AraqwKa1ZFymmCUBHiN4okdq9I6lKpMbJ583pJE7BrTiMjbIfDCU7IdJiO4XbJnLA7sxbGU1CAPNZbYne2TjnTjMDJUbRlqonzrVFmtEzi/jE8oLyhW/ZaltbfHkhH/arX0Zwqzob3xTTPmADasLmOuMlBVJisIYZEP8bpu1J/OsTrPmdI+2Id1YzVqzKjH0IYq2Q6j3CDz44Z1r1fj0IvDRzsuwUD3uOkF3pHh9WrSvKjrR750AyUNThz49ubYEk56bMgS6Gr9DwL7k2P6/rLxeNsJToNqHAPWg8M94DSCRF81mqlLtynQo3AGQC59/LhbUxw2/JPJnM2v7VdOdbNryFwFU7+B05z+Vq3qtQKMa2KSFmeEmdy0raTcOg6jStmbqmRsHl0Lu2qEDsg1VSCStnmQ7bxuIZz+ISPPMUMV+QwB8yvMn9TrMf2RTKUlChMLvYgvLhGk8eqd6WFRqxyMTzPVPgO3XM=">
					<input type="hidden" name="param_r1" value=""> <input
						type="hidden" name="param_r2" value=""> <input
						type="hidden" name="param_r3" value="">
					<div id="handphone">
						<div class="txtBox">
							<p class="tit">아이디 찾기</p>
							<p class="txt">
								본인확인 서비스는 정보통신망법 및 개인정보보호법 개정에<br> 따라 주민번호를 사용하지 않고 휴대폰,
								공인인증서 인증이<br>가능하도록 제공하고 있습니다.
							</p>
							<p class="link">
								NICE 평가정보 : <a href="https://www.idcheck.co.kr/" title="새창으로 열기"
									target="_blank" class="fcO">https://www.idcheck.co.kr</a>
							</p>
							<a href="javascript:checkIDform();" class="btnClick">인증하기</a>
						</div>
						<div class="txtBox">
							<p class="tit">비밀번호 찾기</p>
							<p class="txt">
								회원님의 정보를 입력하시면 <span class="fcO">등록된 휴대전화번호로 임시<br>비밀번호
								</span>를 발송해 드립니다.
							</p>
							<label><span>아이디</span><input type="text" name="UID"></label>
							<label><span>성 명</span><input type="text" name="UNAME"></label>
							<p class="link">
								NICE 평가정보 : <a href="https://www.idcheck.co.kr/" title="새창으로 열기"
									target="_blank" class="fcO">https://www.idcheck.co.kr</a>
							</p>
							<a href="javascript:checkPWform();" class="btnClick">인증하기</a>
						</div>
					</div>
				</form>

				<form id="FindPWD" name="FindPWD" method="post">
					<input type="hidden" name="UTYPE" value="PW" /> <input
						type="hidden" name="m" value="" /> <input type="hidden"
						name="EncodeData"
						value="AgAFRzY3NjWJP0gVx4/Hgs7XB5C/wbAzWSBVEwyXx1AraqwKa1ZFymmCUBHiN4okdq9I6lKpMbJ583pJE7BrTiMjbIfDCU7IdJiO4XbJnLA7sxbGU1CAPNZbYne2TjnTjMDJUbRlqonzrVFmtEzi/jE8oLyhW/ZaltbfHkhH/arX0Zwqzob3xTTPmADasLmOuMlBVJisIYZEP8bpu1J/OsTrPmdI+2Id1YzVqzKjH0IYq2Q6j3CDz44Z1r1fj0IvDRzsuwUD3uOkF3pHh9WrSvKjrR750AyUNThz49ubYEk56bMgS6Gr9DwL7k2P6/rLxeNsJToNqHAPWg8M94DSCRF81mqlLtynQo3AGQC59/LhbUxw2/JPJnM2v7VdOdbNryFwFU7+B05z+Vq3qtQKMa2KSFmeEmdy0raTcOg6jStmbqmRsHl0Lu2qEDsg1VSCStnmQ7bxuIZz+ISPPMUMV+QwB8yvMn9TrMf2RTKUlChMLvYgvLhGk8eqd6WFRqxyMTzPVPgO3XM=">
					<input type="hidden" name="param_r1" value=""> <input
						type="hidden" name="param_r2" value=""> <input
						type="hidden" name="param_r3" value="">
					<div id="gpin" style="display: none">
						<div class="txtBox">
							<p class="tit">아이디 찾기</p>
							<p class="txt">
								개정 "주민등록법"에 의해 타인의 주민등록번호를 부정사용하는 자는 3년 이하의 징역 또는 1천만원, 이하의 벌금이
								부과될 수 있습니다.<br>관련법률_주민등록법 제37조(벌칙) 제10호
							</p>
							<p class="link">
								NICE 평가정보 : <a href="https://www.idcheck.co.kr/" title="새창으로 열기"
									target="_blank" class="fcO">https://www.idcheck.co.kr</a>
							</p>
							<a href="javascript:fnPopup_ipin_id();" class="btnClick">인증하기</a>
						</div>
						<div class="txtBox">
							<p class="tit">비밀번호 찾기</p>
							<p class="txt">
								회원님의 정보를 입력하시면 <span class="fcO">등록된 휴대전화번호로 임시<br>비밀번호
								</span>를 발송해 드립니다.
							</p>
							<label><span>아이디</span><input type="text" name="IUID"></label>
							<label><span>성 명</span><input type="text" name="IUNAME"></label>
							<p class="link">
								공공I-PIN 센터 : <a
									href="http://www.gpin.go.kr/center/main/index.gpin"
									title="새창으로 열기" target="_blank" class="fcO">http://www.gpin.go.kr</a>
							</p>
							<a href="javascript:fnPopup_ipin_pw();" class="btnClick">인증하기</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>