package Library.Member;

import java.sql.Timestamp;

public class MemberBean {
	private int num;
	private String name;
	private String id;
	private String pass;
	private String email;
	private String addr;
	private String addr2;
	private String addr3;
	private Timestamp reg_date;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr) {
		this.addr = addr2;
	}
	
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr) {
		this.addr = addr3;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}