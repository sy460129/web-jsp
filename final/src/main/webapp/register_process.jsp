<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>

<%
    String u_id = request.getParameter("userID");
    String u_pw = request.getParameter("userPW");
    String u_mail = request.getParameter("userMAIL");

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

        String sql = "select count(*) AS count from member where id = '" + u_id + "'";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        int count = rs.getInt("count");

        if (count > 0) {
        	response.sendRedirect("fail_register");
        }
        else {
            String insertSql = "insert into member(id, passwd, email) values";
            insertSql += "('" + u_id + "','" + u_pw + "','" + u_mail + "')";

            int cnt = stmt.executeUpdate(insertSql);
            if (cnt == 1) {
            	response.sendRedirect("success_register");
            } else {
            	response.sendRedirect("fail_register");
            }
        }
        rs.close();
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