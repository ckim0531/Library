<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/info/info_greeting.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>이용안내</h2>
			<ul>
				<li class="on">
					<a href="../../jsp/info/info_greeting.jsp">인사말</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info.jsp">이용 및 회원안내</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>인사말</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="메인"> > 이용안내  > 인사말
			</p>
			<img src="../../images/info/greeting.png" name="img_greeting" id="greeting">
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>