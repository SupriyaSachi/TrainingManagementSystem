<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="trainingplan.course.dao.BatchDAO" %>
<%@page import="trainingplan.course.domain.Batch" %>
<%@page import="trainingplan.course.domain.Trainer" %>
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
		                	 if(validtrainerid())
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
		 var message = "Are you sure you want to navigate away from this page?\n\nYou have started writing or editing a Resume Batch from Halt form.\n\nPress OK to continue or Cancel to stay on the current page.";
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
    var letters = /^[A-Za-z/+]+$/; 
   if (coursetitle.value == " " || coursetitle.value == null)   
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
   else if(coursetitle.value.match(letters))   
   {   
	   document.getElementById('coursetitle').style.borderColor = "#c7d0d2";
     document.getElementById("error").innerHTML = " ";
     return true;   
   }   
   else  
   {   
	   document.getElementById('coursetitle').style.borderColor = "red";
    document.getElementById("error").innerHTML = "Course Name must have alphabet characters only";  
   // sfname.focus();   
    return false;   
   }   

}   



function validbatchstatus()   
{   
   var BatchStatus = document.BatchPlan.BatchStatus;
   if(BatchStatus.value == "Ongoing")   
   {   
	   document.getElementById('status').style.borderColor = "#c7d0d2";
	   document.getElementById("error").innerHTML = " ";
	   return true;  
   }   
   else  
   {  
	   document.getElementById('status').style.borderColor = "red";
	   document.getElementById("error").innerHTML = "Please Select Batch Status as Ongoing to resume batch from Halt";
	   return false;  
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

function validtrainerid() 
{   
var trainerid = document.BatchPlan.TrainerId;
var trainerid_len = trainerid.value.length; 
  
if ((trainerid_len == 0) || (trainerid == " "))   
{   
	document.getElementById('Tid').style.borderColor = "red";
	document.getElementById("error").innerHTML = "Trainer Id should not be empty";
	return false;   
}
else
{
      document.getElementById('Tid').style.borderColor = "#c7d0d2";
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

<%String message = (String)request.getAttribute("ErrorMessage"); 
	if(message != null)
	{ %>
	<label for="message"><font color='red'><%= message%></font></label>
	<% }
	%>

<form name="BatchPlan"  action="ResumeBatchFromHaltAction" method="post" onsubmit="return formValidation()">
<% Batch batch = (Batch)request.getAttribute("batch"); %>
<% if (batch == null)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
	    
	    <input type="submit" name="action" value="Go To Previous Page"/>
	    
<%	}
  else
  {
%>
<label for="error"><span style="color:red;" id="error"></span></label>
<table>
<tr>
<td><label for="BatchId">Batch Id:</label></td>
<td><input type="text" name="BatchId" value="<%= batch.getBatchId() %>" id="bid" onkeyup="batchid_validation()"></td>

<td><label for="CourseTitle">Course Title:</label></td> 
<td><input type="text" name="CourseName" value="<%= batch.course.getCourseName() %>" id="coursetitle" onkeyup="courseselect()"></td>
</tr>

<tr>
<td><label for="BatchStartDate">Batch Start Date:</label></td> 
<% Date BatchStartDate = batch.getBatchStartDate();
   SimpleDateFormat StartmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
   String Startmdy = StartmdyFormat.format(BatchStartDate);
 %>
<td><input type="date" name="BatchStartDate" value="<%= Startmdy %>" id="startdate" onkeyup="isValidStartDate()"></td>


<td><label for="BatchEndDate">Batch End Date:</label></td>
<% Date BatchEndDate = batch.getBatchEndDate();
   SimpleDateFormat EndmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
   String Endmdy = EndmdyFormat.format(BatchEndDate);
 %>
<td><input type="date" name="BatchEndDate" value="<%= Endmdy %>" id="enddate" onkeyup="isValidEndDate()"></td>
</tr>

<tr>
<td><label for="BatchStatus">Batch Status:</label></td> 
<td><label for="value" > <select name="BatchStatus" id="status" onkeyup="validbatchstatus()">
            <option value = "Select"> Select </option>
            <option value = "NotStarted"> NotStarted </option>
            <option value = "Ongoing" selected> Ongoing </option>
            <option value = "Halt"> Halt </option>
            <option value = "Completed"> Completed </option>
		   </select>
		  </label> </td>

<td><label for="TrainerID">Trainer ID:</label></td> 
<%    ArrayList<Trainer> getTrainers = batch.getTrainers(); %>
 <td><label for="Tvalue">  <select name="TrainerId" id="Tid" onkeyup="validtrainerid()">
        <% for (int i = 0; i < getTrainers.size(); i++)
       	   { 
       	        Trainer trainer = (Trainer) getTrainers.get(i);%>
            	  <option value = "<%= trainer.getTrainerId()%>"><% out.println(trainer.getTrainerId());%></option>
       	<% }%> 
	  </select></label></td>
       </tr>
    </table>     
    
<label for="heading">Previous Allocated Trainer Details:- </label>
<br><br>	                  
	<table border="1">
       <tr>
          <th><label for="tableB"> Trainer ID </label></th>
          <th><label for="tableB"> Trainer First Name	</label></th>
          <th><label for="tableB"> Trainer Last Name </label></th>
          <th><label for="tableB"> Availability </label></th>
          <th><label for="tableB"> Trainer Specialization </label></th>
          <th><label for="tableB"> Trainer Status </label></th>
          <th> <label for="tableB">Trainer Work Status </label></th>
       </tr>
       <tr>
	       <td><label for="tableB"><%= batch.trainer.getTrainerId() %></label></td>
	       <td><label for="tableB"><%= batch.trainer.getTrainerFirstName() %></label></td>
	       <td><label for="tableB"><%= batch.trainer.getTrainerLastName() %></label></td>
	       <td><label for="tableB"><%= batch.trainer.getAvailability() %></label></td> 
	       <td><label for="tableB">
	       <%     String[] trainerspec = batch.trainer.getTrainerSpecialization();
	              for(int i=0; i < trainerspec.length; i++) 
	       	      {
	            	  out.println(trainerspec[i]+" ");
	       	}%></label>
	       </td>
	       <td><label for="tableB"><%= batch.trainer.getTrainerStatus() %></label></td>
	       <td><label for="tableB"><%= batch.trainer.getTrainerWorkStatus() %></label></td>
	       </tr>	
       </table>
       <br><br>
<label for="heading1">    Currently Available Trainer Details:-</label>
<br><br>
    
       <%    ArrayList<Trainer> Trainers = batch.getTrainers(); %>
       <table border="1">
       <tr>
          <th><label for="tableB"> S.No. </label></th>
          <th><label for="tableB"> Trainer ID </label></th>
          <th><label for="tableB"> Trainer First Name	</label></th>
          <th><label for="tableB"> Trainer Last Name </label></th>
          <th><label for="tableB"> Availability </label></th>
          <th><label for="tableB"> Trainer Specialization </label></th>
          <th><label for="tableB"> Trainer Status </label></th>
          <th><label for="tableB"> Trainer Work Status </label></th>
       </tr>
       <%  int serialnum = 1;
           for (Trainer trainer: Trainers)
       {%>
	       <tr>
	       <td><label for="tableB"><%= serialnum %></label></td>
	       <td><label for="tableB"><%= trainer.getTrainerId() %></label></td>
	       <td><label for="tableB"><%= trainer.getTrainerFirstName() %></label></td>
	       <td><label for="tableB"><%= trainer.getTrainerLastName() %></label></td>
	       <td><label for="tableB"><%= trainer.getAvailability() %></label></td> 
	       <td><label for="tableB">
	       <%     String[] trainerspecialization = trainer.getTrainerSpecialization();
	              for(int i=0; i < trainerspecialization.length; i++) 
	       	      {
	            	  out.println(trainerspecialization[i]+" ");
	       	}%></label>
	       </td>
	       <td><label for="tableB"><%= trainer.getTrainerStatus() %></label></td>
	       <td><label for="tableB"><%= trainer.getTrainerWorkStatus() %></label></td>
	       </tr>	
	       <% ++serialnum; %>
       <% }%>
         </table>
              

       <input type="submit" name="action" value="Go To Previous Page" onclick="whichPressed=this.value"/> <input type="submit" name="action" value="Save" onclick="whichPressed=this.value"/>  
       
<%} %>
       </form>

</body>
</html>