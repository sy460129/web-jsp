<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>12201731_박승연</title>
    </head>
    <body>
        <form action="admin_withdraw_process.jsp" name="user_info" method="post">
            <fieldset style="width:200px">
                <legend> 회원 추방</legend>
                아이디 : <br>
                <input type="text" name="userID"><br><br>

                <div align="center">
                    <input type="submit" value="추방하기"> 
                    <input type="button" onclick="location.href='admin.jsp'" value="메인으로">
                    &nbsp;&nbsp;
                </div>
            </fieldset>
        </form>
    </body>
</html>