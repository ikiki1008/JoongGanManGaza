<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.*,javax.sql.*,javax.naming.*"%>
<%
request.setCharacterEncoding("UTF-8");
String id=(String)request.getParameter("id");
int check=-1;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:/comp/env/jdbc/team");
		con=ds.getConnection();
		
		String sql="select id from account where id='"+id+"'";
		st=con.createStatement();
		st.execute(sql);
		rs=st.executeQuery(sql);
		if(rs.next()){
			check=1;
		}else{
			check=0;
		}
	}
	finally{
		if(rs!=null)try{rs.close();}catch(SQLException err){}
		if(st!=null)try{st.close();}catch(SQLException err){}
	}
	if(check==1){
%>
		<script>
		alert("사용중인 아이디입니다.");
		history.back();
		</script>
<%
	}else{
%>
		<script>
		alert("사용가능한 아이디입니다.");
		history.back();
<%
	}

%>

		</script>