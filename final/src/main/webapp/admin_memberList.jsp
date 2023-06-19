<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>12201731_박승연</title>
    </head>
    <body>
        <%
        String driverName="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/final";
        String username="root";
        String password="vvinkite46!";
        Connection conn=null;

        Class.forName(driverName);
        conn=DriverManager.getConnection(url, username, password);
        
        Statement sm=conn.createStatement();
        ResultSet rs=sm.executeQuery("select * from member");

        out.print("회원 명단<br>");
        while(rs.next()){
            %>
            <table border="1">
            	<tr>
            		<td>ID : <%=rs.getString("id") %></td>
            		<td>PW : <%=rs.getString("passwd") %></td>
            		<td>E-Mail : <%=rs.getString("email") %></td>
            		<td>Sign-up : <%=rs.getString("signup") %></td>
            	</tr>
            </table>
            <%
        }       

        rs.close();
        sm.close();
        conn.close();
        %>
        <fieldset style="width:230px; height:80px" >
            <legend>아이디 찾기</legend>
             <form action="admin_find_pw.jsp" method="post">
                <table>
                    <tr>
                        <td>ID : </td>
                        <td><input type="text" name="userID"></td>
                    </tr>
                </table>                    
                <div style="text-align:right; margin-right:20px">
                	<input type="submit" value="찾기">
                </div>
            </form>
        </fieldset>
       	<a href="admin.jsp">HOME</a>
    </body>
</html>