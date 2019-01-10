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
				<li class="on">
					<a href="../../jsp/info/info_info2.jsp">�̿�ȳ�</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info3.jsp">�ڷ�Ǿȳ�</a>
				</li>
				<li>
					<a href="../../jsp/info/info_info4.jsp">ȸ���ȳ�</a>
				</li>
			</ul>
			<div class="tabcont">
				<p class="ptit">
					<span>01</span>���� �� �ݳ�
				</p>
				<p class="p01_2">����Ǽ� �� �Ⱓ : 1�� �ִ� 25��, 14�� (�� 1���� 7���̳�)</p>
				<p class="p01_2">�������� : ��ü�� ��� ��ü�ϼ� �Ⱓ��ŭ ���� ����</p>
				<p class="p01_2">
					����Ⱓ ���� : ������ å�� �� �а� ���� ��� �ڷ�� �� Ȩ���������� 1ȸ�� ���Ͽ� 7�� ���� ����Ⱓ ���尡��<br>
					(��ü�� �����û �Ұ���)
				</p>
				<p class="p01_2">
					���ιݳ���(��) : ������ ��ð��� �ƴ� ������ ������ �ܺο� ��ġ�� ���ιݳ���(��)�� ���� ���� �ݳ� ����
				</p>
				<p class="ptit">
					<span>02</span>��������
				</p>
				<p class="p01_2">��󵵼� : �������� ����(��ġ���� ������ ���� �Ұ�)</p>
				<p class="p01_2">������� : 1�δ� 2��, 1�Ǵ� 2����� ���డ��</p>
				<p class="p01_2">������ : ��ȭ, �湮(�ڷ�� �� �̿��� �˻���), Ȩ���������� ���డ��</p>
				<p class="p01_2">�뺸��� : ����� ������ �ݳ��Ǵ� ��� �ܹ����ڼ���(SMS) �뺸</p>
				<p class="p01_2">�����Ⱓ : �뺸 ���Ϻ��� 3�� �̳�(�ް��� ����)</p>
				<p class="p01_2">�뺸 �� 3�� �̳� �̴���� ������ �ڵ� ��ҵǸ� ���� �����ڿ��� ���Ⱑ�� �뺸��</p>
				<p class="p01_2">������ : �ڷ�� �ȳ��뿡�� ���� �������� �����Ͽ� ������ ���൵�� ����</p>
				<p class="p01_2">�̿����� : ��ü�ڴ� ���� �Ұ�</p>
				<p class="ptit">
					<span>03</span>���� å �ٲ㺸�� �ڳ�
				</p>
				<p class="mt10">�������� �������� ������, �������� ���� å �ٲ㺸�� �ڳʿ� ��ġ�Ǿ� �ִ� ������
					��ȯ�� �� �ֽ��ϴ�.</p>
				<p class="p01_2">�� �� : ���ù� ������</p>
				<p class="p01_2">��ȯ��� : ������ ���� å �ٲ㺸�� �ڳ�</p>
				<p class="p01_2">
					��ȯ��� : ���� �ִ� å�� ������ ������ �湮<br>
					���� å �ٲ㺸�� �ڳʿ� ��ġ�� ���� �� �����ϰ� ���� å�� ����<br>
					������ȯ ���� �ۼ�(�ùε��� ������ �ۼ�)<br>
					��ȯ�� å�� ���� å �ٲ㺸�� �ڳ� ������ ��ġ�ϰ�, �����ϰ� ���� å�� ������
				</p>
				<p class="p01_2">��ȯ�Ǽ� : 1ȸ 5�� �̳�</p>
				<p class="p01_2">��ȯ�ڷ��� : ��ȯ�Ұ��ڷḦ ������ ��� �缭(����)</p>
				<p class="fcO l15 mt05">
					�� ��ȯ�Ұ��ڷ� : ���輭, ������, ����, ���ø� �� �����ڷ�, ���纻 �� ��������, ��ȭå, ������ ���� ����,
					�Ѽյ���,<br>
					&nbsp;������ �ڷ� ��
				</p>
				<p class="ptit">
					<span>04</span>�������� Ưȭ�ڷ�
				</p>
				<p class="mt10">�������� Ưȭ�о� �ڷ� ���� ����</p>
				<p class="mt10">Ưȭ���� ��ȭ���α׷� �</p>
				<div class="tblType01 type2 mt20">
					<table>
						<caption>�̿�ȳ�</caption>
						<colgroup>
							<col width="33.3%">
							<col width="33.3%">
						</colgroup>
						<thead>
							<tr>
								<th>������</th>
								<th>Ưȭ�о�</th>
								<th>Ưȭ�ڷ��</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>ȭ��</td>
								<td>��</td>
								<td>�����ڷ�� �� Ưȭ�ڷ� �ڳ�</td>
							</tr>
							<tr>
								<td>�ƶ�����</td>
								<td>����</td>
								<td>�����ڷ�� �� Ưȭ�ڷ� �ڳ�</td>
							</tr>
							<tr>
								<td>����</td>
								<td>������乮ȭ</td>
								<td>������乮ȭ�ڷ��</td>
							</tr>
							<tr>
								<td>�ֿ����</td>
								<td>����׸�å</td>
								<td>�����̵�����</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>