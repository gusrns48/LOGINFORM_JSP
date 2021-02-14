<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "tiger";
	String sql = "insert into member2 values(?, ?, ?, ?, ?, ?, ?, ?, ?)";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 성공</title>
<style>
	body {
		text-align: center;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String mail = request.getParameter("mail");
		String mail2 = request.getParameter("mail2");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		String num = request.getParameter("num");
		try {
			//(1 단계) JDBC 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//(2 단계) 데이터베이스 연결 객체인 Connection 생성
			conn = DriverManager.getConnection(url, uid, pass);
			//(3 단계) Statement 객체 생성하기
			pstmt = conn.prepareStatement(sql);
			//(4 단계) 바인딩 변수를 채운다.
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, mail + "@" + mail2);
			pstmt.setString(6, phone);
			pstmt.setString(7, address);
			pstmt.setString(8, birth);
			pstmt.setString(9, num);
			
			//(5단계) SQL문을 실행하여 결과 처리
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//(6단계) 사용한 리소스 해제
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//finally의 끝
	%>
	        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <b><font size="8" color="#7ba0cc">한양대학교</font></b><br>
        <b><font size="8" color="#A9D0F5">회원이 되신 걸</font></b><br>
        <b><font size="8" color="#E0ECF8">축하드립니다 :)</font></b>
        <br><br><br>
	

	<a href="01_allMember.jsp"> 학생 목록 보기 </a>
</body>
</html>