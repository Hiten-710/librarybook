<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    if(session.getAttribute("userObj") == null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Issue History</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="container mt-5">
    <h3>Transaction History</h3>
    <a href="admin_dashboard.jsp" class="btn btn-secondary mb-3">Back to Dashboard</a>

    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Issue ID</th>
                <th>Book ID</th>
                <th>User ID</th>
                <th>Issue Date</th>
                <th>Return Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection con = DBConnection.getConnection();
                    // We order by issue_id DESC so the newest transactions show first
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM issue_records ORDER BY issue_id DESC");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                        String status = rs.getString("status");
                        String color = status.equals("returned") ? "text-success" : "text-danger font-weight-bold";
            %>
            <tr>
                <td><%= rs.getInt("issue_id") %></td>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getInt("user_id") %></td>
                <td><%= rs.getDate("issue_date") %></td>
                <td><%= rs.getString("return_date") %></td>
                <td class="<%= color %>">
                    <%= status.toUpperCase() %>
                </td>
            </tr>
            <%
                    }
                } catch(Exception e) { e.printStackTrace(); }
            %>
        </tbody>
    </table>
</body>
</html>