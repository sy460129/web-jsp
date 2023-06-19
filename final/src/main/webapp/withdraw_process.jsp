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
        
        if(u_id.equals(session.getAttribute("memberID"))){
        	String sql="delete from member where id=? and passwd=?";

            String driverName="com.mysql.cj.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/final";
            String username="root";
            String password="vvinkite46!";
            Connection conn=null;

            Class.forName(driverName);
            conn=DriverManager.getConnection(url, username, password);
            
            PreparedStatement sm=conn.prepareStatement(sql);
            sm.setString(1,u_id);
    		sm.setString(2,u_pw);
    		
            int cnt=sm.executeUpdate();
            if(cnt==1){
            	%>
            	<script>
            		alert("회원 탈퇴 성공!");
            	</script>
            	<%
            	response.sendRedirect("index.html");
            }
            else{
            	%>
            	<script>
            		alert("회원 탈퇴 실패!");
            	</script>
            	<a href="index_ok.jsp">메인화면으로</a>
                <%
            }
            sm.close();
            conn.close();
        }
        else{
        	%>
        	<script>
        		alert("회원 탈퇴 실패!");
        	</script>
        	<a href="index_ok.jsp">메인화면으로</a>
            <%
        }
        %>        
    </body>
</html>