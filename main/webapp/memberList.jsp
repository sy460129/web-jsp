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
        String u_mail=request.getParameter("userMAIL");

        String sql="insert into members(id, passwd, email) values";
        sql+="('"+ u_id + "','"+ u_pw+"', '" + u_mail+"')";
		
        String driverName="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/odbo";
        String username="root";
        String password="vvinkite46!";
        Connection conn=null;

        Class.forName(driverName);
        conn=DriverManager.getConnection(url, username, password);
        
        Statement sm=conn.createStatement();
        ResultSet rs=sm.executeQuery("select id, passwd, email, signup from members");

        String str="";
        int cnt=1;

        while(rs.next()){
            str+=cnt+" : "+ rs.getString("id")+" / " + rs.getString("passwd") + "/" + rs.getString("email")+ " / " +rs.getString("signup")+"<br>";
            cnt++;
        }
        out.print("Home > 회원가입 명단<br>");
        out.print(str);

        rs.close();
        sm.close();
        conn.close();
        %>
    </body>
</html>