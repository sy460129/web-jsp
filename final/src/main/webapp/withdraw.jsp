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
            p{
            	font-size:20px;
            }
        </style>
        <Script>
        	function check(){
        		let p=document.getElementById("id");
        		if(p== <%=u_id %>) return true;
        		else return false;
        	}
        </Script>
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
        <h1>회원 탈퇴</h1>
        <hr>
        <form action="withdraw_process.jsp" name="user_info" method="post">
            <fieldset style="width:200px">
                <legend> 회원 탈퇴</legend>
                아이디 <br>
                <input type="text" name="userID" id="id"><br><br>
				비밀번호 <br>
				<input type="password" name="userPW"><br><br>
                <div align="center">
                    <input type="submit" value="탈퇴하기" onclick="check()"> &nbsp;&nbsp;
                </div>
            </fieldset>
        </form>
    </body>
</jsp>