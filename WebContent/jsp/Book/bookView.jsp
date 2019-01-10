<%@page import="Library.Book.BookBean"%>
<%@page import="Library.Book.BookDAO"%>
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
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");

	// num, pageNum 파라미터값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	// 디비 처리 객체 BoardDAO 객체 생성
	BookDAO bdao = new BookDAO();

	// 디비에서 게시판에 있는 글 정보 가져오기(글 번호에 해당하는 게시글만 가져오기)
	BookBean bb = bdao.bookBoardGetContentNum(num);
%>

<div id="container">
	<div>
		<div id="left">
			<h2>자료검색</h2>
				<ul>
					<li>
						<a href="../../jsp/Book/bookSearch.jsp">도서검색</a>
					</li>
					<li>
						<a href="../../jsp/Book/bookRequest.jsp">희망도서신청</a>
					</li>
					<li class="on">
						<a href="../../jsp/Book/bookList.jsp">도서목록</a>
					</li>
					<li>
						<a href="../../jsp/Book/bookNew.jsp">신간도서</a>
					</li>
					<li>
						<a href="../../jsp/Book/bookRecommend.jsp">추천도서</a>
					</li>
				</ul>
			</div>

			<div class="conts">
				<h3>도서 정보 보기</h3>
				<p id="nav">
					<img src="../../images/common/icon_home.png" alt="메인"> > 자료검색 > 도서목록
			</p>
			<p class="summary">도서관 소유 도서 입니다.</p>
			<div class="tblType01 type2 type7 mt30">
				<table>
					<caption>보도자료</caption>
					<colgroup>
						<col style="width: 120px">
						<col style="width: 400px">
						<col style="width: 100px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>글번호</th>
							<td><%=bb.getBook_num()%></td>
							<th>등록일</th>
							<td><%=bb.getBook_date()%></td>
						</tr>
						<tr>
							<th>저자</th>
							<td><%=bb.getBook_author()%></td>
							<th>수량</th>
							<td><%=bb.getBook_count()%></td>
						</tr>
						<tr>
							<th>도서 제목</th>
							<td colspan="3"><%=bb.getBook_name()%></td>
						</tr>				
						<tr>
							<th>표지</th>
							<td colspan="3">
								<!-- 웹브라우져에서 바로 실행 가능한 파일들(txt,jpg,png....)과 같은 파일들은 바로 페이지에서 실행 -->
								<!--  그외 나머지 파일들에 대해서는 다운로드 기능로 구현 됨. -->
								<%
									if(bb.getBook_image() != null) {
								%>
										<img src="../../images/common/file/ico_save.gif" alt="첨부파일">
										<a target="_self" href="../../book/<%=bb.getBook_image()%>"
											download="<%=bb.getBook_image()%>"><%=bb.getBook_image()%></a>
								<%
									}
									else if(bb.getBook_image() != null) {
										%>
										<img src="../../images/common/file/ico_save.gif" alt="첨부파일">
										<a target="_self" href="../../book/<%=bb.getBook_image()%>"
											download="<%=bb.getBook_image()%>"><%=bb.getBook_image()%></a>
								<%
									}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<%
									if(bb.getBook_image() != null) {
								%>
									<img src="../../book/<%=bb.getBook_image()%>" style="width: 400px">
								<%
									}
								%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="ac mt20">
			<!-- 관리자만  -->
			<%
				if (id != null) {
					if (id.equals("admin")) {
			%>
					<a href="bookWrite.jsp" class="btn03 type2 type3">글쓰기</a>
					<a href="bookUpdate.jsp?num=<%=bb.getBook_num()%>&pageNum=<%=pageNum%>"
						class="btn03 type2 type3">수정</a>
					<a href="bookDelete.jsp?num=<%=bb.getBook_num()%>&pageNum=<%=pageNum%>"
						class="btn03 type2 type3">삭제</a>
			<%
					}
				}
			%>
			<!-- 관리자만 -->
					<a href="bookList.jsp" class="btn03 type2 type3">목록</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>