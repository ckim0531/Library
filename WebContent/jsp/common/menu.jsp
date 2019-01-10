<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>김수정 도서관</title>
<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_top.css">
</head>
<body>
	<div id="header">
		<div class="top">
			<ul class="topLink">
				<li>
					<a href="../../index.html">
						<img src="../../images/menu/top/home.png" alt="메인">
					</a>
				</li>
				<li>
					<a href="../../index.html" title="새창으로 열기" target="_blank">도서관</a>
				</li>
				<li>
					<a href="../../index.html" title="새창으로 열기" target="_blank">레몬</a>
				</li>
			</ul>
			<%
			// 세션값 가져오기
			String id = (String) session.getAttribute("id");
			
			// 세션값이 없을 때(로그인을 안 한 경우)
			if(id == null) {
			%>
			<ul class="topMy">
				<li class="on">
					<a href="../../jsp/member/login.jsp">로그인</a>
				</li>
				<li>
					<a href="../../jsp/member/join_main.jsp">회원가입</a>
				</li>
			</ul>
			<%
			}
			else { // 로그인을 한 경우
				// 관리자가 아닐 경우
				if(!id.equals("admin")) {
			%>
			<ul class="topMy">
				<li class="on">
					<a href="../../jsp/member/logout.jsp">로그아웃</a>
				</li>
				<li>
					<a href="../../jsp/MyLibrary/memberUpdate.jsp">나의 도서관</a>
				</li>
			</ul>
			<%
				}
				else { // 관리자일 경우
			%>
			<ul class="topMy">
				<li class="on">
					<a href="../../jsp/member/logout.jsp">로그아웃</a>
				</li>
				<li>
					<a href="../../jsp/MyLibrary/memberUpdate.jsp">나의 도서관</a>
				</li>
			</ul>
			<%
				}
			}
			%>
			
		</div>
		<div class="topMenu" id="topMenu">
			<h1 id="topMenuLogo">
				<a href="../../index.html">
					<img src="../../images/menu/menu/logo.png" alt="김수정 도서관">
				</a>
			</h1>
			<ul>
				<li id="top01">
					<a href="../../jsp/Book/bookSearch.jsp">자료검색</a>
					<ul>
						<li id="top01_1">
							<a href="../../jsp/Book/bookSearch.jsp">
								<img src="../../images/menu/menu/m_0101.png" alt="도서검색">도서검색
							</a>
						</li>
						<li id="top01_2">
							<a href="../../jsp/Book/bookRequest.jsp">
								<img src="../../images/menu/menu/m_0104.png" alt="희망도서신청">희망도서신청
							</a>
						</li>
						<li id="top01_3">
							<a href="../../jsp/Book/bookNew.jsp">
								<img src="../../images/menu/menu/m_0403.png" alt="신간도서">신간도서
							</a>
						</li>
						<li id="top01_4">
							<a href="../../jsp/Book/bookRecommend.jsp">
								<img src="../../images/menu/menu/m_0403.png" alt="추천도서">추천도서
							</a>
						</li>
					</ul>
				</li>
				<li id="top02">
					<a href="../../jsp/info/info_greeting.jsp">이용안내</a>
					<ul>
						<li id="top02_1">
							<a href="../../jsp/info/info_greeting.jsp">
								<img src="../../images/menu/menu/m_0202.png" alt="인사말">인사말
							</a>
						</li>
						<li id="top02_2">
							<a href="../../jsp/info/info_info.jsp">
								<img src="../../images/menu/menu/m_0201.png" alt="이용 및 회원안내">이용 및 회원안내
							</a>
						</li>
					</ul>
				</li>
				<li id="top03">
					<a href="../../jsp/notice/noticeList.jsp">열린마당</a>
					<ul>
						<li id="top03_1">
							<a href="../../jsp/notice/noticeList.jsp">
								<img src="../../images/menu/menu/m_0401.png" alt="공지사항">공지사항
							</a>
						</li>
						<li id="top03_2">
							<a href="../../jsp/communication/communicationList.jsp">
								<img src="../../images/menu/menu/m_0402.png" alt="의견나눔방">의견나눔방
							</a>
						</li>
						<li id="top03_3">
							<a href="../../jsp/press/pressList.jsp">
								<img src="../../images/menu/menu/m_0403.png" alt="보도자료">보도자료
							</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="top_bg"></div>
	</div>

	<div id="head">
		<div>
			<p class="sub"></p>
			<p class="tit"></p>
		</div>
	</div>