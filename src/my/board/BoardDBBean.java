package my.board;

/*
 
 create table board
 (num number primary key,
 writer varchar2(10) not null,
 email varchar2(30),
 subject varchar2(50) not null,
 passwd varchar2(12) not null,
 reg_date varchar2(10) not null,
 readcount number default 0,
 content varchar2(4000) not null,
 ip varchar2(20) not null);
 
 create sequence board_seq;
 
 alter table board add re_step number;
 
 alter table board add re_level number; //2°³
 
  alter table board add re_group number; //3°³
 
 */
public class BoardDBBean {
	
		public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
		public int getRe_group() {
		return re_group;
	}
	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}

		private int num;
		private String writer;
		private String email;
		private String subject;
		private String passwd;
		private String reg_date;
		private int readcount;
		private String content;
		private String ip;
		private int re_step;
		private int re_level;
		private int re_group;
		
		
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
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
		

}
