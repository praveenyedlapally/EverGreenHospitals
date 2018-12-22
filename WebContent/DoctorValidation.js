/**
 * 
 */
function DoctorValidate()                                   
{ 
    var department = document.forms["DoctForm"]["dept"];   
     
  

   
   
    if (department.value == "")                                  
    { 
        window.alert("Please select the department"); 
        department.focus();
        return false; 
    }

   
   
    return true; 
}