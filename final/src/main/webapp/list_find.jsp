<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<body>
<%
	String s_id=request.getParameter("search_id");
	String s_subject=request.getParameter("search_subject");
	String sql=null;
	
	String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/final";
    String username="root";
    String password="";
    Connection conn=null;
	Statement stmt=null;
	
	try {
        Class.forName(driverName);
        conn=DriverManager.getConnection(url, username, password);
        stmt=conn.createStatement();
        
        if(s_id.equals("") && s_subject.equals("")){
        	response.sendRedirect("list.jsp");
        }
        else if(s_id.equals("") && !(s_subject.equals(""))){
        	sql="select * from board where subject = '" + s_subject + "'";
        }
        else if(!(s_id.equals("")) && s_subject.equals("")){
        	sql="select * from board where id = '" + s_id + "'";
        }
        else{
        	sql="select * from board where id='" + s_id + "' and subject = '" + s_subject + "'";
        }
        
        ResultSet rs = stmt.executeQuery(sql);
        %>
        <table>
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        <% while(rs.next()){ %>
        
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><a href="view.jsp?list_id=<%= rs.getString("list_id") %>"><%= rs.getString("subject") %></a></td>
                <td><%= rs.getTimestamp("date") %></td>
            </tr>
        
        <% } %>
        </table><br><br>
    	<a href="list.jsp">글 목록</a>
        <%
        rs.close();
    } catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
</body>
</html>
