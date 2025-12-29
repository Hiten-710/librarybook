<!DOCTYPE html>
<html>
<head>
    <title>Library Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="container mt-5" style="background-color: #f4f4f4;">
    <h2 class="text-center">Library Management System</h2>
    <div class="card p-4 mx-auto mt-4" style="width: 400px; shadow: 2px 2px 10px #aaa;">
        <h4 class="text-center mb-4">Admin Login</h4>
        <form action="login_process.jsp" method="post">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" placeholder="admin@gmail.com" required>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <input type="password" name="password" class="form-control" placeholder="admin123" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
    </div>
</body>
</html>