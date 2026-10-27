<%@ page import="com.studentcrud.StudentDAO" %>

<%
    String rollNo = request.getParameter("rollNo");

    if (rollNo != null && !rollNo.trim().isEmpty()) {
        try {
            new StudentDAO().deleteStudent(Integer.parseInt(rollNo));
        } catch (Exception e) {
            // Keep the page simple; return to the student list.
        }
    }

    response.sendRedirect("list-student.jsp");
%>
