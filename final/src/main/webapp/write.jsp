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
                <a href="logout.jsp" style="font-size:20px" title="로그아웃">로그아웃</a>
                <a href="withdraw.jsp" style="font-size:20px" title="회원탈퇴">회원탈퇴</a>
            </div>
        </div>

        <h1>글 작성</h1>
    	<form action="write_post.jsp" method="post">
        <table>
        	<tr>
        		<td>제목</td>
        		<td><input type="text" name="title"></td>
        	</tr>
        	<tr>
        		<td>내용</td>
        		<td><textarea name="content" rows="5" cols="50"></textarea></td>
        	</tr>
        	<tr>
        		<td>비밀번호</td>
        		<td><input type="password" name="password"></td>
        	</tr>
        	<tr>
        		<td><input type="submit" value="작성"></td>
        	</tr>
        </table>
    </form>
    </body>
</html>