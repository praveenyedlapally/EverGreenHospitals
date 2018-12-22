<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hms.db.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jsp page</title>
</head>
<body>
<select class="form-control" name="city" id="city">
            <option>Select City</option>
            <%
                String state_name = request.getParameter("state_name");
                Connection con = MysqlConnection.getConnection();
                PreparedStatement ps =con.prepareStatement("select * from hms.cities where state_name=?");
                ps.setString(1, state_name);
                ResultSet rs =ps.executeQuery();
                while (rs.next()) {
            %>
           <option value="<%=rs.getString("city_name")%>"><%=rs.getString("city_name")%></option>
            <%
                }
            %>
        </select>

</body>
</html>