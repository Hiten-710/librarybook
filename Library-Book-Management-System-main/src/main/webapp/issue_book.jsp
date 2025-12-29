<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    // Security: Check if admin is logged in
    if(session.getAttribute("userObj") == null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Issue Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <div class="card mx-auto" style="width: 500px;">
        <div class="card-header bg-warning text-white">
            <h4>Issue a Book</h4>
        </div>
        <div class="card-body">
            <form action="issue_book_process.jsp" method="post">

                <div class="form-group">
                    <label>Book ID:</label>
                    <small class="text-muted">(Check "View Books" for ID)</small>
                    <input type="number" name="book_id" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>User ID (Student ID):</label>
                    <input type="number" name="user_id" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>Return Date:</label>
                    <input type="date" name="return_date" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-warning btn-block">Issue Book</button>
                <a href="admin_dashboard.jsp" class="btn btn-secondary btn-block">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>