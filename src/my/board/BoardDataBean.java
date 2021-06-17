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
	         System.err.println("lookup ����!!" + e.getMessage());
	      }
	   }

	//�Խñ��� ����� ���� ���ϱ�
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
			
			//�׳� �����������
			//"select * from board order by re_group desc, re_step asc";
			
			//list����Ҷ� 5���� ����Ѵ�
			//start�� end�� ���̷� ���!
			String sql = "select * from "
					//rownum -> ��µǴ� ���鿡�� �ϳ��� ��ȣ�� ����! �? ����!��
					//rownum�� rn�̶�� ����!
					//A.* -> A�� ������ �ִ� ����!
					+ "(select rownum rn, A.* from "
					//re_group�� �������� �ϰ� re_group���� �����ֵ��� re_step�� �ø������ϱ�
					//���� �������� ����� A ��� ����~!
					//�̷� �������� ��쿡�� ()�� ���� ���� �����Ѵ�
					//DB�� �Է��Ѵ�� ��µǴ°� �ƴϰ� �ۼ����� ���� ���Ŀ� ��ۼ����� �����Ѱ���� A
					+ "(select * from board order by re_group desc, re_step asc)A)"
					//rn ���� ?�� ?���̿� ���������� ����آa
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
			//�Խ��� ���,, �������
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
			
			if (dto.getNum() == 0) {//�����̳�?
				//board�� num�߿� ���� ū�� �����ּ���!
				sql = "select max(num) from board";
				//2���϶�
				//"update board set re_step = re_step +1";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				//������ �ִ°��� ����ū���� ã�Ƽ� +1 ���ذ�!
				//������? �ű⿡ +1 ���ٰ�!!!
				if(rs.next()) dto.setRe_group(rs.getInt(1) + 1);
				//max���� ū�����ؼ� Re_group�� �־���
				//null���� ���ü��� �ֱ� ������ �ȳ����� 1�� �־��ٰ�!~!
				else dto.setRe_group(1);
				
			}else { //����̳�?
				//2���϶�
				//re_step ���� ? ���� ū�ֵ��� �ϳ��� ���������ֱ�
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
			//0-readcount (��ȸ��)			
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
			//�Խ��� ��ȸ�� ī�����ϱ�
			//��尪�� content�϶��� plusReadcount�����ϰ� �׿����� ��ȸ���� ī���õ�
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
				//db���� pass������
				String dbPass=rs.getString(1);
				//db�� pass�� �Է��� passwd�� ����?
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
		
		//isPassword�� false�̸� ���̻� ���� ���ϰ� -1�����ع���!
		if(!isPassword(num,passwd)) {
			return -1;
		}
		
		//isPassword�� true�� �������ٰž�!
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
		
		//��й�ȣ ����ġ�ϰ�� -1����
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















