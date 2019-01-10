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
				<h2>�ڷ�˻�</h2>
				<ul>
					<li class="on">
						<a href="../../jsp/Book/bookSearch.jsp">�����˻�</a>
					</li>
					<li>
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
				<h3>�����˻�</h3>
				<p id="nav">
					<img src="../../images/common/icon_home.png" alt="����"> > �ڷ�˻� > �����˻�
				</p>

				<div class="tblType01 mt20">
					<table>
						<caption>��������, �ڷᱸ��, ���±��� �� �����˻��� ���� �����ϴ� ǥ</caption>
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
								<th scope="row">��������</th>
								<td>
									<select id="a_sort" name="a_sort">
										<option value="A">�ֱٵ�ϼ�</option>
										<option value="B">���࿬�� ��������</option>
										<option value="C">���࿬�� ��������</option>
										<option value="D">������ ��������</option>
										<option value="E">������ ��������</option>
										<option value="F">���� ��������</option>
										<option value="G">���� ��������</option>
									</select>
								</td>
								<th>��°Ǽ�</th>
								<td>
									<select id="a_vp" name="a_vp">
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="30">30</option>
									</select>
								</td>
								<th scope="row">����</th>
								<td>
									<input type="checkbox" name="a_loan" id="a_loan" value="Y"> ����
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="searchBox new2018 mt20" id="sb1">
					<select id="a_qf" name="a_qf" title="�˻� ���� ����">
						<option value="T" selected="selected">������</option>
						<option value="A">����</option>
						<option value="K">Ű����</option>
						<option value="I">ISBN</option>
					</select>
					<label for="a_q">
						<input type="text" id="a_q" name="a_q" placeholder="�˻�� �Է��� �ּ���." value=""
							onkeypress="if(event.keyCode==13) searchCheck('1','I');" title="�˻����Է�">
					</label>
					<a href="javascript:sbC();" class="btnSearch btnnew2018">�߰�</a>

					<div class="searchBox type4 mt10" id="sb2" style="display: none;">
						<select id="a_qf1" name="a_qf1" title="�˻� ���� ����">
							<option value="T" selected="selected">������</option>
							<option value="A">����</option>
							<option value="K">Ű����</option>
							<option value="I">ISBN</option>
						</select>
						<label for="a_q1">
							<input type="text" id="a_q1" name="a_q1" placeholder="�˻�� �Է��� �ּ���." value=""
								onkeypress="if(event.keyCode==13) searchCheck('1','I');" title="�˻����Է�">
						</label>
					</div>

					<div class="searchBox type4 mt10" id="sb3" style="display: none;">
						<select title="�˻� ���� ����" id="a_qf2" name="a_qf2">
							<option value="T" selected="selected">������</option>
							<option value="A">����</option>
							<option value="K">Ű����</option>
							<option value="I">ISBN</option>
						</select>
						<label for="a_q2"><input type="text" id="a_q2" name="a_q2"
							placeholder="�˻�� �Է��� �ּ���." value=""
							onkeypress="if(event.keyCode==13) searchCheck('1','I');" title="�˻����Է�">
						</label>
					</div>
					<div class="ac mt10">
						<a href="javascript:searchCheck('1','I');" class="btn04 btnnew2018">�˻�</a>
					</div>
				</div>

				<div class="searchBox new2018 type4 mt20" id="sangse" style="display: none;">
					<!--<span>������˻�</span>//-->
					<select title="�˻� ���� ����" id="a_rf" name="a_rf">
						<option value="T">�����������</option>
						<option value="A">���������</option>
						<option value="P">��������ǻ�</option>
					</select>
					<label for="a_rq"><input type="text" id="a_rq" name="a_rq"
						placeholder="�˻�� �Է��� �ּ���." value=""
						onkeypress="if(event.keyCode==13) searchCheck('1','S');">
					</label>

					<div class="ac mt10">
						<a href="javascript:searchCheck('1','S');" class="btn04 btnnew2018" title="�˻����Է�">�˻�</a>
					</div>
				</div>


				<div id="btnAlignBox" class="btnBoxR mt20">
					<span id="totalbook" class="totNew2018">�� 0��</span>
						<a href="javascript:searchMethod('G');" class="btnAlign list">����Ʈ������ ����</a>
						<a href="javascript:searchMethod('S');" class="btnAlign gall">������������ ����</a>
				</div>
				
				<div class="page" id="pagelist2"></div>
				<div id="lists">
					<ul class="resultList01 mt30">
						<li class="ac">������ �Է��� �˻��� �ּ���.</li>
					</ul>
				</div>


				<div class="page" id="pagelist"></div>
			</div>
		</div>
	</div>
</form>

<jsp:include page="../common/footer.jsp"></jsp:include>