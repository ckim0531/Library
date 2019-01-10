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

	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(id);
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
			<h3>도서 관리 글 쓰기</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 나의 도서관 > 도서 관리
			</p>
			<div class="tblType01 type5 mt20">
				<table>
					<caption>도서 글 쓰기</caption>
					<colgroup>
						<col width="100px">
						<col>
					</colgroup>
					<tbody>
						<form id="form" name="form" method="post"
							action="bookWritePro.jsp" enctype="multipart/form-data">
							<tr>
								<input type="hidden" name="num" value="<%=mb.getNum()%>">
								<input type="hidden" name="id" value="<%=mb.getId()%>">
								<th scope="row">도서 제목</th>
								<td>
									<input type="text" id="name" name="name" value="">
								</td>
							</tr>
							<tr>
								<th scope="row">저자</th>
								<td>
									<input type="text" id="author" name="author" value="">
								</td>
							</tr>
							<tr>
								<th scope="row">책 수량</th>
								<td>
									<input type="text" id="count" name="count" value="">
								</td>
							</tr>
							<tr>
								<th scope="row">표지</th>
								<td>
									<input type="file" name="image">
								</td>
							</tr>
							<div class="ac mt20">
								<input type="submit" value="글 쓰기" class="btn03 type2 type3">
								<a href="bookList.jsp" class="btn03 type2 type3">목록</a>
							</div>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>