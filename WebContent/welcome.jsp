<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hms.db.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  bh-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jsp page</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Optional bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="/EverGreenHospitals/country.js" type="text/javascript"></script>
<script src="/EverGreenHospitals/location.js" type="text/javascript"></script>
<script src="/EverGreenHospitals/EnquireValidation.js" type="text/javascript"></script>
<script src="/EverGreenHospitals/AppointmentValidation.js" type="text/javascript"></script>
<script src="/EverGreenHospitals/ReferValidation.js" type="text/javascript"></script>
<script src="/EverGreenHospitals/DoctorValidation.js" type="text/javascript"></script>
<script src="/EverGreenHospitals/EmailValidation.js" type="text/javascript"></script>
 <script>
  $(document).ready(function() {
    $("#datepicker").datepicker({minDate: 0});
  });
  </script>

  
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc; 
}

.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}
.enquire {
         text-align: right;
         
         
}
.copyrights {
    background: #0075ad;
    padding: 12px 0;
    text-align: center;
    color: #fff;
    font-size: 12px;
}
/* Create two equal columns that floats next to each other */
.column {
    float: left;
    width: 50%;
    padding: 10px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
/* drop downs for services,about contact us */
 .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>

</head>
<body>
	

	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a href="welcome.jsp"> <img
							src="images/hospitalLogo.jpg"
							width = "150px" height = "75px" >
						</a>
    </div>
     <ul class="nav navbar-nav">
      <li class="active"><a href="welcome.jsp">Home</a></li>
     <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Services</a>
    <div class="dropdown-content">
      <a href="ReqAppointment.jsp">Request an appointment</a>
      <a href="FindDoctor.jsp">Find a Doctor</a>
	  <a href="AmenitiesServices.jsp">Amenities and services</a>
	  <a href="VisitinghGuide.jsp">Visitor hours and Guidelines</a>
	  <a href="admissionDischarge.jsp">Admission and Discharge info</a>
    </div>
	 
  </li>
     
      <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Department</a>
   <div class="dropdown-content">
      <a href="Physiotherapy.jsp">Physiotherapy</a>
      <a href="CriticalCare.jsp">Critical Care</a>
	  <a href="Cardiology.jsp">Cardiology</a>
	  <a href="Gasteroenterology.jsp">Gastroenterology</a>
    </div>
  </li>
      <li><a href="BillingInfoDisplay">Billing info</a></li>
      <li><a href="AboutUs.jsp">About</a></li>
      <li><a href="ContactUs.jsp">Contact Us</a></li>
       <li><a href="login.jsp">Admin Login</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-plus"></span>Emergency: 937-900-1404</a></li>
    </ul>
  </div>
</nav>
  <!-- Sliders starts from here -->
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/Hospital1.jpg">
    </div>

    <div class="item">
      <img src="images/Hospital11.jpg">
    </div>

    <div class="item">
      <img src="images/Hospital12.jpg">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  
  
<div class="container">
	<div style = "text-align: center;" >
	  <b><h1>Evergreen Hospital</h1></b>
	  <p>Evergreen Hospital is a hospital in Warrensburg, MO, dedicated to providing exceptional care to Johnson County and the surrounding areas. With state-of-the-art technology, board-certified providers, highly trained staff and a beautiful, modern facility, we’re proud to be your partner for health, closer to home.Western Missouri Medical Center (WMMC) is a hospital in Warrensburg, MO, dedicated to providing exceptional care to Johnson County and the surrounding areas. With state-of-the-art technology, board-certified providers, highly trained staff and a beautiful, modern facility, we’re proud to be your partner for health, closer to home</p>
	</div>
	<hr>
	<div class="row">
	  <div class="col-sm-6">
	  	  	 <h3>Welcome to EverGreenHospitals</h3>
		 <p>EverGreenHospitals is one of the recently established multispeciality hospital in Missouri state in serveral places and it comprises of 1000 beds </p>
		 <p>With Us there are experienced doctors with 98 percent success rate in operations .We have several departments like Neurology,Cardiology,Physiotherapy and Gastroenterology</p>
		 <p>We have 30 operation theaters and we support almost every health insurance that is there in the market</p>
		 <p>We have done several cardiac surgery's and we have 100 percent success rate in doing that. </p>
		 <p>We have 24/7 ambulance facility and doctors are available </p>
		 <p>
		 	<a href="images/hospital_info.pdf" download>
					<input type = "button" name = "printPdf" id ="printPdf" value = "Save as PDF"/>
			</a>
		 </p>
		  <p>
		 	    <form name="emailForm" action="SendAttachMail" method="post" onsubmit="return EmailValidate()">
		 	       email <input type ="text" name="email"> 
					<input type = "submit"  value = "Send by email"/>
			    </form>
		 </p>
		 
	  </div>
	  <div class="col-sm-6">
	  <!-- ********************************************************************************************** -->
	  <!-- Enquiry form -->
	  <h1 style="color: blue">Enquire form</h1>
	  		<form name ="EnqForm" action="Enquire" method="post" onsubmit="return EnquireValidate()">
			  <div class="form-group">
			   <input type="text" name="name" class="form-control" placeholder = "Enter Your name">
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" name ="email" placeholder = "Enter your email"/>
			  </div>
			   <div class="form-group">
			    <input type="text" class="form-control" name="contactNO" placeholder = "Enter Your contact no "/>
			  </div>
			    <div class="form-group">
			     <select class="form-control" id="country_id" name="country" >
                                <option disabled="" value="" selected="">select a country</option>
                                <%
                                    Connection con2 = MysqlConnection.getConnection();
                                	PreparedStatement  ps2= con2.prepareStatement("select * from hms.countries");
                                    ResultSet rs2 = ps2.executeQuery();
                                    while (rs2.next()) {
                                %>
                                <option value="<%=rs2.getString("country_name")%>"><%=rs2.getString("country_name")%></option>
                                <%
                                    }
                                %>
                            </select>
			  </div>
			   <div class="form-group" id="state_id">
			  		  <select class="form-control" name="state" >
                                <option>Select State</option>
                            </select>   
			  </div>
			   <div class="form-group" id="city_name">
			  		  <select class="form-control" name="city" >
                                <option>Select City</option>
                                </select>
			  </div>
			   <div class="form-group">
			     <select class="form-control" id="speciality_id" name="speciality" >
                                <option disabled="" value="" selected="">select a speciality </option>
                                <%
                                    Connection con3 = MysqlConnection.getConnection();
                                	PreparedStatement  ps3= con3.prepareStatement("select * from hms.speciality");
                                    ResultSet rs3 = ps3.executeQuery();
                                    while (rs3.next()) {
                                %>
                                <option value="<%=rs3.getString("speciality_name")%>"><%=rs3.getString("speciality_name")%></option>
                                <%
                                    }
                                %>
                            </select>
			  </div>
			    <div class="form-group">
			    	<textarea rows="4" cols="50" name="comment" placeholder="Enter your message here" ></textarea>
			  </div>
			  
			  
			
			  <button type="submit" class="btn btn-default">Submit</button>
		</form>
 			 
		</div>
	  
	  </div>	  
	</div>
	 <!-- ************************************************************************************************** -->
	

<button class="accordion btn-info">Request  to an appointment</button>
<div class="panel">
<div style = "padding-left: 350px;">
<form name="AptForm" action="AppointmentBooking" method="post" onsubmit="return AppointmentValidate()">
<h1 style="color: blue">Appointment Request form</h1>
	  		
			  <div class="form-group">
			   <input type="text" name="first_name" class="form-control" placeholder = "Enter Your first name">
			  </div>
			  <div class="form-group">
			   <input type="text" name="last_name" class="form-control" placeholder = "Enter Your last name">
			  </div>
			   <div class="form-group">
			   Sex <input type="radio" checked name="sex" value="male">Male
				  <input type="radio" name="sex" value="female">Female</td>
			  </div>
			  <div class="form-group">
			   <input type="text" name="contact_no" class="form-control" placeholder = "Enter Your contactNO">
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" name ="email_address" placeholder = "Enter your email"/>
			  </div>
			   <div class="form-group">
			    <input type="text" class="form-control" id="datepicker" name="datepicker" placeholder = "Appointmentdate "/>
			  </div>
			    <div class="form-group">
			     <select class="form-control" id="location_id" name="location" >
                                <option disabled="" value="" selected="">Preferred location</option>
                                <%
                                     Connection con1 = MysqlConnection.getConnection();
                                	PreparedStatement  ps1= con1.prepareStatement("select * from hms.plocation");
                                    ResultSet rs1 = ps1.executeQuery();
                                    while (rs1.next()) {
                                %>
                                < <option value="<%=rs1.getString("location_name")%>"><%=rs1.getString("location_name")%></option>
                                <%
                                    }
                                %>
                            </select>
			  </div>
			   <div class="form-group" id="dept_id">
			  		  <select class="form-control" name="dept" >
                                <option>Select Department</option>
                            </select>   
			  </div>
			   <div class="form-group" id="doctor_id">
			  		  <select class="form-control" name="doctor" >
                                <option>Select doctor</option>
                                </select>
			  </div>
			    <div class="form-group">
			    	<textarea rows="4" cols="50" name="address" placeholder="Enter your address here" form="usrform" ></textarea>
			  </div>
			  
			  
			
			  <button type="submit" class="btn btn-default">Submit</button>
		</form>
<%--  <form action="AppointmentBooking">
<h1>Appointment request form</h1>
			<table style="with: 50%">
				<tr>
					<td>First Name</td>
					<td><input type="text" name="first_name" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="last_name" /></td>
				</tr>
							<tr>	<td>Sex:</td>
				  <td>   <input type="radio" checked name="sex" value="male">Male
				  <input type="radio" name="sex" value="female">Female</td>
 				 </tr>
				<tr>
					<td>Contact No</td>
					<td><input type="text" name="contact_no" /></td>
				</tr>
				</tr>
					<tr>
					<td>Email Address</td>
					<td><input type="text" name="email_address" /></td>
				</tr>
				<tr>
					<td>Appointment date</td>
					<td><input id="datepicker" name="datepicker"/></td>
				</tr>
				  <tr>
                        <td>Location</td>
                        <td>
                            <select class="form-control" id="location_id" name="location">
                                <option disabled="" value="" selected="">Preferred location</option>
                                <%
                                    Connection con1 = MysqlConnection.getConnection();
                                	PreparedStatement  ps1= con1.prepareStatement("select * from hms.plocation");
                                    ResultSet rs1 = ps1.executeQuery();
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("location_name")%>"><%=rs1.getString("location_name")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                     <tr>
                        <td>Department</td>
                        <td id="dept_id"><!--  states will display here --->
                            <select class="form-control" name="dept">
                                <option>Select department</option>
                            </select>      
                        </td>
                    </tr>
                    <tr>
                        <td>Doctor</td>
                        <td id="doctor_id"><!--  cities will display here --->
                            <select class="form-control" name="doctor" id="doctor_id">
                                <option>Select doctor</option>
                            </select>
                        </td>
                    </tr>
				
				<tr>
				
					<td>Address</td>
					<td><input type="text" name="address" /></td>
				</tr>
			        </table>	
			<input type="submit" value="Submit" />
			</form> --%>
		</div>
	<hr>
 </div>
 
  <!--Find a doctor starts here-->
 <button class="accordion btn-info">Find a Doctor</button>
<div class="panel">
	<h1>Find the doctors</h1>
	<form name="DoctForm" action="DisplayDoctors" method="post" onsubmit="return DoctorValidate()">
	 <div class="form-group">
			     <select class="form-control" id="dept_id" name="dept" >
                                <option disabled="" value="" selected="">select a department</option>
                                <%
                                    Connection con4 = MysqlConnection.getConnection();
                                	PreparedStatement  ps4= con4.prepareStatement("select * from hms.department");
                                    ResultSet rs4 = ps4.executeQuery();
                                    while (rs4.next()) {
                                %>
                                <option value="<%=rs4.getString("department_name")%>"><%=rs4.getString("department_name")%></option>
                                <%
                                    }
                                %>
                            </select>
			  </div>
			   <button type="submit" class="btn btn-default">Find doctors</button>
	</form>
</div>

<!--Refer a Patient-->
 <button class="accordion btn-info">Refer a Patient</button>
 <div class="panel">
	
		<form name="RefForm" action="PatientRefer" method="post" onsubmit="return ReferralValidate()">
			<span id="ctl00_referapatient_LblMsg"></span>

			<div class="form-group" style="margin-bottom: 6px;">I am a</div>


			<input type="radio" name="referer" value="patient" checked>
			Patient&nbsp; <input type="radio" name="referer" value="physician">
			Physician &nbsp; <input type="radio" name="referer" value="relative">
			Other<br> <br>
	


	<div class="form-group">
		Patient Name <input name="pName" type="text" id="p_name"
			class="form-control" placeholder="Type Patient Name*">
	</div>


	<div class="form-group">
		Patient Date of Birth <input name="pDob" type="text" maxlength="50"
			id="d_o_b" class="form-control" placeholder="mm/dd/yyyy">
	</div>


	<div class="form-group">
		Patient Mobile Number <input name="mobileNumber" type="text"
			id="mobile_number" class="form-control"
			placeholder="Type Patient Mobile Number*">
	</div>


	<div class="form-group">
		Patient Email <input name="emailId" type="text" id="email_id"
			class="form-control" placeholder="Type Patient Email*">
	</div>



	
	<h4>YOUR DETAILS</h4>



	<div class="form-group">
		Name <input name="rName" type="text" id="r_name" class="form-control"
			placeholder="Your Name*">
	</div>


	<div class="form-group">
		Mobile Number <input name="rMobile_number" type="text"
			id="r_mobile_number" class="form-control"
			placeholder="Type your Mobile Number*">
	</div>


	<div class="form-group">
		Email <input name="rEmail" type="text" id="r_email"
			class="form-control" placeholder="Type Your Email*">
	</div>


	<div class="form-group">
		Address
		<textarea name="rAddress" rows="3" cols="35" id="r_Address"
			class="form-control" placeholder="Address"></textarea>
	</div>
	<button type="submit" class="btn btn-default">Refer</button>
	</form>

</div>
<!-- *********************************************************** -->

	<div class="copyrights">
    <div class="grid-row">
      <div class="grid-col grid-col-6">
        <p>Copyrights ©2018 Evergreen Hospitals. All Rights Reserved.</p>
      </div>
      <div class="grid-col grid-col-6">Designed &amp; Developed by <a target="-blank" style="text-decoration:none;"/"><span style="color:#a4d845;font-weight:bold;font-size:12px;"> Praveen and</span><span style="color:#a4d845;font-weight:bold;font-size:12px;"> Team</span></a></div>
    </div>
    <!--/ copyrights --> 
  </div>
 
	
	
	


  
</body>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
    });
}
</script>
<!--  
<script>
   $(document).ready(function () {
        $("#country_id").on("change", function () {
            var country_id = $("#country_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "state.jsp",//your jsp page name
                    data: {country_id: country_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#state_id").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script>
-->
<!-- <script>
   $(document).ready(function () {
        $("#location_id").on("change", function () {
            var location_id = $("#location_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "department.jsp",//your jsp page name
                    data: {location_id: location_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#dept_id").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script> -->

</html>