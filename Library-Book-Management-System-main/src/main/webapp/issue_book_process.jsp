<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    int bookId = Integer.parseInt(request.getParameter("book_id"));
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String returnDate = request.getParameter("return_date");

    // Automatic Issue Date = Today
    java.util.Date date = new java.util.Date();
    java.sql.Date issueDate = new java.sql.Date(date.getTime());

    try {
        Connection con = DBConnection.getConnection();

        // 1. Check if book exists and is available
        PreparedStatement checkPs = con.prepareStatement("SELECT available FROM books WHERE book_id=?");
        checkPs.setInt(1, bookId);
        ResultSet rs = checkPs.executeQuery();

        if(rs.next()) {
            int available = rs.getInt("available");

            if(available > 0) {
                // BOOK IS AVAILABLE - PROCEED TO ISSUE

                // 2. Insert into issue_records
                PreparedStatement issuePs = con.prepareStatement(
                    "INSERT INTO issue_records(book_id, user_id, issue_date, return_date, status) VALUES(?,?,?,?,?)");
                issuePs.setInt(1, bookId);
                issuePs.setInt(2, userId);
                issuePs.setDate(3, issueDate);
                issuePs.setString(4, returnDate);
                issuePs.setString(5, "issued"); // Status is 'issued' until returned
                int i = issuePs.executeUpdate();

                // 3. Decrease Book Quantity
                if(i > 0) {
                    PreparedStatement updatePs = con.prepareStatement("UPDATE books SET available = available - 1 WHERE book_id=?");
                    updatePs.setInt(1, bookId);
                    updatePs.executeUpdate();

                    out.println("<script>alert('Book Issued Successfully!'); window.location='admin_dashboard.jsp';</script>");
                }

            } else {
                // Stock is 0
                out.println("<script>alert('Stock Empty! Book not available.'); window.location='issue_book.jsp';</script>");
            }
        } else {
            // Book ID wrong
            out.println("<script>alert('Invalid Book ID.'); window.location='issue_book.jsp';</script>");
        }

    } catch(Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>