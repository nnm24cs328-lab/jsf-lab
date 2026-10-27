<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.studentcrud.Student,com.studentcrud.StudentDAO,java.sql.SQLException" %>

<%
    StudentDAO dao = new StudentDAO();
    Student student = null;
    String message = "";
    String rollNoValue = request.getParameter("rollNo");

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Student updatedStudent = new Student(
                Integer.parseInt(request.getParameter("rollNo")),
                request.getParameter("name"),
                request.getParameter("email"),
                Integer.parseInt(request.getParameter("age"))
            );
            dao.updateStudent(updatedStudent);
            response.sendRedirect("list-student.jsp");
            return;
        } catch (NumberFormatException e) {
            message = "Enter a valid roll number and age.";
        } catch (SQLException e) {
            message = "Unable to update student. Check the database connection.";
        }
    }

    if (rollNoValue != null && !rollNoValue.trim().isEmpty()) {
        try {
            student = dao.getStudentByRollNo(Integer.parseInt(rollNoValue));
            if (student == null) {
                message = "Student not found.";
            }
        } catch (NumberFormatException e) {
            message = "Invalid roll number.";
        } catch (SQLException e) {
            message = "Unable to load student. Check the database connection.";
        }
    } else {
        message = "Roll number is required.";
    }
%>

<!DOCTYPE html>
<html>
<head><title>Update Student</title></head>
<body>
    <h2>Update Student</h2>
    <p><%= message %></p>

    <% if (student != null) { %>
    <form action="update-student.jsp" method="post">
        Roll No: <%= student.getRollNo() %>
        <input type="hidden" name="rollNo" value="<%= student.getRollNo() %>"><br><br>
        Name: <input type="text" name="name" value="<%= student.getName() %>" required><br><br>
        Email: <input type="email" name="email" value="<%= student.getEmail() %>" required><br><br>
        Age: <input type="number" name="age" min="1" value="<%= student.getAge() %>" required><br><br>
        <input type="submit" value="Update Student">
    </form>
    <% } %>

    <br><a href="list-student.jsp">Back to Student List</a>
</body>
</html>
