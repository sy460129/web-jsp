<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id=(String)session.getAttribute("memberID");
	String u_pw=(String)session.getAttribute("memberPW");
%>
<%
    String score = request.getParameter("score");
	String level = "easy"; 
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());


    String driverName = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/final";
    String username = "root";
    String password = "vvinkite46!";
    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.createStatement();
		
        String sql = "insert into easy(score, id, level, date) values";
        sql += "('" + score + "','" + u_id + "','" + level + "', '"  + timestamp + "')";

        int cnt = stmt.executeUpdate(sql);
        response.sendRedirect("ranking.jsp");
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