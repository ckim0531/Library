<%@page import="Library.Board.CommunicationBean"%>
<%@page import="Library.Board.CommunicationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="../../css/common/common.css">
<link rel="stylesheet" type="text/css"
	href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css"
	href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/common/commonBoardBtn.css">
<link rel="stylesheet" type="text/css"
	href="../../css/menu/menu_sub.css">

<link rel="stylesheet" type="text/css"
	href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css"
	href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js"
	charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	
	// num, pageNum 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	System.out.println("View pageNum : " + pageNum);
	System.out.println("View num : " + num);
	
	// 디비 처리 객체 BoardDAO 객체 생성
	// 조회수 1증가 처리 메서드
	CommunicationDAO bdao = new CommunicationDAO();
	bdao.communicationUpdateReadcount(num);

	// 디비에서 게시판에 있는 글 정보 가져오기(글 번호에 해당하는 게시글만 가져오기)
	CommunicationBean bb = bdao.communicationGetBoard(num);
	
	System.out.println("의견나눔방 글 번호 : " + bb.getNum());
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
			<h3>의견나눔방</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 열린마당 > 의견나눔방
			</p>
			<p class="summary">도서관 의견나눔방 입니다.</p>
			<div class="tblType01 type2 type7 mt30">
				<table>
					<caption>의견나눔방</caption>
					<colgroup>
						<col style="width: 120px">
						<col>
						<col style="width: 100px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="3"><%=bb.getSubject()%></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><%=bb.getName()%></td>
							<th>등록일</th>
							<td><%=bb.getDate()%></td>
						</tr>
						<tr>
							<th>글번호</th>
							<input type="hidden" id="num" name="num" value="<%=bb.getNum()%>">
							<td><%=bb.getNum()%></td>
							<th>조회수</th>
							<td><%=bb.getReadcount()%></td>
						</tr>
						<tr>
							<td colspan="4" class="p25 lh30"><%=bb.getContent()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 댓글 쓰기 -->
			<div class="tblType01 type2 type7 mt30">
				<form>
				</form>
			</div>
			
			<div class="ac mt20">
				<!-- 작성자만 글쓰기 -->
				<%
				// 세션값 가져오기
				if (id != null) {
					if (bb.getId().equals(id)) {
						System.out.println("id : " + bb.getId());
				%>
				<a href="communicationWrite.jsp" class="btn03 type2 type3">글쓰기</a>
				<a href="communicationUpdate.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"
					class="btn03 type2 type3">수정</a>
				<a href="communicationDelete.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"
					class="btn03 type2 type3">삭제</a>
				<%
					}
					else {
						System.out.println("id : " + bb.getId());
				%>
						<a href="communicationWrite.jsp" class="btn03 type2 type3">글쓰기</a>
						<%
					}
				}
				%>
				<!-- 작성자만 글쓰기 -->
				<a href="communicationReWrite.jsp?num=<%=num%>&
					re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>"
					class="btn03 type2 type3">답글</a>
				<a href="communicationList.jsp" class="btn03 type2 type3">목록</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>