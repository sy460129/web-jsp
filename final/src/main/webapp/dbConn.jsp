<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>JDBC 커넥션</title>
    </head>
    <body>
      <%
        String driverName="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/final";
        String username="root";
        String password="";
        Connection conn=null;
       	try{ //JDBC
            Class.forName(driverName);
            conn=DriverManager.getConnection(url,username,password);
            out.println(">>연결 성공 : " + conn);
        }
        catch (ClassNotFoundException e){
            out.println(">> 연결 실패 : 드라이버 복사 필요!");
        } catch(SQLException e){
            out.println(">> 연결 실패 : SQL 명령문 확인 필요!");
        }
        finally{
            try{
                if(conn!=null){
                    conn.close();
                }
                
            }
            catch(SQLException e){
                ;
            }
        }
        %>
    </body>
</html>
