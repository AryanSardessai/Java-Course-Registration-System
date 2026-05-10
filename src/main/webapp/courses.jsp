<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>

<html>
<head>
    <title>Courses</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h2>Available Courses</h2>

<hr>

<%

Connection con = DBConnection.getConnection();

Statement st = con.createStatement();

ResultSet rs = st.executeQuery("SELECT * FROM courses");

while(rs.next()){

%>

    <h3><%= rs.getString("course_name") %></h3>

    Instructor:
    <%= rs.getString("instructor") %>

    <br><br>

    <a href="enroll.jsp?id=<%= rs.getInt("course_id") %>">
        Enroll
    </a>

    <hr>

<%

}

%>

<br>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>