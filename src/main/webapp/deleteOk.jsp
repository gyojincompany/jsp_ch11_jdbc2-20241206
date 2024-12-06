<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 성공</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");
		
		String sql ="DELETE FROM membertbl WHERE memberid=?";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jbedu";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;		
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, mid);//sql 문 내의 첫번째 ?에 mid를 셋팅
			
			int resultNum = pstmt.executeUpdate();//성공하면 1 반환
			
			if(resultNum == 1) {
				out.println("회원 탈퇴 성공!!");
			} else {
				out.println("회원 탈퇴 실패!!");
			}
		}catch(Exception e){
			out.println("DB 에러 발생! 회원 탈퇴 실패!!");
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	
	%>
</body>
</html>