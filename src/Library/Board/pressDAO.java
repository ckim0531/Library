package Library.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class pressDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// 디비 연결 처리 메서드 생성
	private Connection getConnect() throws Exception {
		// Context 객체 생성
		Context init = new InitialContext();
		
		// 디비 연동 정보를 불러오는 메서드
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Library_Book_Rental");
		
		// ds 객체를 사용하여 디비 연결
		con = ds.getConnection();
		
		return con;
	}
	
	// 디비 자원 해제
	public void CloseDB() {
		// ResultSet 해제
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// PreparedStatement 해제
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// Connection 해제
		if(con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 게시판 글 생성
	public void pressBoardInsert(pressBean bb) {
		int num = 0;
		
		try {
			con = getConnect();
			System.out.println("공지사항 글 쓰기 드라이버로드 & 디비 연결 성공");
			
			// sql 쿼리 작성
			// 게시판 글 번호 num 구하기
			sql = "select max(num) from board_press";
			
			// 객체 생성
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 기존의 글이 있다 -> 가장 마지막 글 번호 + 1
				// num = rs.getInt("max(num)") + 1;
				num = rs.getInt(1) + 1;
			}
			
			System.out.println("마지막 공지사항 글 번호 : " + num);
			
			// sql 쿼리 작성
			// board_press db에 insert
			sql = "insert into board_press "
					+ "(num, id, name, subject, content,"
					+ "readcount, re_ref, re_lev, re_seq,"
					+ "date, file) "
					+ "values(?, ?, ?, ?, ?,"
					+ "?, ?, ?, ?,"
					+ "now(), ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num); // 글 번호
			pstmt.setString(2, bb.getId()); // 작성자 아이디
			pstmt.setString(3, bb.getName()); // 작성자 이름
			pstmt.setString(4, bb.getSubject()); // 글 제목
			pstmt.setString(5, bb.getContent()); // 글 내용
			pstmt.setInt(6, 0); // readcount 조회수 : 0
			pstmt.setInt(7, num); // re_ref : 답변글 그룹 -> 일반글 번호와 동일
			pstmt.setInt(8, 0); // re_lev : 답변글 들여쓰기 -> 일반글 들여쓰기 X
			pstmt.setInt(9, 0); // re_seq : 답변글 순서 -> 일반글이 제일 위에 위치
			pstmt.setString(10, bb.getFile()); // 파일의 경로
			
			// 실행
			pstmt.executeUpdate();
			System.out.println("공지사항 게시판 글 번호 : " + bb.getNum());
			System.out.println("공지사항 게시판 글 아이디 : " + bb.getId());
			System.out.println("공지사항 게시판 글 작성자 : " + bb.getName());
			System.out.println("공지사항 게시판 글 제목 : " + bb.getSubject());
			System.out.println("공지사항 게시판 글 내용 : " + bb.getContent());
			System.out.println("공지사항 게시판 글 조회수 : " + bb.getReadcount());
			System.out.println("공지사항 게시판 글 답변글 그룹 : " + bb.getRe_ref());
			System.out.println("공지사항 게시판 글 답변글 들여쓰기 : " + bb.getRe_lev());
			System.out.println("공지사항 게시판 글 답변글 순서 : " + bb.getRe_seq());
			System.out.println("공지사항 게시판 글 파일의 경로 : " + bb.getFile());
			System.out.println("공지사항 게시판 글 작성 완료");
			System.out.println();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지사항 게시판 글 생성 실패");
			System.out.println();
		} finally {
			CloseDB();
		}
	}
	
	// 게시판 글 쓸 때 번호 가져오기
	public int pressGetBoardNum() {
		int count = 0;

		try {
			// 디비연결
			con = getConnect();
			System.out.println("디비 연결 성공");
			
			// sql 작성 [count()]
			sql = "select max(num) from board_press";
			
			// 객체 생성
			pstmt = con.prepareStatement(sql);
			
			// 객체 실행
			rs = pstmt.executeQuery();
			
			// 정보 있으면 저장
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("글 개수 체크 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return count;
	}
	
	// 게시판 전체 글 개수 가져오기
	public int pressBoardGetCount() {
		int count = 0;

		try {
			// 디비연결
			con = getConnect();
			System.out.println("디비 연결 성공");
			
			// sql 작성 [count()]
			sql = "select count(*) from board_press";
			
			// 객체 생성
			pstmt = con.prepareStatement(sql);
			
			// 객체 실행
			rs = pstmt.executeQuery();
			
			// 정보 있으면 저장
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("글 개수 체크 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return count;
	}
		
	// 게시판 전체 글 가져오기
	public List pressBoardGetList() {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();
			
			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 그룹별 내림차순(re_ref), 글 순서 오름차순(re_seq)
			sql = "select * from board_press order by re_ref desc, re_seq asc";
			
			pstmt = con.prepareStatement(sql);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을 때 저장
			// 게시글 1개에 대한 정보를 BoardBean 객체 저장 -> BoardList 한 칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				pressBean bb = new pressBean();

				// DB -> Bean 저장
				bb.setNum(rs.getInt("num"));
				bb.setId(rs.getString("id"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				
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
	public List pressBoardGetList(int startRow, int pageSize) {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();
			
			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 그룹별 내림차순(re_ref), 글순서 오름차순(re_seq)
			// 필요한 만큼씩 데이터를 가져가기 limit 시작행-1, 개수
			sql = "select * from board_press order by re_ref desc,re_seq asc limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을 때 저장
			// 게시글 1개에 대한 정보를 BoardBean 객체 저장 => BoardList 한 칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				pressBean bb = new pressBean();

				// DB -> Bean 저장
				bb.setNum(rs.getInt("num"));
				bb.setId(rs.getString("id"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				
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
	
	// 조회수 증가
	public void pressBoardUpdateReadcount(int num) {
		try {
			// 드라이버 로드, 디비 연결
			con = getConnect();
			
			// sql 저장, pstmt 객체 생성
			// 조회수(readcount) 1 증가 시키는 구문
			// 글 번호에 해당하는 글을 조회수 1씩 증가
			sql = "update board_press set readcount = readcount + 1 where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			// pstmt 객체 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 글 번호에 해당하는 게시글 가져오기
	public pressBean pressBoardGetContentNum(int num) {
		pressBean bb = null;
		
		try {
			con = getConnect();
			
			// 게시판 글 번호에 해당하는 글 정보 모두 가져오기
			sql = "select * from board_press where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			// 실행
			rs = pstmt.executeQuery();
			
			// rs 데이터 있을 떄 -> 자바빈(bb) 저장(set()) 메서드 사용
			if(rs.next()) {
				bb = new pressBean();
				bb.setNum(rs.getInt("num"));
				bb.setId(rs.getString("id"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return bb;
	}
	
	// 게시글 수정하기
	public int pressBoardUpdate(pressBean bb) {
		int check = -1;
		
		System.out.println(bb.getId());
		System.out.println(bb.getNum());
		
		try {
			con = getConnect();
			
			// 글 번호에 해당하는 아이디가 있으면
			sql = "select id from board_press where num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("확인 : " +rs.getString("id"));
				if(bb.getId().equals(rs.getString("id"))) {
					System.out.println("rs 확인");
					sql = "update board_press set subject = ?, content = ?, file = ?"
							+ "where num = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getSubject());
					pstmt.setString(2, bb.getContent());
					pstmt.setString(3, bb.getFile());
					pstmt.setInt(4, bb.getNum());
					
					pstmt.executeUpdate();
					
					check = 1;
					
					System.out.println("공지사항 수정 완료. 글 번호 : " + bb.getNum());
					System.out.println("작성자 : " + bb.getName());
					System.out.println("아이디 : " + bb.getId());
				}
				else {
					// 글은 있으나, 아이디가 안 맞으면
					check = 0;
				}
			}
			else {
				// 글 번호에 해당하는 아이디가 없으면
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return check;
	}
	
	// 게시글 삭제 시 삭제할 파일 이름 가져오기
	public String pressGetFileName(int num) {
		String fileName = null;
		
		try {
			con = getConnect();

			// 게시판에 글이 있는지 확인
			sql = "select file from board_press where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				fileName = rs.getString("file");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileName;
	}
	
	// 게시글 업로드한 파일 삭제
	public int pressDeleteFile(int num, String id) {
		int check = -1;

		try {
			con = getConnect();

			sql = "select id from board_press where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println(rs.getString("id"));
				if(id.equals(rs.getString("id"))) {
					// 삭제 처리 쿼리 구문
					sql = "update board_press set file = '' where num = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
	
	// 게시판 글 삭제
	public int pressDelete(int num, String id) {
		int check = -1;

		try {
			con = getConnect();

			sql = "select id from board_press where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println(rs.getString("id"));
				if(id.equals(rs.getString("id"))) {
					// 삭제 처리 쿼리 구문
					sql = "delete from board_press where num = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return check;
	}
	
	// 게시판 답 글 쓰기
	public void board_pressReInsert(pressBean bb) {
		int num = 0;
		
		try {
			con = getConnect();
			
			// 글 번호(num) 계산
			sql = "select max(num) from board_press";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			// 답글 순서를 재배치
			// re_ref 같은 그룹에 있으면서, re_seq 기존의 값보다 크면, re_Seq 값을 1 증가
			sql = "update board_press set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			pstmt.executeUpdate();
			
			// 게시판 답글 추가(작성)
			// insert, num값(계산), 전달받은 정보(bb)
			// re_req -> 글 번호 그대로
			// re_lev, re_seq 1씩 증가
			sql = "insert into board_press("
					+ "num, id, name, subject, content,"
					+ "readcount, re_ref, re_lev, re_Seq, date)"
					+ "values(?, ?, ?, ?, ?,"
					+ "?, ?, ?, ?, now())";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getId());
			pstmt.setString(3, bb.getName());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, bb.getRe_ref()); // 기존 글 번호와 동일
			pstmt.setInt(8, bb.getRe_lev()+1);
			pstmt.setInt(9, bb.getRe_seq()+1);
			
			pstmt.executeUpdate();
			
			System.out.println("답글 쓰기 완료");
		} catch (Exception e) {
			System.out.println("답글 쓰기 실패");
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 게시판 댓글 쓰기
}