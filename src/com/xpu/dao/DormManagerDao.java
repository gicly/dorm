package com.xpu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.xpu.model.DormManager;
import com.xpu.model.PageBean;
import com.xpu.util.JDBCUtil;
import com.xpu.util.StringTool;

public class DormManagerDao {
	JDBCUtil util=new JDBCUtil();
	public List<DormManager> dormManagerList( PageBean pageBean, DormManager s_dormManager)throws Exception {
		Connection conn=util.getConn();
		List<Object> para=new ArrayList<Object>();
		List<DormManager> dormManagerList = new ArrayList<DormManager>();
		StringBuffer sb = new StringBuffer("SELECT * FROM t_dormManager t1");
		if(StringTool.isNotEmpty(s_dormManager.getName())) {
			System.out.println("name"+s_dormManager.getName());
			sb.append(" where t1.name like ?");
			para.add("%"+s_dormManager.getName()+"%");
		} else if(StringTool.isNotEmpty(s_dormManager.getUserName())) {
			System.out.println("username"+s_dormManager.getUserName());
			sb.append(" where t1.userName like ?");
			para.add("%"+s_dormManager.getUserName()+"%");
		}
		if(pageBean != null) {
			sb.append(" limit ?,?");
			para.add(pageBean.getStart());
			para.add(pageBean.getPageSize());

		}
		System.out.println(sb.toString());
		PreparedStatement pst = conn.prepareStatement(sb.toString());
		for (int i = 0; i < para.size(); i++) {
			System.out.println(para.get(i));
			pst.setObject(i+1,para.get(i));

		}
		ResultSet rs = pst.executeQuery();
		while(rs.next()) {
			DormManager dormManager=new DormManager();
			dormManager.setDormManagerId(rs.getInt("dormManId"));
			int dormBuildId = rs.getInt("dormBuildId");
			dormManager.setDormBuildId(dormBuildId);
			dormManager.setDormBuildName(DormBuildDao.dormBuildName(conn, dormBuildId));
			dormManager.setName(rs.getString("name"));
			dormManager.setSex(rs.getString("sex"));
			dormManager.setUserName(rs.getString("userName"));
			dormManager.setTel(rs.getString("tel"));
			dormManager.setPassword(rs.getString("password"));
			dormManagerList.add(dormManager);
		}

			util.closeAll(rs,pst,conn);

		return dormManagerList;
	}
	
	public int dormManagerCount( DormManager s_dormManager)throws Exception {
		int count=0;
		Connection conn=util.getConn();
		StringBuffer sb = new StringBuffer("select count(*) as total from t_dormManager t1");
		if(StringTool.isNotEmpty(s_dormManager.getName())) {
			sb.append(" where t1.name like '%"+s_dormManager.getName()+"%'");
		} else if(StringTool.isNotEmpty(s_dormManager.getUserName())) {
			sb.append(" where t1.userName like '%"+s_dormManager.getUserName()+"%'");
		}
		PreparedStatement pst = conn.prepareStatement(sb.toString());
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			count= rs.getInt("total");
		}
		util.closeAll(rs,pst,conn);
		return count;
	}
	
	public DormManager dormManagerShow(Connection con, String dormManagerId)throws Exception {
		String sql = "select * from t_dormManager t1 where t1.dormManId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dormManagerId);
		ResultSet rs=pstmt.executeQuery();
		DormManager dormManager = new DormManager();
		if(rs.next()) {
			dormManager.setDormManagerId(rs.getInt("dormManId"));
			dormManager.setDormBuildId(rs.getInt("dormBuildId"));
			dormManager.setName(rs.getString("name"));
			dormManager.setSex(rs.getString("sex"));
			dormManager.setUserName(rs.getString("userName"));
			dormManager.setTel(rs.getString("tel"));
			dormManager.setPassword(rs.getString("password"));
		}
		return dormManager;
	}
	
	public int dormManagerAdd(Connection con, DormManager dormManager)throws Exception {
		String sql = "insert into t_dormManager values(null,?,?,null,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dormManager.getUserName());
		pstmt.setString(2, dormManager.getPassword());
		pstmt.setString(3, dormManager.getName());
		pstmt.setString(4, dormManager.getSex());
		pstmt.setString(5, dormManager.getTel());
		return pstmt.executeUpdate();
	}
	
	public int dormManagerDelete(Connection con, String dormManagerId)throws Exception {
		String sql = "delete from t_dormManager where dormManId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dormManagerId);
		return pstmt.executeUpdate();
	}
	
	public int dormManagerUpdate(Connection con, DormManager dormManager)throws Exception {
		String sql = "update t_dormManager set userName=?,password=?,name=?,sex=?,tel=? where dormManId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, dormManager.getUserName());
		pstmt.setString(2, dormManager.getPassword());
		pstmt.setString(3, dormManager.getName());
		pstmt.setString(4, dormManager.getSex());
		pstmt.setString(5, dormManager.getTel());
		pstmt.setInt(6, dormManager.getDormManagerId());
		return pstmt.executeUpdate();
	}

	public boolean haveManagerByUser(Connection con, String userName) throws Exception {
		String sql = "select * from t_dormmanager t1 where t1.userName=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, userName);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			return true;
		}
		return false;
	}
	
	
}
