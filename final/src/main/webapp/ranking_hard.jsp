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
                <a href="logout.jsp" style="font-size:20px" title="회원가입">로그아웃</a>
                <a href="withdraw.jsp" style="font-size:20px" title="회원가입">회원탈퇴</a>
            </div>
        </div>
        <%
    // 데이터베이스 연결 설정
    String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/final";
    String username="root";
    String password="";
    Connection conn=null;
    
    Class.forName(driverName);
    conn=DriverManager.getConnection(url,username,password);
    Statement stmt = conn.createStatement();

    // 게시판 데이터 조회
    String query = "select * from hard order by score desc;";
    ResultSet rs = stmt.executeQuery(query);
%>
    <h1>HARD RANKING</h1>
    <table>
        <tr>
            <th>SCORE</th>
            <th>ID</th>
            <th>LEVEL</th>
            <th>TIME</th>
        </tr>
        <% while (rs.next()) { %>
        
            <tr>
                <td><%= rs.getInt("score") %></td>
                <td><%= rs.getString("id") %></td>
                <td><%= rs.getString("level") %></td>
                <td><%= rs.getTimestamp("date") %></td>
            </tr>
        
        <% } %>
    </table>

<%
    // 연결 및 리소스 해제
    rs.close();
    stmt.close();
    conn.close();
%>
    </body>
</html>
