<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="trainingplan.course.dao.CourseDAO" %>
<%@page import="trainingplan.course.domain.Course" %>
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
           if(trainerid_validation())
           {
              if(trainerfirstnameallLetter())
              {
                 if(trainerlastnameallLetter())
                 {
                    if(validsex())
                    {
                       if(isValidDate())
                       {
 			  			 if(trainerphonenumber())
                          {
                             if(altphonenumber())
			     			  {
                                if(ValidateEmail())
                                {
                                  if(alphanumericticno())
                                  {
                                    if(validavailability())
                                    {
                                      if(validtrainerspec())
                                      {
                                        if(validstatus())
                                        {
                                           if(isValidJoiningDate())
                                           {	   
	                                           if(validworkstatus())
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
	else if (whichPressed =="Go To Previous Page")
	{
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a Trainer Registration form.\n\nPress OK to continue or Cancel to stay on the current page.";
		 if (confirm(message)) 
        	 return true;
         else 
        	 return false;
	}
}


function trainerid_validation()   
{   
var trainerid = document.RegisterTrainer.TrainerId;
var trainerid_len = trainerid.value.length; 
var letters = /^[0-9a-zA-Z]+$/;  
if ((trainerid_len == 0) || (trainerid_len < 9))   
{   
	document.getElementById('Tid').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Trainer Id should not be empty / length should be greater or equal to 9";
	return false;   
}
else if (trainerid.value.match(letters))
{
      document.getElementById('Tid').style.borderColor = "#c7d0d2";
      document.getElementById("error").innerHTML = " ";
      return true;
}
else
{
      document.getElementById('Tid').style.borderColor = "red";    
      document.getElementById("error").innerHTML = "Invalid Trainer Id";
      return false;   
}
}


    

function trainerfirstnameallLetter()   
{    
	var tfname = document.RegisterTrainer.TrainerFirstName;	
   var letters = /^[A-Za-z]+$/; 
   if (tfname.value == " " || tfname.value == null)   
   {   
	document.getElementById('firstname').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Trainer First Name should not be empty";
//	sfname.focus();   
	return false;   
   } 
   else if (document.getElementById('firstname').value.length <= 2)
   {
        document.getElementById('firstname').style.borderColor = "red";
        document.getElementById("error").innerHTML = "Trainer Name is too short";
        return false;
   } 
   else if(tfname.value.match(letters))   
   {   
     document.getElementById('firstname').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
    document.getElementById('firstname').style.borderColor = "red";  
    document.getElementById("error").innerHTML = "Trainer First Name must have alphabet characters only";  
    return false;   
   }   
}   
 


function trainerlastnameallLetter()   
{    
	var tlname = document.RegisterTrainer.TrainerLastName;	
   var letters = /^[A-Za-z]+$/;   
   
   if (tlname.value == " " || tlname.value == null)   
   {   
	document.getElementById('lastname').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Trainer Last Name should not be empty";  
	tlname.focus();   
	return false;   
   }  
   else if (document.getElementById('lastname').value.length <= 2)
   {
        document.getElementById('lastname').style.borderColor = "red";
        document.getElementById("error").innerHTML = "Trainer Name is too short";
        return false;
   }
   else if(tlname.value.match(letters))   
   {   
     document.getElementById('lastname').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
    document.getElementById('lastname').style.borderColor = "red";  
    document.getElementById("error").innerHTML = "Trainer Last Name must have alphabet characters only";    
    tlname.focus();   
    return false;   
   }   
}   


function validsex()   
{   
   var r = document.getElementsByName("Gender")
   var c = -1

for(var i=0; i < r.length; i++)
{
   if(r[i].checked) 
   {
      c = i; 
   }
}
if (c == -1) 
{
	document.getElementById('sex').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Please select Gender";	
   return false;
}
else
{
   return true;
}
}


function isValidDate()
{
	var input = document.RegisterTrainer.DateOfBirth;
	
    if (input.value.length == 0)
    {
    	document.getElementById('Dob').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter The Date Of Birth!!";
    	return false;
    }
    else
    {
    	document.getElementById('Dob').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}


function isValidJoiningDate()
{
	var input = document.RegisterTrainer.DateOfJoining;
	
    if (input.value.length == 0)
    {
    	document.getElementById('Doj').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter The Date Of Joining!!";
    	return false;
    }
    else
    {
    	document.getElementById('Doj').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}

function trainerphonenumber()   
{   
	var tmobno = document.RegisterTrainer.MobileNo;	
  var phoneno = /^\d{8}$/;   
    
  if(tmobno.value.match(phoneno))  
  { 
      document.getElementById('phone').style.borderColor = "#c7d0d2";  
      document.getElementById("error").innerHTML = " ";
      return true;   
  }
  else  
  {   
      document.getElementById('phone').style.borderColor = "red"; 
      document.getElementById("error").innerHTML = "Please Enter Phone Number / Invalid Phone number";
      return false;  
  }   
}  


function altphonenumber()   
{   
	var amobno = document.RegisterTrainer.AltTelphNo;	
  var phoneno = /^\d{8}$/; 
  
  if(amobno.value.match(phoneno))  
  {   
      document.getElementById('phonealt').style.borderColor = "#c7d0d2";
      document.getElementById("error").innerHTML = " ";
      return true;   
  }
  else  
  {   
      document.getElementById('phonealt').style.borderColor = "red"; 
      document.getElementById("error").innerHTML = "Please Enter Phone Number / Invalid Phone number";
      return false;  
  }   
}  


function ValidateEmail()   
{   
	var semail = document.RegisterTrainer.Email;	
   var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;   
   if(semail.value.match(mailformat))   
   {   
      document.getElementById('email').style.borderColor = "#c7d0d2";  
      document.getElementById("error").innerHTML = " ";
      return true;   
   }   
   else  
   {   
        document.getElementById('email').style.borderColor = "red"; 
        document.getElementById("error").innerHTML = "Please Enter Email id / Invalid Email Id";
	return false;   
   }   
}  


function alphanumericticno()   
{    
	var ticno = document.RegisterTrainer.TrainerICno;
  var letters = /^[0-9a-zA-Z]+$/;   
  if(ticno.value.match(letters))   
  {   
    document.getElementById('icno').style.borderColor = "#c7d0d2";
    document.getElementById("error").innerHTML = " ";
    return true;   
  }
  else  
  {   
    document.getElementById('icno').style.borderColor = "red";
    document.getElementById("error").innerHTML = "Please Enter Parent IC Number / Invalid Parent IC No";
    return false;   
  }   
}  


function validavailability() 
{
var r = document.getElementsByName("Availability")
   var c = -1

for(var i=0; i < r.length; i++)
{
   if(r[i].checked) 
   {
      c = i; 
   }
}
if (c == -1) 
{
	document.getElementById('avail').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Please select Trainer Availability";	
   return false;
}
else
{
   return true;
}
}


function validtrainerspec()
{
   var tspec = document.RegisterTrainer.TrainerSpecializationn;
   if(tspec.value == "Select")   
   {   
     document.getElementById('spec').style.borderColor = "red";
     document.getElementById("error").innerHTML = "Please Select Trainer Specialization";  
     return false;   
   }   
   else  
   {   
     document.getElementById('spec').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
}   


function validstatus() 
{
var r = document.getElementsByName("TrainerStatus")
   var c = -1

for(var i=0; i < r.length; i++)
{
   if(r[i].checked) 
   {
      c = i; 
   }
}
if (c == -1) 
{
	document.getElementById('status').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Please select Trainer Status";	
   return false;
}
else
{
   return true;
}
}
  

function validworkstatus() 
{
var r = document.getElementsByName("TrainerWorkStatus")
   var c = -1

for(var i=0; i < r.length; i++)
{
   if(r[i].checked) 
   {
      c = i; 
   }
}
if (c == -1) 
{
	document.getElementById('workstatus').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Please select Trainer Work Status";	
   return false;
}
else
{
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
    width: 900px;
    height: 520px;
    top: 70%;
    left: 50%;
    margin-top: -398px;
    margin-left: -460px;
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
    margin-left: 10px;
    width: 222px;
    height: 25px;
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
input[type=date]{
    color: #777;
    padding-left: 10px;
    margin: 10px;
    margin-top: 12px;
    margin-left: 18px;
    width: 210px;
    height: 25px;
	border: 1px solid #c7d0d2;
    border-radius: 2px;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
-webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
	}
input[type=text]:hover,
input[type=date]:hover {
    border: 1px solid #b6bfc0;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
}
input[type=text]:focus,
input[type=date]:focus {
    border: 1px solid #a8c9e4;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
}
#lower {
    background: #ecf2f5;
    width: 100%;
    height: 88px;
    margin-top: 13px;
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
    margin-top: 30px;
    width: 155px;
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
	<%String message = (String)request.getAttribute("ErrorMessage"); 
	if(message != null)
	{ %>
	<label for="message"><font color='red'><%= message%></font></label>
	<% }%>
	
	<form name="RegisterTrainer" action="RegisterTrainerAction" method="post" onsubmit="return formValidation()">
	<% ArrayList<Course> courseList = (ArrayList<Course>)request.getAttribute("courseList"); %>
	<% if (courseList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Course Details are not found !!!"); %> </font></label>
	    
	    <input type="submit" name="action" value="Go To Previous Page"/>
	    
<%}
  else
  {
%>
<label for="error"><span style="color:red;" id="error"></span></label>
<table>
<tr>
<td><label for="TrainerId">	Trainer ID:</label></td>
<td>	<input type="text" name="TrainerId" id="Tid" onkeyup="trainerid_validation()"></td>
	
	
<td><label for="TrainerFN">	Trainer First Name:</label></td>
<td>	<input type="text" name="TrainerFirstName" id="firstname" onkeyup="trainerfirstnameallLetter()"></td>
</tr>	
	
<tr>	
<td><label for="TrainerLN">	Trainer Last Name:</label></td>
<td>	<input type="text" name="TrainerLastName" id="lastname" onkeyup="trainerlastnameallLetter()"></td>
	
	
<td><label for="Gender">Gender:</label></td>
<td><label for="Male"> <input type="radio" name="Gender" value="Male" id="sex" onkeyup="validsex()"> Male </label> 

<label for="Female"> <input type="radio" name="Gender" value="Female"> Female </label>
</td>
</tr>	
	
<tr>	
<td><label for="date">Date Of Birth:</label></td>
<td><input type="date" name="DateOfBirth" id="Dob" onkeyup="isValidDate()"></td>  
	
<td><label for="MobileNo">Mobile No:</label></td>
<td><input type="text" name="MobileNo" id="phone" onkeyup="trainerphonenumber()"></td>	
</tr>	
	
<tr>	
<td><label for="AltTelphNo">Alternate Telephone No:</label></td>
<td><input type="text" name="AltTelphNo" id="phonealt" onkeyup="altphonenumber()"></td>

<td><label for="Email">Email:</label></td>
<td><input type="text" name="Email" id="email" onkeyup="ValidateEmail()"></td>
</tr>

<tr>	
<td><label for="StudentICno">IC no of Trainer:</label></td>
<td><input type="text" name="TrainerICno" id="icno" onkeyup="alphanumericticno()"></td>


<td><label for="Availability">Trainer Availability:</label></td>
<td><label for="FT"> <input type="radio" name="Availability" value="Fulltime" id="avail" onkeyup="validavailability()"> Full Time </label> 

<label for="PT"> <input type="radio" name="Availability" value="Parttime"> Part Time </label>
</td>
</tr>	

<tr>	
<td><label for="spec">	Trainer Specialization:</label></td>
<td><label for="spec">	<select name="TrainerSpecialization" multiple id="spec" onkeyup="validtrainerspec()">
                <option value = "Select" selected> Select </option>
        		<% for (int i = 0; i < courseList.size(); i++)
       	   		{ 
       	        	Course course = (Course) courseList.get(i);%>
            	  	<option value = "<%= course.getCourseName()%>"><% out.println(course.getCourseName());%></option>
       			<% }%> 
	</select></label></td>
	
	
<td><label for="Trainerstatus">	Trainer Status Info:</label></td>
<td><label for="free">	<input type="radio" name="TrainerStatus" value="Free" id="status" onkeyup="validstatus()"> Free </label>
     <label for="occupied">	<input type="radio" name="TrainerStatus" value="Occupied"> Occupied </label></td>
</tr>	
	
<tr>
<td><label for="date">Trainer Joining Date:</label></td>
<td><input type="date" name="DateOfJoining" id="Doj" onkeyup="isValidJoiningDate()"></td>  

<td><label for="Wstatus">	    
	Trainer Work Status: </label></td>
<td><label for="Wstatus">	<input type="radio" name="TrainerWorkStatus" value="Employed" id="workstatus" onkeyup="validworkstatus()"> Employed </label>
   <label for="Wstatus">	<input type="radio" name="TrainerWorkStatus" value="Left"> Left </label></td>
</tr>
	
	</table>
	
	<input type="submit" name="action" value="Go To Previous Page" onclick="whichPressed=this.value"/> <input type="submit" name="action" value="Save" onclick="whichPressed=this.value"/> 
	
	</form>
<% }%>
</div>
</body>
</html>