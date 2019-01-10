<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/main/main_login.css">
<link rel="stylesheet" type="text/css" href="../../css/main/main_search.css">
<link rel="stylesheet" type="text/css" href="../../css/main/main_notice.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

	<div class="mainContent" id="container">
		<div>
			<!-- 로그인, 검색 검색 박스 -->
			<div class="cont1">
				<!-- 로그인 박스 -->
				<div class="loginBox">
					<div>
						<input type="text" id="id" name="id" placeholder="아이디" style="margin-bottom: 10px;">
						<input type="password" name="pass" placeholder="비밀번호">
						<a href="../../jsp/member/loginProc.jsp">
							<img src="../../images/main/login/btn_login.png" alt="로그인">
						</a>
						<ul>
							<li><a href="../mypage/mylib.asp.html">회원가입</a></li>
							<li><a href="../data/mylib3.asp.html">아이디찾기</a></li>
							<li><a href="../data/mylib3.asp.html">비밀번호찾기</a></li>
						</ul>
					</div>
				</div>
				<!-- 로그인 박스 -->
				<!-- 검색 박스 -->
				<div class="searchBox">
					<div>
						<label for="a_q">
							<input type="text" id="a_q" name="a_q" onkeypress="if(event.keyCode==13) goMainSearch();"
								title="도서명 입력" placeholder="도서 이름">
						</label>
						<a href="javascript:goMainSearch();">
							<img src="../../images/main/search/btn_search.png" alt="도서검색">
						</a>
					</div>
					<ul>
						<li><a href="../mypage/mylib.asp.html">대출도서조회</a></li>
						<li><a href="../data/mylib3.asp.html">희망도서신청</a></li>
						<li><a href="../data/mylib3.asp.html">의견나눔방</a></li>
					</ul>
				</div> <!-- 검색 박스 -->
			</div>
			<!-- 로그인, 검색 검색 박스 -->

			<!-- 공지사항 -->
			<div class="cont2">
				<div class="noticeBox">
					<ul class="tab_menu">
						<li class="active">
							<a href="index.html#a">
								<img src="../../images/main/notice/btn_tab01.png" alt="공지사항">
							</a>
						</li>
						<li>
							<a href="index.html#a">
								<img src="../../images/main/notice/btn_tab02.png" alt="문화행사">
							</a>
						</li>
						<li>
							<a href="index.html#a">
								<img src="../../images/main/notice/btn_tab03.png" alt="작은도서관">
							</a>
						</li>
					</ul>
					<div class="tabCont">
						<div>
							<ul class="conbox">
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../comu/org_view.asp-idx=2832.html">
										[전체]대화도서관 디지털자료실 주말오후 자원봉사자 모집(모집완료)
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../comu/org_view.asp-idx=2831.html">
										[전체]아람누리도서관 자원봉사자 모집 안내​
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../comu/org_view.asp-idx=2830.html">
										[마두]마두도서관 공조기 고장(냉방 중단) 안내
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../comu/org_view.asp-idx=2829.html">
										[원당]원당도서관 자료실 자원봉사자 모집 안내​
									</a>
								</li>
							</ul>
							<a href="../../jsp/notice/noticeList.jsp" class="more">
								<img src="../../images/main/notice/btn_more2.png" alt="공지사항 더보기">
							</a>
						</div>
						<div style="display: none">
							<ul class="conbox">
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../culture/reg_view.asp-idx=4374.html">
										[아람누리]아람누리도서관 8월 북스타트 DAY(5~6세/8.30.목)
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../culture/reg_view.asp-idx=4373.html">
										[아람누리]아람누리도서관 8월 북스타트 DAY(3~4세/8.30.목)
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../culture/reg_view.asp-idx=4372.html">
										[아람누리]아람누리도서관 8월 북스타트 DAY(1~2세/8.30.목)
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../culture/reg_view.asp-idx=4371.html">
										[아람누리]아람누리도서관 8월 북스타트 DAY(임신부/8.30.목)
									</a>
								</li>
							</ul>
							<a href="../../jsp/communication/communicationList.jsp" class="more">
								<img src="../../images/main/notice/btn_more2.png" alt="의견나눔방 더보기">
							</a>
						</div>
						<div style="display: none">
							<ul class="conbox">
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../lib/org_view.asp-idx=313.html">
										[탄현 작은도서관] 2018 경기도 작은도서관 찾아가는 지역 작가.예술가 ..
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../lib/org_view.asp-idx=312.html">
										[관산 작은도서관] 도서관 운영시간 변경 안내
									</a>
								</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../lib/org_view.asp-idx=311.html">
										[신도작은도서관] 8월 임시 휴관일 안내</a>
									</li>
								<li style="width: 85%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="../lib/org_view.asp-idx=310.html">
										[탄현작은도서관] 2학기 청소년 자원봉사자 모집 안내
									</a>
								</li>
							</ul>
							<a href="../../jsp/press/pressList.jsp" class="more">
								<img src="../../images/main/notice/btn_more2.png" alt="보도자료 더보기">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../../jsp/common/footer.jsp"></jsp:include>