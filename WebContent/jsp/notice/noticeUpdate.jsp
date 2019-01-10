<%@page import="Library.Board.NoticeBean"%>
<%@page import="Library.Board.NoticeDAO"%>
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
				<li class="on">
					<a href="../../jsp/notice/noticeList.jsp">공지사항</a>
				</li>
				<li>
					<a href="../../jsp/communication/communicationList.jsp">의견나눔방</a>
				</li>
				<li>
					<a href="../../jsp/press/pressList.jsp">보도자료</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>공지사항 수정</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 열린마당 > 공지사항
			</p>
			<div class="tblType01 type5 mt20">
				<table>
					<caption>공지사항 수정</caption>
					<colgroup>
						<col width="100px">
						<col>
						<col width="125px">
						<col>
					</colgroup>
					<tbody>
						<%
							String id = (String) session.getAttribute("id");
						
							// 목록 페이지, 현재 페이지 파라미터값 가져오기
							int num = Integer.parseInt(request.getParameter("num"));
							String pageNum = request.getParameter("pageNum");
					
							// 디비에서 정보가져오기, 글번호에 해당하는 수정할 글 정보
							// 디비 객체 생성 -> 메서드 호출 -> 정보저장 -> 표에 출력
							NoticeDAO bdao = new NoticeDAO();
							NoticeBean bb = bdao.noticeBoardGetContentNum(num); 
						%>
						<form id="form" name="form" method="post"
							action="../../jsp/notice/noticeUpdatePro.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"
							enctype="multipart/form-data">
							<tr>
								<input type="hidden" id="id" name="id" value="<%=bb.getId()%>">
								<input type="hidden" name="num" value="<%=num%>">
								<th scope="row">이름</th>
								<td>
									<%=bb.getName()%>
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
							<tr>
								<th scope="row">첨부파일</th>
								<td>
									<input type="file" name="file" style="width: 200%;"><%=bb.getFile()%>
									<input type="hidden" name="file2" value="<%=bb.getFile()%>">
									<%
									if(bb.getFile() != "null" || !bb.getFile().equals("null")) {
									%>
										<a href="noticeDeleteFile.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
											<img src="../../images/common/file/ico_cancle.png" alt="첨부파일삭제" />
										</a>
									<%
									}
									%>
								</td>
							</tr>
							<div class="ac mt20">
								<input type="submit" value="수정" class="btn03 type2 type3">
								<a href="../../jsp/notice/noticeList.jsp" class="btn03 type2 type3">목록</a>
							</div>
						</form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>