<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.studentcrud.Student,com.studentcrud.StudentDAO,java.util.List,java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head><title>Student List</title></head>
<body>
    <h2>Student List</h2>

    <%
        try {
            List<Student> students = new StudentDAO().getAllStudents();
    %>
    <table border="1" cellpadding="8">
        <tr>
            <th>Roll No</th><th>Name</th><th>Email</th><th>Age</th><th>Actions</th>
        </tr>
        <% for (Student student : students) { %>
        <tr>
            <td><%= student.getRollNo() %></td>
            <td><%= student.getName() %></td>
            <td><%= student.getEmail() %></td>
            <td><%= student.getAge() %></td>
            <td>
                <a href="update-student.jsp?rollNo=<%= student.getRollNo() %>">Update</a>
                |
                <form action="delete-student.jsp" method="post" style="display:inline"
                      onsubmit="return confirm('Delete this student?');">
                    <input type="hidden" name="rollNo" value="<%= student.getRollNo() %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <% } %>
        <% if (students.isEmpty()) { %>
        <tr><td colspan="5">No students found.</td></tr>
        <% } %>
    </table>
    <%
        } catch (SQLException e) {
    %>
        <p>Unable to load students. Check the database connection.</p>
    <%
        }
    %>

    <br><a href="add-student.jsp">Add New Student</a>
</body>
</html>
