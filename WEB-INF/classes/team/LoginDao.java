package team;

import team.LoginDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.connector.Response;

public class LoginDao {
	private Connection getConnection() throws Exception{
		
		//1. JNDI를 이용하기 위한 객체 생성
		Context init = new InitialContext();
		
		//2. 등록된 네이밍 서비스로부터 등록된 자원을 가져옴
		Context env = (Context) init.lookup("java:comp/env");
		
		//3. 자원들 중 원하는 jdbc/tjkim 자원을 찾아서 데이터소스를 가져옴
		DataSource ds = (DataSource) env.lookup("jdbc/team");

		//4. 커넥션 얻어옴
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public void insert(LoginDto dto) {
		String sql = "insert into account values(?, ?, ?, ?, ?, ?)";
		
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getEmail());
			
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//메소드 작성 시 고려사항
	//1. public or private
	//2. 반환 데이터 (output)
	//3. 입력 데이터 (input)
	
	public int checkUser(String id, String pass){
		String sql = "select pass from account where id=? and pass=?";
		int check=0;
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) 
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pass);//sql 실행 준비
			try(ResultSet rs = pstmt.executeQuery();)
			{
				if(rs.next()) {
					check=1;
				}else {
					check=0;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
	
	public int checkId(String id){
		String sql = "select id from account where id=?";
		int check=0;
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) 
		{
			pstmt.setString(1, id);//sql 실행 준비
			try(ResultSet rs = pstmt.executeQuery();)
			{
				if(rs.next()) {
					check=1;
				}else {
					check=0;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}

	public void update(String id, String name, String pass, String tel, String email) {
		String sql = "update account set name=? , pass=?, tel=?, email=? where id=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			pstmt.setString(3, tel);
			pstmt.setString(4, email);
			pstmt.setString(5, id);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		String sql = "delete from account where id=?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				)
		{
			pstmt.setString(1, id);
			
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	
}
