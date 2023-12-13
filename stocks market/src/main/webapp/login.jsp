<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login page</title>
</head>
<body>
		<%
		String userName;

		String userPsw;
		Connection con= null;

		PreparedStatement ps = null;

		ResultSet rs = null;



		String driverName = "com.mysql.cj.jdbc.Driver";

		String url = "jdbc:mysql://localhost:3306/first";

		String user = "root";

		String dbpsw = "892989";
		String sql = "select * from register where name=? and password=?";
		String name = request.getParameter("name");

		String password = request.getParameter("password");
		if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || 
				password.equals(""))))

				{

				try{

				Class.forName(driverName);

				con = DriverManager.getConnection(url, user, dbpsw);

				ps = con.prepareStatement(sql);

				ps.setString(1, name);

				ps.setString(2, password);

				rs = ps.executeQuery();

				if(rs.next())

				{ 

				userName = rs.getString("name");

				userPsw = rs.getString("password");
				if(name.equals(userName) && password.equals(userPsw))

				{

				out.println("<h1> login succesfully </h1><br>"); 
				out.println("<a href='http://localhost:8080/stocks_market/index.html' target='_self'>Home Page</a><br> <br>");

				} 

				}

				else

				out.println("<h1>Incoorect username and Password</h1>");
				out.println("<a href='http://localhost:8080/stocks_market/login.html' target='_self'>Retry</a>");
				

				rs.close();

				ps.close(); 

				}

				catch(Exception sqe)

				{

				out.println(sqe);

				} 

				}

				else

				{
					
				}
				
		%>
	
</body>
</html>