<%@page import="Library.Board.CommunicationBean"%>
<%@page import="Library.Board.CommunicationDAO"%>
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
			<h3>의견나눔방 수정</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 열린마당 > 의견나눔방
			</p>
			<div class="tblType01 type5 mt20">
				<table>
					<caption>의견나눔방 수정</caption>
					<colgroup>
						<col width="100px">
						<col>
						<col width="125px">
						<col>
					</colgroup>
					<tbody>
						<%
							// 목록 페이지, 현재 페이지 파라미터값 가져오기
							int num = Integer.parseInt(request.getParameter("num"));
							String pageNum = request.getParameter("pageNum");
					
							// 디비에서 정보가져오기, 글번호에 해당하는 수정할 글 정보
							// 디비 객체 생성 -> 메서드 호출 -> 정보저장 -> 표에 출력
							CommunicationDAO bdao = new CommunicationDAO();
							CommunicationBean bb = bdao.communicationGetBoard(num); 
						%>
						<form id="form" name="form" method="post"
							action="communicationUpdatePro.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
							<tr>
								<%
									String id = (String) session.getAttribute("id");
									// 세션에 저장된 아이디를 가져와서 그 아이디 해당하는 회원정보를 가져온다.
									MemberDAO mdao = new MemberDAO();
									MemberBean mb = mdao.getMember(id);
								%>
								<input type="hidden" name="num" value="<%=num%>">
								<th scope="row">이름</th>
								<td>
									<%=mb.getName()%>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" style="width: 500px;" id="subject"
										name="subject" value="<%=bb.getSubject()%>">
								</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td>
									<textarea style="width: 200%; height: 200px; white-space: pre;"
										id="content" name="content"><%=bb.getContent()%></textarea>
								</td>
							</tr>
							<div class="ac mt20">
								<input type="submit" value="수정" class="btn03 type2 type3">
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