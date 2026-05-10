<%@ page import="java.sql.*" %>
<%@ page import="database.DBConnection" %>

<%
String courseId = request.getParameter("course_id");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
    "DELETE FROM enrollments WHERE student_id=? AND course_id=?"
);

ps.setInt(1,1);
ps.setInt(2,Integer.parseInt(courseId));

ps.executeUpdate();

response.sendRedirect("mycourses.jsp");
%>