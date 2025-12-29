<%@ page import="com.library.DBConnection" %>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></head>
<body class="container mt-5">
    <h3>Add New Book</h3>
    <form action="add_book_process.jsp" method="post" class="w-50">
        <input type="text" name="title" class="form-control mb-2" placeholder="Book Title" required>
        <input type="text" name="author" class="form-control mb-2" placeholder="Author Name" required>
        <input type="text" name="category" class="form-control mb-2" placeholder="Category">
        <input type="number" name="quantity" class="form-control mb-2" placeholder="Total Quantity" required>
        <button type="submit" class="btn btn-success">Add Book</button>
        <a href="admin_dashboard.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</body>
</html>