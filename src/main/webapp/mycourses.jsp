<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>

<html>
<head>
    <title>My Courses</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h2>My Enrolled Courses</h2>

<hr>

<%

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(

		"SELECT courses.course_id, courses.course_name, courses.instructor " +
    "FROM enrollments " +
    "JOIN courses ON enrollments.course_id = courses.course_id " +
    "WHERE enrollments.student_id=?"

);

ps.setInt(1,1);

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

    <div class="course">

<h3><%= rs.getString("course_name") %></h3>

<p>
Instructor:
<%= rs.getString("instructor") %>
</p>

<a href="unenroll.jsp?course_id=<%= rs.getInt("course_id") %>">
    <button>Leave Course</button>
</a>

</div>

<%

}

%>

<br>

<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>