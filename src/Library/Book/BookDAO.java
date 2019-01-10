package Library.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Library.Book.BookBean;

public class BookDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// 디비 연결 처리 메서드 생성
	private Connection getConnect() throws Exception {
		// Context 객체 생성
		Context init = new InitialContext();

		// 디비 연동 정보를 불러오는 메서드
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Library_Book_Rental");

		// ds 객체를 사용하여 디비 연결
		con = ds.getConnection();

		return con;
	}

	// 디비 자원 해제
	public void CloseDB() {
		// ResultSet 해제
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// PreparedStatement 해제
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// Connection 해제
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글 생성
	public void bookBoardInsert(BookBean bb) {
		int num = 0;

		try {
			con = getConnect();

			// sql 쿼리 작성
			// 게시판 글 번호 num 구하기
			sql = "select max(book_num) from book";

			System.out.println("게시판 글 번호 구하기 : " + sql);

			// 객체 생성
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 기존의 글이 있다 -> 가장 마지막 글 번호 + 1
				// num = rs.getInt("max(num)") + 1;
				num = rs.getInt(1) + 1;
			}

			System.out.println("마지막 도서 글 번호 : " + num);

			// sql 쿼리 작성
			// book db에 insert
			sql = "insert into book " + "(book_num, book_name, book_author," + "book_count, book_date, book_image)"
					+ "values(?, ?, ?," + "?, now(), ?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num); // 책 번호
			pstmt.setString(2, bb.getBook_name()); // 책 이름
			pstmt.setString(3, bb.getBook_author()); // 책 지은이
			pstmt.setInt(4, bb.getBook_count()); // 책 수량
			pstmt.setString(5, bb.getBook_image()); // 책 표지 사진 // 파일 경로

			System.out.println("책 글쓰기 글 작성 완료");

			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("책 게시판 글 생성 실패");
		} finally {
			CloseDB();
		}
	}

	// 게시판 글 쓸 때 번호 가져오기
	public int bookGetBoardNum() {
		int count = 0;

		try {
			// 디비연결
			con = getConnect();

			// sql 작성 [count()]
			sql = "select max(book_num) from book";

			// 객체 생성
			pstmt = con.prepareStatement(sql);

			// 객체 실행
			rs = pstmt.executeQuery();

			// 정보 있으면 저장
			if (rs.next()) {
				count = rs.getInt(1);
			}

			System.out.println("게시판 글 쓸 떄 번호 가져오기");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return count;
	}

	// 게시판 전체 글 개수 가져오기
	public int bookBoardGetCount() {
		int count = 0;

		try {
			// 디비연결
			con = getConnect();
			System.out.println("디비 연결 성공");

			// sql 작성 [count()]
			sql = "select count(*) from book";

			// 객체 생성
			pstmt = con.prepareStatement(sql);

			// 객체 실행
			rs = pstmt.executeQuery();

			// 정보 있으면 저장
			if (rs.next()) {
				count = rs.getInt(1);
			}

			System.out.println("게시판 전체 글 개수 가져오기");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return count;
	}

	// 게시판 전체 글 가져오기
	public List bookBoardGetList() {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();

			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 글 순서 오름차순(re_seq)
			sql = "select * from book order by book_num asc";

			pstmt = con.prepareStatement(sql);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을 때 저장
			// 게시글 1개에 대한 정보를 BoardBean 객체 저장 -> BoardList 한 칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				BookBean bb = new BookBean();

				bb.setBook_num(rs.getInt("book_num")); // 책 번호
				bb.setBook_name(rs.getString("book_name")); // 책 이름
				bb.setBook_author(rs.getString("book_author")); // 책 지은이
				bb.setBook_count(rs.getInt("book_count")); // 책 수량
				bb.setBook_date(rs.getDate("book_date")); // 책 정보 올린 날짜
				bb.setBook_image(rs.getString("book_image")); // 책 표지 사진

				// boardBean 객체를 boardList 한 칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return boardList;
	}

	// 게시판 페이지 나타내기
	public List bookBoardGetList(int startRow, int pageSize) {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();

			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 글순서 오름차순(re_seq)
			// 필요한 만큼씩 데이터를 가져가기 limit 시작행-1, 개수
			sql = "select * from book order by book_num desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을 때 저장
			// 게시글 1개에 대한 정보를 BoardBean 객체 저장 => BoardList 한 칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				BookBean bb = new BookBean();

				// DB -> Bean 저장
				bb.setBook_num(rs.getInt("book_num")); // 책 번호
				bb.setBook_name(rs.getString("book_name")); // 책 이름
				bb.setBook_author(rs.getString("book_author")); // 책 지은이
				bb.setBook_count(rs.getInt("book_count")); // 책 수량
				bb.setBook_date(rs.getDate("book_date")); // 책 정보 올린 날짜
				bb.setBook_image(rs.getString("book_image")); // 책 표지 사진

				// boardBean 객체를 boardList 한 칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return boardList;
	}

	// 신간 도서
	public List bookBoardGetNewList(int startRow, int pageSize) {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();

			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신 글 10개 글 순서 오름차순
			// 필요한 만큼씩 데이터를 가져가기 limit 시작행-1, 개수
			// select * from book order by book_num desc limit 10;
			sql = "select * from book order by book_num desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow - 1);
			/*pstmt.setInt(2, pageSize);*/
			pstmt.setInt(2, 5);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을 때 저장
			// 게시글 1개에 대한 정보를 BoardBean 객체 저장 => BoardList 한 칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				BookBean bb = new BookBean();

				// DB -> Bean 저장
				bb.setBook_num(rs.getInt("book_num")); // 책 번호
				bb.setBook_name(rs.getString("book_name")); // 책 이름
				bb.setBook_author(rs.getString("book_author")); // 책 지은이
				bb.setBook_count(rs.getInt("book_count")); // 책 수량
				bb.setBook_date(rs.getDate("book_date")); // 책 정보 올린 날짜
				bb.setBook_image(rs.getString("book_image")); // 책 표지 사진

				// boardBean 객체를 boardList 한 칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return boardList;
	}
	
	// 추천 도서
	public List bookBoardGetRecommendList(int startRow, int pageSize) {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();

			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 글순서 오름차순(re_seq)
			// 필요한 만큼씩 데이터를 가져가기 limit 시작행-1, 개수
			// select * from book order by rand() limit 10;
			sql = "select * from book order by rand() desc limit ?, ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow - 1);
			/*pstmt.setInt(2, pageSize);*/
			pstmt.setInt(2, 5);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을 때 저장
			// 게시글 1개에 대한 정보를 BoardBean 객체 저장 => BoardList 한 칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				BookBean bb = new BookBean();

				// DB -> Bean 저장
				bb.setBook_num(rs.getInt("book_num")); // 책 번호
				bb.setBook_name(rs.getString("book_name")); // 책 이름
				bb.setBook_author(rs.getString("book_author")); // 책 지은이
				bb.setBook_count(rs.getInt("book_count")); // 책 수량
				bb.setBook_date(rs.getDate("book_date")); // 책 정보 올린 날짜
				bb.setBook_image(rs.getString("book_image")); // 책 표지 사진

				// boardBean 객체를 boardList 한 칸에 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return boardList;
	}

	// 글 번호에 해당하는 게시글 가져오기
	public BookBean bookBoardGetContentNum(int num) {
		BookBean bb = null;

		try {
			con = getConnect();

			// 게시판 글 번호에 해당하는 글 정보 모두 가져오기
			sql = "select * from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			// 실행
			rs = pstmt.executeQuery();

			// rs 데이터 있을 떄 -> 자바빈(bb) 저장(set()) 메서드 사용
			if (rs.next()) {
				bb = new BookBean();

				bb.setBook_num(rs.getInt("book_num")); // 책 번호
				bb.setBook_name(rs.getString("book_name")); // 책 이름
				bb.setBook_author(rs.getString("book_author")); // 책 지은이
				bb.setBook_count(rs.getInt("book_count")); // 책 수량
				bb.setBook_date(rs.getDate("book_date")); // 책 정보 올린 날짜
				bb.setBook_image(rs.getString("book_image")); // 책 표지 사진
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return bb;
	}

	// 게시글 수정하기
	public int bookBoardUpdate(BookBean bb) {
		int check = -1;

		try {
			con = getConnect();

			// 글 번호에 해당하는 책 제목 있으면
			sql = "select * from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getBook_num());

			System.out.println("dao bookBoardUpdate 글 번호 확인 : " + bb.getBook_num());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (bb.getBook_num() == rs.getInt("book_num")) {
					System.out.println("dao bookBoardUpdate bb.getBook_name() : " + bb.getBook_name());
					System.out.println("dao bookBoardUpdate rs.getString('book_name') : " + rs.getString("book_name"));
					sql = "update book set book_name = ?, book_author = ?," + "book_count = ?, book_image = ?"
							+ "where book_num = ?";

					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getBook_name()); // 책 이름
					pstmt.setString(2, bb.getBook_author()); // 책 지은이
					pstmt.setInt(3, bb.getBook_count()); // 책 수량
					pstmt.setString(4, bb.getBook_image()); // 책 표지 사진
					pstmt.setInt(5, bb.getBook_num()); // 책 번호

					System.out.println("dao bookBoardUpdate 이름 : " + bb.getBook_name());
					System.out.println("dao bookBoardUpdate 지은이 : " + bb.getBook_author());
					System.out.println("dao bookBoardUpdate 수량 : " + bb.getBook_count());
					System.out.println("dao bookBoardUpdate 표지 : " + bb.getBook_image());
					System.out.println("dao bookBoardUpdate 번호 : " + bb.getBook_num());

					pstmt.executeUpdate();

					check = 1;
					System.out.println("도서 수정 완료. 글 번호 : " + bb.getBook_num());
				} else {
					// 글은 있으나, 아이디가 안 맞으면
					check = 0;

					System.out.println("도서 수정 check : " + check);
				}
			} else {
				// 글 번호에 해당하는 아이디가 없으면
				check = -1;

				System.out.println("도서 수정 check : " + check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}

	// 게시글 삭제 시 삭제할 파일 이름 가져오기
	public String bookGetFileName(int num) {
		String imageName = null;

		try {
			con = getConnect();

			// 게시판에 글이 있는지 확인
			sql = "select book_image from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				imageName = rs.getString("book_image");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return imageName;
	}

	// 게시글 업로드한 파일 삭제
	public int bookDeleteFile(int num, String name) {
		int check = -1;

		try {
			con = getConnect();

			sql = "select book_name from book where book_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println(rs.getString("book_name"));
				if (name.equals(rs.getString("book_name"))) {
					// 삭제 처리 쿼리 구문
					sql = "update book set book_image = '' where book_num = ?";

					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();

					check = 1;

					System.out.println("업로드 한 파일 삭제 check 1 : " + check);
				} else {
					check = 0;

					System.out.println("업로드 한 파일 삭제 check 0 : " + check);
				}
			} else {
				check = -1;

				System.out.println("업로드 한 파일 삭제 check -1 : " + check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}

	// 게시판 글 삭제
	public int bookDelete(int num, String bookName) {
		int check = -1;

		try {
			con = getConnect();

			sql = "select book_name from book where book_num = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			System.out.println("게시판 글 삭제 sql : " + num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println(rs.getString("book_name"));
				if (bookName.equals(rs.getString("book_name"))) {
					// 삭제 처리 쿼리 구문
					sql = "delete from book where book_num = ?";

					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();

					System.out.println("게시판 글 삭제 pstmt : " + num);

					check = 1;

					System.out.println("게시판 글 삭제 check 1 : " + check);
				} else {
					check = 0;

					System.out.println("게시판 글 삭제 check 0 : " + check);
				}
			} else {
				check = -1;

				System.out.println("게시판 글 삭제 check -1 : " + check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
}