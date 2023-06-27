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
              margin-right:10px;
            }
            div a{
            	font-size:20px;
            	margin-right:20px;
            }
            a{
            	text-decoration: none;
            }
        </style>
    </head>
    <%
    	String driverName="com.mysql.cj.jdbc.Driver";
    	String url="jdbc:mysql://localhost:3306/final";
    	String username="root";
    	String password="";
    	Connection conn=null;
    	PreparedStatement pstmt = null;

    	Class.forName(driverName);
    	conn=DriverManager.getConnection(url,username,password);

    	String listID = request.getParameter("list_id");
	%>
    <body>
        <h1>글 수정</h1>
    	<form action="list_modify_process.jsp?list_id=<%=listID %>" method="post">
        <table>
        	<tr>
        		<td>제목</td>
        		<td><input type="text" name="new_subject"></td>
        	</tr>
        	<tr>
        		<td>내용</td>
        		<td><textarea name="new_content" rows="5" cols="50"></textarea></td>
        	</tr>
        	<tr>
        		<td><input type="submit" value="수정"></td>
        	</tr>
        </table>
    </form>
    </body>
</jsp>
