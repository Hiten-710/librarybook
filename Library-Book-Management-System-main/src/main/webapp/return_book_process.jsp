<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    int bookId = Integer.parseInt(request.getParameter("book_id"));
    int userId = Integer.parseInt(request.getParameter("user_id"));

    try {
        Connection con = DBConnection.getConnection();

        // 1. Check if there is an active issue record for this user & book
        PreparedStatement checkPs = con.prepareStatement(
            "SELECT * FROM issue_records WHERE book_id=? AND user_id=? AND status='issued'");
        checkPs.setInt(1, bookId);
        checkPs.setInt(2, userId);
        ResultSet rs = checkPs.executeQuery();

        if(rs.next()) {
            // RECORD FOUND - PROCEED TO RETURN

            // 2. Update status to 'returned'
            PreparedStatement returnPs = con.prepareStatement(
                "UPDATE issue_records SET status='returned', return_date=CURDATE() WHERE book_id=? AND user_id=? AND status='issued'");
            returnPs.setInt(1, bookId);
            returnPs.setInt(2, userId);
            int i = returnPs.executeUpdate();

            if(i > 0) {
                // 3. Increase Book Quantity back (+1)
                PreparedStatement updateBookPs = con.prepareStatement(
                    "UPDATE books SET available = available + 1 WHERE book_id=?");
                updateBookPs.setInt(1, bookId);
                updateBookPs.executeUpdate();

                out.println("<script>alert('Book Returned Successfully!'); window.location='admin_dashboard.jsp';</script>");
            }
        } else {
            // No record found
            out.println("<script>alert('Error: This book was not issued to this user (or already returned).'); window.location='return_book.jsp';</script>");
        }

    } catch(Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>