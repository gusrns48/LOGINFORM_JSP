<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!//선언부는 첫 방문자에 의해서 단 한번 수행합니다.
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "tiger";
	String sql = "select * from member2";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
	}
	
	table {
		margin: 0 auto;
	}
	
	table, th, td {
		border: 1px solid #7ba0cc;
	}
</style>
</head>
<body>
	<table width='800' border='1'>
		<tr>
		<br><br>
        <b><font size="6" color="#7ba0cc">한양대학교</font></b><br>
        <b><font size="6" color="#7ba0cc">회원 목록</font></b> 
			<th>이이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>출생년도</th>
			<th>학번</th>
			<th>메일</th>
			<th>휴대전화</th>
			<th>주소</th>
		</tr>
		<h5>불법으로 유포, 악용 할 경우 처벌의 대상이 됩니다 :(</h5>
		<%
			try {
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, uid, pass);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>" + rs.getString("id") + "</td>");
					out.println("<td>" + rs.getString("password") + "</td>");
					out.println("<td>" + rs.getString("name") + "</td>");
					out.println("<td>" + rs.getString("gender") + "</td>");
					out.println("<td>" + rs.getString("birth") + "</td>");
					out.println("<td>" + rs.getString("num") + "</td>");
					out.println("<td>" + rs.getString("mail")+ "</td>");
					out.println("<td>" + rs.getString("phone") + "</td>");
					out.println("<td>" + rs.getString("address") + "</td>");
					out.println("</tr>");
				}//while의 끝
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//finally의 끝
		%>
	</table>
</body>
</html>