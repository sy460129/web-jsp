<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>로그인</title>
    </head>
    <body>
        <form action="login_process.jsp" name="user_info" method="post">
            <fieldset style="width:200px">
                <legend> 로그인</legend>
                아이디 : <br>
                <input type="text" name="userID"><br><br>
                비밀번호 : <br>
                <input type="password" name="userPW"><br><br>
                <div align="center">
                    <input type="submit" value="로그인">
                </div>
            </fieldset>
        </form>
    </body>
</html>