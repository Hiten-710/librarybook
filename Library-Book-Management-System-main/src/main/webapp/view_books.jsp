<%@ page import="java.sql.*, com.library.DBConnection" %>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></head>
<body class="container mt-5">
    <h3>Library Inventory</h3>
    <a href="admin_dashboard.jsp" class="btn btn-secondary mb-3">Back</a>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr><th>ID</th><th>Title</th><th>Author</th><th>Total</th><th>Available</th></tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection con = DBConnection.getConnection();
                    ResultSet rs = con.prepareStatement("SELECT * FROM books").executeQuery();
                    while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("book_id") %></td>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td style="font-weight:bold; color:<%= rs.getInt("available")>0?"green":"red" %>">
                    <%= rs.getInt("available") %>
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