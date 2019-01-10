<%@page import="Library.Book.BookBean"%>
<%@page import="Library.Book.BookDAO"%>
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
	//세션값 가져오기(id)
	String id = (String) session.getAttribute("id");

	//세션값 없을경우 로그인 페이지로 이동
	if (id == null)
		response.sendRedirect("../../jsp/member/login.jsp");
%>

<div id="container">
	<div>
		<div id="left">
			<h2>나의 도서관</h2>
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
			<h3>도서 관리 수정</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 나의 도서관 > 도서 관리
			</p>
			<div class="tblType01 type5 mt20">
				<table>
					<caption>도서 관리 수정</caption>
					<colgroup>
						<col width="100px">
						<col>
					</colgroup>
					<tbody>
						<%
							// 목록 페이지, 현재 페이지 파라미터값 가져오기
							int num = Integer.parseInt(request.getParameter("num"));
							String pageNum = request.getParameter("pageNum");
					
							// 디비에서 정보가져오기, 글번호에 해당하는 수정할 글 정보
							// 디비 객체 생성 -> 메서드 호출 -> 정보저장 -> 표에 출력
							BookDAO bdao = new BookDAO();
							BookBean bb = bdao.bookBoardGetContentNum(num); 
						%>
						<form id="form" name="form" method="post"
							action="bookUpdatePro.jsp?num=<%=bb.getBook_num()%>&pageNum=<%=pageNum%>"
							enctype="multipart/form-data">
							<tr>
								<th scope="row">도서 제목</th>
								<td>
									<input type="text" id="name" name="name" value="<%=bb.getBook_name()%>">
								</td>
							</tr>
							<tr>
								<th scope="row">저자</th>
								<td>
									<input type="text" id="author" name="author" value="<%=bb.getBook_author()%>">
								</td>
							</tr>
							<tr>
								<th scope="row">책 수량</th>
								<td>
									<input type="text" id="count" name="count" value="<%=bb.getBook_count()%>">
								</td>
							</tr>
							<tr>
								<th scope="row">표지</th>
								<td>
									<input type="file" name="image"><%=bb.getBook_image()%>
									<input type="hidden" name="image2" value="<%=bb.getBook_image2()%>">
									<%
									if(bb.getBook_image() != "") {
									%>
										<a href="bookDeleteFile.jsp?num=<%=bb.getBook_num()%>&pageNum=<%=pageNum%>">
											<img src="../../images/common/file/ico_cancle.png" alt="첨부파일삭제" />
										</a>
										<%
									}
									%>
								</td>
							</tr>
							<div class="ac mt20">
								<input type="submit" value="수정" class="btn03 type2 type3">
								<a href="../../jsp/book/bookList.jsp" class="btn03 type2 type3">목록</a></div>
							</div>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>