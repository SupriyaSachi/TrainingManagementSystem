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
<title> </title>
<script lang="javascript">

var whichPressed;

function formValidation()   
{
	if(whichPressed=="Save")                 
	{	
		if(studentid_validation())   
		 {
		   if(studentfirstnameallLetter())   
		   {
		     if(studentlastnameallLetter())   
		     {
		        if(validsex())   
		        { 
		           if(isValidDate())
		           {
		              if(studentphonenumber())
		 	      {
		                 if(parentphonenumber())
			         {
		                    if(altphonenumber())
		                    {
		                       if(ValidateEmail())
		                       {
		                         if(alphanumericsicno())
		                         {
		                           if(alphanumericpicno())
		                           {
		                              if(courseselect())
		                              {
		                                 if(isValidStartDate())
		                                 {
		                                   if(isValidEndDate())
		                                   {
		                                      if (validbatchallocationstatus())
		                                      {
		                                         if(findaboutus())
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
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a student registration form.\n\nPress OK to continue or Cancel to stay on the current page.";
		 if (confirm(message)) 
        	 return true;
         else 
        	 return false;
	}
}




function studentid_validation()   
{   
var sid = document.RegisterStudent.StudentId;
var sid_len = sid.value.length; 
var letters = /^[0-9a-zA-Z]+$/;  
if ((sid_len == 0) || (sid_len < 9))   
{   
	document.getElementById('studid').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Student Id should not be empty / length should be greater or equal to 9";
	return false;   
}
else if (sid.value.match(letters))
{
      document.getElementById('studid').style.borderColor = "#c7d0d2";
      document.getElementById("error").innerHTML = " ";
      return true;
}
else
{
      document.getElementById('studid').style.borderColor = "red";    
      document.getElementById("error").innerHTML = "Invalid Id";
      return false;   
}
}



function studentfirstnameallLetter()   
{    
	var sfname = document.RegisterStudent.StudentFirstName;	
   var letters = /^[A-Za-z]+$/; 
   if (sfname.value == " " || sfname.value == null)   
   {   
	document.getElementById('firstname').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Student First Name should not be empty";
//	sfname.focus();   
	return false;   
   } 
   else if (document.getElementById('firstname').value.length <= 2)
   {
        document.getElementById('firstname').style.borderColor = "red";
        document.getElementById("error").innerHTML = "Student Name is too short";
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
    document.getElementById("error").innerHTML = "Student First Name must have alphabet characters only";  
    sfname.focus();   
    return false;   
   }   
}   



function studentlastnameallLetter()   
{    
	var slname = document.RegisterStudent.StudentLastName;	
   var letters = /^[A-Za-z]+$/;   
   
   if (slname.value == " " || slname.value == null)   
   {   
	document.getElementById('lastname').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Student Last Name should not be empty";  
	slname.focus();   
	return false;   
   }  
   else if (document.getElementById('lastname').value.length <= 2)
   {
        document.getElementById('lastname').style.borderColor = "red";
        document.getElementById("error").innerHTML = "Student Name is too short";
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
    document.getElementById("error").innerHTML = "Student Last Name must have alphabet characters only";    
    slname.focus();   
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
	var input = document.RegisterStudent.DateOfBirth;
	
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

 

function studentphonenumber()   
{   
	var smobno = document.RegisterStudent.StudentMobileNo;	
  var phoneno = /^\d{8}$/;   
    
  if(smobno.value.match(phoneno))  
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

function parentphonenumber()   
{  
	var pmobno = document.RegisterStudent.ParentMobileNo;	
  var phoneno = /^\d{8}$/; 
  
  if(pmobno.value.match(phoneno))  
  {   
      document.getElementById('phonep').style.borderColor = "#c7d0d2";
      document.getElementById("error").innerHTML = " ";
      return true;   
  }
  else  
  {   
      document.getElementById('phonep').style.borderColor = "red";
      document.getElementById("error").innerHTML = "Please Enter Phone Number / Invalid Phone number";
      return false;  
  }   
}  


function altphonenumber()   
{   
	var amobno = document.RegisterStudent.AltTelphNo;	
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
	var semail = document.RegisterStudent.Email;	
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



function alphanumericsicno()   
{    

	var icno = document.RegisterStudent.StudentICno;	
  var letters = /^[0-9a-zA-Z]+$/;   
  if(icno.value.match(letters))   
  {   
    document.getElementById('sicno').style.borderColor = "#c7d0d2";
    document.getElementById("error").innerHTML = " ";
    return true;   
  }
  else  
  {   
    document.getElementById('sicno').style.borderColor = "red";   
    document.getElementById("error").innerHTML = "Please Enter Student IC Number / Invalid Student IC No";
    icno.focus();   
    return false;   
  }   
}   


function alphanumericpicno()   
{    
	var picno = document.RegisterStudent.ParentICno;
  var letters = /^[0-9a-zA-Z]+$/;   
  if(picno.value.match(letters))   
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


function courseselect()   
{   
	var coursetitle = document.RegisterStudent.CourseName;
   if(coursetitle.value == "select")   
   {   
     document.getElementById('coursetitle').style.borderColor = "red";
     document.getElementById("error").innerHTML = "Please Select Course";
     return false;   
   }   
   else  
   {   
     document.getElementById('coursetitle').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
}   



function validbatchallocationstatus()   
{   
   var r = document.getElementsByName("BatchAllocationStatus")
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
	document.getElementById("error").innerHTML = "Please Select Batch Allocation Status";
   return false;
}
else
{
   return true;
}
}

function isValidStartDate()
{
	var input = document.RegisterStudent.PrefCourseStartDate;
	
    if (input.value.length == 0)
    {
    	document.getElementById('prefsd').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter The Preferrable Course Start date!!";
    	return false;
    }
    else
    {
    	document.getElementById('prefsd').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}


function isValidEndDate()
{
	var input = document.RegisterStudent.PrefCourseEndDate;
    if (input.value.length == 0)
    {
    	document.getElementById('prefed').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter The Preferrable Course End date!!";
    	return false;
    }
    else
    {
    	document.getElementById('prefed').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}



function findaboutus()   
{   
	var aboutus = document.RegisterStudent.Findaboutus;
   if(aboutus.value == "Please Select")   
   {   
     document.getElementById('find').style.borderColor = "red";
     document.getElementById("error").innerHTML = "Please Select An Option From Find About Us";  
     return false;   
   }   
   else  
   {   
     document.getElementById('find').style.borderColor = "#c7d0d2";
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
    background: #fff;
}
#container {
    position: fixed;
    width: 1100px;
    height: 592px;
    top: 70%;
    left: 50%;
    margin-top: -430px;
    margin-left: -551px;
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
 -webkit-transition: all .4s ease
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
    width: 240px;
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
    width: 230px;
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
    height: 73px;
    margin-top: 30px;
	  box-shadow: inset 0 1px 1px #fff;
    border-top: 1px solid #ccc;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}

table
{ 
margin-left: auto;
margin-right: auto;
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
    margin-top: 26px;
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

.error {
            border:2px solid red;
        }

</style>

</head>
<body>



<%String message = (String)request.getAttribute("ErrorMessage"); 
	if(message != null)
	{ %>
	<label for="message"><font color='red'><%= message%></font></label>
	<% }%>	

<form name="RegisterStudent" action="RegisterStudentAction" method="post" onsubmit="return formValidation()">
	
	<% ArrayList<Course> courseList = (ArrayList<Course>)request.getAttribute("courseList"); %>
	
	<% if (courseList.size() == 0)
	{ %>
	<label for="coursedetails"><font color='red'> <% out.println("Course Details are not found !!!"); %> </font></label>
	 
	    <input type="submit" name="action" value="Go To Previous Page"/>
	  
<%}
  else
  {
%>
<br>
<label for="error"><span style="color:red;" id="error"></span></label>
<br>
<table>
<tr>
<td><label for="StudentId">Student Id:</label></td>
<td><input type="text" name="StudentId" id="studid" onkeyup="studentid_validation()">  
</td>

<td><label for="StudentFirstName">Student First Name:</label></td>
<td><input type="text" name="StudentFirstName" id="firstname" onkeyup="studentfirstnameallLetter()"> 
</td>
</tr>

<tr>
<td><label for="StudentLastName">Student Last Name:</label></td>
<td><input type="text" name="StudentLastName" id="lastname" onkeyup="studentlastnameallLetter()"> 
</td>

<td><label for="Gender">Gender:</label></td>
<td><label for="Male"> <input type="radio" name="Gender" value="Male" id="sex" onkeyup="validsex()"> Male </label> 

<label for="Female"> <input type="radio" name="Gender" value="Female" id="sex"> Female </label>

</td>
</tr>

<tr>
<td><label for="date">Date Of Birth:</label></td>
<td><input type="date" name="DateOfBirth" id="Dob" onkeyup="isValidDate()">
</td>

<td><label for="StudentMobileNo">Student Mobile No:</label></td>
<td><input type="text" name="StudentMobileNo" id="phone" onkeyup="studentphonenumber()">
</td>
</tr>

<tr>
<td><label for="ParentMobileNo">Parent Mobile No:</label></td>
<td><input type="text" name="ParentMobileNo" id="phonep" onkeyup="parentphonenumber()">
</td>

<td><label for="AltTelphNo">Alternate Telephone No:</label></td>
<td><input type="text" name="AltTelphNo" id="phonealt" onkeyup="altphonenumber()">
</td>
</tr>

<tr>
<td><label for="Email">Email:</label></td>
<td><input type="text" name="Email" id="email" onkeyup="ValidateEmail()">
</td>

<td><label for="StudentICno">Student IC No:</label></td>
<td><input type="text" name="StudentICno" id="sicno" onkeyup="alphanumericsicno()">
</td>
</tr>

<tr>
<td><label for="ParentICno">Parent IC No:</label></td>
<td><input type="text" name="ParentICno" id="icno" onkeyup="alphanumericpicno()">
</td>

<td><label for="CourseName">Course Title:</label></td>
<td><label for="course" ><select name="CourseName" id="coursetitle" onkeyup="courseselect()">
                 <option value = "select" selected>select</option>
        		<% for (int i = 0; i < courseList.size(); i++)
       	   		{ 
       	        	Course course = (Course) courseList.get(i);%>
            	  	<option value = "<%= course.getCourseName()%>"><% out.println(course.getCourseName());%></option>
       			<% }%> 
	</select></label>
</td>
</tr>
	
<tr>	
<td><label for="PrefCourseStartDate">Preferable Course Start Date:</label></td>
<td><input type="date" name="PrefCourseStartDate" id="prefsd" onkeyup="isValidStartDate()">
</td>

<td><label for="PrefCourseEndDate">Preferable Course End Date:</label></td>
<td><input type="date" name="PrefCourseEndDate" id="prefed" onkeyup="isValidEndDate()">
</td>
</tr>

<tr>
<td><label for="BatchAllocationStatus">Batch Allocation Status:</label></td>
<td><label for="Yes"><input type="radio" name="BatchAllocationStatus" value="Yes" onkeyup="validbatchallocationstatus()"> Yes </label>

<label for="No"><input type="radio" name="BatchAllocationStatus" value="No"> No </label>
</td> 
</tr>

<tr>
<td><label for="Findaboutus">How did you find about us:</label>	</td>
<td><label for="about"><select name="Findaboutus" id="find" onkeyup="findaboutus()">
	<option value = "Please Select" selected>Please Select</option>
	<option value = "Google"> Google</option>
	<option value = "Yahoo">Yahoo</option>
	<option value = "Friend or Colleague"> Friend or Colleague</option>
	<option value = "Advertisement">Advertisement</option>
	<option value = "Bing">Bing</option>
	<option value = "Others">Others</option>
</select></label>	
</td>

<td><label for="Reason">If Others, Please Specify:</label>	</td>
<td><input type="text" name="Reason">
</td>
</tr>
</table>

<input type="submit" name="action" value="Go To Previous Page" onclick="whichPressed=this.value"> <input type="submit" name="action" value="Save" onclick="whichPressed=this.value"/> 

<%} %>

	
</form>

</body>
</html>