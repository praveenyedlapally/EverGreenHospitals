/**
 * 
 */
function ReferralValidate()                                   
{ 
    var pName = document.forms["RefForm"]["pName"];  
    var date = document.forms["RefForm"]["pDob"];
    var pphone = document.forms["RefForm"]["mobileNumber"];  
    var email = document.forms["RefForm"]["emailId"];
    var r_name = document.forms["RefForm"]["rName"];   
    
    var rphone = document.forms["RefForm"]["rMobile_number"];  
    var remail = document.forms["RefForm"]["rEmail"]; 
    var rAddress = document.forms["RefForm"]["rAddress"]; 
  

   
   
    if (pName.value == "")                                  
    { 
        window.alert("Please enter patient name."); 
        pName.focus();
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
    if (today <= ds) {
        alert("Current or future date is not allowed.");
        return false;
    }
    if (pphone.value == "")                           
    { 
        window.alert("Please enter patient contact number."); 
        pphone.focus(); 
        return false; 
    } 
    var mob = /^[1-9]{1}[0-9]{9}$/;

	if (mob.test(pphone.value) == false) {
		alert("Please enter valid patient Contact number.");
		pphone.focus(); 
		return false;
	}
    if (email.value == "")                                   
    { 
        window.alert("Please enter a valid patient e-mail address."); 
        email.focus(); 
        return false; 
    } 
	 if (email.value.indexOf("@", 0) < 0)                 
	    { 
	        window.alert("Please enter a valid patient e-mail address."); 
	        email.focus(); 
	        return false; 
	    } 
	   
	    if (email.value.indexOf(".", 0) < 0)                 
	    { 
	        window.alert("Please enter a valid patient e-mail address."); 
	        email.focus(); 
	        return false; 
	    } 

    if (r_name.value == "")                                  
    { 
        window.alert("Please enter your  name."); 
        r_name.focus(); 
        return false; 
    } 
    if (pName.value == r_name.value )                                  
    { 
        window.alert("patient name and your name should not be same"); 
        r_name.value="";
        r_name.focus();
        return false; 
    } 
	 if (rphone.value == "")                           
	    { 
	        window.alert("Please enter your contact number."); 
	        rphone.focus(); 
	        return false; 
	    } 
	 if (mob.test(rphone.value) == false) {
			alert("Please enter valid your Contact number.");
			rphone.focus(); 
			return false;
		}
	 if (remail.value.indexOf("@", 0) < 0)                 
	    { 
	        window.alert("Please enter your valid e-mail address."); 
	        remail.focus(); 
	        return false; 
	    } 
	   
	    if (remail.value.indexOf(".", 0) < 0)                 
	    { 
	        window.alert("Please enter  your valid e-mail address."); 
	        remail.focus(); 
	        return false; 
	    } 
	if (rAddress.value == "")                                  
    { 
        window.alert("Please enter the address"); 
        rAddress.focus();
        return false; 
    }
   
    return true; 
}