<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id=request.getParameter("userID");
	String u_pw=request.getParameter("userPW");
	
	if(u_id.equals("admin")){
    	session.setAttribute("memberID", u_id);
    	session.setAttribute("memberPW", "admin");
    	response.sendRedirect("admin.jsp");
    }
	
	String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/final";
    String username="root";
    String password="";
    Connection conn = null;
	Statement stmt = null;
	
	try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.createStatement();

        String checkSql = "select count(*) as count from member WHERE id = '" + u_id + "' and passwd = '" + u_pw + "'";
        ResultSet checkResult = stmt.executeQuery(checkSql);
        checkResult.next();
        int count = checkResult.getInt("count");

        if (count > 0) {
        	session.setAttribute("memberID", u_id);
        	session.setAttribute("memberPW", u_pw);
			response.sendRedirect("index_ok.jsp");
        }
        else {
            response.sendRedirect("fail_login");
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
