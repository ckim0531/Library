<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
	
<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css?ver=1.1">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/search/search_request.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>자료검색</h2>
			<ul>
				<li>
					<a href="../../jsp/Book/bookSearch.jsp">도서검색</a>
				</li>
				<li class="on">
					<a href="../../jsp/Book/bookRequest.jsp">희망도서신청</a>
				</li>
				<li>
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
			<h3>희망도서신청</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 자료검색 > 희망도서신청
			</p>
			<p class="summary">희망도서신청 안내 입니다.</p>
				<h4>신청안내</h4>
				<div class="tblType01">
					<table>
						<caption>신청안내</caption>
						<colgroup>
							<col style="width:100px">
							<col>
						</colgroup>
						<tbody>
							<tr>
							<th scope="row">신청</th>
							<td>
								<p class="p02">
									도서관에 원하는 자료가 없을 경우, 직접 원하는 자료를 신청 할 수 있는 서비스 입니다.<br>
									(1인 월 3권까지 가능)
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">신청방법</th>
							<td>
								<p class="p02">도서를 신청하실 때는 서명, 저자, 출판사와 인적사항(특히, 휴대폰과
									E-mail)을 정확히 기록하여 주십시오.</p>
								<p class="p02">자료검색을 통하여 도서관에 소장되어 있는지 확인 후 신청하여 주십시오.</p>
								<p class="p02">신청도서는 보통 3~4주가 소요되나, 도서의 출판 상황에 따라 그 이상 소요될
									수도 있습니다.</p>
							</td>
						</tr>
						<tr>
							<th scope="row">신청제한</th>
							<td>
								<p class="p02">도서관 소장자료, 구입.정리 중인 자료</p>
								<p class="p02">서명, 저자, 출판사 등이 정확하지 않은 도서</p>
								<p class="p02">심화단계 전문서적, 대학교재</p>
								<p class="p02">시리즈, 전집류</p>
								<p class="p02">개인적인 수험서, 학습지, 문제집, 참고서</p>
								<p class="p02">오락성이 강한 만화, 판타지, 무협소설, 인터넷소설, 로맨스소설</p>
								<p class="p02">문고본, 50페이지 미만의 소책자, 스프링 파일도서</p>
								<p class="p02">품절, 절판 도서</p>
								<p class="p02">고가의 도서(50,000원 이상)</p>
								<p class="p02">특정 종교분야 도서, 출판년도가 오래된 도서</p>
								<p class="p02">기타 내용 및 형태 면에서 공공도서관 장서로서 부적합하다고 판단되는 도서</p>
							</td>
						</tr>
						<tr>
							<th scope="row">우선대출제도</th>
							<td>
								<p class="p02">우선 대출제는 신청자에게 가능하며 도서가 자료실에 비치된 날로부터 3일 동안
									신청자에게 우선 대출됩니다.</p>
								<p class="p02">자료실 데스크에서 본인확인 후 이용 가능합니다.</p>
								<p class="p02">우선대출 서비스를 받으시려면 E-mail 과 SMS수신여부를 꼭 등록하여 주셔야
									합니다.</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<h4>담당자 안내</h4>
			<div class="tblType01 type6">
				<table>
					<caption>담당자 안내</caption>
					<colgroup>
						<col style="width: 170px">
						<col>
						<col style="width: 170px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="al l30">사서</th>
							<td>김수정 012) 345-6789</td>
						</tr>
					</tbody>
				</table>
			</div>
			<h4>신청조회</h4>
			<p>* 신청한 도서의 진행상황 및 처리결과는 홈페이지에서 확인 가능합니다. "진행상태"란 에 표시됩니다.</p>
			<div class="tblType01 type6 mt15">
				<table>
					<caption>신청조회</caption>
					<colgroup>
						<col style="width: 170px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">신청중</th>
							<td>
								<p class="p02">이용자가 도서관에 희망도서를 신청한 상태</p>
							</td>
						</tr>
						<tr>
							<th scope="row">처리중</th>
							<td>
								<p class="p02">신청한 희망도서가 구입이 반영된 경우</p>
								<p class="p02">도서관 정기구입에 반영된 경우</p>
							</td>
						</tr>
						<tr>
							<th scope="row">소장중</th>
							<td>
								<p class="p02">이미 도서관에 소장되어 있는 상태</p>
							</td>
						</tr>
						<tr>
							<th scope="row">취소됨</th>
							<td>
								<p class="p02">신청한 자료가 취소되는 경우로 취소사유가 표시됨</p>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="line"></div>
			</div>
			<div class="btnBoxR mt15">
				<a href="mylib3_01.asp" class="btn03 type2">희망도서신청</a> <a
					href="mylib3_02.asp" class="btn03 type2">희망신청내역</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>