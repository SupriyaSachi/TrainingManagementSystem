<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="Header.jsp" %>    
<!DOCTYPE html">
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
           if(courseid_validation())
           {
              if(coursename_validation())
              {
                 if(validcoursesession())
                 {
                    if(validcourseconductingon())
                    {
                        if(isValidstartdate())
                        {
                            if(isValidenddate())
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
	else if (whichPressed =="Go To Previous Page")
	{
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a Course Plan form.\n\nPress OK to continue or Cancel to stay on the current page.";
		 if (confirm(message)) 
        	 return true;
         else 
        	 return false;
	}
}


function isValidenddate()
{
	var input = document.PlanCourse.CourseEndDate;
	
    if (input.value.length == 0)
    {
    	document.getElementById('cend').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter Course End Date!!";
    	return false;
    }
    else
    {
    	document.getElementById('cend').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}



function isValidstartdate()
{
	var input = document.PlanCourse.CourseStartDate;
	
    if (input.value.length == 0)
    {
    	document.getElementById('cstart').style.borderColor = "red";
    	document.getElementById("error").innerHTML = "Please Enter Course Start Date!!";
    	return false;
    }
    else
    {
    	document.getElementById('cstart').style.borderColor = "#c7d0d2";
    	document.getElementById("error").innerHTML = " ";
    	return true;
    }	
}


function validcourseconductingon()
{
   var conduct = document.PlanCourse.CourseConductingOn;
   if(conduct.value == "Select")   
   {   
     document.getElementById('courseconduct').style.borderColor = "red";
     document.getElementById("error").innerHTML = "Please Select Course Conducting On Days";  
     return false;   
   }   
   else  
   {   
     document.getElementById('courseconduct').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
}   



function validcoursesession() 
{
var r = document.getElementsByName("CourseSession")
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
	document.getElementById('session').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Please select Course Session";	
   return false;
}
else
{
   return true;
}
}



function courseid_validation()   
{   
var courseid = document.PlanCourse.CourseId;
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
	var cname = document.PlanCourse.CourseName;	
   var letters = /^[A-Za-z/+]+$/; 
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
    height: 434px;
    top: 70%;
    left: 50%;
    margin-top: -355px;
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
input[type=date]{
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
    height: 107px;
    margin-top: 15px;
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
    float: centre;
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
<form name="PlanCourse" action="PlanCourseAction" method="post" onsubmit="return formValidation()">
<label for="error"><span style="color:red;" id="error"></span></label>
<table>

<tr>
<td><label for="CourseId">Course Id: </label></td>
<td><input type="text" name="CourseId" id="cid" onkeyup="courseid_validation()"></td>
</tr>

<tr>
<td><label for="CourseName">Course Name: </label></td>
<td><input type="text" name="CourseName" id="coursetitle" onkeyup="coursename_validation()"></td>
</tr>
 
<tr>
<td><label for="CourseSession">Course Session:</label></td>
<td>
<label for="name" >
<input type="radio" name="CourseSession" value="Morning" id="session" onkeyup="validcoursesession()"> Morning</label>
<label for="name" ><input type="radio" name="CourseSession" value="Afternoon"> Afternoon</label>
<label for="name" ><input type="radio" name="CourseSession" value="FullDay"> Full Day</label>

</td>
</tr>

<tr>
<td><label for="CourseConductingOn">Course Conducting On:</label></td>
<td> <label for="name" >
						<select name="CourseConductingOn" multiple id="courseconduct" onkeyup="validcourseconductingon()">
						<option value = "Select" selected> Please Select </option>
						<option value = "Monday"> Monday</option>
						<option value = "Tuesday">Tuesday</option>
						<option value = "Wednesday"> Wednesday</option>
						<option value = "Thursday">Thursday</option>
						<option value = "Friday">Friday</option>
						<option value = "Saturday">Saturday</option>
						<option value = "Sunday">Sunday</option>
						<option value = "AllDays">AllDays</option>
					</select>
					</label>
</td>
</tr>

<tr>
<td><label for="CourseStartDate">Tentative Course Start Date: </label></td>
<td><input type="date" name="CourseStartDate" id="cstart" onkeyup="isValidstartdate()"></td>    
</tr>

<tr>
<td><label for="CourseEndDate">Tentative Course End Date: </label></td>
<td><input type="date" name="CourseEndDate" id="cend" onkeyup="isValidenddate()">   </td> 
</tr>
 </table>
 
 <p align="center"> 
<input type="submit" name="action" value="Save" onclick="whichPressed=this.value"> <input type="submit" name="action" value="Go To Previous Page" onclick="whichPressed=this.value">  
</p>
</form>
</div>
</body>

</html>