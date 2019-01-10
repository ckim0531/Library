package Library.Board;

import java.sql.Date;

public class pressBean {
	/*
	 * CREATE TABLE `board_press` 
	 * 	(
	 *		`num` int(11) NOT NULL AUTO_INCREMENT, 
	 *		`id` varchar(45) DEFAULT NULL, 
	 *		`name` varchar(20) DEFAULT NULL,
	 *		`subject` varchar(50) DEFAULT NULL, 
	 *		`content` varchar(2000) DEFAULT NULL, 
	 *		`readcount` int(11) DEFAULT NULL, 
	 *		`re_ref` int(11) DEFAULT NULL, 
	 *		`re_lev` int(11) DEFAULT NULL, 
	 *		`re_seq` int(11) DEFAULT NULL, 
	 *		`date` date DEFAULT NULL, 
	 *		`file` varchar(50) DEFAULT NULL, 
	 *		PRIMARY KEY (`num`) 
	 *	) ENGINE=InnoDB DEFAULT CHARSET=utf8
	 */

	private int num; // �� ��ȣ(pk ����)
	private String id; // �ۼ��� ���̵�
	private String name; // �ۼ���
	private String pass; // �� ��й�ȣ
	private String subject; // �� ����
	private String content; // �� ����
	private int readcount; // �� ��ȸ��
	private int re_ref; // ��� �׷�
	private int re_lev; // ��� ����
	private int re_seq; // ��� ����
	private Date date; // �� �ۼ���
	private String file; // ���� ����
	private String file2;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

}