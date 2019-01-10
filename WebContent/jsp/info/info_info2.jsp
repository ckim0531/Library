<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_tab.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/info/info_info.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>이용안내</h2>
			<ul>
				<li>
					<a href="../../jsp/info/info_greeting.jsp">인사말</a>
				</li>
				<li class="on">
					<a href="../../jsp/info/info_info.jsp">이용 및 회원안내</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>이용 및 회원안내</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 이용안내 > 이용 및 회원안내
			</p>
			<p class="summary">도서관의 이용 및 회원안내 입니다.</p>
			<ul class="tabList01">
				<li>
					<a href="../../jsp/info/info_info.jsp">이용시간</a>
				</li>
				<li class="on">
					<a href="../../jsp/info/info_info2.jsp">이용안내</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info3.jsp">자료실안내</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info4.jsp">회원안내</a>
				</li>
			</ul>
			<div class="tabcont">
				<p class="ptit">
					<span>01</span>대출 및 반납
				</p>
				<p class="p01_2">대출권수 및 기간 : 1인 최대 25권, 14일 (※ 1관당 7권이내)</p>
				<p class="p01_2">대출정지 : 연체할 경우 연체일수 기간만큼 대출 정지</p>
				<p class="p01_2">
					대출기간 연장 : 대출한 책을 더 읽고 싶은 경우 자료실 및 홈페이지에서 1회에 한하여 7일 동안 대출기간 연장가능<br>
					(연체시 연장신청 불가능)
				</p>
				<p class="p01_2">
					무인반납함(기) : 도서관 운영시간이 아닐 때에는 도서관 외부에 설치된 무인반납함(기)을 통해 도서 반납 가능
				</p>
				<p class="ptit">
					<span>02</span>도서예약
				</p>
				<p class="p01_2">대상도서 : 대출중인 도서(비치중인 도서는 예약 불가)</p>
				<p class="p01_2">예약범위 : 1인당 2권, 1권당 2명까지 예약가능</p>
				<p class="p01_2">예약방법 : 전화, 방문(자료실 내 이용자 검색대), 홈페이지에서 예약가능</p>
				<p class="p01_2">통보방법 : 예약된 도서가 반납되는 즉시 단문문자서비스(SMS) 통보</p>
				<p class="p01_2">보관기간 : 통보 익일부터 3일 이내(휴관일 제외)</p>
				<p class="p01_2">통보 후 3일 이내 미대출시 예약이 자동 취소되며 다음 예약자에게 대출가능 통보됨</p>
				<p class="p01_2">대출방법 : 자료실 안내대에서 도서 대출증을 제시하여 보관된 예약도서 대출</p>
				<p class="p01_2">이용제한 : 연체자는 예약 불가</p>
				<p class="ptit">
					<span>03</span>좋은 책 바꿔보기 코너
				</p>
				<p class="mt10">가정에서 보관중인 도서와, 도서관의 좋은 책 바꿔보기 코너에 비치되어 있는 도서를
					교환할 수 있습니다.</p>
				<p class="p01_2">대 상 : 고양시민 누구나</p>
				<p class="p01_2">교환장소 : 도서관 좋은 책 바꿔보기 코너</p>
				<p class="p01_2">
					교환방법 : 집에 있는 책을 가지고 도서관 방문<br>
					좋은 책 바꿔보기 코너에 비치된 도서 중 소장하고 싶은 책을 선정<br>
					도서교환 대장 작성(시민들이 스스로 작성)<br>
					교환할 책은 좋은 책 바꿔보기 코너 서가에 비치하고, 소장하고 싶은 책은 가져감
				</p>
				<p class="p01_2">교환권수 : 1회 5권 이내</p>
				<p class="p01_2">교환자료대상 : 교환불가자료를 제외한 모든 양서(良書)</p>
				<p class="fcO l15 mt05">
					※ 교환불가자료 : 수험서, 문제집, 잡지, 팸플릿 및 낱장자료, 복사본 및 제본도서, 만화책, 낙서가 심한 도서,
					훼손도서,<br>
					&nbsp;음란성 자료 등
				</p>
				<p class="ptit">
					<span>04</span>도서관별 특화자료
				</p>
				<p class="mt10">도서관별 특화분야 자료 중점 구입</p>
				<p class="mt10">특화관련 문화프로그램 운영</p>
				<div class="tblType01 type2 mt20">
					<table>
						<caption>이용안내</caption>
						<colgroup>
							<col width="33.3%">
							<col width="33.3%">
						</colgroup>
						<thead>
							<tr>
								<th>도서관</th>
								<th>특화분야</th>
								<th>특화자료실</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>화정</td>
								<td>꽃</td>
								<td>종합자료실 내 특화자료 코너</td>
							</tr>
							<tr>
								<td>아람누리</td>
								<td>예술</td>
								<td>종합자료실 내 특화자료 코너</td>
							</tr>
							<tr>
								<td>마두</td>
								<td>고양향토문화</td>
								<td>고양향토문화자료실</td>
							</tr>
							<tr>
								<td>주엽어린이</td>
								<td>세계그림책</td>
								<td>세계어린이도서실</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>