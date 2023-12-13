<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>contact us</title>
</head>
<body>
	<%
	// Connection conn;
	PreparedStatement pstm;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/first", "root", "892989");
	String name=request.getParameter("your name");
	String email=request.getParameter("email");
	String number=request.getParameter("number");
	String sql="insert into contactus values(?,?,?)";
    pstm=conn.prepareStatement(sql);
    pstm.setString(1,name);
    pstm.setString(2,email);
    pstm.setString(3,number);
    pstm.executeUpdate();
	}catch(Exception e){
		out.println(e);
	}
	out.println("<h1>your information is saved succesfully</h1><br>");
	out.println("<a href='http://localhost:8080/stocks_market/index.html' target='_self'>Home Page</a>");
    
	%>
</body>
</html>