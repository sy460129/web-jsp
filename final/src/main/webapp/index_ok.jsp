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
               			<a href="change_password.jsp" style="font-size:20px" title="비밀번호 변경">비밀번호 변경</a>
                		<a href="logout.jsp" style="font-size:20px" title="로그아웃">로그아웃</a>
                		<a href="withdraw.jsp" style="font-size:20px" title="회원탈퇴">회원탈퇴</a>
               		<% }%>
            </div>
        </div>
        <h1>12201731 박승연 - 방향키 게임</h1>
        <hr>
        <h2>게임 설명</h2>
        <div style="background:aliceblue">
            <details>
                <summary style="font-size:30px; cursor:pointer">난이도 EASY</summary>
                <p>방향키가 가리키는 방향이 위, 혹은 아래 두 가지 경우만 주어진다.<br>
                </p>
            </details>
            <br>
            <details>
                <summary style="font-size:30px; cursor:pointer">난이도 NORMAL</summary>
                <p>방향키가 가리키는 방향이 상하좌우 네 방향으로 주어진다.
                    만약 방향키를 잘못 입려한 경우 경고 문구를 띄운다.
                </p>
            </details>
            <br>
            <details>
                <summary style="font-size:30px; cursor:pointer">난이도 HARD</summary>
                <p>난이도 NORMAL의 조건을 만족한다.<br>
                    만약 방향키를 잘못 입력했을 경우 경고 문구를 띄우고, 누적된 틀린 횟수만큼 점수가 감소한다.<br>
                    점수는 0 보다 낮아질 수 없다.<br>
                    다음 순서로 입려해야 할 화살표의 방향이 보이지 않는다.<br>
                </p>
            </details>
        </div>
    </body>
</html>