<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
	String u_id=(String)session.getAttribute("memberID");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>12201731_박승연</title>
        <style>
            body {
              font-family: Consolas, sans-serif;
            }
            .nav{
              display: flex;
              justify-content: space-between;
              align-items: center;
              padding: 10px;
            }
            .nav a{
              text-decoration: none;
              color: black;
              font-size:30px;
              margin-right:10px;
            }
            summary:hover{
                color:red;
            }
        </style>
    </head>
    <body>
        <div class="nav">
        	<div>
                <a href="admin.jsp" title="home">Home</a>
                <a href="list.jsp" title="게시판">Community</a>
            	<a href="admin_memberList.jsp">Member</a>
            	<a href="admin_withdraw.jsp">Expel</a>
            </div>
            <div>
                <a href="admin.jsp" title="admin"><strong>admin</strong></a>
            	<a href="logout.jsp" title="로그아웃">로그아웃</a>
            </div>
        	
        </div>
        <%
    
    String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/final";
    String username="root";
    String password="";
    Connection conn=null;
    PreparedStatement pstmt = null;
    
    Class.forName(driverName);
    conn=DriverManager.getConnection(url,username,password);
    Statement stmt = conn.createStatement();
    
    
    String sql = "select * from board";
    ResultSet rs = stmt.executeQuery(sql);
    
%>
    <h1>게시판 목록</h1>
    <a href="write.jsp">글쓰기</a>
    <a href="list.jsp">글 목록</a><br><br>
    <table>
        <tr>
        	<th>번호</th>
            <th>ID</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        <% while (rs.next()) { %>        
            <tr>
            	<td><%= rs.getString("list_id") %></td>
                <td><%= rs.getString("id") %></td>
                <td><a href="view.jsp?list_id=<%= rs.getString("list_id") %>"><%= rs.getString("subject") %></a></td>
                <td><%= rs.getTimestamp("date") %></td>
            </tr>
        
        <% } %>
    </table>

<%
    
    rs.close();
    stmt.close();
    conn.close();
%>
    </body>
</html>
