<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>register page</title>
</head>
<body>
		<%
	// Connection conn;
	PreparedStatement pstm;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/first", "root", "892989");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String password =request.getParameter("password");
	String date=request.getParameter("date");
	
	String sql="insert into register values(?,?,?,?)";
    pstm=conn.prepareStatement(sql);
    pstm.setString(1,name);
    pstm.setString(2,email);
    pstm.setString(3,password);
    pstm.setString(4,date);
    pstm.executeUpdate();
	}catch(Exception e){
		out.println(e);
	}
	out.println("<h1>your information is saved succesfully</h1><br>");
	out.println("<a href='http://localhost:8080/stocks_market/login.html' target='_self'>Login page</a>");
    
	%>
</body>
</html>