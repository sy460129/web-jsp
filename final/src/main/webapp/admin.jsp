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
            	font-size:20px;
            }
            .nav a{
              color: black;
              font-size:30px;
              text-align:right;
            }
            div a{
            	font-size:50px;
            	margin-right:20px;
            	text-decoration:none;
            }
            p{
            	font-size:20px;
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
        <h1>admin 계정으로 로그인</h1>
        <hr><br><br>
        <p>관리자 계정으로 접속하였습니다.</p>
        <p>관리자 계정으로는 게시판 관리, 회원 관리 등을 할 수 있습니다.</p>
    </body>
</jsp>