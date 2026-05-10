<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>

<html>
<head>
    <title>Enroll</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<%

String courseId = request.getParameter("id");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "INSERT INTO enrollments(student_id, course_id) VALUES(?,?)"
);

ps.setInt(1,1);
ps.setInt(2,Integer.parseInt(courseId));

int i = ps.executeUpdate();

if(i > 0){

%>

    <h2>Enrollment Successful!</h2>

<%

}

%>

<br>

<a href="courses.jsp">Back to Courses</a>

</body>
</html>