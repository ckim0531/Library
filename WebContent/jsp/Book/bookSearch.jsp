<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
	
<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_tab.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_table.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_page.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/search/search_book.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<form method="get" id="form" name="form" action="/center/data/search.asp">
	<div id="container">
		<div>
			<div id="left">
				<h2>자료검색</h2>
				<ul>
					<li class="on">
						<a href="../../jsp/Book/bookSearch.jsp">도서검색</a>
					</li>
					<li>
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
				<h3>도서검색</h3>
				<p id="nav">
					<img src="../../images/common/icon_home.png" alt="메인"> > 자료검색 > 도서검색
				</p>

				<div class="tblType01 mt20">
					<table>
						<caption>도서구분, 자료구분, 형태구분 등 도서검색할 조건 선택하는 표</caption>
						<colgroup>
							<col style="width: 115px">
							<col>
							<col style="width: 115px">
							<col>
							<col style="width: 115px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">정렬조건</th>
								<td>
									<select id="a_sort" name="a_sort">
										<option value="A">최근등록순</option>
										<option value="B">발행연도 내림차순</option>
										<option value="C">발행연도 오름차순</option>
										<option value="D">도서명 내림차순</option>
										<option value="E">도서명 오름차순</option>
										<option value="F">저자 내림차순</option>
										<option value="G">저자 오름차순</option>
									</select>
								</td>
								<th>출력건수</th>
								<td>
									<select id="a_vp" name="a_vp">
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="30">30</option>
									</select>
								</td>
								<th scope="row">대출</th>
								<td>
									<input type="checkbox" name="a_loan" id="a_loan" value="Y"> 가능
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="searchBox new2018 mt20" id="sb1">
					<select id="a_qf" name="a_qf" title="검색 조건 선택">
						<option value="T" selected="selected">도서명</option>
						<option value="A">저자</option>
						<option value="K">키워드</option>
						<option value="I">ISBN</option>
					</select>
					<label for="a_q">
						<input type="text" id="a_q" name="a_q" placeholder="검색어를 입력해 주세요." value=""
							onkeypress="if(event.keyCode==13) searchCheck('1','I');" title="검색어입력">
					</label>
					<a href="javascript:sbC();" class="btnSearch btnnew2018">추가</a>

					<div class="searchBox type4 mt10" id="sb2" style="display: none;">
						<select id="a_qf1" name="a_qf1" title="검색 조건 선택">
							<option value="T" selected="selected">도서명</option>
							<option value="A">저자</option>
							<option value="K">키워드</option>
							<option value="I">ISBN</option>
						</select>
						<label for="a_q1">
							<input type="text" id="a_q1" name="a_q1" placeholder="검색어를 입력해 주세요." value=""
								onkeypress="if(event.keyCode==13) searchCheck('1','I');" title="검색어입력">
						</label>
					</div>

					<div class="searchBox type4 mt10" id="sb3" style="display: none;">
						<select title="검색 조건 선택" id="a_qf2" name="a_qf2">
							<option value="T" selected="selected">도서명</option>
							<option value="A">저자</option>
							<option value="K">키워드</option>
							<option value="I">ISBN</option>
						</select>
						<label for="a_q2"><input type="text" id="a_q2" name="a_q2"
							placeholder="검색어를 입력해 주세요." value=""
							onkeypress="if(event.keyCode==13) searchCheck('1','I');" title="검색어입력">
						</label>
					</div>
					<div class="ac mt10">
						<a href="javascript:searchCheck('1','I');" class="btn04 btnnew2018">검색</a>
					</div>
				</div>

				<div class="searchBox new2018 type4 mt20" id="sangse" style="display: none;">
					<!--<span>결과내검색</span>//-->
					<select title="검색 조건 선택" id="a_rf" name="a_rf">
						<option value="T">결과내도서명</option>
						<option value="A">결과내저자</option>
						<option value="P">결과내출판사</option>
					</select>
					<label for="a_rq"><input type="text" id="a_rq" name="a_rq"
						placeholder="검색어를 입력해 주세요." value=""
						onkeypress="if(event.keyCode==13) searchCheck('1','S');">
					</label>

					<div class="ac mt10">
						<a href="javascript:searchCheck('1','S');" class="btn04 btnnew2018" title="검색어입력">검색</a>
					</div>
				</div>


				<div id="btnAlignBox" class="btnBoxR mt20">
					<span id="totalbook" class="totNew2018">총 0권</span>
						<a href="javascript:searchMethod('G');" class="btnAlign list">리스트형으로 보기</a>
						<a href="javascript:searchMethod('S');" class="btnAlign gall">갤러리형으로 보기</a>
				</div>
				
				<div class="page" id="pagelist2"></div>
				<div id="lists">
					<ul class="resultList01 mt30">
						<li class="ac">도서명 입력후 검색해 주세요.</li>
					</ul>
				</div>


				<div class="page" id="pagelist"></div>
			</div>
		</div>
	</div>
</form>

<jsp:include page="../common/footer.jsp"></jsp:include>