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
	if(whichPressed == "Save")                 
	{	
		if(batchid_validation())   
		 {
		      if(courseselect())
		      {    
		          if(isValidStartDate())
		          {
		             if(isValidEndDate())
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
	else if (whichPressed =="Go To Previous Page")
	{
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a Batch Plan form.\n\nPress OK to continue or Cancel to stay on the current page.";
		 if (confirm(message)) 
        	 return true;
         else 
        	 return false;
	}
}




function batchid_validation()   
{   
var batchid = document.BatchPlan.BatchId;
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




function courseselect()   
{   
	var coursetitle = document.BatchPlan.CourseName;
   if(coursetitle.value == "Select")   
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



function validbatchstatus()   
{   
   var BatchStatus = document.BatchPlan.BatchStatus;
   if(BatchStatus.value == "Select")   
   {   
     document.getElementById('status').style.borderColor = "red";
     document.getElementById("error").innerHTML = "Please Select Batch Status";
     return false;   
   }   
   else  
   {   
     document.getElementById('status').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }  
}

function isValidStartDate()
{
	var input = document.BatchPlan.BatchStartDate;
	
    if (input.value.length == 0)
    {
    	document.getElementById('startdate').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter The Batch Start date!!";
    	return false;
    }
    else
    {
    	document.getElementById('startdate').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}


function isValidEndDate()
{
	var input = document.BatchPlan.BatchEndDate;
    if (input.value.length == 0)
    {
    	document.getElementById('enddate').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter The Batch End date!!";
    	return false;
    }
    else
    {
    	document.getElementById('enddate').style.borderColor = "#c7d0d2";
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
    width: 600px;
    height: 418px;
    top: 70%;
    left: 50%;
    margin-top: -350px;
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
    width: 161px;
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
    width: 150px;
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
table
{ 
margin-left: auto;
margin-right: auto;
}
#lower {
    background: #ecf2f5;
    width: 100%;
    height: 80x;
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
    float: center;
    margin-right: 20px;
    margin-top: 20px;
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
	<% }
	%>

<form name="BatchPlan" action="PlanBatchAction" method="post" onsubmit="return formValidation()">
<% ArrayList<Course> courseList = (ArrayList<Course>)request.getAttribute("courseList"); %>
<% if (courseList.size() == 0)
	{ %>
	<label for="coursedetails"><font color='red'> <% out.println("Course Details are not found !!!"); %> </font></label>
	<p align="center">
	    <label for="message"><input type="submit" name="action" value="Go To Previous Page"/></label>
	    </p>
	    
<%}
  else
  {
%>

<label for="error"><span style="color:red;" id="error"></span></label>

<table>
<tr>
<td><label for="BatchId">Batch Id:</label></td>
<td><input type="text" name="BatchId" id="bid" onkeyup="batchid_validation()"></td>
</tr>

<tr>
<td><label for="CourseTitle">Course Title:</label></td> 
<td><label for="value" ><select name="CourseName" id="coursetitle" onkeyup="courseselect()">
				<option value = "Select" selected> Select </option>
        		<% for (int i = 0; i < courseList.size(); i++)
       	   		{ 
       	        	Course course = (Course) courseList.get(i);%>
            	  	<option value = "<%= course.getCourseName()%>"><% out.println(course.getCourseName());%></option>
       			<% }%> 
	</select></label></td>
</tr>

<tr>
<td><label for="BatchStartDate">Batch Start Date:</label></td> 
<td><input type="date" name="BatchStartDate" id="startdate" onkeyup="isValidStartDate()"></td>
</tr>

<tr>
<td><label for="BatchEndDate">Batch End Date:</label></td>
<td><input type="date" name="BatchEndDate" id="enddate" onkeyup="isValidEndDate()"></td>
</tr>

<tr>
<td><label for="BatchStatus">Batch Status:</label></td> 
<td><label for="value" > <select name="BatchStatus" id="status" onkeyup="validbatchstatus()">
            <option value = "Select" selected> Select </option>
            <option value = "NotStarted"> NotStarted </option>
            <option value = "Ongoing"> Ongoing </option>
            <option value = "Halt"> Halt </option>
            <option value = "Completed"> Completed </option>
		   </select>
		  </label> </td>
 </tr>
</table>
<p align="center">
<input type="submit" name="action" value="Save" onclick="whichPressed=this.value"> <input type="submit" name="action" value="Go To Previous Page" onclick="whichPressed=this.value">  
 </p>
<%} %>
</form>
</div>
</body>
</html>