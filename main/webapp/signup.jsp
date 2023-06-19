<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>회원가입</title>
    </head>
    <body>
        <form action="signup_process.jsp" name="user_info" method="post">
            <fieldset style="width:200px">
                <legend> 회원 가입</legend>
                아이디 : <br>
                <input type="text" name="userID"><br><br>
                비밀번호 : <br>
                <input type="password" name="userPW"><br><br>
                이메일 : <br>
                <input type="email" name="userMAIL"><br><br>

                <div align="center">
                    <input type="submit" value="가입하기"> &nbsp;&nbsp;
                    <input type="reset" value="다시 작성">
                </div>
            </fieldset>
        </form>
    </body>
</html>