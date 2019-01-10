<%@page import="Library.Member.MemberDAO"%>
<%@page import="Library.Member.MemberBean"%>
<%@page import="Library.Board.CommunicationBean"%>
<%@page import="Library.Board.CommunicationDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_search.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_page.css">
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
	
	//세션값 없을경우 로그인 페이지로 이동
	if (id == null)
		response.sendRedirect("../../jsp/member/login.jsp");
	
	// 디비처리 객체 생성 BoardDAO
	CommunicationDAO ndao = new CommunicationDAO();

	// getBoardCount() 생성후 처리 
	int count = ndao.communicationGetCount();

	// 한 페이지에서 보여줄 글 개수를 설정
	int pageSize = 10;

	// 현재 페이지 위치 
	String pageNum = request.getParameter("pageNum");
	
	if (pageNum == null) {
		pageNum = "1";
	}

	// 시작행을 계산하기   1...11...21...31...
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;

	// 끝행을 계산하기  10..... 20.....30...40... 
	int endRow = currentPage * pageSize;

	// 디비 안에 있는 모든 글정보를 가져오기

	// ndao.getBoardList();
	List boardList = null;

	if (count != 0) {
		// boardList = ndao.getBoardList();
		// ArrayList boardList = (ArrayList) ndao.getBoardList();
		// 페이징 처리한 만큼씩만 정보를 가져오는 작업 
		boardList = ndao.communicationGetList(startRow, pageSize);
	}
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
			<form id="form" name="form" method="post" action="../../jsp/communication/communicationList.jsp">
				<div class="searchBox type3 mt30">
					<select title="검색 조건 선택" id="flag" name="flag">
						<option value="0">제목</option>
						<option value="1">내용</option>
						<option value="4">전체</option>
					</select>
					<input size="10" title="검색어 입력란" placeholder="검색어를 입력해 주세요."
						type="text" id="name" name="name" value="">
					<a href="javascript:listShow();" class="btnSearch">검색</a>
				</div>
			</form>
			<div class="tblType01 type9 mt20">
				<table>
					<caption>의견나눔방 목록</caption>
					<colgroup>
						<col width="10%">
						<col>
						<col width="13%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<%
						if(count != 0) {
							for (int i = 0; i < boardList.size(); i++) {
								// boardList -> 1칸에 있던 정보 -> boardBean 이동 
								// boardBean 객체 사용해서  출력 
								CommunicationBean nb = (CommunicationBean) boardList.get(i);
						%>
						<tbody>
							<tr>
								<td><%=nb.getNum()%></td>
								<td class="al l20">
								<%
									int wid = 0;
								
									// 답글 모양 만들기(들여쓰기)
									if(nb.getRe_lev() > 0) {
										wid = 10 * nb.getRe_lev();
								%>
									<img src="../../images/common/re/level.gif" height="15" width="<%=wid%>">
  		    						<img src="../../images/common/re/re.gif">
								<%
									}
								%>
									<a href="communicationView.jsp?num=<%=nb.getNum()%>&pageNum=<%=pageNum%>">
										<%=nb.getSubject()%></a>
								</td>
								<td><%=nb.getName()%></td>
								<td><%=nb.getDate()%></td>
								<td><%=nb.getReadcount()%></td>
							</tr>
						</tbody>
						<%
							}
						}
					%>
				</table>
			</div>
			
			<div class="ar mt10">
				<a href="communicationWrite.jsp?pageNum=<%=pageNum%>" class="btn03 type2 type3">글쓰기</a>
			</div>
			
			<div class="page">
				<ul>
					<%
						// 페이지 접근 형태 출력
						// <이전  1,2,3,4,5 다음>
						if (count != 0) {
							// 전체 페이지수 계산 => 게시판 글 50개 , 한페이지에 10개씩 보여줌  => 5페이지 
							//                  게시판 글 77개 , 한페이지에 10개씩 보여줌  => 8페이지( 7+1 )
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

							// 한 화면에 보여줄 페이지 번호의 개수 
							int pageBlock = 10;

							// 시작페이지 번호
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;

							// 끝페이지 번호 
							int endPage = startPage + pageBlock - 1;

							if (endPage > pageCount) {
								endPage = pageCount;
							}

							// 이전
							if (startPage > pageBlock) {
					%>
					<a href="communicationList.jsp?pageNum=<%=startPage - pageBlock%>">
						<img src="../../images/common/page/btn_next.png" alt="이전 페이지 보기">
					</a>
					<%
							}
							// 1~10,11~20,21~30,....
							for (int i = startPage; i <= endPage; i++) {
								if (i == currentPage) {
					%>
					<li class="on">
						<a href="communicationList.jsp?pageNum=<%=i%>"><%=i%></a>
					<%
								}
								else
								{
					%>
					<li>
						<a href="communicationList.jsp?pageNum=<%=i%>"><%=i%></a>
					<%
								}
							}
							// 다음
							if (endPage < pageCount) {
					%>
					<a href="communicationList.jsp?pageNum=<%=startPage + pageBlock%>">
						<img src="../../images/common/page/btn_next.png" alt="다음 페이지 보기">
					</a>
					<%
							}
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>