package com.kye.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kye.DTO.BbsDTO;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO(){
		try {
			String dbURL = "jdbc:mysql://localhost:3306/java_board?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "03210321";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate(){
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";//DB 오류
	}
	
	public int getNext(){
		String SQL = "SELECT bbs_no FROM bbs ORDER BY bbs_no DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1) + 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//DB 오류
	}
	
	public int write(String title, String id, String content){
		String SQL = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, title);
			pstmt.setString(3, id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, content);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//DB 오류
	}
	
	public ArrayList<BbsDTO> getList(int pageNumber){
		String SQL = "SELECT * FROM bbs WHERE bbs_no <? AND available=1 ORDER BY bbs_no DESC LIMIT 10";
		
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BbsDTO bbsDTO = new BbsDTO();
				bbsDTO.setBbs_no(rs.getInt(1));
				bbsDTO.setTitle(rs.getString(2));
				bbsDTO.setId(rs.getString(3));
				bbsDTO.setDate(rs.getDate(4));
				bbsDTO.setContent(rs.getString(5));
				bbsDTO.setAvailable(rs.getInt(6));
				list.add(bbsDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber){
		String SQL = "SELECT * FROM bbs WHERE bbs_no <? AND available = 1 ORDER BY bbs_no DESC LIMIT 10";
		
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public BbsDTO getBbsDTO(int bbs_no){
		String SQL = "SELECT * FROM bbs WHERE bbs_no = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbs_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				BbsDTO bbsDTO = new BbsDTO();
				bbsDTO.setBbs_no(rs.getInt(1));
				bbsDTO.setTitle(rs.getString(2));
				bbsDTO.setId(rs.getString(3));
				bbsDTO.setDate(rs.getDate(4));
				bbsDTO.setContent(rs.getString(5));
				bbsDTO.setAvailable(rs.getInt(6));
				
				return bbsDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bbs_no, String title, String content){
		String SQL = "UPDATE bbs SET title = ?, content = ? WHERE bbs_no = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, bbs_no);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int bbs_no){
		String SQL = "UPDATE bbs SET available = 0 WHERE bbs_no =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbs_no);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
