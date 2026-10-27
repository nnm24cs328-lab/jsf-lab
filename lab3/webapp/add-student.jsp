<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.studentcrud.Student,com.studentcrud.StudentDAO,java.sql.SQLException" %>

<%
    String message = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Student student = new Student(
                Integer.parseInt(request.getParameter("rollNo")),
                request.getParameter("name"),
                request.getParameter("email"),
                Integer.parseInt(request.getParameter("age"))
            );

            new StudentDAO().addStudent(student);
            response.sendRedirect("list-student.jsp");
            return;
        } catch (NumberFormatException e) {
            message = "Enter a valid roll number and age.";
        } catch (SQLException e) {
            message = "Unable to add student. Check the roll number and database connection.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head><title>Add Student</title></head>
<body>
    <h2>Add Student</h2>
    <form action="add-student.jsp" method="post">
        Roll No: <input type="number" name="rollNo" required><br><br>
        Name: <input type="text" name="name" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        Age: <input type="number" name="age" min="1" required><br><br>
        <input type="submit" value="Add Student">
    </form>
    <p><%= message %></p>
    <a href="list-student.jsp">View Students</a>
</body>
</html>
