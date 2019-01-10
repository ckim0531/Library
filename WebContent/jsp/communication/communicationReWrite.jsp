<%@page import="Library.Board.CommunicationDAO"%>
<%@page import="Library.Board.CommunicationBean"%>
<%@page import="Library.Member.MemberDAO"%>
<%@page import="Library.Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/common/commonBoardBtn.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<%
	String id = (String) session.getAttribute("id");

	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));

	// 세션에 저장된 아이디를 가져와서 그 아이디 해당하는 회원정보를 가져온다.
	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(id);
%>
								
<div id="container">
	<div>
		<div id="left">
			<h2>열린마당</h2>
			<ul>
				<li>
					<a href="../../jsp/notice/noticeList.jsp">공지사항</a>
				</li>
				<li class="on">
					<a href="../../jsp/communication/communicationList.jsp">의견나눔방</a>
				</li>
				<li>
					<a href="../../jsp/press/pressList.jsp">보도자료</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>의견나눔방 답글 쓰기</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 열린마당 > 의견나눔방
			</p>
			<div class="tblType01 type5 mt20">
				<table>
					<caption>의견나눔방 글 쓰기</caption>
					<colgroup>
						<col width="100px">
						<col>
						<col width="125px">
						<col>
					</colgroup>
					<tbody>
						<form id="form" name="form" method="post" action="communicationReWritePro.jsp?pageNum=<%=pageNum%>">
							<tr>
								<input type="hidden" name="num" value="<%=mb.getNum()%>">
								<input type="hidden" name="id" value="<%=mb.getId()%>">
								<input type="hidden" name="re_ref" value="<%=re_ref%>">
								<input type="hidden" name="re_lev" value="<%=re_lev%>">
								<input type="hidden" name="re_seq" value="<%=re_seq%>">
								<th scope="row">이름</th>
								<td>
									<input type="hidden" name="name" value="<%=mb.getName() %>">
									<%=mb.getName()%>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" style="width: 500px;" id="subject"
										name="subject" value="[답글] ">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td>
									<textarea style="width: 200%; height: 200px;"
										id="content" name="content"></textarea>
								</td>
							</tr>
							<div class="ac mt20">
								<input type="submit" value="글 쓰기" class="btn03 type2 type3">
								<a href="communicationList.jsp" class="btn03 type2 type3">목록</a>
							</div>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>