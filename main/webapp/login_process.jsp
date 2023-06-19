<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id=request.getParameter("userID");
	String u_pw=request.getParameter("userPW");
	
	String sql="INSERT INTO members(id, passwd, email) VALUES";
	sql+="('" + u_id + "','" + u_pw + "')";
	
	String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/odbo";
    String username="root";
    String password="vvinkite46!";
    Connection conn=null;
    
    Class.forName(driverName);
    conn=DriverManager.getConnection(url, username, password);
    
	
    if(u_id!=null && u_id.equals(u_pw)){
    	out.println(u_id + " 로그인 성공");
    }
    else{
    	out.println(u_id + " 로그인 실패");
    }
    conn.close();
   %>