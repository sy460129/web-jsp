<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
    String u_id = request.getParameter("userID");
    String u_pw = request.getParameter("userPW");
    String u_mail = request.getParameter("userMAIL");

    String driverName = "com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/odbo";
    String username = "root";
    String password = "vvinkite46!";
    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.createStatement();

        // 중복 ID 체크
        String checkSql = "SELECT COUNT(*) AS count FROM members WHERE id = '" + u_id + "'";
        ResultSet checkResult = stmt.executeQuery(checkSql);
        checkResult.next();
        int count = checkResult.getInt("count");

        if (count > 0) {
            out.println("fail");
        } else {
            String insertSql = "INSERT INTO members(id, passwd, email) VALUES";
            insertSql += "('" + u_id + "','" + u_pw + "','" + u_mail + "')";

            int cnt = stmt.executeUpdate(insertSql);
            if (cnt == 1) {
                out.println("success");
            } else {
                out.println("fail");
            }
        }

        checkResult.close();
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