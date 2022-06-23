package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import team.BoardDto;

public class BoardDao {
	private Connection getConnection() throws Exception{
		//1. JNDI를 이용하기 위한 객체 생성
		Context init = new InitialContext();
		
		//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		Context env = (Context) init.lookup("java:comp/env");
		
		//3. 자원들 중 원하는 jdbc/team 자원을 찾아서 데이터소스를 가져옴
		DataSource ds = (DataSource) env.lookup("jdbc/team");
		
		//4. 커넥션 얻어옴
		Connection con = ds.getConnection();
		
		return con;
	}

	/*------------------------------- 게시판 작성 ------------------------------------*/
	public void boardinsert(BoardDto dto) {
		String sql = "insert into board(id,title,content) values(?, ?, ?)";
		
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void noticeinsert(BoardDto dto) {
		String sql = "insert into notice(id,title,content) values(?, ?, ?)";
		
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void qnainsert(BoardDto dto) {
		String sql = "insert into qna(id,title,content) values(?, ?, ?)";
		
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*-------------------------------------------------------------*/
	
	/*-------------------------- 게시판 목록 ------------------------*/
	public ArrayList<BoardDto> boardlist(){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		String sql = "select num,title,id,dt from board order by num desc";
		
		try(
				Connection con = getConnection();
				Statement stmt = con.createStatement();
				)
		{
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setDt(rs.getString("dt"));
				
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<BoardDto> noticelist(){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		String sql = "select num,title,id,dt from notice order by num desc";
		
		try(
				Connection con = getConnection();
				Statement stmt = con.createStatement();
				)
		{
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setDt(rs.getString("dt"));
				
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<BoardDto> qnalist(){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		String sql = "select num,title,id,dt from qna order by num desc";
		
		try(
				Connection con = getConnection();
				Statement stmt = con.createStatement();
				)
		{
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setDt(rs.getString("dt"));
				
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	/*---------------------------------------------------------------------*/
	
	/*--------------------------- 글 수정 ------------------------------------*/
	public void boardupdate(String title, String content, String num) {
		String sql = "update board set title=? , content=? where num=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);

			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void noticeupdate(String title, String content, String num) {
		String sql = "update notice set title=? , content=? where num=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);

			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void qnaupdate(String title, String content, String num) {
		String sql = "update qna set title=? , content=? where num=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);

			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*---------------------------------------------------------------------------*/
	/*---------------------------- 글 삭제 -----------------------------------------*/
	public void boarddel(String num) {
		String sql = "delete from board where num=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, num);
			
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void noticedel(String num) {
		String sql = "delete from notice where num=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, num);
			
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void qnadel(String num) {
		String sql = "delete from qna where num=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, num);
			
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/*-----------------------------------------------------------------*/
}
