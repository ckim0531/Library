<%@page import="Library.Member.MemberDAO"%>
<%@page import="Library.Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/common/commonBoardBtn.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/member.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../../js/member/memberUpdate.js" charset="utf-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../../js/member/joinAddr.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<%
	//세션값 가져오기(id)
	String id = (String) session.getAttribute("id");

	//세션값 없을경우 로그인 페이지로 이동
	if(id == null)
		response.sendRedirect("../../jsp/member/login.jsp");
	
	// 아이디, 이름을 제외한 나머지 항목 수정
	
	// 세션에 저장된 아이디를 가져와서 그 아이디 해당하는 회원정보를 가져온다.
	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(id);
%>
									
<div id="container">
	<div>
		<div id="left">
			<h2>나의 도서관</h2>
			<ul>
				<li>
					<a href="../../jsp/notice/noticeList.jsp">대출/예약 내역</a>
				</li>
				<li class="on">
					<a href="../../jsp/MyLibrary/memberUpdate.jsp">정보수정</a>
				</li>
				<li>
					<a href="../../jsp/MyLibrary/memberDelete.jsp">회원탈퇴</a>
				</li>
				<!-- 관리자만 -->
				<%
					if (id != null) {
						if (id.equals("admin")) {
				%>
				<li>
					<a href="../../jsp/MyLibrary/mail.jsp">메일 보내기</a>
				</li>
				<li>
					<a href="../../jsp/MyLibrary/message.jsp">문자 보내기</a>
				</li>
				<%
						}
					}
				%>
				<!-- 관리자만 -->
			</ul>
		</div>
		<div class="conts">
			<h3>정보수정</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 나의 도서관 > 정보수정
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
						<form id="join" name="join" method="post"
							action="memberUpdatePro.jsp">
							<tr>
								<th scope="row">성명</th>
								<td>
									<input type="hidden" name="name" id="name" value="<%=mb.getName()%>">
									<%=mb.getName()%>
								</td>
							</tr>
							<tr>
								<th scope="row">아이디</th>
								<input type="hidden" name="id" id="id" value="<%=mb.getId()%>">
								<td colspan="3"><%=id%></td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<input type="password" name="pass" id="pass" maxlength="20" required="required"
										onchange="joinPassCheck()"><br>
								</td>
							</tr>
							<tr>
								<th scope="row">E-mail</th>
								<td colspan="3">
									<input type="text" id="email" name="email" value="<%=mb.getEmail()%>" />
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="3">
									<%
									if(mb.getAddr() != null) {
									%>
									<input type="text" readonly="readonly" id="joinZipcode"
										placeholder="우편번호" name="addr" value="<%=mb.getAddr()%>">
									<input type="button" class="btn001 type2" onclick="joinAddrFind()"
										value="우편번호"><br>
									<input type="text" class="mt10" readonly="readonly" id="joinAddr"
										placeholder="주소" name="addr2" value="<%=mb.getAddr2()%>">
									<input type="text" class="mt10" id="joinAddr2" placeholder="상세주소"
										required="required" name="addr3" value="<%=mb.getAddr3()%>">
									<%
									}
									else {
									%>
									<input type="text" readonly="readonly" id="joinZipcode"
										placeholder="우편번호" name="addr" value="">
									<input type="button" class="btn001 type2" onclick="joinAddrFind()"
										value="우편번호"><br>
									<input type="text" class="mt10" readonly="readonly" id="joinAddr"
										placeholder="주소" name="addr2" value="">
									<input type="text" class="mt10" id="joinAddr2" placeholder="상세주소"
										required="required" name="addr3" value="">
									<%
									}
									%>
								</td>
							</tr>
							<div class="temsOk type2">
								<input type="submit" value="수정"> 
								<a href="../../index.html">취소</a>
							</div>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>