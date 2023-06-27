<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
	String u_id=(String)session.getAttribute("memberID");
%>
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
		String driverName="com.mysql.cj.jdbc.Driver";
    	String url="jdbc:mysql://localhost:3306/final";
    	String username="root";
    	String password="";
    	Connection conn=null;
    	PreparedStatement pstmt = null;
    
    	Class.forName(driverName);
    	conn=DriverManager.getConnection(url,username,password);
    	Statement stmt = conn.createStatement();
		String listId = request.getParameter("list_id");
    
    	String sql = "select * from board where list_id=?";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, listId);
    	ResultSet rs = pstmt.executeQuery();
    
    	if (rs.next()) { %>
    		<table>
       			<tr>
       				<th>id</th>
       				<td><%=rs.getString("id") %></td>
       			</tr>
       			<tr>
       				<th>Title</th>
       				<td><%=rs.getString("subject") %></td>
       			</tr>
       			<tr>
       				<th>Content</th>
       				<td><%=rs.getString("content") %></td>
       			</tr>
       			<tr>
       				<th>Date</th>
       				<td><%=rs.getString("date") %></td>
       			</tr>
       		</table>
    	<% 
    		if(u_id.equals(rs.getString("id")) || u_id.equals("admin")){ %>    			
    			<a href="list_modify.jsp?list_id=<%=rs.getString("list_id")%>">수정</a>
    			<a href="list_delete_process.jsp?list_id=<%=rs.getString("list_id")%>">삭제</a>
    			<%
    		}
    	} 
    	rs.close();
    	pstmt.close();
    	conn.close();
	%>    
</body>
</html>
