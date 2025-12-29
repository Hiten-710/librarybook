<%@ page import="java.sql.*, com.library.DBConnection" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            session.setAttribute("userObj", email); // Save user in session
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            out.println("<script>alert('Invalid Credentials'); window.location='index.jsp';</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>