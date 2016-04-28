<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script lang="javascript">
var whichPressed;

function formValidation()   
{
	if(whichPressed == "LogIn")                 
	{	
		if(validateUsername())   
		{
			if(validatePassword())
			{
				return true;
			}
			else
			{
				return false;
			}	
		}
		else
		{
			return false; 
		}
	}
}

function validateUsername() 
{      
	var fld = document.LogInAction.LogInName;
	var illegalChars = /\W/; // allow letters, numbers, and underscores  
	//document.getElementById("message").innerHTML = " ";
	if (fld.value == "") 
	{        
		document.getElementById('userid').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "You didn't enter a username.";        
		return false;     
	} 
	else if ((fld.value.length < 4) || (fld.value.length > 15)) 
	{        
		document.getElementById('userid').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The login name is the wrong length.";		
		return false;     
	} 
	else if (illegalChars.test(fld.value)) 
	{        
		document.getElementById('userid').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The login name contains illegal characters. Login name allows letters, numbers and underscore.";		
		return false;     
	} 
	else
	{       
		document.getElementById('userid').style.borderColor = "#c7d0d2";
	     document.getElementById("error").innerHTML = " ";
	     return true;   
	}
} 

function validatePassword() 
{      
	var fld = document.LogInAction.Passwd;
	var illegalChars = /\W/; // allow letters, numbers, and underscores     
	if (fld.value == "") 
	{        
		document.getElementById('userpass').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "You didn't enter a password.";        
		return false;     
	} 
	else if ((fld.value.length < 4) || (fld.value.length > 15)) 
	{        
		document.getElementById('userpass').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The password is the wrong length.";		
		return false;     
	} 
	else if (illegalChars.test(fld.value)) 
	{        
		document.getElementById('userpass').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The password contains illegal characters. Password allows letters, numbers and underscore.";		
		return false;     
	} 
	else
	{       
		document.getElementById('userpass').style.borderColor = "#c7d0d2";
	     document.getElementById("error").innerHTML = " ";
	     return true;   
	}
} 
</script>
<style> 
/* Basics */
html, body {
    width: 100%;
    height: 100%;
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    color: #444;
    -webkit-font-smoothing: antialiased;
    background: #f0f0f0;
}
#container {
    position: fixed;
    width: 350px;
    height: 345px;
    top: 50%;
    left: 50%;
    margin-top: -180px;
    margin-left: -170px;
	background: #fff;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	
}
form {
    margin: 0 auto;
    margin-top: 20px;
}
label {
    color: #555;
    display: inline-block;
    margin-left: 18px;
    padding-top: 10px;
    font-size: 14px;
}
p a {
    font-size: 11px;
    color: #aaa;
    float: right;
    margin-top: -13px;
    margin-right: 20px;
 -webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
}
p a:hover {
    color: #555;
}
input {
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 12px;
    outline: none;
}
input[type=text],
input[type=password] {
    color: #777;
    padding-left: 10px;
    margin: 10px;
    margin-top: 12spx;
    margin-left: 18px;
    width: 190px;
    height: 25px;
	border: 1px solid #c7d0d2;
    border-radius: 2px;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
-webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
	}
input[type=text]:hover,
input[type=password]:hover {
    border: 1px solid #b6bfc0;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
}
input[type=text]:focus,
input[type=password]:focus {
    border: 1px solid #a8c9e4;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
}

#middle {
   width: 100%;
    height: 80px;
    margin-top: 1px;
	  box-shadow: inset 0 1px 1px #fff;
    border-top: 1px solid #ccc;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}

#lower {
    background: #ecf2f5;
    width: 100%;
    height: 68px;
    margin-top: 30px;
	  box-shadow: inset 0 1px 1px #fff;
    border-top: 1px solid #ccc;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}
.check {
    margin-left: 3px;
	font-size: 11px;
    color: #444;
    text-shadow: 0 1px 0 #fff;
}
input[type=submit] {
    float: right;
    margin-right: 20px;
    margin-top: 20px;
    width: 80px;
    height: 25px;
font-size: 14px;
    font-weight: bold;
    color: #fff;
    background-color: #acd6ef; /*IE fallback*/
    background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
    background-image: -moz-linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    border-radius: 30px;
    border: 1px solid #66add6;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
    cursor: pointer;
}
input[type=submit]:hover {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
    background-image: -moz-linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
    background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
}
input[type=submit]:active {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
    background-image: -moz-linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
    background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
}
</style>
</head>
<body>
<div id="container">
<%String message = (String)request.getAttribute("ErrorMessage"); 
	if(message != null)
	{ %>
	<label for="message"><span style="color:red;" id="message"><%= message%></span></label>
	<% }
%>
  
<form name="LogInAction" action="LogInAction" method="post" onsubmit="return formValidation()">
<label for="error"><span style="color:red;" id="error"></span></label>
<table>
<tr>
<td><label for="username">Username:</label> </td>
<td><input type="text" name="LogInName" id="userid" onkeyup="validateUsername()"></td>
</tr>

<tr>
<td><label for="password">Password:</label> </td>
<td><input type="password" name="Passwd" id="userpass" onkeyup="validatePassword()"></td>
</tr>
</table>
<div id="lower"> 
<input type="submit" name="action" value="LogIn" onclick="whichPressed=this.value">
<br>
<label for="forgot"> <a href="ForgotUsernameOrPassword">Forgot Username or Password</a></label>
</div><!--/ lower-->
 <div id="middle">
 
<input type="submit" name="action" value="Sign Up">
<br>
<label for="signin">New User? Sign Up Now</label>
</div>
</form>
</div><!--/ container-->
</body>
</html>