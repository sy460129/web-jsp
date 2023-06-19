<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String id=(String)session.getAttribute("memberID");
%>
<html>
<head>
<title>12201731_박승연</title>
</head>
<body>
<%
	String listID=request.getParameter("list_id");

	String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/final";
    String username="root";
    String password="vvinkite46!";
    Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);

        String sql="delete from board where list_id=" + listID;
        pstmt = conn.prepareStatement(sql);
        pstmt.executeUpdate();
        
        response.sendRedirect("success_delete_post");
    } catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
</body>
</html>