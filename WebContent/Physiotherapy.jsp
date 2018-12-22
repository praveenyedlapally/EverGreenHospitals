<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hms.db.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
 <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
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
							width = "150px" height = "50px">
						</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="welcome.jsp">Home</a></li>
   <!--    <li><a href="#">Services</a></li>--> 
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
	  <a href="VisitinghGuide.jsp">Gastroenterology</a>
    </div>
  </li>
     <li><a href="BillingInfoDisplay">Billing info</a></li>
     <li><a href="AboutUs.jsp">About</a></li>
      <li><a href="ContactUs.jsp">Contact Us</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-plus"></span>Emergency: 937-900-1404</a></li>
    </ul>
  </div>
</nav>
  
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>



</div>
  
  
<div class="container">
	<div style = "text-align: center;" >
	  <b><h1>Evergreen Hospital</h1></b>
	</div>
	<hr>
	<div class="row">
	  <div class="col-sm-6">
			<h1>Physiotherapy </h1> 

<p><span style="color: rgba(0, 0, 0, 0.941176);"><strong></strong></span></p><strong> 

<h3 style="font-measure: 18px;font-weight: 800;">A Perfect Anatomical Repair without Functional Recovery is Useless</h3> 

</strong><p><strong></strong></p> 

<p>The Department of Physiotherapy and Rehabilitation is committed to reestablishing you to your ideal wellbeing and useful capacities after any musculoskeletal sickness or damage. Physiotherapists work nonstop to convey the most ideal patient consideration to both our outpatients and inpatients.</p> 

<p><b>Depending on your necessities, treatment strategies may include:</b></p> 

<ul> 

<li>Various manual treatment systems including joint preparation, delicate tissue back rub and scope of-movement exercises.</li> 

<li>Customized Bracing/Splinting/prosthetics/orthotics to enhance portability and function.</li> 

<li>Programming to enhance portability, adaptability and muscle quality, while diminishing weight on the joints</li> 

<li>Stretching exercises</li> 

<li>Use of the McKenzie Method of Mechanical Diagnosis and Treatment for the treatment of low back and neck pain</li> 

<li>Procedures, for example, Ultrasound and Interferential Current Therapy, TENS, Electrical Stimulation to advance delicate tissue recuperating and ease pain.</li> 

<li>Neuromuscular re-instruction utilizing electrical incitement for the treatment of muscle lopsided characteristics or atrophy</li> 

</ul>


	  </div>
	  <div class="col-sm-6">
	  <!-- ********************************************************************************************** -->
	  <!-- Enquiry form -->
	  <h1 style="color: blue">Enquire form</h1>
	  		<form name ="EnqForm" action="Enquire"  onsubmit="return EnquireValidate()"  method="post">
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
			    	<textarea rows="4" cols="50" name="comment" placeholder="Enter your message here" form="usrform" ></textarea>
			  </div>
			  
			  
			
			  <button type="submit" class="btn btn-default">Submit</button>
		</form>
 			 
		</div>
	  
	  </div>	  
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


</html>