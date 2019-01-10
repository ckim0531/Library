<%@page import="Library.Member.MemberBean"%>
<%@page import="Library.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/member.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<%
	// 세션값 가져오기(id)
	String id = (String)session.getAttribute("id");

	// 세션값 없을 경우 로그인 페이지로 이동
	if(id == null)
		response.sendRedirect("loginForm.jsp");
	
	// MemberDAO 객체 생성 -> 회원 정보 찾아오기 
	MemberDAO mdao = new MemberDAO();
	
	// MemberBean 타입 객체 <- getMember(id)
	MemberBean mb = mdao.getMember(id);
	
	// 아이디(수정불가 상태 ), 비밀번호 -> 처리 페이지 이동(deletePro.jsp)
	%>

<div id="container">
	<div>
		<div id="left">
			<h2>나의 도서관</h2>
			<ul>
				<li>
					<a href="../../jsp/notice/noticeList.jsp">대출/예약 내역</a>
				</li>
				<li>
					<a href="../../jsp/MyLibrary/memberUpdate.jsp">정보수정</a>
				</li>
				<li class="on">
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
			<h3>회원탈퇴</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 나의 도서관 > 회원탈퇴
			</p>
			<p>
				회원탈퇴를 하시면 회원님의 모든 정보가 삭제되며, 홈페이지를 통해 동의한 "맞춤형서비스제공"도 중지됩니다.
			</p>
			<div class="tblType01 mt05">
				<table summary="희망도서신청서 작성">
					<caption>희망도서신청서 작성</caption>
					<colgroup>
						<col width="120px">
						<col width="">
					</colgroup>
					<tbody>
						<form id="LoginForm" method="post" action="memberDeletePro.jsp">
							<tr>
								<th scope="row" class="al l30">성명 <span class="fcOr">*</span></th>
								<td>
									<input type="hidden" name="name" id="name" value="<%=mb.getName()%>">
									<%=mb.getName()%>
								</td>
							</tr>
							<tr>
								<th scope="row" class="al l30">아이디 <span class="fcOr">*</span></th>
								<td colspan="3">
									<input type="hidden" name="id" id="id" value="<%=mb.getId()%>">
									<%=mb.getId()%>
								</td>
							</tr>
							<tr>
								<th scope="row" class="al l30">비밀번호 <span class="fcOr">*</span></th>
								<td>
									<input type="password" id="pass" name="pass"
										size="10" title="비밀번호 입력란" required="required">
								</td>
							</tr>
								<div class="mt20">
								<input type="submit" value="탈퇴하기">
							</div>
						</form>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>