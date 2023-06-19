<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
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
                <a href="index.html" title="home">Home</a>
                <a href="javascript:alert('로그인을 하세요!')" title="게시판">Community</a>
                <a href="javascript:alert('로그인을 하세요!')" title="게임">Game</a>
                <a href="javascript:alert('로그인을 하세요!')" title="랭킹">Ranking</a>
            </div>
            <div>
                <a href="login.html" style="font-size:20px" title="로그인">Login</a>
                <a href="register.jsp" style="font-size:20px" title="회원가입">Register</a>
            </div>
        </div>

        <form action="register_process.jsp" name="user_info" method="post">
            <fieldset style="width:250px">
                <legend> 회원 가입</legend>
                <table>
                	<tr>
                		<td>아이디</td>
                		<td><input type="text" name="userID"></td>
                	</tr>
                	<tr>
                		<td>비밀번호</td>
                		<td><input type="password" name="userPW"></td>
                	</tr>
                	<tr>
                		<td>이메일</td>
                		<td><input type="email" name="userMAIL"></td>
                	</tr>
                </table>

                <div align="right">
                    <input type="submit" value="가입하기">
                </div>
            </fieldset>
        </form>
    </body>
</html>