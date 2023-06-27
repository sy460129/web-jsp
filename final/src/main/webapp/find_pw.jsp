<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>12201731_박승연</title>
</head>
<body>
<%
	String u_id=request.getParameter("userID");
	
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

        String sql = "SELECT * FROM member WHERE id = '" + u_id + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if(rs.next()){
        %>
        <table border="1">
        	<tr>
        		<td>ID : </td>
        		<td><%=u_id %></td>
        	</tr>
        	<tr>
        		<td>PW : </td>
        		<td><%=rs.getString("passwd") %></td>
        	</tr>
        	<tr>
        		<td>E-mail : </td>
        		<td><%=rs.getString("email") %></td>
        	</tr>
        </table>
        <%
        }
        else{
        	%>
        	ID : <%=u_id %>가 존재하지 않습니다!
        	<%
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
<br>
<a href="login.html">로그인 하러 가기</a>
</body>
</html>
