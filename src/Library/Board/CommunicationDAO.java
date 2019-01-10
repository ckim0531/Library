package Library.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommunicationDAO {
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

	// 게시판 글 쓰기
	public void communicationInsert(CommunicationBean cb) {
		int num = 0;

		try {
			con = getConnect();
			System.out.println("드라이버로드 & 디비 연결 성공 ");

			// sql 쿼리 작성 & 객체 생성
			// 게시판 글번호num 구하기
			sql = "select max(num) from board_communication";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 기존의 글이 있다. => 기존의 가장 마지막 글 번호 + 1
				// num = rs.getInt("max(num)")+1;
				num = rs.getInt(1) + 1;
			}
			System.out.println("num : " + num);

			// sql- insert
			sql = "insert into board_communication("
					+ "num, id, name, subject, content,"
					+ "readcount, re_ref, re_lev, re_seq, date)"
					+ "values(?, ?, ?, ?, ?,"
					+ "?, ?, ?, ?, now())";
			
			// now() -> sql 쿼리구문안에서 사용되는 내장함수,
			// 현재 시간을 가져오는 메서드 (Mysql 5.6버젼이상만 가능)
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, cb.getId());
			pstmt.setString(3, cb.getName());
			pstmt.setString(4, cb.getSubject());
			pstmt.setString(5, cb.getContent());
			pstmt.setInt(6, 0); // readcount 조회수 : 0
			pstmt.setInt(7, num); // re_ref : 답변글 그룹 => 일반글 번호와 동일
			pstmt.setInt(8, 0); // re_lev : 답변글 들여쓰기 -> 일반글 들여쓰기 X
			pstmt.setInt(9, 0); // re_seq : 답변글 순서 -> 일반글이 제일 위에 위치

			// 실행
			pstmt.executeUpdate();
			System.out.println("num ttttttttt: " + num);
			System.out.println("의견나눔방 글 작성 완료 ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 게시판 글 번호 가져오기
	public int communicationGetCount() {
		int count = 0;

		try {
			// 디비연결
			con = getConnect();
			System.out.println("디비 연결성공!");
			
			// sql 작성 [count()] & 객체 생성
			sql = "select max(num) from board_communication";
			pstmt = con.prepareStatement(sql);
			// 객체 실행
			rs = pstmt.executeQuery();
			
			// 정보 있으면 저장
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
			System.out.println("의견나눔방 개수 : " + count);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return count;
	}
	
	// 게시판 글 목록 수 가져오기
	public List communicationGetList() {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();
			System.out.println("디비 연결 성공");
			
			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 그룹별 내림차순(re_ref), 글순서 오름차순(re_seq)
			sql = "select * from board_communication order by re_ref desc, re_seq asc";
			pstmt = con.prepareStatement(sql);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을때 저장
			// 게시글 1개의 대한 정보를 BoardBean 객체 저장 => BoardList 한칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				CommunicationBean cb = new CommunicationBean();

				// DB -> Bean 저장
				cb.setNum(rs.getInt("num"));
				cb.setId(rs.getString("id"));
				cb.setName(rs.getString("name"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setRe_ref(rs.getInt("re_ref"));
				cb.setRe_lev(rs.getInt("re_lev"));
				cb.setRe_seq(rs.getInt("re_seq"));
				cb.setDate(rs.getDate("date"));
				
				// boardBean 객체를 boardList 한칸에 저장
				boardList.add(cb);
				
				System.out.println("communicationGetList : " + cb.getNum());
			}
			System.out.println("회원 정보 저장 성공 ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return boardList;
	}
	
	// 게시판 목록 페이지 구하기
	public List communicationGetList(int startRow, int pageSize) {
		List boardList = new ArrayList();

		try {
			// 디비 연결
			con = getConnect();
			System.out.println("디비 연결 성공");
			
			// sql & 객체 생성
			// 테이블에 있는 모든 데이터를 가져오기
			// 정렬 : 최신글 위쪽, 그룹별 내림차순(re_ref), 글순서 오름차순(re_seq)
			// 필요한 만큼씩 데이터를 가져가기 limit 시작행-1,개수
			sql = "select * from board_communication order by re_ref desc, re_seq asc limit ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			// sql 실행 저장 -> 리턴
			rs = pstmt.executeQuery();

			// rs 데이터가 있을때 저장
			// 게시글 1개의 대한 정보를 BoardBean 객체 저장 => BoardList 한칸에 저장
			while (rs.next()) {
				// BoardBean 객체 생성
				CommunicationBean cb = new CommunicationBean();

				// DB -> Bean 저장
				cb.setNum(rs.getInt("num"));
				cb.setId(rs.getString("id"));
				cb.setName(rs.getString("name"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setRe_ref(rs.getInt("re_ref"));
				cb.setRe_lev(rs.getInt("re_lev"));
				cb.setRe_seq(rs.getInt("re_seq"));
				cb.setDate(rs.getDate("date"));
				
				// boardBean 객체를 boardList 한칸에 저장
				boardList.add(cb);
			}
			System.out.println("회원 정보 저장 성공 ");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}

		return boardList;
	}
	
	// 게시판 조회수
	public void communicationUpdateReadcount(int num) {
		try {
			// 드라이버로드,디비연결 (커넥션풀)
			con = getConnect();
			
			// sql 작성, pstmt 객체 생성
			// 조회수(readcount) 1증가 시키는구문, 글번호에 해당하는 글을 조회수 1씩 증가
			sql = "update board_communication set readcount = readcount + 1 where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);

			// pstmt 객체 실행
			pstmt.executeUpdate();
			System.out.println("글 조회수 1증가 ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
	}
	
	// 게시판 해당 글 정보 가져오기
	public CommunicationBean communicationGetBoard(int num) {
		CommunicationBean cb = null;

		// 디비 연결
		try {
			con = getConnect();
			// 게시판 글번호에 해당하는 글정보 모두 가져오기
			sql = "select * from board_communication where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			// 실행
			rs = pstmt.executeQuery();
			
			// rs 데이터 있을때 -> 자바빈(cb) 저장(set()메서드 사용)
			if (rs.next()) {
				cb = new CommunicationBean();
				cb.setNum(rs.getInt("num"));
				cb.setId(rs.getString("id"));
				cb.setName(rs.getString("name"));
				cb.setSubject(rs.getString("subject"));
				cb.setContent(rs.getString("content"));
				cb.setReadcount(rs.getInt("readcount"));
				cb.setRe_ref(rs.getInt("re_ref"));
				cb.setRe_lev(rs.getInt("re_lev"));
				cb.setRe_seq(rs.getInt("re_seq"));
				cb.setDate(rs.getDate("date"));
			}
			
			System.out.println("communicationGetBoard : " + cb.getNum());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return cb;
	}
	
	// 게시판 글 수정
	public int communicationUpdate(CommunicationBean cb) {
		int check = -1;
		
		System.out.println("check : " + check);
		
		try {
			con = getConnect();
			
			// 글 번호에 해당하는 아이디가 있으면
			sql = "select id from board_communication where num = ?";
			System.out.println("hhhh : "+cb.getNum());
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cb.getNum());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("확인 : " +rs.getString("id"));
				System.out.println(" ggggg : "+cb.getId());
				if(cb.getId().equals(rs.getString("id"))) {
					System.out.println("xxxxxxx");
					System.out.println("Subject : "+cb.getSubject() );
					System.out.println("Content() : "+cb.getContent() );
					System.out.println("num() : "+cb.getNum() );
					
					sql = "update board_communication set subject = ?, content = ?"
							+ "where num = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, cb.getSubject());
					pstmt.setString(2, cb.getContent());
					pstmt.setInt(3, cb.getNum());
					
					pstmt.executeUpdate();
					
					check = 1;
					System.out.println("check : " + check);
					System.out.println("의견나눔방 수정 완료. 글 번호 : " + cb.getNum());
					System.out.println("작성자 : " + cb.getName());
					System.out.println("아이디 : " + cb.getId());
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
			System.out.println("수정 실패");
		} finally {
			CloseDB();
		}

		return check;
	}
	
	// 게시판 글 삭제
	public int communicationDelete(int num, String id) {
		int check = -1;

		try {
			con = getConnect();

			// 게시판에 글이 있는지 확인
			sql = "select id from board_communication where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if(id.equals(rs.getString("id"))) {
					// 삭제 처리 쿼리 구문
					sql = "delete from board_communication where num = ?";
					
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
		}

		return check;
	}
	
	// 게시판 답 글 쓰기
	public void communicationReInsert(CommunicationBean cb) {
		int num = 0;
		
		try {
			con = getConnect();
			
			// 글 번호(num) 계산
			sql = "select max(num) from board_communication";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1) + 1;
			}
			
			// 답글 순서를 재배치
			// re_ref 같은 그룹에 있으면서,
			// re_seq 기존의 값보다 크면, re_Seq 값을 1 증가
			sql = "update board_communication"
					+ "set re_seq=re_seq+1"
					+ "where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cb.getRe_ref());
			pstmt.setInt(2, cb.getRe_seq());
			pstmt.executeUpdate();
			
			// 게시판 답글 추가(작성)
			// insert, num값(계산), 전달받은 정보(cb)
			// re_req -> 글 번호 그대로
			// re_lev, re_seq 1씩 증가
			sql = "insert into board_communication("
					+ "num, id, name, subject, content,"
					+ "readcount, re_ref, re_lev, re_Seq, date)"
					+ "values(?, ?, ?, ?, ?,"
					+ "?, ?, ?, ?, now())";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, cb.getId());
			pstmt.setString(3, cb.getName());
			pstmt.setString(4, cb.getSubject());
			pstmt.setString(5, cb.getContent());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, cb.getRe_ref()); // 기존 글 번호와 동일
			pstmt.setInt(8, cb.getRe_lev()+1);
			pstmt.setInt(9, cb.getRe_seq()+1);
			
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