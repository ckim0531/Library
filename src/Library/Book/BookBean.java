package Library.Book;

import java.sql.Date;

public class BookBean {
	/*
	 *	CREATE TABLE `book`
	 *	(
	 *		`book_num` int(11) NOT NULL AUTO_INCREMENT,
	 *		`book_name` varchar(100) DEFAULT NULL,
	 *		`book_author` varchar(45) DEFAULT NULL,
	 *		`book_count` int(11) DEFAULT NULL,
	 *		`book_date` date DEFAULT NULL,
	 *		`book_image` varchar(45) DEFAULT NULL,
	 *		PRIMARY KEY (`book_num`)
	 *	)
	 *	ENGINE=InnoDB DEFAULT CHARSET=utf8
	 */
	
	private int book_num; // 도서 번호
	private String book_name; // 도서명
	private String book_author; // 작가
	private int book_count; // 도서 수량
	private Date book_date; // 도서 등록한 날짜
	private String book_image; // 표지
	private String book_image2; // 표지
	
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	
	public int getBook_count() {
		return book_count;
	}
	public void setBook_count(int book_count) {
		this.book_count = book_count;
	}
	
	public Date getBook_date() {
		return book_date;
	}
	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}
	
	public String getBook_image() {
		return book_image;
	}
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	
	public String getBook_image2() {
		return book_image2;
	}
	public void setBook_image2(String book_image2) {
		this.book_image2 = book_image2;
	}
}