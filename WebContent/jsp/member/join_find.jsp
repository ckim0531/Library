<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<link rel="stylesheet" type="text/css" href="../../css/common/common.css">
<link rel="stylesheet" type="text/css" href="../../css/common/common_layout.css">
<link rel="stylesheet" type="text/css" href="../../css/menu/menu_sub.css">
<link rel="stylesheet" type="text/css" href="../../css/member/loginFind.css">

<link rel="stylesheet" type="text/css" href="../../css/font/nanumbarungothic.css">
<link rel="stylesheet" type="text/css" href="../../css/font/nanumgothic.css">

<script type="text/javascript" src="../../js/common/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/common/common.js" charset="utf-8"></script>

<jsp:include page="../../jsp/common/menu.jsp"></jsp:include>

<div id="container">
	<div>
		<div id="left">
			<h2>ȸ������</h2>
			<ul>
				<li>
					<a href="../../jsp/member/login.jsp">�α���</a>
				</li>
				<li>
					<a href="../../jsp/member/join_main.jsp">ȸ������</a>
				</li>
				<li class="on">
					<a href="../../jsp/member/join_find.jsp">���̵�/��й�ȣ ã��</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>���̵�/��й�ȣ ã��</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="����"> > ȸ������ > ���̵�/��й�ȣ ã��
			</p>
			<p class="summary">������ ȸ������ �����ϼż� �پ��� ������ ��������.</p>
			<ul class="tab_menu2 tabList03">
				<li class="on">
					<a href="javascript:hpgpin('handphone');">���� Ȯ��(�޴���)</a>
				</li>
				<li>
					<a href="javascript:hpgpin('gpin');">������ Ȯ��(i-pin)</a>
				</li>
			</ul>
			<div class="tabCont2">
				<form name="form_ipin" id="form_ipin" method="post">
					<input type="hidden" name="param_r1" value="I">
					<input type="hidden" name="param_r2" value="">
					<input type="hidden" name="param_r3" value="">
				</form>

				<form name="form_ipin_pw" method="post">
					<input type="hidden" name="m" value="pubmain">
					<!-- �ʼ� ����Ÿ��, �����Ͻø� �ȵ˴ϴ�. -->
					<input type="hidden" name="param_r1" value="PW"> <input
						type="hidden" name="param_r2" value=""> <input
						type="hidden" name="param_r3" value="">
				</form>

				<form id="FindID" name="FindID" method="post">
					<input type="hidden" name="UTYPE" value="I" /> <input
						type="hidden" name="m" value="" /> <input type="hidden"
						name="EncodeData"
						value="AgAFRzY3NjWJP0gVx4/Hgs7XB5C/wbAzWSBVEwyXx1AraqwKa1ZFymmCUBHiN4okdq9I6lKpMbJ583pJE7BrTiMjbIfDCU7IdJiO4XbJnLA7sxbGU1CAPNZbYne2TjnTjMDJUbRlqonzrVFmtEzi/jE8oLyhW/ZaltbfHkhH/arX0Zwqzob3xTTPmADasLmOuMlBVJisIYZEP8bpu1J/OsTrPmdI+2Id1YzVqzKjH0IYq2Q6j3CDz44Z1r1fj0IvDRzsuwUD3uOkF3pHh9WrSvKjrR750AyUNThz49ubYEk56bMgS6Gr9DwL7k2P6/rLxeNsJToNqHAPWg8M94DSCRF81mqlLtynQo3AGQC59/LhbUxw2/JPJnM2v7VdOdbNryFwFU7+B05z+Vq3qtQKMa2KSFmeEmdy0raTcOg6jStmbqmRsHl0Lu2qEDsg1VSCStnmQ7bxuIZz+ISPPMUMV+QwB8yvMn9TrMf2RTKUlChMLvYgvLhGk8eqd6WFRqxyMTzPVPgO3XM=">
					<input type="hidden" name="param_r1" value=""> <input
						type="hidden" name="param_r2" value=""> <input
						type="hidden" name="param_r3" value="">
					<div id="handphone">
						<div class="txtBox">
							<p class="tit">���̵� ã��</p>
							<p class="txt">
								����Ȯ�� ���񽺴� ������Ÿ��� �� ����������ȣ�� ������<br> ���� �ֹι�ȣ�� ������� �ʰ� �޴���,
								���������� ������<br>�����ϵ��� �����ϰ� �ֽ��ϴ�.
							</p>
							<p class="link">
								NICE ������ : <a href="https://www.idcheck.co.kr/" title="��â���� ����"
									target="_blank" class="fcO">https://www.idcheck.co.kr</a>
							</p>
							<a href="javascript:checkIDform();" class="btnClick">�����ϱ�</a>
						</div>
						<div class="txtBox">
							<p class="tit">��й�ȣ ã��</p>
							<p class="txt">
								ȸ������ ������ �Է��Ͻø� <span class="fcO">��ϵ� �޴���ȭ��ȣ�� �ӽ�<br>��й�ȣ
								</span>�� �߼��� �帳�ϴ�.
							</p>
							<label><span>���̵�</span><input type="text" name="UID"></label>
							<label><span>�� ��</span><input type="text" name="UNAME"></label>
							<p class="link">
								NICE ������ : <a href="https://www.idcheck.co.kr/" title="��â���� ����"
									target="_blank" class="fcO">https://www.idcheck.co.kr</a>
							</p>
							<a href="javascript:checkPWform();" class="btnClick">�����ϱ�</a>
						</div>
					</div>
				</form>

				<form id="FindPWD" name="FindPWD" method="post">
					<input type="hidden" name="UTYPE" value="PW" /> <input
						type="hidden" name="m" value="" /> <input type="hidden"
						name="EncodeData"
						value="AgAFRzY3NjWJP0gVx4/Hgs7XB5C/wbAzWSBVEwyXx1AraqwKa1ZFymmCUBHiN4okdq9I6lKpMbJ583pJE7BrTiMjbIfDCU7IdJiO4XbJnLA7sxbGU1CAPNZbYne2TjnTjMDJUbRlqonzrVFmtEzi/jE8oLyhW/ZaltbfHkhH/arX0Zwqzob3xTTPmADasLmOuMlBVJisIYZEP8bpu1J/OsTrPmdI+2Id1YzVqzKjH0IYq2Q6j3CDz44Z1r1fj0IvDRzsuwUD3uOkF3pHh9WrSvKjrR750AyUNThz49ubYEk56bMgS6Gr9DwL7k2P6/rLxeNsJToNqHAPWg8M94DSCRF81mqlLtynQo3AGQC59/LhbUxw2/JPJnM2v7VdOdbNryFwFU7+B05z+Vq3qtQKMa2KSFmeEmdy0raTcOg6jStmbqmRsHl0Lu2qEDsg1VSCStnmQ7bxuIZz+ISPPMUMV+QwB8yvMn9TrMf2RTKUlChMLvYgvLhGk8eqd6WFRqxyMTzPVPgO3XM=">
					<input type="hidden" name="param_r1" value=""> <input
						type="hidden" name="param_r2" value=""> <input
						type="hidden" name="param_r3" value="">
					<div id="gpin" style="display: none">
						<div class="txtBox">
							<p class="tit">���̵� ã��</p>
							<p class="txt">
								���� "�ֹε�Ϲ�"�� ���� Ÿ���� �ֹε�Ϲ�ȣ�� ��������ϴ� �ڴ� 3�� ������ ¡�� �Ǵ� 1õ����, ������ ������
								�ΰ��� �� �ֽ��ϴ�.<br>���ù���_�ֹε�Ϲ� ��37��(��Ģ) ��10ȣ
							</p>
							<p class="link">
								NICE ������ : <a href="https://www.idcheck.co.kr/" title="��â���� ����"
									target="_blank" class="fcO">https://www.idcheck.co.kr</a>
							</p>
							<a href="javascript:fnPopup_ipin_id();" class="btnClick">�����ϱ�</a>
						</div>
						<div class="txtBox">
							<p class="tit">��й�ȣ ã��</p>
							<p class="txt">
								ȸ������ ������ �Է��Ͻø� <span class="fcO">��ϵ� �޴���ȭ��ȣ�� �ӽ�<br>��й�ȣ
								</span>�� �߼��� �帳�ϴ�.
							</p>
							<label><span>���̵�</span><input type="text" name="IUID"></label>
							<label><span>�� ��</span><input type="text" name="IUNAME"></label>
							<p class="link">
								����I-PIN ���� : <a
									href="http://www.gpin.go.kr/center/main/index.gpin"
									title="��â���� ����" target="_blank" class="fcO">http://www.gpin.go.kr</a>
							</p>
							<a href="javascript:fnPopup_ipin_pw();" class="btnClick">�����ϱ�</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>