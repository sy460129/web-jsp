<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>회원가입</title>
    </head>
    <body>
        <form action="withdraw_process.jsp" name="user_info" method="post">
            <fieldset style="width:200px">
                <legend> 회원 탈퇴</legend>
                아이디 : <br>
                <input type="text" name="userID"><br><br>

                <div align="center">
                    <input type="submit" value="탈퇴하기"> &nbsp;&nbsp;
                </div>
            </fieldset>
        </form>
    </body>
</html>