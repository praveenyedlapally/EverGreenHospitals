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
		<select class="form-control" name="dept" id="dept">
            <option>Select department</option>
            <%

                String location_id =request.getParameter("location_id");
                Connection con = MysqlConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from department where location_name='"+ location_id +"'");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("department_name")%>"><%=rs.getString("department_name")%></option>
            <%
                }
            %>
        </select>
</body>
<!-- <script>
    $(document).ready(function () {
        $("#dept").on("change", function () {
            var dept_name = $("#dept").val();
                $("#error").html("");
                $.ajax({
                    url: "doctor.jsp",
                    method: "POST",
                    data: {dept_name: dept_name},
                    success: function (data)
                    {
                        $("#doctor_id").html(data);
                    }
                });
        });
    });
</script> -->
</html>