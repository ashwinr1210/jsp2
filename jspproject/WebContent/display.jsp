<%@page import="sun.font.CreatedFontTracker"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import=" java.sql.Statement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>display image</title>
</head>
<body>
 	<table ​border="1">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>email</th>
			<th>address</th>
			<th>image</th>
		</tr>
	<%
		/* int id = Integer.parseInt(request.getParameter("id")); */

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = (Connection) DriverManager
					.getConnection("jdbc:mysql://localhost:3306/aswin?user=root");
		
/* 			String q = "SELECT student_name,student_email,student_address,filename FROM students_details where student_id="
					+ id + ""; */
					
		    String q="SELECT * FROM students_details";	
			Statement smt = conn.createStatement();
			ResultSet rs = smt.executeQuery(q);

			while (rs.next()) {
				int id=rs.getInt("student_id");
				String name = rs.getString("student_name");
				String email = rs.getString("student_email");
				String address = rs.getString("student_address");
				String filename = rs.getString("filename");
	           %><tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=email%></td>
				<td><%=address%></td>
				<td><img src="D:\\images\\<%=filename%>" width="100" height="100" />
				</td></tr>
	
<%-- 	<table>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>email</th>
			<th>address</th>
			<th>image</th>
		</tr>
		<tr>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=email%></td>
			<td><%=address%></td>
			<td><img src="D:\\images\\<%=filename%>" width="100" height="100" /></td>
		</tr>
	</table> --%>

	<%
		}
		} catch (Exception e) {
			out.println(e);
		}
	%>




</body>
</html>