/**
 * 
 */
/**
 * 
 */
function EnquireValidate()                                   
{ 
    var name = document.forms["EnqForm"]["name"];   
    var email = document.forms["EnqForm"]["email"]; 
    var phone = document.forms["EnqForm"]["contactNO"];  
    
  

   
   
    if (name.value == "")                                  
    { 
        window.alert("Please enter your name."); 
        name.focus(); 
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
 
   
    return true; 
}