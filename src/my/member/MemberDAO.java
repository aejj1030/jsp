package my.member;

import java.sql.*;
import java.util.*;

import my.db.ConnectionPoolBean;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
 

	private ConnectionPoolBean pool;

	private String search;
	private String searchString;
	
	public void setSearch(String search) {
		this.search = search;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public MemberDAO() {	}
	

	
	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException {
		try {
			con = pool.getConnection();
			//주민번호 자체가 중복을 허용하지 않기 때문에!
			String sql = "select name from member where ssn1=? and ssn2=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			
			//데이터가 있다면 true 반환
			if (rs.next()) {
				//String dbName = rs.getString(1);
				//if (dbName.trim().equals(name)) {
					return true;
				//}else {
				//	return false;
				//}
			}else {
				return false;
			}
			
			
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int insertMember(MemberDTO dto) throws SQLException {
		try {
			con =pool.getConnection();
			String sql = "insert into member values (member_seq.nextval, ?,?,?,?,?,?,?,?,?,sysdate)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPasswd());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<MemberDTO> listMember() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from member";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list;
			//닫는데 시간을 사용하는게 싫어서
			//전달해줬는데도 닫는작업을 따로 하지 않고
			//try finally는 멀티스레드로 실행되기 때문에 DAO가 무슨일하던 끝,,
			
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	

	public List<MemberDTO> makeList(ResultSet rs) throws SQLException {
		List<MemberDTO> list = new ArrayList<>();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setSsn1(rs.getString("ssn1"));
			dto.setSsn2(rs.getString("ssn2"));
			dto.setEmail(rs.getString("email"));
			dto.setHp1(rs.getString("hp1"));
			dto.setHp2(rs.getString("hp2"));
			dto.setHp3(rs.getString("hp3"));
			dto.setJoindate(rs.getString("joindate"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteMember(int no) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "delete from member where no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
	public MemberDTO getMember(int no) throws SQLException{
		try {
			con = pool.getConnection();
			String sql = "select * from member where no = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			List<MemberDTO> list = makeList(rs);
			return list.get(0); //올라온거 하나 리턴해주겠다
			
		}finally {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if (con != null) pool.returnConnection(con);
			
		}
	}
	  
	public int updateMember(MemberDTO dto) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = 
				"update member set passwd=?, email=?, hp1=?, hp2=?, hp3=? where no=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	

	public List<MemberDTO> findMember() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from member where " + search + " = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			List<MemberDTO> find = makeList(rs);
			return find;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	
		
		public String searchMember(String name, String ssn1, String ssn2, String id) throws SQLException {
			
			try {
				con = pool.getConnection();
				String sql = null;
				//id가 null이면 아이디찾기
				if (id == null) {
					sql = "select id from member where name=? and ssn1=? and ssn2=?";
				//비밀번호 찾기
				}else {
					sql = "select passwd from member where name=? and ssn1=? and ssn2=? and id=?";
				}
				
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, ssn1);
				ps.setString(3, ssn2);
				
				//null이 아니면 4번은 id야 -> 비밀번호 찾기할경우 id 넣어줌
				if (id != null) ps.setString(4, id);
				rs = ps.executeQuery();
				
				//결과 있어 일치하는값 있어
				if (rs.next()) {
					return rs.getString(1);
				}
				//결과가 없어,, 그런결과 없어
				return null;
				
			}finally {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) pool.returnConnection(con);
			}
		}
	}
























