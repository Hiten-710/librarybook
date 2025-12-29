<%
    if(session.getAttribute("userObj") == null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head><title>Admin Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-dark bg-dark justify-content-between">
        <span class="navbar-brand mb-0 h1">Library Dashboard</span>
        <a href="index.jsp" class="btn btn-danger btn-sm">Logout</a>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>Add Books</h4>
                    <p>Add new books to inventory.</p>
                    <a href="add_book.jsp" class="btn btn-success">Open</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>View Books</h4>
                    <p>Check available stock.</p>
                    <a href="view_books.jsp" class="btn btn-primary">Open</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card text-center p-4">
                    <h4>Issue Book</h4>
                    <p>Issue books to students.</p>
                    <a href="issue_book.jsp" class="btn btn-warning">Open</a>
                </div>
            </div>
            <div class="col-md-4 mt-3"> <div class="card text-center p-4">
                    <h4>Return Book</h4>
                    <p>Accept returned books.</p>
                    <a href="return_book.jsp" class="btn btn-info">Open</a>
                </div>
            </div>
            <div class="col-md-4 mt-3">
                <div class="card text-center p-4">
                    <h4>View History</h4>
                    <p>See all borrowing records.</p>
                    <a href="view_history.jsp" class="btn btn-dark">View Log</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>