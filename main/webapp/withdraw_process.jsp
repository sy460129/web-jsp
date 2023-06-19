<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
        String u_mail=request.getParameter("userMAIL");

        String sql="delete from members where id=?";

        String driverName="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/odbo";
        String username="root";
        String password="vvinkite46!";
        Connection conn=null;

        Class.forName(driverName);
        conn=DriverManager.getConnection(url, username, password);
        
        PreparedStatement sm=conn.prepareStatement(sql);
        sm.setString(1,u_id);

        int cnt=sm.executeUpdate();
        if(cnt==1){
            out.println("회원탈퇴 성공");
        }
        else{
            out.println("회원탈퇴 실패");
        }
        sm.close();
        conn.close();
        %>
    </body>
</html>