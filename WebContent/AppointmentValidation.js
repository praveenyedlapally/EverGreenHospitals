/**
 * 
 */
function AppointmentValidate()                                   
{ 
    var Fname = document.forms["AptForm"]["first_name"];   
    var Lname = document.forms["AptForm"]["last_name"];   
    var phone = document.forms["AptForm"]["contactNO"];  
    var email = document.forms["AptForm"]["email_address"];   
    var date = document.forms["AptForm"]["datepicker"];
  

   
   
    if (Fname.value == "")                                  
    { 
        window.alert("Please enter your First name."); 
         Fname.focus();
        return false; 
    }

    if (Lname.value == "")                                  
    { 
        window.alert("Please enter your last name."); 
         Lname.focus(); 
        return false; 
    } 
    if (Fname.value == Lname.value )                                  
    { 
        window.alert("FirstName and LastName should not be same"); 
        Lname.value="";
        Lname.focus();
        return false; 
    } 
    if (email.value == "")                                   
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf("@", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (email.value.indexOf(".", 0) < 0)                 
    { 
        window.alert("Please enter a valid e-mail address."); 
        email.focus(); 
        return false; 
    } 
   
    if (phone.value == "")                           
    { 
        window.alert("Please enter your Contact number."); 
        phone.focus(); 
        return false; 
    } 
    var mob = /^[1-9]{1}[0-9]{9}$/;

	if (mob.test(phone.value) == false) {
		alert("Please enter valid Contact number.");
		phone.focus(); 
		return false;
	}
	  if (date.value == "") {
	    	window.alert("Please enter the Date..!!");
	    	date.focus();
	        return false;
	    }
	    else if (!date.value.match(/^(0[1-9]|1[012])[\- \/.](?:(0[1-9]|[12][0-9]|3[01])[\- \/.](19|20)[0-9]{2})$/)) {
	    	window.alert('date format is wrong');
	    	date.focus();
	        return false;
	    }
	    var ds= Date.parse(date.value);
	    var today = new Date();
	    if (today > ds) {
	        alert("past date is not allowed.");
	        return false;
	    }
 
   
    return true; 
}