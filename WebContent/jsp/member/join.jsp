<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_tab.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/member.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../../js/member/join.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../../js/member/joinAddr.js" charset="utf-8"></script>

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
		<div class="conts">
			<!-- 숨겨진 변수 하나 생성 -->
			<!-- 회원가입을 눌렀을 때 아이디 중복 검사를 했는지 판단하기 위해 -->
			<input type="hidden" id="idCheck" value="false">
			
			<h3>회원가입</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 회원서비스 > 회원가입
			</p>
			<div class="tblType01 type5">
				<table>
					<caption>기본정보</caption>
					<colgroup>
						<col width="100px">
						<col>
						<col width="106px">
						<col>
					</colgroup>
					<tbody>
						<form name="joinForm" id="AraJoin" method="post" action="../../jsp/member/joinProc.jsp">
							<tr>
								<th scope="row">성명</th>
								<td colspan="3">
									<input type="text" name="name" id="name" required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">아이디</th>
								<td colspan="3">
									<!-- <input type="text" name="id" id="id" onkeypress="IDchecker(this);"> -->
									<!-- <a href="javascript:idCheck();" class="btn001">아이디 중복</a> -->
									<!-- * 6~12자 이하, 영문대문자 숫자 조합(첫자는 영문만가능) -->
									<input type="text" name="id" id="id" required="required"
										onchange="joinIdCheck()">
									<span id="joinCheckIdText"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td colspan="3">
									<input type="password" name="pass" id="pass"
										maxlength="20" style="width: 300px;" required="required"
										onchange="joinPassCheck()"><br>
									<span id="joinCheckPassText"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호<br>확인</th>
								<td colspan="3">
									<input type="password" name="passSame" id="passSame"
										maxlength="20" style="width: 300px;" required="required"
										onchange="joinPassSameCheck()"><br>
									<span id="joinCheckPassSameText"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">E-mail</th>
								<td colspan="3">
									<input type="email" name="email" id="email"  required="required">
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="3">
									<input type="text" readonly="readonly" id="joinZipcode"
										placeholder="우편번호" name="addr">
									<input type="button" class="btn001 type2" onclick="joinAddrFind()"
										value="우편번호 찾기"><br>
									<input type="text" class="mt10" readonly="readonly" id="joinAddr"
										placeholder="주소" name="addr2">
									<input type="text" class="mt10" id="joinAddr2" placeholder="상세주소"
										required="required" name="addr3">
									
									<!-- <input size="6" readonly="readonly" title="우편번호 입력" type="text"
										style="width: 110px;" name="zipcode" id="zipcode"
										required="required"  placeholder="우편번호"> 
									<a href="javascript:joinAddrFind();" class="btn001 type2">우편번호</a><br>
									<input class="mt10" size="60" title="주소 입력" type="text"
										style="width: 600px" name="address" id="address" required="required"> -->
								</td>
							</tr>
							<div class="temsOk type2">
								<input type="submit" value="확인">
								<input type="reset" value="취소">
								<!-- <a href="javascript:joinCheck();">확인</a> 
								<a href="../../join/join_main.jsp">취소</a> -->
							</div>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>