
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
            body {font-family:Consolas, sans-serif}
            .main{
                background: black;
                width: 100%;
                height: 500px;
                text-align:center;
            }
            .nav{
              display: flex;
              justify-content: space-between;
              align-items: center;
              padding: 10px;
              background:white;
            }
            .nav div{
                text-decoration: none;
                background:white;
                color: black;
                font-size:30px;
                margin-right:10px;
            }
            .nav a{
              text-decoration: none;
              color: black;
              font-size:30px;
              margin-right:10px;
            }
            td a {
                text-decoration: none;
                font-size: 30px;
                font-color:black;
            }
        </style>
    </head>
    <body>
        <div class="nav">
            <div>
                <a href="index_ok.jsp" title="home">Home</a>
                <a href="list.jsp" title="게시판">Community</a>
                <a href="game.html" title="게임실행">Game</a>
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
        <table border="1">
        	<tr>
        		<th> 난이도 랭킹</th>
        	</tr>
        	<tr>
        		<td><a href="ranking_easy.jsp">EASY</a></td>
        	</tr>
        	<tr>
        		<td><a href="ranking_normal.jsp">NORMAL</a></td>
        	</tr>
        	<tr>
        		<td><a href="ranking_hard.jsp">HARD</a></td>
        	</tr>
        </table>
    </body>
</html>