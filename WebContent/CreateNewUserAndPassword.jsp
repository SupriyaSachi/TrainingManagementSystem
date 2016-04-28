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
	if(whichPressed=="Save")                 
	{
		if(userfirstnameallLetter())
		{	
			if(userlastnameallLetter())
			{	
				if(alphanumericicno())
				{
					if(validateUsername())   
					{
						if(validatePassword())
						{
							if(validatePasswordconfirm())
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
	else if (whichPressed =="Cancel")
	{
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started creating a new account form.\n\nPress OK to continue or Cancel to stay on the current page.";
		 if (confirm(message)) 
        	 return true;
         else 
        	 return false;
	}
}


function userfirstnameallLetter()   
{    
	var sfname = document.CreateNewUserAndPasswordAction.UserFirstName;	
   var letters = /^[A-Za-z]+$/; 
   if (sfname.value == " " || sfname.value == null || document.getElementById('firstname').value.length == 0)   
   {   
	document.getElementById('firstname').style.borderColor = "red";
	document.getElementById("error").innerHTML = "User First Name should not be empty";
//	sfname.focus();   
	return false;   
   } 
   else if (document.getElementById('firstname').value.length <= 2)
   {
        document.getElementById('firstname').style.borderColor = "red";
        document.getElementById("error").innerHTML = "User Name is too short";
        return false;
   } 
   else if(sfname.value.match(letters))   
   {   
     document.getElementById('firstname').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
    document.getElementById('firstname').style.borderColor = "red";  
    document.getElementById("error").innerHTML = "User First Name must have alphabet characters only";  
    sfname.focus();   
    return false;   
   }   
}   



function userlastnameallLetter()   
{    
	var slname = document.CreateNewUserAndPasswordAction.UserLastName;	
   var letters = /^[A-Za-z]+$/;   
   
   if (slname.value == " " || slname.value == null || document.getElementById('lastname').value.length == 0)   
   {   
	document.getElementById('lastname').style.borderColor = "red";
	document.getElementById("error").innerHTML = "User Last Name should not be empty";  
	slname.focus();   
	return false;   
   }  
   else if (document.getElementById('lastname').value.length <= 2)
   {
        document.getElementById('lastname').style.borderColor = "red";
        document.getElementById("error").innerHTML = "User Name is too short";
        return false;
   }
   else if(slname.value.match(letters))   
   {   
     document.getElementById('lastname').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
    document.getElementById('lastname').style.borderColor = "red";  
    document.getElementById("error").innerHTML = "User Last Name must have alphabet characters only";    
    slname.focus();   
    return false;   
   }   
}   

function alphanumericicno()   
{    

	var uicno = document.CreateNewUserAndPasswordAction.UserICNo;	
  var letters = /^[0-9a-zA-Z]+$/;   
 
  if ((document.getElementById('icno').value.length < 9) ||  (document.getElementById('icno').value.length > 9))
	{        
		document.getElementById('icno').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "Please Enter User IC Number / Invalid User IC No length.";		
		return false;     
	} 
  else if(uicno.value.match(letters))   
  {   
    document.getElementById('icno').style.borderColor = "#c7d0d2";
    document.getElementById("error").innerHTML = " ";
    return true;   
  }
  
}   

function validateUsername() 
{      
	var fld = document.CreateNewUserAndPasswordAction.UserName;
	var illegalChars = /\W/; // allow letters, numbers, and underscores  
	if (fld.value == "") 
	{        
		document.getElementById('userid').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "You didn't enter a username.";        
		return false;     
	} 
	else if ((fld.value.length < 4) || (fld.value.length > 15)) 
	{        
		document.getElementById('userid').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The user name is the wrong length.";		
		return false;     
	} 
	else if (illegalChars.test(fld.value)) 
	{        
		document.getElementById('userid').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The user name contains illegal characters. Login name allows letters, numbers and underscore.";		
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
	var fld = document.CreateNewUserAndPasswordAction.Passwd;
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

function validatePasswordconfirm() 
{      
	var pass = document.CreateNewUserAndPasswordAction.Passwd;
	var pass1 = document.CreateNewUserAndPasswordAction.repasswd;
	var illegalChars = /\W/; // allow letters, numbers, and underscores     
	if (pass1.value == "") 
	{        
		document.getElementById('reuserpass').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "You didn't enter a password to confirm.";        
		return false;     
	} 
	else if ((pass1.value.length < 4) || (pass1.value.length > 15)) 
	{        
		document.getElementById('reuserpass').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The password is the wrong length.";		
		return false;     
	} 
	else if (illegalChars.test(pass1.value)) 
	{        
		document.getElementById('reuserpass').style.borderColor = "red";       
		document.getElementById("error").innerHTML = "The password contains illegal characters. Password allows letters, numbers and underscore.";		
		return false;     
	} 
	else if ((pass.value == pass1.value) && (pass.value.length == pass1.value.length))
	{        
		document.getElementById('reuserpass').style.borderColor = "#c7d0d2";
	    document.getElementById("error").innerHTML = " ";
	    return true;    
	} 
	else
	{       
		document.getElementById('reuserpass').style.borderColor = "#E34234";       
		document.getElementById("error").innerHTML = "The passwords do not match";		
		return false;  
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
    width: 600px;
    height: 475px;
    top: 70%;
    left: 50%;
    margin-top: -370px;
    margin-left: -300px;
	background: #fff;
    border-radius: 1px;
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
    margin-left: 8px;
    padding-top: 10px;
    font-size: 14px;
}
table
{ 
margin-left: auto;
margin-right: auto;
margin-top: -13px;
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

select {
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 12px;
    outline: none;
}
select {
    color: #777;
    padding-left: 10px;
    margin: 10px;
    margin-top: 12px;
    margin-left: 13px;
    width: 160px;
    height: 21px;
	border: 1px solid #c7d0d2;
    border-radius: 2px;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
-webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
	}
select {
    border: 1px solid #b6bfc0;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
}
select {
    border: 1px solid #a8c9e4;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
}


input {
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 12px;
    outline: none;
}

input[type=radio]{
	color: #777;
	width: 19px;
    height: 13px;
    padding: 0 1px 0 0;
    display: block;
    clear: left;
    float: left;
}

input[type=radio]:hover {
    border: 1px solid #b6bfc0;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
}
input[type=radio]:focus{
    border: 1px solid #a8c9e4;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
}

input[type=text],
input[type=date],
input[type=password]{
    color: #777;
    padding-left: 10px;
    margin: 10px;
    margin-top: 12px;
    margin-left: 18px;
    width: 152px;
    height: 21px;
	border: 1px solid #c7d0d2;
    border-radius: 2px;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
-webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
	}
input[type=text]:hover,
input[type=date]:hover,
input[type=password]:hover {
    border: 1px solid #b6bfc0;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
}
input[type=text]:focus,
input[type=date]:focus,
input[type=password]:focus {
    border: 1px solid #a8c9e4;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
}
#lower {
    background: #ecf2f5;
    width: 100%;
    height: 40px;
    margin-top: 15px;
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
    width: 130px;
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


input[type=submit]:active {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
    background-image: -moz-linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
    background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
}

input[type=submit]:hover {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
    background-image: -moz-linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
    background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
}
</style>

</head>
<body>
<div id="container">

<div id="lower">
<label for="message"> Create your Account </label>
</div>
<%String message = (String)request.getAttribute("ErrorMessage"); 
	if(message != null)
	{ %>
	<label for="message"><span style="color:red;" id="message"><%= message%></span></label>
	<% } %>
<form name="CreateNewUserAndPasswordAction" action="CreateNewUserAndPasswordAction" method="post" onsubmit="return formValidation()">
<label for="error"><span style="color:red;" id="error"></span></label>
<table>
<tr>
<td><label for="username">Enter your First Name:</label> </td>
<td><input type="text" name="UserFirstName" id="firstname" onkeyup="userfirstnameallLetter()"></td>
</tr>

<tr>
<td><label for="username">Enter your Last Name:</label> </td>
<td><input type="text" name="UserLastName" id="lastname" onkeyup="userlastnameallLetter()"></td>
</tr>

<tr>
<td><label for="username">Enter your IC No:</label> </td>
<td><input type="text" name="UserICNo" id="icno" onkeyup="alphanumericicno()"></td>
</tr>

<tr>
<td><label for="username">Choose your UserName:</label> </td>
<td><input type="text" name="UserName" id="userid" onkeyup="validateUsername()"></td>
</tr>

<tr>
<td><label for="password">Create a Password:</label> </td>
<td><input type="password" name="Passwd" id="userpass" onkeyup="validatePassword()"></td>
</tr>

<tr>
<td><label for="password">Confirm your Password:</label> </td>
<td><input type="password" name="repasswd" id="reuserpass" onkeyup="validatePasswordconfirm()"></td>
</tr>

<tr>
<td><input type="submit" name="action" value="Save" onclick="whichPressed=this.value"> </td>
<td><input type="submit" name="action" value="Cancel" onclick="whichPressed=this.value"></td>
</tr>
</table>
</form>
</div>
</body>
</html>