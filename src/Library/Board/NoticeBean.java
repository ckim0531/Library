package Library.Board;

import java.sql.Date;

public class NoticeBean {
	/*
	 * CREATE TABLE `board_notice` 
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

	private int num; // 글번호(pk 제약)
	private String id; // 글쓴이 아이디
	private String name; // 글쓴이 이름
	private String subject; // 글 제목
	private String content; // 글 내용
	private int readcount; // 글 조회수
	private int re_ref; // 답글 그룹
	private int re_lev; // 답글 레벨
	private int re_seq; // 답글 순서
	private Date date; // 글 작성일
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