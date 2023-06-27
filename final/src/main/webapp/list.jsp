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
                <a href="index_ok.jsp" title="home">Home</a>
                <a href="list.jsp" title="게시판">Community</a>
                <a href="game.html" title="게임">Game</a>
                <a href="ranking.jsp" title="랭킹">Ranking</a>
            </div>
            <div>
               	<a href="index_ok.jsp"><%= u_id %>님 환영합니다!</a>
                <%
               		if(u_id.equals("admin")){ %>
               			<a href="logout.jsp" style="font-size:20px" title="로그아웃">로그아웃</a>
               		<%}
               		else{ %>
               			<a href="change_password.jsp" style="font-size:20px" title="회원가입">비밀번호 변경</a>
                		<a href="logout.jsp" style="font-size:20px" title="로그아웃">로그아웃</a>
                		<a href="withdraw.jsp" style="font-size:20px" title="회원탈퇴">회원탈퇴</a>
               		<% }%>
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
    
    int cnt=1;
    
    String sql = "select * from board";
    ResultSet rs = stmt.executeQuery(sql);
    
%>
    <h1>게시판 목록</h1>
    <a href="write.jsp">글쓰기</a>
    <a href="list.jsp">글 목록</a><br><br>
    <table>
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        <% while (rs.next()) { %>        
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><a href="view.jsp?list_id=<%= rs.getString("list_id") %>"><%= rs.getString("subject") %></a></td>
                <td><%= rs.getTimestamp("date") %></td>
            </tr>
        
        <% } %>
    </table>
    <br>
    <h3>검색</h3>
    <form action="list_find.jsp" method="post">
    	ID : <input type="text" name="search_id"><br>
    	제목 : <input type="text" name="search_subject"><br>
    	<input type="submit" value="검색">
    </form>

<%
    
    rs.close();
    stmt.close();
    conn.close();
%>
    </body>
</html>
