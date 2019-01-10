<%@page import="Library.Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
	
		// 세션값 가져오기
		String id = (String) session.getAttribute("id");
		
		// 세션값없을때 로그인페이지로 이동
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}
		
		// 파라미터 id,pass 저장
		String pass = request.getParameter("pass");
%>

<jsp:useBean id="mb" class="Library.Member.MemberBean" />
	<jsp:setProperty property="*" name="mb" />

	<%
		// MemberDAO 객체 생성 -> 메서드 호출
		MemberDAO mdao = new MemberDAO();
		System.out.println(pass);
		int check = mdao.deleteMember(id, pass);
		// 1 -> "삭제완료", main.jsp
		if (check == 1) {
			session.invalidate();
			mdao.deleteMember(id, pass);
	%>
	<script type="text/javascript">
		alert("회원 탈퇴 되었습니다.");
		location.href = "../../jsp/common/main.jsp";
	</script>
	<%
		} else if (check == 0) {
	%>
	<script type="text/javascript">
		alert("비밀번호 오류");
		System.out.println("비밀번호 오류");
		history.back();
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("아이디 없음");
		System.out.println("아이디 없음");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>