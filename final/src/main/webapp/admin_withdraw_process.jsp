<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>회원가입</title>
    </head>
    <body>
        <%
        String u_id=request.getParameter("userID");
        String u_pw=request.getParameter("userPW");

        String sql="delete from member where id=?";

        String driverName="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/final";
        String username="root";
        String password="";
        Connection conn=null;

        Class.forName(driverName);
        conn=DriverManager.getConnection(url, username, password);
        
        PreparedStatement sm=conn.prepareStatement(sql);
        sm.setString(1,u_id);

        int cnt=sm.executeUpdate();
        if(cnt==1){
        	%>
        	<script>
        		alert("회원 추방 성공!");
        	</script>
        	<%
            response.sendRedirect("admin.jsp");
        }
        else{
        	%>
        	<script>
        		alert("회원 추방 실패!");
        	</script>
        	<%
            response.sendRedirect("admin.jsp");
        }
        sm.close();
        conn.close();
        %>
    </body>
</html>
