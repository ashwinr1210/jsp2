<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student details</title>
</head>
<body>

	<form method ="post" action="/jspproject/hi"  enctype = "multipart/form-data" >

		<div>

			Name :<input type=text name="name" id="textname">
		</div>
		<br>
		<div>

			Mobile no :<input type=text name="mobile" id="mobile">
		</div>
		<br>
		<div>

			Personal Address :<input type=text name="address" id="address">
		</div>
		<br>

		<div>upload

			<input type="file"name="img" id="img"><br>
			<br> 
			<input type="submit" value="Submit">
		</div>
	</form>
</body>
</html>
