<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h2>Student Login</h2>

<form method="post">

    Email:
    <input type="email" name="email"><br><br>

    Password:
    <input type="password" name="password"><br><br>

    <input type="submit" value="Login">

</form>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");

if(email != null && password != null){

    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM students WHERE email=? AND password=?"
    );

    ps.setString(1,email);
    ps.setString(2,password);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){

    	response.sendRedirect("dashboard.jsp");

    } else {

        out.println("<h3>Invalid Email or Password!</h3>");
    }
}

%>

</body>
</html>