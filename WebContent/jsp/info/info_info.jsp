<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<img src="../../images/common/icon_home.png" alt="메인"> > 이용안내  > 이용 및 회원안내
			</p>
			<p class="summary">도서관의 이용 및 회원안내 입니다.</p>
			<ul class="tabList01">
				<li class="on">
					<a href="../../jsp/info/info_info.jsp">이용시간</a>
				</li>
				<li>
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
				<p class="p01">
					토/일요일 : <span>정상운영</span>
				</p>
				<p class="p01 ti_50">
					휴관일 : <span>일요일을 제외한 「관공서의 공휴일에 관한 규정」이 정하는 공휴일<br>
						(다만, 일요일과 겹치는 공휴일은 휴관, 정부에서 수시로 지정한 임시 공휴일 포함)</span>
				</p>
				<p class="p01">도서관별 휴무일</p>
				<p class="p02">행신·원당·삼송·아람누리·백석·풍동·대화·덕이·화정어린이도서관 : 매월 첫 번째, 세 번째 월요일</p>
				<p class="p02">화정·신원·마두·식사·한뫼·가좌·행신어린이·주엽어린이도서관 : 매월 두 번째, 네 번째 월요일</p>
				<div class="tblType01 type2 mt10">
					<table>
						<caption>도서관 이용시간 안내 테이블</caption>
						<colgroup>
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>자료실</th>
								<th>이용시간 (토, 일요일)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>열람실
									<p class="fcO">* 아람누리도서관,풍동도서관,어린이도서관은 열람실 없음</p>
								</td>
								<td>하절기:3월~10월 07:00 ~ 23:00<br>동절기:11월~2월 08:00 ~ 23:00</td>
							</tr>
							<tr>
								<td>종합자료실</td>
								<td>(월~금) 09:00 ~ 22:00 / (토~일) 09:00 ~ 18:00</td>
							</tr>
							<tr>
								<td>어린이자료실</td>
								<td>09:00 ~ 18:00</td>
							</tr>
							<tr>
								<td>연속간행물실 (정기간행물실)</td>
								<td>09:00 ~ 18:00</td>
							</tr>
							<tr>
								<td>디지털자료실 (정보검색실)</td>
								<td>(월~금) 09:00 ~ 22:00 / (토~일) 09:00 ~ 18:00</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>