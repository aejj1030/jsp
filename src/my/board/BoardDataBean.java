package my.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class BoardDataBean {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	static DataSource ds;	
	   static {
	      try {
	         Context init = new InitialContext();   //javax.naming
	         ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	      }catch(NamingException e) {
	         System.err.println("lookup 실패!!" + e.getMessage());
	      }
	   }

	//게시글이 몇개인지 갯수 구하기
	public int getCount() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select count(*) from board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}

	public List<BoardDBBean> listBoard(int start, int end) throws SQLException {
		try {
			con = ds.getConnection();
			
			//그냥 출력해줬을때
			//"select * from board order by re_group desc, re_step asc";
			
			//list출력할때 5개씩 출력한당
			//start와 end값 사이로 출력!
			String sql = "select * from "
					//rownum -> 출력되는 값들에게 하나씩 번호를 주자! 어떄? 조아!ㅋ
					//rownum을 rn이라고 하장!
					//A.* -> A가 가지고 있는 모든것!
					+ "(select rownum rn, A.* from "
					//re_group로 내림차순 하고 re_group값이 같은애들은 re_step로 올림차순하기
					//기존 쿼리문의 결과를 A 라고 하장~!
					//이런 쿼리문일 경우에는 ()를 제일 먼저 질행한다
					//DB에 입력한대로 출력되는게 아니고 글순서로 정렬 이후에 답글순으로 정렬한결과를 A
					+ "(select * from board order by re_group desc, re_step asc)A)"
					//rn 값이 ?와 ?사이에 있을때까지 출력해줭
					+ " where rn between ? and ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			List<BoardDBBean> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public List<BoardDBBean> makeList(ResultSet rs) throws SQLException{
		List<BoardDBBean> list = new ArrayList<>();
		while(rs.next()) {
			BoardDBBean dto = new BoardDBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			//게시판 답글,, 만드는중
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			dto.setRe_group(rs.getInt("re_group"));
			list.add(dto);
			
		}return list;
	}
	

	public int insertBoard(BoardDBBean dto) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = null;
			
			if (dto.getNum() == 0) {//새글이냐?
				//board에 num중에 제일 큰값 구해주세요!
				sql = "select max(num) from board";
				//2개일때
				//"update board set re_step = re_step +1";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				//기존에 있는값중 제일큰값을 찾아서 +1 해준것!
				//있으면? 거기에 +1 해줄겡!!!
				if(rs.next()) dto.setRe_group(rs.getInt(1) + 1);
				//max에서 큰값구해서 Re_group에 넣어줌
				//null값이 나올수도 있기 때문에 안나오면 1로 넣어줄게!~!
				else dto.setRe_group(1);
				
			}else { //답글이냐?
				//2개일때
				//re_step 값이 ? 보다 큰애들은 하나씩 증가시켜주기
				//"update board set re_step = re_step + 1 where re_step > ?";
				
				sql = "update board set re_step = re_step + 1 where re_group = ? and re_step > ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, dto.getRe_group());
				ps.setInt(2, dto.getRe_step());
				ps.executeUpdate();
				dto.setRe_step(dto.getRe_step() + 1);
				dto.setRe_level(dto.getRe_level() + 1);
			}
			
			sql = "insert into board values(board_seq.nextval, ?,?,?,?, sysdate, 0, ?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getPasswd());
			//sysdate-reg_date
			//0-readcount (조회수)			
			ps.setString(5, dto.getContent());
			ps.setString(6, dto.getIp());
			ps.setInt(7, dto.getRe_step());
			ps.setInt(8, dto.getRe_level());
			ps.setInt(9, dto.getRe_group());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}

	
	public void plusReadcount(int num) throws SQLException{
		try {
			con=ds.getConnection();
			String sql="update board set readcount = readcount+1 where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			int res=ps.executeUpdate();
			
		}finally {
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	
	public BoardDBBean getBoard(int num, String mode) throws SQLException{
		try {
			//게시판 조회수 카운팅하기
			//모드값이 content일때만 plusReadcount실행하고 그에따라 조회수가 카운팅됨
			if(mode.equals("content")) {
				plusReadcount(num);
			}
			
			con=ds.getConnection();
			String sql="select * from board where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			List<BoardDBBean> list=makeList(rs);
			return list.get(0);
			
		}finally {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}

	protected boolean isPassword(int num, String passwd) throws SQLException{
		try {
			con=ds.getConnection();
			String sql="select passwd from board where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				//db에서 pass꺼내기
				String dbPass=rs.getString(1);
				//db의 pass와 입력한 passwd가 같냐?
				if(dbPass.equals(passwd)) return true;
			}
			return false;
		}finally {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}

	public int deleteBoard(int num, String passwd) throws SQLException{
		try {
		
		//isPassword가 false이면 더이상 진행 안하고 -1리턴해버림!
		if(!isPassword(num,passwd)) {
			return -1;
		}
		
		//isPassword가 true면 삭제해줄거야!
		con=ds.getConnection();
		String sql="delete from board where num=?";
		ps=con.prepareStatement(sql);
		ps.setInt(1, num);
		int res=ps.executeUpdate();
		return res;
		
	}finally {
		if(ps!=null)ps.close();
		if(con!=null)con.close();
	}
	}
	
	public int updateBoard(BoardDBBean dto) throws SQLException{
		
		//비밀번호 불일치일경우 -1리턴
		if(!isPassword(dto.getNum(), dto.getPasswd())) {
			return -1;
		}
		
		try {
			con=ds.getConnection();
			String sql="update board set writer=?, email=?, subject=?, content=?, where num=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getNum());
			int res=ps.executeUpdate();
			return res;
		}finally {
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}
	}
	

}















