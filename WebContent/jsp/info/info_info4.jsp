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
			<h2>�̿�ȳ�</h2>
			<ul>
				<li>
					<a href="../../jsp/info/info_greeting.jsp">�λ縻</a>
				</li>
				<li class="on">
					<a href="../../jsp/info/info_info.jsp">�̿� �� ȸ���ȳ�</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>�̿� �� ȸ���ȳ�</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="����"> > �̿�ȳ� > �̿� �� ȸ���ȳ�
			</p>
			<p class="summary">�������� �̿� �� ȸ���ȳ� �Դϴ�.</p>
			<ul class="tabList01">
				<li>
					<a href="../../jsp/info/info_info.jsp">�̿�ð�</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info2.jsp">�̿�ȳ�</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info3.jsp">�ڷ�Ǿȳ�</a>
				</li>
				<li class="on">
					<a href="../../jsp/info/info_info4.jsp">ȸ���ȳ�</a>
				</li>
			</ul>
			<div class="tabcont">
				<p class="mt10">
					Ȩ�������� �¶��λ����� ���� ���������� ���� �� ȸ������ �� ȸ�����߱޽�û�� �����մϴ�.<br>
					ȸ������ �� ȸ������ �� ���񼭷��� �����Ͻþ� ������ �ȳ�����ũ�� �湮�ϼż� �߱� �����ñ� �ٶ��ϴ�.
				</p>
				<p class="ptit">
					<span>01</span>�����ڰ�
				</p>
				<p class="p01_2">��⵵ ������, ��⵵ �б� �л� �� ������, �����</p>
				<p class="ptit">
					<span>02</span>��������
				</p>
				<p class="p01_2">
					Ȩ������ �� ȸ�� ��û �� ������ �湮(�ȳ�����ũ) �� ȸ������(�ź��� �Ǵ� ������ ����)
					 �� ���������� ȸ���� �߱� (������, ����ϴ�����)</p>
				<p class="ptit">
					<span>03</span>���񼭷�
				</p>
				<p class="p01_2">
					<span class="b">
						�ֹε�ϻ� ��⵵ ������</span><br>
						�� ��� : �ֹε�ϵ 1��<br>
						�� û�ҳ� : �л��� �Ǵ� û�ҳ���<br>
						�� �� �� : ���ּҰ� ����Ǿ� �ִ� �ź���
				</p>
				<p class="p01_2">
					<span class="b">��⵵ ���� ���ü ������ </span><br>
					�ź���, ��������(��⵵ ���� �ּ� ����)
				</p>
				<p class="p01_2">
					<span class="b">��⵵ ���� �б� ���л�</span><br>
					�л���(��⵵ ���� �ּ� ����)
				</p>
				<p class="p01_2">
					<span class="b">��⵵ ���� �����</span><br>
					��⵵ ���� ����ڵ����
				</p>
				<p class="mt10 b">
					�� ���� Ȯ���� ���� ������� 1�� (������ ���� ��� ���������� �Կ� ����)<br>
					�� �ź��� �Ǵ� �������� ��⵵ ���� �� ���� ���� Ȯ�� �� ��� �̿��ڿ��� ��ȯ
				</p>

				<div class="tblType01 type2 mt20">
					<table>
						<caption>ȸ������ �ȳ�</caption>
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
								<th scope="col">ȸ��</th>
								<th scope="col">���� ����/�ݳ�/����</th>
								<th scope="col">����å<br>�������
								</th>
								<th scope="col">�������<br>��û
								</th>
								<th scope="col">�������ڷ��<br>������ �̿�
								</th>
								<th scope="col">��ȭ����û</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>��ȸ��</td>
								<td></td>
								<td></td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
							</tr>
							<tr>
								<td>������ȸ��</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
								<td>
									<img src="../../images/info/blt_01.png" alt="����" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="ac mt30">
				<a href="../../jsp/join/join_main.jsp" class="btn03 type2">ȸ������ �ٷΰ���</a>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../common/footer.jsp"></jsp:include>