<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    if(session.getAttribute("userObj") == null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Return Book</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <div class="card mx-auto" style="width: 500px;">
        <div class="card-header bg-success text-white">
            <h4>Return a Book</h4>
        </div>
        <div class="card-body">
            <form action="return_book_process.jsp" method="post">

                <div class="form-group">
                    <label>Book ID:</label>
                    <input type="number" name="book_id" class="form-control" required>
                </div>

                <div class="form-group">
                    <label>User ID (Student ID):</label>
                    <input type="number" name="user_id" class="form-control" required>
                </div>

                <button type="submit" class="btn btn-success btn-block">Return Book</button>
                <a href="admin_dashboard.jsp" class="btn btn-secondary btn-block">Cancel</a>
            </form>
        </div>
    </div>
</body>
</html>