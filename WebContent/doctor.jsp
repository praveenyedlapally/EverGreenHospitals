<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hms.db.MysqlConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="/EverGreenHospitals/departmentjs.js" type="text/javascript"></script>
</head>
<body>
		<select class="form-control" name="doctor" id="doctor">
            <option>Select Doctor</option>
            <%

                String dept_name =request.getParameter("dept_name");
                Connection con = MysqlConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from doctor where department_name='"+ dept_name +"'");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("doctor_name")%>"><%=rs.getString("doctor_name")%></option>
            <%
                }
            %>
        </select>
</body>

</html>