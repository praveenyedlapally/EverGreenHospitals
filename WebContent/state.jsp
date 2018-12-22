<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.db.MysqlConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="/EverGreenHospitals/statejs.js" type="text/javascript"></script>
</head>
<body>
 <select class="form-control" name="state" id="state">
            <option>Select State</option>
            <%

                String country_id =request.getParameter("country_id");
                Connection con = MysqlConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from states where country_name='"+ country_id+"'");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("state_name")%>"><%=rs.getString("state_name")%></option>
            <%
                }
            %>
        </select>
</body>
<!-- <script>
    $(document).ready(function () {
        $("#state").on("change", function () {
            var state_name = $("#state").val();
                $("#error").html("");
                $.ajax({
                    url: "city.jsp",
                    method: "POST",
                    data: {state_name: state_name},
                    success: function (data)
                    {
                        $("#city_name").html(data);//response sending to city.jsp page 
                    }
                });
        });
    });
</script> -->
</html>
