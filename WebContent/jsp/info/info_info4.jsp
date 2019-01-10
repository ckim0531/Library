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
				<li>
					<a href="../../jsp/info/info_info2.jsp">이용안내</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info3.jsp">자료실안내</a>
				</li>
				<li class="on">
					<a href="../../jsp/info/info_info4.jsp">회원안내</a>
				</li>
			</ul>
			<div class="tabcont">
				<p class="mt10">
					홈페이지에 온라인상으로 본인 인증과정을 거쳐 웹 회원가입 후 회원증발급신청이 가능합니다.<br>
					회원증은 웹 회원가입 후 구비서류를 지참하시어 도서관 안내데스크에 방문하셔서 발급 받으시기 바랍니다.
				</p>
				<p class="ptit">
					<span>01</span>가입자격
				</p>
				<p class="p01_2">경기도 거주자, 경기도 학교 학생 및 직장인, 사업자</p>
				<p class="ptit">
					<span>02</span>가입절차
				</p>
				<p class="p01_2">
					홈페이지 웹 회원 신청 → 도서관 방문(안내데스크) → 회원승인(신분증 또는 증명서류 지참)
					 → 도서관대출 회원증 발급 (대출증, 모바일대출증)</p>
				<p class="ptit">
					<span>03</span>구비서류
				</p>
				<p class="p01_2">
					<span class="b">
						주민등록상 경기도 거주자</span><br>
						① 어린이 : 주민등록등본 1부<br>
						② 청소년 : 학생증 또는 청소년증<br>
						③ 성 인 : 현주소가 기재되어 있는 신분증
				</p>
				<p class="p01_2">
					<span class="b">경기도 소재 기업체 재직자 </span><br>
					신분증, 재직증명서(경기도 소재 주소 기입)
				</p>
				<p class="p01_2">
					<span class="b">경기도 소재 학교 재학생</span><br>
					학생증(경기도 소재 주소 기입)
				</p>
				<p class="p01_2">
					<span class="b">경기도 소재 사업자</span><br>
					경기도 소재 사업자등록증
				</p>
				<p class="mt10 b">
					※ 본인 확인을 위한 증명사진 1매 (사진이 없는 경우 도서관에서 촬영 가능)<br>
					※ 신분증 또는 증명서류는 경기도 거주 및 소재 여부 확인 후 즉시 이용자에게 반환
				</p>

				<div class="tblType01 type2 mt20">
					<table>
						<caption>회원가입 안내</caption>
						<colgroup>
							<col width="15%" />
							<col width="17%" />
							<col width="17%" />
							<col width="17%" />
							<col width="17%" />
							<col width="17%" />
							<col />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">회원</th>
								<th scope="col">도서 대출/반납/예약</th>
								<th scope="col">전자책<br>오디오북
								</th>
								<th scope="col">희망도서<br>신청
								</th>
								<th scope="col">디지털자료실<br>열람실 이용
								</th>
								<th scope="col">문화행사신청</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>웹회원</td>
								<td></td>
								<td></td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
							</tr>
							<tr>
								<td>도서관회원</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="가능" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="ac mt30">
				<a href="../../jsp/join/join_main.jsp" class="btn03 type2">회원가입 바로가기</a>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../common/footer.jsp"></jsp:include>