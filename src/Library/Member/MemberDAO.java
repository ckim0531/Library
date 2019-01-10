package Library.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	// 인스턴스 변수(전역 변수 역할)
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	// 디비 연결처리 메서드 구현 getCon()
	private Connection getCon() throws Exception {
		Context init = new InitialContext();

		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Library_Book_Rental");
		
		con = ds.getConnection();
		
		return con;
	}
	
	// 디비 자원 해제 관리 메서드
	public void CloseDB() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 회원가입
	public void joinInsertMember(MemberBean mb) {
		try {
			// 드라이버 로드, 디비 연결
			con = getCon();
			
			sql = "insert into member"
					+ "(num, name, id, pass, email, addr, reg_date)"
					+ "values (?, ?, ?, ?, ?, ?, now())";
			
			// pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mb.getNum());
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getId());
			pstmt.setString(4, mb.getPass());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getAddr()
								+ "/" + mb.getAddr2() 
								+ "/" + mb.getAddr3());
			
			// pstmt 객체 실행
			pstmt.executeUpdate();
			
			System.out.println(mb.getId() + " 회원가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertMember 실패 " + mb.getId());
		} finally {
			CloseDB();
		}
	}
	
	// 회원가입 아이디 체크
	public int joinCheckId(String id) {
		int check = 0;
		
		try {
			// 드라이버 로드, 디비 연결
			con = getCon();
			
			sql = "select id from member where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 아이디 중복
				check = 1;
				
				System.out.println(id + " 아이디 중복");
			}
			else {
				// 아이디 중복 X // 회원가입 가능
				check = 0;
				
				System.out.println(id + " 회원가입 가능");
			}
			
			System.out.println("회원가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(id + " joinCheckId 실패");
		} finally {
			CloseDB();
		}
		
		return check;
	}
	
	// 로그인 할 때 아이디와 비밀번호 체크
	public int loginCheck(String id, String pass) {
		int check = -1;
		
		try {
			// 드라이버 로드, 디비 연결
			con = getCon();
			
			sql = "select pass from member where id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 전달받은 id 값에 해당하는 pass 값 차기
				// 아이디 존재할 경우 비밀번호 같은지 체크
				if(pass.equals(rs.getString("pass"))) {
					// 비밀번호가 같을 경우
					// 로그인 처리
					check = 1;
					
					System.out.println("로그인 성공 ");
				}
				else {
					// 비밀번호가 다를 경우
					check = 0;
					System.out.println("비밀번호가 다름");
				}
			}
			else {
				// id에 해당하는 pass 값이 없는 경우(id가 없는 경우, 회원가입 x)
				check = -1;
				System.out.println("회원가입이 필요함");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
		return check;
	}
	
	// 로그인시 회원정보 가져오기
	public MemberBean getMember(String id) throws Exception {
		MemberBean mb = null;
		
		try {
			// 드라이버 로드, 디비 연결
			con = getCon();
			
			sql="select * from member where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				// 회원정보 저장
				mb = new MemberBean();
				
				mb.setId(rs.getString("id"));
				mb.setEmail(rs.getString("email"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
			}
		} catch (SQLException e) {
			System.out.println("getMember 회원 정보 가져오기 실패");
			e.printStackTrace();
		} finally{
		    CloseDB();			
		}

		return mb;
	}
	
	// 회원 정보 수정
	public int updateMember(MemberBean mb) {
		int check = -1;
		
		try {
			// 드라이버로드, 디비연결
			con = getCon();
			
			// sql 작성 (id에 해당하는 pass 있는지 판단)
			sql = "select pass from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			
			System.out.println("아이디 : " + mb.getId());
			
			// sql 실행 & rs 저장
			rs = pstmt.executeQuery();
			
			System.out.println("rs : " + rs);
			
			// 아이디 & 비밀번호 => 수정   1 리턴
			if(rs.next()) {
				if(mb.getPass().equals(rs.getString("pass"))) {
					// 정보 수정
					// sql
					sql = "update member set name = ?, email = ?, addr = ?"
							+ "where id = ?";
					
					// pstmt 객체 생성 및 실행
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
					pstmt.setString(2, mb.getEmail());
					pstmt.setString(3, mb.getAddr()
										+ "/" + mb.getAddr2() 
										+ "/" + mb.getAddr3());
					pstmt.setString(4, mb.getId());
					
					pstmt.executeUpdate();
					
					System.out.println("회원 정보 수정 완료!");
					
					check = 1;
					
					System.out.println("아이디 : " + mb.getId());
					
					System.out.println("check : " + check);
				}
				else { // 아이디 , 비밀번호 X => 0 리턴	
					check = 0;
					System.out.println("check : " + check);
				}
			}
			else { // 아이디X => -1 리턴		
				check = -1;
				System.out.println("check : " + check);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 정보 수정 실패");
		}
		finally {
			// 자원 해제
			CloseDB();
		}
		
		return check;
	}
	
	// 회원 정보 삭제
	public int deleteMember(String id, String pass) {
		int check = -1;
				
		try {
			con = getCon();
			
			sql = "select pass from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			// 아이디 O, 비밀번호 O, 1 리턴, 삭제
			if(rs.next()) {
				System.out.println(rs.getString("pass"));
				if(pass.equals(rs.getString("pass"))) {
					// sql 삭제 처리
					sql = "delete from member where id = ?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					
					System.out.println("회원 탈퇴(삭제) 성공");
					
					check = 1;
				}
				else {
					// 아이디 O 비밀번호 X, 0 리턴
					check = 0;
				}
			}
			else { // 아이디 X, -1 리턴
				check = -1;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember 실패");
		}
		
		return check;
	}
}