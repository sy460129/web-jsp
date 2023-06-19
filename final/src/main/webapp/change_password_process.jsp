<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String id=(String)session.getAttribute("memberID");
%>
<html>
<head>
<title>12201731_박승연</title>
</head>
<body>
<%
	String u_id=request.getParameter("userID");
	String u_pw=request.getParameter("userPW");
	String newpw=request.getParameter("newPW");
	
	if(u_pw.equals(newpw) || !(id.equals(u_id))){
		response.sendRedirect("fail_change_pw.jsp");
	}
	String driverName="com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/final";
    String username="root";
    String password="vvinkite46!";
    Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);

        String sql = "select passwd from member where id='" + u_id + "' and passwd=" + u_pw;
        pstmt = conn.prepareStatement(sql);
        
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
        	sql="update member set passwd='" + newpw + "' where id='" + u_id + "'";
        	pstmt=conn.prepareStatement(sql);
        	int check = pstmt.executeUpdate();
        	if(check>0){
        		response.sendRedirect("success_change_pw");
        	}
        	else{
    			response.sendRedirect("fail_change_pw");
    		}
		} 
        else{
			response.sendRedirect("fail_change_pw");
		}
    } catch (Exception e) {
        out.println("오류가 발생했습니다: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
<br>
<a href="login.html">로그인 하러 가기</a>
</body>
</html>