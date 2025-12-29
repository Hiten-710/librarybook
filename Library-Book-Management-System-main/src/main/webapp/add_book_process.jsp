<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String category = request.getParameter("category");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("INSERT INTO books(title, author, category, quantity, available) VALUES(?,?,?,?,?)");
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setString(3, category);
        ps.setInt(4, quantity);
        ps.setInt(5, quantity); // Available starts same as Total

        ps.executeUpdate();
        response.sendRedirect("view_books.jsp"); // Redirect to view page after adding
    } catch(Exception e) { e.printStackTrace(); }
%>