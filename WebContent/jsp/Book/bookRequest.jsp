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
			<h2>�ڷ�˻�</h2>
			<ul>
				<li>
					<a href="../../jsp/Book/bookSearch.jsp">�����˻�</a>
				</li>
				<li class="on">
					<a href="../../jsp/Book/bookRequest.jsp">���������û</a>
				</li>
				<li>
					<a href="../../jsp/Book/bookList.jsp">�������</a>
				</li>
				<li>
					<a href="../../jsp/Book/bookNew.jsp">�Ű�����</a>
				</li>
				<li>
					<a href="../../jsp/Book/bookRecommend.jsp">��õ����</a>
				</li>
			</ul>
		</div>
		<div class="conts">
			<h3>���������û</h3>
			<p id="nav">
				<img src="../../images/common/icon_home.png" alt="����"> > �ڷ�˻� > ���������û
			</p>
			<p class="summary">���������û �ȳ� �Դϴ�.</p>
				<h4>��û�ȳ�</h4>
				<div class="tblType01">
					<table>
						<caption>��û�ȳ�</caption>
						<colgroup>
							<col style="width:100px">
							<col>
						</colgroup>
						<tbody>
							<tr>
							<th scope="row">��û</th>
							<td>
								<p class="p02">
									�������� ���ϴ� �ڷᰡ ���� ���, ���� ���ϴ� �ڷḦ ��û �� �� �ִ� ���� �Դϴ�.<br>
									(1�� �� 3�Ǳ��� ����)
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">��û���</th>
							<td>
								<p class="p02">������ ��û�Ͻ� ���� ����, ����, ���ǻ�� ��������(Ư��, �޴�����
									E-mail)�� ��Ȯ�� ����Ͽ� �ֽʽÿ�.</p>
								<p class="p02">�ڷ�˻��� ���Ͽ� �������� ����Ǿ� �ִ��� Ȯ�� �� ��û�Ͽ� �ֽʽÿ�.</p>
								<p class="p02">��û������ ���� 3~4�ְ� �ҿ�ǳ�, ������ ���� ��Ȳ�� ���� �� �̻� �ҿ��
									���� �ֽ��ϴ�.</p>
							</td>
						</tr>
						<tr>
							<th scope="row">��û����</th>
							<td>
								<p class="p02">������ �����ڷ�, ����.���� ���� �ڷ�</p>
								<p class="p02">����, ����, ���ǻ� ���� ��Ȯ���� ���� ����</p>
								<p class="p02">��ȭ�ܰ� ��������, ���б���</p>
								<p class="p02">�ø���, ������</p>
								<p class="p02">�������� ���輭, �н���, ������, ����</p>
								<p class="p02">�������� ���� ��ȭ, ��Ÿ��, �����Ҽ�, ���ͳݼҼ�, �θǽ��Ҽ�</p>
								<p class="p02">����, 50������ �̸��� ��å��, ������ ���ϵ���</p>
								<p class="p02">ǰ��, ���� ����</p>
								<p class="p02">���� ����(50,000�� �̻�)</p>
								<p class="p02">Ư�� �����о� ����, ���ǳ⵵�� ������ ����</p>
								<p class="p02">��Ÿ ���� �� ���� �鿡�� ���������� �弭�μ� �������ϴٰ� �ǴܵǴ� ����</p>
							</td>
						</tr>
						<tr>
							<th scope="row">�켱��������</th>
							<td>
								<p class="p02">�켱 �������� ��û�ڿ��� �����ϸ� ������ �ڷ�ǿ� ��ġ�� ���κ��� 3�� ����
									��û�ڿ��� �켱 ����˴ϴ�.</p>
								<p class="p02">�ڷ�� ����ũ���� ����Ȯ�� �� �̿� �����մϴ�.</p>
								<p class="p02">�켱���� ���񽺸� �����÷��� E-mail �� SMS���ſ��θ� �� ����Ͽ� �ּž�
									�մϴ�.</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<h4>����� �ȳ�</h4>
			<div class="tblType01 type6">
				<table>
					<caption>����� �ȳ�</caption>
					<colgroup>
						<col style="width: 170px">
						<col>
						<col style="width: 170px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="al l30">�缭</th>
							<td>����� 012) 345-6789</td>
						</tr>
					</tbody>
				</table>
			</div>
			<h4>��û��ȸ</h4>
			<p>* ��û�� ������ �����Ȳ �� ó������� Ȩ���������� Ȯ�� �����մϴ�. "�������"�� �� ǥ�õ˴ϴ�.</p>
			<div class="tblType01 type6 mt15">
				<table>
					<caption>��û��ȸ</caption>
					<colgroup>
						<col style="width: 170px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">��û��</th>
							<td>
								<p class="p02">�̿��ڰ� �������� ��������� ��û�� ����</p>
							</td>
						</tr>
						<tr>
							<th scope="row">ó����</th>
							<td>
								<p class="p02">��û�� ��������� ������ �ݿ��� ���</p>
								<p class="p02">������ ���ⱸ�Կ� �ݿ��� ���</p>
							</td>
						</tr>
						<tr>
							<th scope="row">������</th>
							<td>
								<p class="p02">�̹� �������� ����Ǿ� �ִ� ����</p>
							</td>
						</tr>
						<tr>
							<th scope="row">��ҵ�</th>
							<td>
								<p class="p02">��û�� �ڷᰡ ��ҵǴ� ���� ��һ����� ǥ�õ�</p>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="line"></div>
			</div>
			<div class="btnBoxR mt15">
				<a href="mylib3_01.asp" class="btn03 type2">���������û</a> <a
					href="mylib3_02.asp" class="btn03 type2">�����û����</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>