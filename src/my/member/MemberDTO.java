package my.member;
/*
 * 
create table member
(no number primary key,
name varchar2(20) not null,
id varchar2(15) not null,
passwd varchar2(12) not null,
ssn1 varchar2(6) not null,
ssn2 varchar2(7) not null,
email varchar2(50),
hp1 varchar2(3),
hp2 varchar2(4),
hp3 varchar2(4),
joindate varchar2(12));

create sequence memberjsp_seq;

 */

public class MemberDTO {
	
	private int no;
	private String name;
	private  String id;
	private String passwd;
	private String ssn1;
	private String ssn2;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String joindate;
	
	
	public String getAllHp() {
		if(hp1 == null) return "전화번호 없음";
		return hp1+"-"+hp2+"-"+hp3;
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSsn1() {
		return ssn1;
	}
	public void setSsn1(String ss1) {
		this.ssn1 = ss1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public void setSsn2(String ss2) {
		this.ssn2 = ss2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

}
