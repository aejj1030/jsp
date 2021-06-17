package my.board2;
/*

create table board2
(num number primary key,
writer varchar2(10) not null,
email varchar2(30),
subject varchar2(50) not null,
passwd varchar2(12) not null,
reg_date varchar2(10) not null,
readcount number default 0,
content varchar2(4000) not null,
ip varchar2(20),
filename varchar2(1000) not null,
filesize number);

create sequence board2_seq;
 
 
 */
public class Board2DBBean {

	private int num;
	private String writer;
	private String email;
	private String subject;
	private String passwd;
	private String reg_date;
	private int readcount;
	private String content;
	private String ip;
	private String filename;
	private int filesize;
	
	public int getNum() {
		return num;
	}
	public void setNum(int numm) {
		this.num = numm;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
}