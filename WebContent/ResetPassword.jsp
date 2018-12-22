<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
<style type="text/css">
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
</style>
<script type="text/javascript">
function checkEmail(theForm) {
    if (theForm.pwd1.value != theForm.pwd2.value)
    {
        alert('Those passwords don\'t match!');
        return false;
    } else {
        return true;
    }
}
</script>
</head>
<body>
<a href="welcome.jsp"><button>Home</button></a>
<form action="ResetPassword" method ="post" onsubmit="return checkEmail(this);">
    
	Enter a new password:<input type="text" name="pwd1"> <br>
	ReEnter the password:<input type="password" name="pwd2"> <br>
	<input type="submit" value="Reset">
</form>
</body>
</html>