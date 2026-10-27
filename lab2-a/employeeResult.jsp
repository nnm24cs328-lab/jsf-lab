
<%@ page contentType="text/html; charset=UTF-8"
         language="java"
         import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Information Result</title>
</head>
<body>

    <h2>Employee Information Result</h2>

    <%
        String employeeId = request.getParameter("employeeId");
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String department = request.getParameter("department");
        String email = request.getParameter("email");

        int age = 0;
        int birthYear = 0;

        if (ageStr != null && !ageStr.trim().isEmpty()) {
            try {
                age = Integer.parseInt(ageStr);

                if (age < 1) {
                    throw new NumberFormatException();
                }

                int currentYear =
                    Calendar.getInstance().get(Calendar.YEAR);

                birthYear = currentYear - age;

            } catch (NumberFormatException e) {
                out.println("<p>Invalid age entered.</p>");
            }
        }

        String nameAndDepartment =
            (name == null ? "" : name) + " (" +
            (department == null ? "" : department) + ")";

        String formattedEmail =
            email == null ? "" : email.trim().toLowerCase();
    %>

    <table border="1" cellpadding="10" cellspacing="0">

        <tr>
            <th>Employee ID</th>
            <td><%= employeeId == null ? "" : employeeId %></td>
        </tr>

        <tr>
            <th>Name and Department</th>
            <td><%= nameAndDepartment %></td>
        </tr>

        <tr>
            <th>Age</th>
            <td><%= age %></td>
        </tr>

        <tr>
            <th>Calculated Birth Year</th>
            <td><%= birthYear %></td>
        </tr>

        <tr>
            <th>Formatted Email</th>
            <td><%= formattedEmail %></td>
        </tr>

    </table>

    <br>

    <a href="employeeForm.jsp">Back to Employee Form</a>

</body>
</html>
