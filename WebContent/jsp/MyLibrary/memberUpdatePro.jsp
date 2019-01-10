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

		// 세션값 유지
		String id = (String) session.getAttribute("id");

		System.out.println("id : " + id);

		if (id == null) {
			response.sendRedirect("login.jsp");
		}

		System.out.println("id : " + id);

		// 액션태그 
		// MemberBean mb 객체 생성 -> 전달받은 파라미터값 저장
	%>

	<jsp:useBean id="mb" class="Library.Member.MemberBean" />
	<jsp:setProperty property="*" name="mb" />

	<%
		// MemberDAO 객체 생성 -> 업데이트 처리 
		MemberDAO mdao = new MemberDAO();

		// 메서드 생성 처리 (updateMember(mb))
		// => 자바 스크립트 사용
		// 1 => "수정 성공" alert, => main.jsp
		// 0 => "비밀번호 오류" alert => 이전 페이지로 이동
		// -1 => "아이디 없음" alert => 이전 페이지로 이동
		int check = mdao.updateMember(mb);

		if (check == 1) {
	%>
	<script type="text/javascript">
		alert("회원 정보 수정 성공");
		location.href = "memberUpdate.jsp";
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