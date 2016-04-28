<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="trainingplan.course.dao.StudentDAO" %>
<%@page import="trainingplan.course.domain.Student" %>
<%@page import="trainingplan.course.domain.Trainer" %>
<%@page import="trainingplan.course.domain.Batch" %>
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
		        if(alphanumericsicno())
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
	else if (whichPressed =="Go To Previous Page")
	{
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a resume student form.\n\nPress OK to continue or Cancel to stay on the current page.";
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


function validbatchallocationstatus()   
{   
	var conduct = document.RegisterStudent.BatchAllocationStatus;
	
	   if(conduct.value == "Yes")   
	   {   
		   document.getElementById('batchstatus').style.borderColor = "#c7d0d2";
		     document.getElementById("error").innerHTML = " ";
		     return true;  
	   }   
	   else  
	   {   
		   document.getElementById('batchstatus').style.borderColor = "red";
		   document.getElementById("error").innerHTML = "Please Select Batch Allocation Status / it should be Yes";  
		   return false; 
	   }  
}

function validcourseconductingon()
{
   var conduct = document.RegisterStudent.CourseConductingOn;
   if(conduct.value == " " || conduct.value == null ||
      conduct.value.length == 0)   
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
	var conduct = document.RegisterStudent.CourseSession;
	   if(conduct.value == " " || conduct.value == null ||
	      conduct.value.length == 0)   
	   {   
		   document.getElementById('session').style.borderColor = "red";
		   document.getElementById("error").innerHTML = "Please Select Course Session";  
		   return false;  
	   }   
	   else  
	   {   
		   document.getElementById('session').style.borderColor = "#c7d0d2";
		   document.getElementById("error").innerHTML = " ";
		   return true; 
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
    
   if (BatchStatus.value == "Halt")   
   {   
	   document.getElementById('status').style.borderColor = "red";
	   document.getElementById("error").innerHTML = "Please Resume Student from Halt Batch Status";
	   BatchStatus.focus();
	   return false;  
   }   
   else  
   {  
	   document.getElementById('status').style.borderColor = "#c7d0d2";
	   document.getElementById("error").innerHTML = " ";
	   return true; 
   }  
}
</script>
<style> 

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
    width: 850px;
    height: 457px;
    top: 70%;
    left: 50%;
    margin-top: -373px;   /*goes top if we increase*/
    margin-left: -420px;
	background: #fff;
    border-radius: 1px;
    border: 1px solid #ccc;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);
	
}

table
{ 
margin-left: auto;
margin-right: auto;
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
    padding-left: 3px;
    margin: 10px;
    margin-top: 12px;
    margin-left: 10px;
    width: 200px;
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
	width: 12px;
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
    height: 78px;
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
	<form name="RegisterStudent" action="ResumeStudentAction" method="post" onsubmit="return formValidation()">
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

<td><label for="StudentICno">IC no of Student:</label></td> 
<td><input type="text" name="StudentICno" value="<%= student.getStudentICno() %>" id="sicno" onkeyup="alphanumericsicno()"></td>
</tr>
	
<tr>
<td><label for="BatchAllocationStatus">Batch Allocation Status:  </label></td>      
	<td><label for="Status">	<select name="BatchAllocationStatus" id="batchstatus" onkeyup="validbatchallocationstatus()">
           <% if(student.getBatchAllocationStatus().equals("Yes")) 
           {%>
              <option value = "Yes" selected> Yes <option>
            <%} 
            else 
            {%>
               <option value = "Yes"> Yes </option>
             <% } 
           	if(student.getBatchAllocationStatus().equals("No")) 
           {%>
            <option value = "No" selected> No </option>
            <%} 
            else 
            {%>
               <option value = "No"> No </option>
             <% }  %>
		   </select>
	</label>
     	 </td>

<td><label for="CourseId">Course Id: </label></td>
<td><input type="text" name="CourseId" value="<%= student.course.getCourseId() %>" id="cid" onkeyup="courseid_validation()"></td>
</tr>
	
	
<tr>
<td><label for="CourseName">Course Title: </label></td>
<td><input type="text" name="CourseName" value="<%= student.course.getCourseName() %>" id="coursetitle" onkeyup="coursename_validation()"></td>

<td><label for="value">Course Conducting On: </label></td>
<td>	<input type="text" name="CourseConductingOn" value="<% String[] CourseConductingOn = student.course.getCourseConductingOn();
              									   for(int i=0; i < CourseConductingOn.length; i++) 
       	      									   {
            	  									  out.println(CourseConductingOn[i]);
       												}%>" id="courseconduct" onkeyup="validcourseconductingon()">
</td>
</tr>       												
       		
<tr>       												
<td><label for="CourseSession"> Course Session: </label></td>
<td><input type="text" name="CourseSession" value="<%= student.course.getCourseSession() %>" id="session" onkeyup="validcoursesession()"></td>
    
<td><label for="BatchId"> Batch Id:</label></td>
<td><input type="text" name="BatchId" value="<%= student.batch.getBatchId()%>" id="bid" onkeyup="batchid_validation()"></td>
</tr>           

<tr>
<td><label for="BatchStatus"> Batch Status: </label>   </td>
<td> <label for="value"> <select name="BatchStatus" onchange="this.form.submit()" id="status" onkeyup="validbatchstatus()">
		 <% if(student.batch.getBatchStatus().equals("Ongoing")) 
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
            </label>   
            </td>
            
    
<td><label for="TrainerId">Trainer Id:</label></td> 
<td><input type="text" name="TrainerId" value="<%= student.trainer.getTrainerId() %>"></td>
 </tr>     
           
       
    </table>
    
	<input type="submit" name="action" value="Go To Previous Page" onclick="whichPressed=this.value"/> <input type="submit" name="action" value="Save" onclick="whichPressed=this.value"/> 
	
	</form>
	</div>
</body>
</html>