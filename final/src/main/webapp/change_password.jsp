<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
                <a href="logout.jsp" style="font-size:20px" title="회원가입">로그아웃</a>
                <a href="withdraw.jsp" style="font-size:20px" title="회원탈퇴">회원탈퇴</a>
            </div>
        </div>

        <fieldset style="width:250px; height:120px" >
            <legend>비밀번호 변경</legend>
             <form action="change_password_process.jsp" method="post">
                <table>
                    <tr>
                        <td>ID : </td>
                        <td><input type="text" name="userID"></td>
                    </tr>
                    <tr>
                        <td>PW : </td>
                        <td><input type="password" name="userPW"></td>
                    </tr>
                    <tr>
                        <td>NEW PW : </td>
                        <td><input type="password" name="newPW"></td>
                    </tr>
                </table>                    
                <div style="text-align:right; margin-right:10px">
                	<input type="submit" value="변경">
                </div>
            </form>
        </fieldset>
    </body>
</html>