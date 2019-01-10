<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/join_welcome.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>ȸ������</h2>
			<ul>
				<li>
					<a href="../../jsp/member/join_login.jsp">�α���</a>
				</li>
				<li class="on">
					<a href="../../jsp/member/join_main.jsp">ȸ������</a>
				</li>
				<li>
					<a href="../../jsp/member/join_find.jsp">���̵�/��й�ȣ ã��</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>ȸ������</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="����"> > ȸ������ > ȸ������
			</p>
			<div class="joincom">
				<div>
					<p>
						<strong>���ԿϷ�</strong> ȸ�� ������ �Ϸ� �Ǿ����ϴ�.
					</p>
				</div>
			</div>
			<a href="../../jsp/member/login.jsp" class="btnLoginGo">�α����ϱ�</a>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>