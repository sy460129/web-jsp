<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id=(String)session.getAttribute("memberID");
	String u_pw=(String)session.getAttribute("memberPW");
%>
<%
    String subject = request.getParameter("title");
    String content = request.getParameter("content");
    String pw = request.getParameter("password");
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());


    String driverName = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/final";
    String username = "root";
    String password = "";
    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.createStatement();
		
        if(u_pw.equals(pw) || u_id.equals("admin")){
        	
            String sql = "insert into board(id, subject, content, date) values";
            sql += "('" + u_id + "','" + subject + "','" + content + "','" + timestamp + "')";

            int cnt = stmt.executeUpdate(sql);
            response.sendRedirect("list.jsp");
        }
        else{
        	response.sendRedirect("fail_write");
        }
    } catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
