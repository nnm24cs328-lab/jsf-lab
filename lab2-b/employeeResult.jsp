
<%@ page contentType="text/html; charset=UTF-8"
         language="java"
         import="java.util.Calendar,java.util.regex.Pattern" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Information Result</title>
</head>
<body>

<h2>Employee Information Result</h2>

<%
    request.setCharacterEncoding("UTF-8");

    String empId = request.getParameter("empId");
    String name = request.getParameter("name");
    String ageStr = request.getParameter("age");
    String dep = request.getParameter("dep");
    String email = request.getParameter("email");

    String empIdError = "";
    String nameError = "";
    String ageError = "";
    String depError = "";
    String emailError = "";

    boolean isValid = true;

    // 1. Validate Employee ID
    if (empId == null || empId.trim().isEmpty()) {
        empIdError = "Employee ID is required.";
        isValid = false;
    }

    // 2. Validate Name: letters and spaces only
    if (name == null ||
        !name.trim().matches("[a-zA-Z ]+")) {
        nameError = "Name must contain only letters and spaces.";
        isValid = false;
    }

    // 3. Validate Age: numeric value between 18 and 65
    int age = 0;

    try {
        if (ageStr == null || ageStr.trim().isEmpty()) {
            throw new NumberFormatException();
        }

        age = Integer.parseInt(ageStr.trim());

        if (age < 18 || age > 65) {
            ageError = "Age must be between 18 and 65.";
            isValid = false;
        }

    } catch (NumberFormatException e) {
        ageError = "Age must be a valid number.";
        isValid = false;
    }

    // 4. Validate Department
    if (dep == null ||
        !dep.matches("HR|Finance|IT|Sales")) {
        depError = "Please select a valid department.";
        isValid = false;
    }

    // 5. Validate Email
    String emailRegex =
        "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";

    if (email == null ||
        !Pattern.matches(emailRegex, email.trim())) {
        emailError = "Please enter a valid email address.";
        isValid = false;
    }
%>

<% if (!isValid) { %>

    <h3>Validation Errors</h3>

    <ul>
        <% if (!empIdError.isEmpty()) { %>
            <li><%= empIdError %></li>
        <% } %>

        <% if (!nameError.isEmpty()) { %>
            <li><%= nameError %></li>
        <% } %>

        <% if (!ageError.isEmpty()) { %>
            <li><%= ageError %></li>
        <% } %>

        <% if (!depError.isEmpty()) { %>
            <li><%= depError %></li>
        <% } %>

        <% if (!emailError.isEmpty()) { %>
            <li><%= emailError %></li>
        <% } %>
    </ul>

    <a href="employeeForm.jsp">Go back to the form</a>

<% } else { %>

    <h3>Employee Details Submitted Successfully</h3>

    <table border="1" cellpadding="10" cellspacing="0">

        <tr>
            <th>Employee ID</th>
            <td><%= empId.trim() %></td>
        </tr>

        <tr>
            <th>Name</th>
            <td><%= name.trim() %></td>
        </tr>

        <tr>
            <th>Age</th>
            <td><%= age %></td>
        </tr>

        <tr>
            <th>Department</th>
            <td><%= dep %></td>
        </tr>

        <tr>
            <th>Email</th>
            <td><%= email.trim().toLowerCase() %></td>
        </tr>

    </table>

    <br>
    <a href="employeeForm.jsp">Back to the form</a>

<% } %>

</body>
</html>
