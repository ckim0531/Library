<%@page import="Library.Board.NoticeBean"%>
<%@page import="Library.Board.NoticeDAO"%>
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

	// 디비 처리 객체 BoardDAO 객체 생성
	// 조회수 1증가 처리 메서드
	NoticeDAO bdao = new NoticeDAO();
	bdao.noticeBoardUpdateReadcount(num);

	// 디비에서 게시판에 있는 글 정보 가져오기(글 번호에 해당하는 게시글만 가져오기)
	NoticeBean bb = bdao.noticeBoardGetContentNum(num);
%>
<div id="container">
	<div>
		<div id="left">
			<h2>열린마당</h2>
			<ul>
				<li class="on"><a href="../../jsp/notice/noticeList.jsp">공지사항</a>
				</li>
				<li><a href="../../jsp/communication/communicationList.jsp">의견나눔방</a></li>
				<li><a href="../../jsp/press/pressList.jsp">보도자료</a></li>
			</ul>
		</div>
		<div class="conts">
			<h3>공지사항</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 열린마당 > 공지사항
			</p>
			<p class="summary">도서관 공지사항 입니다.</p>
			<div class="tblType01 type2 type7 mt30">
				<table>
					<caption>공지사항</caption>
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
							<input type="hidden" name="num" value="<%=bb.getNum()%>">
							<td><%=bb.getNum()%></td>
							<th>조회수</th>
							<td><%=bb.getReadcount()%></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
								<%
								if(!"".equals(bb.getFile())) {
								%>
									<img src="../../images/common/file/ico_save.gif" alt="첨부파일" /> 
									<a target="_self" href="../../upload/<%=bb.getFile()%>" download="<%=bb.getFile()%>"><%=bb.getFile()%></a> 
								<%
								}
								%>
							</td>
							<!-- 웹브라우져에서 바로 실행 가능한 파일들(txt,jpg,png....)과 같은 파일들은 바로 페이지에서 실행 -->
							<!--  그외 나머지 파일들에 대해서는 다운로드 기능로 구현 됨. -->
						</tr>
						<tr>
							<td colspan="4" class="p25 lh30"><%=bb.getContent()%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="ac mt20">
				<!-- 관리자만 글쓰기 -->
				<%
				// 세션값 가져오기
				if (id != null) {
					if (id.equals("admin")) {
				%>
				<a href="noticeWrite.jsp" class="btn03 type2 type3">글쓰기</a>
				<a href="noticeUpdate.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"
					class="btn03 type2 type3">수정</a>
				<a href="noticeDelete.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"
					class="btn03 type2 type3">삭제</a>
				<%
					}
				}
				%>
				<!-- 관리자만 글쓰기 -->
				<a href="noticeList.jsp" class="btn03 type2 type3">목록</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>