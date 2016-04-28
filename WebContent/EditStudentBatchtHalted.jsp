<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="trainingplan.course.dao.StudentDAO" %>
<%@page import="trainingplan.course.domain.Student" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
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
		                              if(validbatchallocationstatus())
		                              {
		                            	  if(courseid_validation())
		                            	  {
		                            		  if(coursename_validation())
		                            		  {
		                            			  if(validcourseconductingon())
			                            		  {
		                            				  if(validcoursesession())
		                            				  {
		                            					  if(batchid_validation())   
		                            					  {
		                            						  if (validbatchstatus())
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
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a student batch halted form.\n\nPress OK to continue or Cancel to stay on the current page.";
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
var conduct = document.RegisterStudent.Gender;
if(conduct.value == "Male" || conduct.value == "Female")   
{   
	document.getElementById('sex').style.borderColor = "#c7d0d2";
	document.getElementById("error").innerHTML = " ";	
	     return true;  
}   
else  
{   
	document.getElementById('sex').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Please select Gender";	
	return false;
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

function validcourseconductingon()
{
   var conduct = document.RegisterStudent.CourseConductingOn;
   if(conduct.value == "Monday" || conduct.value == "Tuesday" ||
      conduct.value == "Wednesday" || conduct.value == "Thursday" || 
      conduct.value == "Friday" || conduct.value == "Saturday" ||
      conduct.value == "Sunday" || conduct.value == "AllDays")   
   {   
	   document.getElementById('courseconduct').style.borderColor = "#c7d0d2";
	     document.getElementById("error").innerHTML = " ";
	     return true;  
   }   
   else  
   {   
	   document.getElementById('courseconduct').style.borderColor = "red";
	   document.getElementById("error").innerHTML = "Please Select Course Conducting On Days";  
	   return false; 
   }   
}   



function validcoursesession() 
{
	var conduct = document.RegisterStudent.CourseSession;
	   if(conduct.value == "Morning" || conduct.value == "Afternoon" ||
	      conduct.value == "FullDay")   
	   {   
		   document.getElementById('session').style.borderColor = "#c7d0d2";
		     document.getElementById("error").innerHTML = " ";
		     return true;  
	   }   
	   else  
	   {   
		   document.getElementById('session').style.borderColor = "red";
		   document.getElementById("error").innerHTML = "Please Select Course Session";  
		   return false; 
	   }   
}



function courseid_validation()   
{   
var courseid = document.RegisterStudent.CourseId;
var letters = /^[A-Za-z]+$/;
  
if (courseid.value == " " || courseid.value == null)   
   {   
	document.getElementById('cid').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Course Id should not be empty";
    courseid.focus();   
	return false;   
   } 
   else if (document.getElementById('cid').value.length < 1)
   {
        document.getElementById('cid').style.borderColor = "red";
        document.getElementById("error").innerHTML = "Course Id should not be empty";
        return false;
   } 
   else if(courseid.value.match(letters))   
   {   
     document.getElementById('cid').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
    document.getElementById('cid').style.borderColor = "red";  
    document.getElementById("error").innerHTML = "Course Id must have alphabet characters only";  
    courseid.focus();   
    return false;   
   }   
}




function coursename_validation()   
{    
	var cname = document.RegisterStudent.CourseName;	
   var letters = /^[A-Za-z]+$/; 
   if (cname.value == " " || cname.value == null)   
   {   
	document.getElementById('coursetitle').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Course Name should not be empty";
//	sfname.focus();   
	return false;   
   } 
   else if (document.getElementById('coursetitle').value.length < 1)
   {
        document.getElementById('coursetitle').style.borderColor = "red";
        document.getElementById("error").innerHTML = "Course Name should not be empty";
        return false;
   } 
   else if(cname.value.match(letters))   
   {   
     document.getElementById('coursetitle').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
    document.getElementById('coursetitle').style.borderColor = "red";  
    document.getElementById("error").innerHTML = "Course Name must have alphabet characters only";  
    //sfname.focus();   
    return false;   
   }   
}   

function batchid_validation()   
{   
var batchid = document.RegisterStudent.BatchId;
var batchid_len = batchid.value.length; 
var letters = /^[0-9a-zA-Z]+$/;  
if (batchid_len == 0)   
{   
	document.getElementById('bid').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Batch Id should not be empty";
	return false;   
}
else if (batchid.value.match(letters))
{
      document.getElementById('bid').style.borderColor = "#c7d0d2";
      document.getElementById("error").innerHTML = " ";
      return true;
}
else
{
      document.getElementById('bid').style.borderColor = "red";    
      document.getElementById("error").innerHTML = "Invalid Batch Id";
      return false;   
}
}


function validbatchstatus()   
{   
   var BatchStatus = document.RegisterStudent.BatchStatus;
   if(BatchStatus.value == "NotStarted" || BatchStatus.value == "Ongoing" || BatchStatus.value == "Halt" || 
	  BatchStatus.value == "Completed")   
   {   
	   document.getElementById('status').style.borderColor = "#c7d0d2";
	   document.getElementById("error").innerHTML = " ";
	   return true;  
   }   
   else  
   {  
	   document.getElementById('status').style.borderColor = "red";
	   document.getElementById("error").innerHTML = "Please Select Batch Status";
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
    width: 860px;
    height: 600px;
    top: 70%;
    left: 50%;
    margin-top: -435px;
    margin-left: -420px;
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
    width: 210px;
    height: 22px;
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
    width: 200px;
    height: 22px;
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
    height: 75px;
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

table
{ 
margin-left: auto;
margin-right: auto;
}

input[type=submit] {
    float: right;
    margin-right: 20px;
    margin-top: 23px;
    width: 100px;
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
	<% }
	%>
<form  name="RegisterStudent" action="EditBatchHaltedStudentListAction" method="post" onsubmit="return formValidation()">
<% Student student = (Student)request.getAttribute("student"); %>
<label for="error"><span style="color:red;" id="error"></span></label>
<table>
<tr>
<td><label for="StudentId">Student Id: </label></td>
<td><input type="text" name="StudentId" value="<%= student.getStudentId() %>" id="studid" onkeyup="studentid_validation()"></td>

<td><label for="StudentFirstName">Student First Name: </label></td>
<td><input type="text" name="StudentFirstName" value="<%= student.getStudentFirstName() %>" id="firstname" onkeyup="studentfirstnameallLetter()"></td>
</tr>
     
<tr>
<td><label for="StudentLastName">Student Last Name: </label></td>
<td><input type="text" name="StudentLastName" value="<%= student.getStudentLastName() %>" id="lastname" onkeyup="studentlastnameallLetter()"></td>

<td><label for="Gender">Gender: </label></td>
<td><label for="value" ><select name="Gender" id="sex" onkeyup="validsex()">
           <% if(student.getGender().equals("Male")) 
           {%>
              <option value = "Male" selected> Male </option>
            <%} 
            else 
            {%>
               <option value = "Male"> Male </option>
             <% } 
           	if(student.getGender().equals("Female")) 
           {%>
            <option value = "Female" selected> Female </option>
            <%} 
            else 
            {%>
               <option value = "Female"> Female </option>
             <% }  %>
		   </select>
		   </label>
		   </td>
		   </tr>
           
<tr>
<td><label for="value" >Date Of Birth: </label></td>
<% Date DOB = student.getDateOfBirth();
   SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
   String dobmdy = dobmdyFormat.format(DOB);
%>
<td><input type="date" name="DateOfBirth" value="<%= dobmdy %>" id="Dob" onkeyup="isValidDate()"> 		</td>
   
<td><label for="StudentMobileNo"> Mobile No Of Student: </label></td>
<td><input type="text" name="StudentMobileNo" value="<%= student.getStudentMobileNo() %>" id="phone" onkeyup="studentphonenumber()"></td>
</tr>

<tr> 
<td><label for="ParentMobileNo">Mobile No Of Parent:</label></td> 
<td><input type="text" name="ParentMobileNo" value="<%= student.getParentMobileNo() %>" id="phonep" onkeyup="parentphonenumber()"></td>

<td><label for="AltTelphNo">Alternate Telephone No:  </label></td>
<td><input type="text" name="AltTelphNo" value="<%= student.getAltTelphNo() %>" id="phonealt" onkeyup="altphonenumber()"></td>
</tr>
           
<tr>  
<td><label for="Email">Email: </label></td> 
<td><input type="text" name="Email" value="<%= student.getEmail() %>" id="email" onkeyup="ValidateEmail()"></td>

<td><label for="StudentICno">IC no of Student:</label></td> 
<td><input type="text" name="StudentICno" value="<%= student.getStudentICno() %>" id="sicno" onkeyup="alphanumericsicno()"></td>
</tr>

<tr>
<td><label for="ParentICno">IC no of Parent: </label></td>
<td><input type="text" name="ParentICno" value="<%= student.getParentICno() %>" id="icno" onkeyup="alphanumericpicno()"></td>

<td><label for="BatchAllocationStatus">Batch Allocation Status:  </label></td>      
	<td>	
	<% if(student.getBatchAllocationStatus().equals("Yes")) 
           {%>
              <label for="Yes"><input type="radio" name="BatchAllocationStatus" value="Yes" checked="checked" onkeyup="validbatchallocationstatus()"> Yes</label>
            <%} 
            else 
            {%>
               <label for="Yes"><input type="radio" name="BatchAllocationStatus" value="Yes" onkeyup="validbatchallocationstatus()"> Yes </label>
             <% } 
		if(student.getBatchAllocationStatus().equals("No")) 
       {%>
       		<label for="No"><input type="radio" name="BatchAllocationStatus" value="No" checked="checked" onkeyup="validbatchallocationstatus()"> No </label>
     	<%} 
     	else 
    	 {%>
       		 <label for="No"><input type="radio" name="BatchAllocationStatus" value="No" onkeyup="validbatchallocationstatus()"> No </label>
     	 <% } %>
     	 </td>
  </tr> 
            
<tr>
<td><label for="CourseId">Course Id: </label></td>
<td> <input type="text" name="CourseId" value="<%= student.course.getCourseId() %>" id="cid" onkeyup="courseid_validation()"> </td>

<td><label for="CourseName">Course Title: </label></td>
<td><input type="text" name="CourseTitle" value="<%= student.course.getCourseName() %>" id="coursetitle" onkeyup="coursename_validation()"></td>
</tr>
     
<tr>
<td><label for="value" >Course Conducting On:</label></td>
<td><label for="value"><select name="CourseConductingOn" multiple id="courseconduct" onkeyup="validcourseconductingon()">
        <%String[] courseconductingon = student.course.getCourseConductingOn(); %>
        <% if (courseconductingon[0] == null)
           {%>
              <option value = "Monday"> Monday </option>
            <%} 
            else 
            {%>
               <option value = "Monday" selected> Monday </option>
             <% } 
           	if(courseconductingon[1] == null) 
           {%>
            <option value = "Tuesday"> Tuesday </option>
            <%} 
            else 
            {%>
               <option value = "Tuesday" selected> Tuesday </option>
             <% } 
           	if(courseconductingon[2] == null) 
            {%>
             <option value = "Wednesday"> Wednesday </option>
             <%} 
             else 
             {%>
                <option value = "Wednesday" selected> Wednesday </option>
              <% }
           	if(courseconductingon[3] == null)
            {%>
             <option value = "Thursday"> Thursday </option>
             <%} 
             else 
             {%>
                <option value = "Thursday" selected> Thursday </option>
              <% }
           	if(courseconductingon[4] == null) 
            {%>
             <option value = "Friday"> Friday </option>
             <%} 
             else 
             {%>
                <option value = "Friday" selected> Friday </option>
              <% }
           	if(courseconductingon[5] == null) 
            {%>
             <option value = "Saturday"> Saturday </option>
             <%} 
             else 
             {%>
                <option value = "Saturday" selected> Saturday </option>
              <% }
           	if(courseconductingon[6] == null) 
            {%>
             <option value = "Sunday"> Sunday </option>
             <%} 
             else 
             {%>
                <option value = "Sunday" selected> Sunday </option>
              <% } %>
           	<option value = "AllDays">AllDays</option>
	  </select>
	  </label></td>
	            
<td><label for="CourseSession">Course Session:</label></td>
 <td><label for="session">     	
         <select name="CourseSession" id="session" onkeyup="validcoursesession()">
           <% if(student.course.getCourseSession().equals("Morning")) 
           {%>
              <option value = "Morning" selected> Morning </option>
            <%} 
            else 
            {%>
               <option value = "Morning"> Morning </option>
             <% } 
           	if(student.course.getCourseSession().equals("Afternoon")) 
           {%>
            <option value = "Afternoon" selected> Afternoon </option>
            <%} 
            else 
            {%>
               <option value = "Afternoon"> Afternoon </option>
             <% } 
        	if(student.course.getCourseSession().equals("FullDay")) 
            {%>
             <option value = "FullDay" selected> FullDay </option>
             <%} 
             else 
             {%>
                <option value = "FullDay"> FullDay </option>
              <% } %>
             </select>
             </label>
             </td>
             </tr>

<tr>
<td><label for="BatchId">Batch Id: </label></td>
<td><input type="text" name="BatchId" value="<%= student.batch.getBatchId() %>" id="bid" onkeyup="batchid_validation()"></td>

<td><label for="BatchStatus">Batch Status: </label></td>
 <td><label for="value" >     
            <select name="BatchStatus" id="status" onkeyup="validbatchstatus()">
			<% if(student.batch.getBatchStatus().equals("NotStarted")) 
           {%>
              <option value = "NotStarted" selected> NotStarted </option>
            <%} 
            else 
            {%>
               <option value = "NotStarted"> NotStarted </option>
             <% } 
           	if(student.batch.getBatchStatus().equals("Ongoing")) 
           {%>
            <option value = "Ongoing" selected> Ongoing </option>
            <%} 
            else 
            {%>
               <option value = "Ongoing"> Ongoing </option>
             <% } 
           	if(student.batch.getBatchStatus().equals("Halt")) 
            {%>
             <option value = "Halt" selected> Halt </option>
             <%} 
             else 
             {%>
                <option value = "Halt"> Halt </option>
              <% } 
        	if(student.batch.getBatchStatus().equals("Completed")) 
            {%>
             <option value = "Completed" selected> Completed </option>
             <%} 
             else 
             {%>
                <option value = "Completed"> Completed </option>
              <% } %>
            </select>
           </label> </td>
 </tr>
   </table>     
  
<input type="submit" name="action" value="Cancel" onclick="whichPressed=this.value"/> <input type="submit" name="action" value="Save" onclick="whichPressed=this.value"/>  

</form>
</div>
</body>
</html>