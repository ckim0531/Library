<%@page import="Library.Mail.SMTPAuthenticatior"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	System.out.println("from : " + from);
	System.out.println("to : " + to);
	System.out.println("subject : " + subject);
	System.out.println("content : " + content);

	// Properties
	// 객체에 SMTP 서버 접속에 필요한 정보를 저장하여 인증하고 세션을 얻어오고,
	// 현재 Properties 객체에 넣는 정보들은 naver SMTP 서버에 인증하기 위한 정보
	Properties p = new Properties(); // 정보를 담을 객체

	p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP

	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들

	try {
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		// MimeMessage 클래스에 전달한 입력값들을 저장
		MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		msg.setSubject(subject); // 제목

		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr); // 보내는 사람

		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

		msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

		// Transport 객체의 send 메서드를 이용하여 메일을 보냄
		Transport.send(msg); // 전송
		
		response.sendRedirect("../../jsp/MyLibrary/mail.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("메일 전송 실패");
		// 오류 발생시 뒤로 돌아가도록
		return;
	}
	// 성공 시
%>