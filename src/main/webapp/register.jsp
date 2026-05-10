<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>

<html>
<head>
    <title>Student Registration</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h2>Student Registration</h2>

<form method="post">

    Name:
    <input type="text" name="name"><br><br>

    Email:
    <input type="email" name="email"><br><br>

    Password:
    <input type="password" name="password"><br><br>

    <input type="submit" value="Register">

</form>

<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

if(name != null && email != null && password != null){

    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO students(name,email,password) VALUES(?,?,?)"
    );

    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,password);

    int i = ps.executeUpdate();

    if(i > 0){
        out.println("<h3>Registration Successful!</h3>");
    }
}

%>

</body>
</html>