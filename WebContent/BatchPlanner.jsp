<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="trainingplan.course.dao.CourseDAO" %>
<%@page import="trainingplan.course.domain.Course" %>
<%@page import="trainingplan.course.domain.Student" %>
<%@page import="trainingplan.course.domain.Batch" %>
<%@page import="trainingplan.course.domain.Trainer" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    float: center;
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

table
{ 
margin-left: auto;
margin-right: auto;
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
<form action="BatchPlannerAction" method="post">
<label for="message">Batch Completed Student List :-</label>
<br>
<% ArrayList<Student> studentList1 = (ArrayList<Student>)request.getAttribute("studentList1"); %>
<% if (studentList1.size() == 0)
	{ %>
<label for="message">	<font color='red'> <% out.println("Datas are not found !!!"); %> </font> </label>
<%	}
else
{
%>
<br>
<table border="1">
       <tr>
          <th> <label for="message"> S.No </label> </th>
       	  <th> <label for="message">  Student Id  </label> </th>
          <th> <label for="message">  Student First Name  </label> </th>
          <th> <label for="message">  Student Last Name	 </label> </th>
          <th> <label for="message">  Gender  </label> </th>
          <th> <label for="message">  Date Of Birth  </label> </th>
          <th> <label for="message">  Mobile No Of Student  </label> </th>
          <th> <label for="message">  Mobile No Of Parent  </label> </th>
          <th> <label for="message">  Alternate Telephone No  </label> </th>
          <th> <label for="message">  Email Id  </label> </th>
          <th> <label for="message">  IC no of Student  </label> </th>
          <th> <label for="message">  IC no of Parent  </label> </th>
          <th> <label for="message">  Batch Allocation Status  </label> </th>
          <th> <label for="message">  Course Id  </label> </th>
          <th> <label for="message">  Course Title  </label> </th>
          <th> <label for="message">  Course Conducting On  </label> </th>
          <th> <label for="message">  Course Session  </label> </th>
          <th> <label for="message">  Batch Id  </label> </th>
          <th> <label for="message">  Batch Start Date  </label> </th>
          <th> <label for="message">  Batch End Date  </label> </th>
          <th> <label for="message">  Batch Status  </label> </th>
          <th> <label for="message">  Trainer Id  </label> </th>
          <th> <label for="message">  Trainer First Name  </label> </th>
          <th> <label for="message">  Trainer Last Name  </label> </th>
          <th> <label for="message">  Trainer Availability  </label> </th>
       </tr>
       <% int serialnumber = 1;
           for (Student student: studentList1)
       {%>
       <tr>
       <td> <label for="message"> <%= serialnumber %> </label> </td>
       <td> <label for="message"> <%= student.getStudentId() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentFirstName() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentLastName() %> </label> </td>
       <td> <label for="message"> <%= student.getGender() %> </label> </td>
       
       <% Date DOB = student.getDateOfBirth();
         SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dobmdy = dobmdyFormat.format(DOB);
         %>
         
       <td> <label for="message"> <%= dobmdy %> </label> </td>
       <td> <label for="message"> <%= student.getStudentMobileNo() %> </label> </td>
       <td> <label for="message"> <%= student.getParentMobileNo() %> </label> </td>
       <td> <label for="message"> <%= student.getAltTelphNo() %> </label> </td>
       <td> <label for="message"> <%= student.getEmail() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentICno() %> </label> </td>
       <td> <label for="message"> <%= student.getParentICno() %> </label> </td>
       <td> <label for="message"> <%= student.getBatchAllocationStatus() %> </label> </td>
       <td> <label for="message"> <%= student.course.getCourseId() %> </label> </td>
       <td> <label for="message"> <%= student.course.getCourseName() %> </label> </td>
       <td> <label for="message"> 
       <%     String[] CourseConductingOn = student.course.getCourseConductingOn();
              for(int i=0; i < CourseConductingOn.length; i++) 
       	      {
            	  out.println(CourseConductingOn[i]);
       	}%></label>
       	</td>
       	<td> <label for="message"> <%= student.course.getCourseSession() %> </label> </td>
       	<td> <label for="message"> <%= student.batch.getBatchId() %> </label> </td>
       	<% Date batchStartDate = student.batch.getBatchStartDate();
                         		  SimpleDateFormat StartmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
    		                      String Startmdy = StartmdyFormat.format(batchStartDate); %>
       	
	    <td> <label for="message"> <%= Startmdy %> </label> </td>   
	    
	    <% Date batchEndDate = student.batch.getBatchEndDate();
                         		  SimpleDateFormat EndmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
    		                      String Endmdy = EndmdyFormat.format(batchEndDate); %>
    		                      
	    <td> <label for="message"> <%= batchEndDate %> </label> </td>	
	    <td> <label for="message"> <%= student.batch.getBatchStatus() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerId() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerFirstName() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerLastName() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getAvailability() %> </label> </td>
	    </tr>
	    <% ++serialnumber; %>
        <% } %>
       </table>
<%} %>
<br>
<br>
<label for="message">Batch Allocated Student List :-</label>
<br>
<% ArrayList<Student> studentList2 = (ArrayList<Student>)request.getAttribute("studentList2"); %>
<% if (studentList2.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
<%	}
else
{
%>
<br>
<table border="1">
       <tr>
          <th> <label for="message">  S.No.  </label> </th>
       	  <th> <label for="message">  Student Id  </label> </th>
          <th> <label for="message">  Student First Name  </label> </th>
          <th> <label for="message">  Student Last Name	 </label> </th>
          <th> <label for="message">  Gender  </label> </th>
          <th> <label for="message">  Date Of Birth  </label> </th>
          <th> <label for="message">  Mobile No Of Student  </label> </th>
          <th> <label for="message">  Mobile No Of Parent  </label> </th>
          <th> <label for="message">  Alternate Telephone No  </label> </th>
          <th> <label for="message">  Email  </label> </th>
          <th> <label for="message">  IC no of Student  </label> </th>
          <th> <label for="message">  IC no of Parent  </label> </th>
          <th> <label for="message">  Batch Allocation Status  </label> </th>
          <th> <label for="message">  Course Id  </label> </th>
          <th> <label for="message">  Course Title  </label> </th>
          <th> <label for="message">  Course Conducting On  </label> </th>
          <th> <label for="message">  Course Session  </label> </th>
          <th> <label for="message">  Batch Id  </label> </th>
          <th> <label for="message">  Batch Start Date  </label> </th>
          <th> <label for="message">  Batch End Date  </label> </th>
          <th> <label for="message">  Batch Status  </label> </th>
          <th> <label for="message">  Trainer Id  </label> </th>
          <th> <label for="message">  Trainer First Name  </label> </th>
          <th> <label for="message">  Trainer Last Name  </label> </th>
          <th> <label for="message">  Trainer Availability  </label> </th>
          <th> <label for="message">  Trainer Status  </label> </th>
       </tr>
       <% int serialnumber = 1;
          for (Student student: studentList2)
       {%>
       <tr>
       <td> <label for="message"> <%= serialnumber %> </label> </td>
       <td> <label for="message"> <%= student.getStudentId() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentFirstName() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentLastName() %> </label> </td>
       <td> <label for="message"> <%= student.getGender() %> </label> </td>
       
       <% Date DOB = student.getDateOfBirth();
         SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dobmdy = dobmdyFormat.format(DOB);
         %>
       
       <td> <label for="message"> <%= dobmdy %> </label> </td>
       <td> <label for="message"> <%= student.getStudentMobileNo() %> </label> </td>
       <td> <label for="message"> <%= student.getParentMobileNo() %> </label> </td>
       <td> <label for="message"> <%= student.getAltTelphNo() %> </label> </td>
       <td> <label for="message"> <%= student.getEmail() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentICno() %> </label> </td>
       <td> <label for="message"> <%= student.getParentICno() %> </label> </td>
       <td> <label for="message"> <%= student.getBatchAllocationStatus() %> </label> </td>
       <td> <label for="message"> <%= student.course.getCourseId() %> </label> </td>
       <td> <label for="message"> <%= student.course.getCourseName() %> </label> </td>
       <td> <label for="message"> 
       <%     String[] CourseConductingOn = student.course.getCourseConductingOn();
              for(int i=0; i < CourseConductingOn.length; i++) 
       	      {
            	  out.println(CourseConductingOn[i]);
       	}%></label>
       	</td>
       	<td> <label for="message"> <%= student.course.getCourseSession() %> </label> </td>
       	<td> <label for="message"> <%= student.batch.getBatchId() %> </label> </td>
       	
       	<% Date BatchStartDate = student.batch.getBatchStartDate();
           SimpleDateFormat StartmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
           String Startmdy = StartmdyFormat.format(BatchStartDate);
         %>
	    <td> <label for="message"> <%= Startmdy %> </label> </td>   
	    
	    <% Date BatchEndDate = student.batch.getBatchEndDate();
           SimpleDateFormat EndmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
           String Endmdy = EndmdyFormat.format(BatchEndDate);
         %>
	    
	    <td> <label for="message"> <%= Endmdy %> </label> </td>	
	    
	    <td> <label for="message"> <%= student.batch.getBatchStatus() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerId() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerFirstName() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerLastName() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getAvailability() %> </label> </td>
	    <td> <label for="message"> <%= student.trainer.getTrainerStatus() %> </label> </td>
	    <% ++serialnumber; %>
        <% } %>
        </tr>
       </table>
<%} %>
<br>
<br>
<label for="message">Batch Not Allocated Student List :-</label>
<br>
<% ArrayList<Student> studentList = (ArrayList<Student>)request.getAttribute("studentList"); %>
<% if (studentList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
<%	}
else
{
%>
<br>
    <table border="1">
       <tr>
          <th> <label for="message">  S.No.  </label> </th>
       	  <th> <label for="message">  Student Id  </label> </th>
          <th> <label for="message">  Student First Name  </label> </th>
          <th> <label for="message">  Student Last Name	 </label> </th>
          <th> <label for="message">  Gender  </label> </th>
          <th> <label for="message">  Date Of Birth  </label> </th>
          <th> <label for="message">  Mobile No Of Student  </label> </th>
          <th> <label for="message">  Mobile No Of Parent  </label> </th>
          <th> <label for="message">  Alternate Telephone No  </label> </th>
          <th> <label for="message">  Email  </label> </th>
          <th> <label for="message">  IC no of Student  </label> </th>
          <th> <label for="message">  IC no of Parent  </label> </th>
          <th> <label for="message">  Preferred Course Start Date  </label> </th>
          <th> <label for="message">  Preferred Course End Date  </label> </th>
          <th> <label for="message">  Batch Allocation Status  </label> </th>
          <th> <label for="message">  Course Id  </label> </th>
          <th> <label for="message">  Course Title  </label> </th>
          <th> <label for="message">  Course Conducting On  </label> </th>
          <th> <label for="message">  Course Session  </label> </th>
       </tr>
       <%  int serialnumber = 1;
           for (Student student: studentList)
       {%>
       <tr>
       <td> <label for="message"> <%= serialnumber %> </label> </td>
       <td> <label for="message"> <%= student.getStudentId()%> </label> </td>
       <td> <label for="message"> <%= student.getStudentFirstName() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentLastName() %> </label> </td>
       <td> <label for="message"> <%= student.getGender() %> </label> </td>
       
       <% Date DOB = student.getDateOfBirth();
         SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dobmdy = dobmdyFormat.format(DOB);
         %>
       <td> <label for="message"> <%= dobmdy %> </label> </td>
       
       <td> <label for="message"> <%= student.getStudentMobileNo() %> </label> </td>
       <td> <label for="message"> <%= student.getParentMobileNo() %> </label> </td>
       <td> <label for="message"> <%= student.getAltTelphNo() %> </label> </td>
       <td> <label for="message"> <%= student.getEmail() %> </label> </td>
       <td> <label for="message"> <%= student.getStudentICno() %> </label> </td>
       <td> <label for="message"> <%= student.getParentICno() %> </label> </td>
       
       <% Date CourseStartDate = student.getPrefCourseStartDate();
          SimpleDateFormat StartmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String Startmdy = StartmdyFormat.format(CourseStartDate);
        %>
        
       <td> <label for="message"> <%= Startmdy %> </label> </td>
       
       <% Date CourseEndDate = student.getPrefCourseEndDate();
          SimpleDateFormat EndmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String Endmdy = EndmdyFormat.format(CourseEndDate);
       %>
       <td> <label for="message"> <%= Endmdy %> </label> </td>
       <td> <label for="message"> <%= student.getBatchAllocationStatus() %> </label> </td>
       <td> <label for="message"> <%= student.course.getCourseId() %> </label> </td>
       <td> <label for="message"> <%= student.course.getCourseName() %> </label> </td>
       <td> <label for="message"> 
       <%     String[] CourseConductingOn = student.course.getCourseConductingOn();
              for(int i=0; i < CourseConductingOn.length; i++) 
       	      {
            	  out.println(CourseConductingOn[i]);
       	}%> </label>
       	</td>
       	<td> <label for="message"> <%= student.course.getCourseSession() %> </label> </td>
       </tr>
       <% ++serialnumber; %>
        <% } %> 
       </table>
 <% } %> 
 <br>
 <br>
 <label for="message">Trainer List :-</label>
 <br>
 <% ArrayList<Trainer> trainerList = (ArrayList<Trainer>)request.getAttribute("trainerList"); %>
<% if (trainerList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
<%	}
  else
  {
%>
<br>
    <table border="1">
       <tr>
          <th> <label for="message">  S.No.  </label> </th> 
       	  <th> <label for="message">  Trainer ID  </label> </th>
          <th> <label for="message">  Trainer First Name  </label> </th>
          <th> <label for="message">  Trainer Last Name  </label> </th>
          <th> <label for="message">  Gender  </label> </th>
          <th> <label for="message">  Date Of Birth  </label> </th>
          <th> <label for="message">  Mobile No  </label> </th>
          <th> <label for="message">  Alternate Telephone No  </label> </th>
          <th> <label for="message">  Email Id  </label> </th>
          <th> <label for="message">  Trainer IC No  </label> </th>
          <th> <label for="message">  Availability  </label> </th>
          <th> <label for="message">  Trainer Specialization  </label> </th>
          <th> <label for="message">  Trainer Status  </label> </th>
          <th> <label for="message">  Trainer Work Status  </label> </th>
          <th> <label for="message">  Trainer Joining Date  </label> </th>
       </tr>
       <% int serialnumber = 1;
          for (Trainer trainer: trainerList)
       {%>
       <tr>
        <td> <label for="message"> <%= serialnumber %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerId() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerFirstName() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerLastName() %> </label> </td>
       <td> <label for="message"> <%= trainer.getGender() %> </label> </td>
       
       <% Date DOB = trainer.getDateOfBirth();
         SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dobmdy = dobmdyFormat.format(DOB);
         %>
      <td> <label for="message"> <%= dobmdy %> </label> </td>
       
       <td> <label for="message"> <%= trainer.getMobileNo() %> </label> </td>
       <td> <label for="message"> <%= trainer.getAltTelphNo() %> </label> </td>
       <td> <label for="message"> <%= trainer.getEmail() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerICno() %> </label> </td>
       <td> <label for="message"> <%= trainer.getAvailability() %> </label> </td>
       <td> <label for="message"> 
       <%     String[] trainerspecialization = trainer.getTrainerSpecialization();
              for(int i=0; i < trainerspecialization.length; i++) 
       	      {
            	  out.println(trainerspecialization[i]);
       	}%> </label>
       </td>
       <td> <label for="message"> <%= trainer.getTrainerStatus() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerWorkStatus() %> </label> </td>
       <% Date DateOfJoining = trainer.getTrainerJoiningDate();
   		  SimpleDateFormat dojmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String dojmdy = dojmdyFormat.format(DateOfJoining);
 		%>
      <td><label for="header"><%= dojmdy %></label></td>
       </tr>
       <% ++serialnumber; %>
       <% }
       %>
       </table>
       <% } %>
 <br>
 <br>
<label for="message"> Left Trainer List :-</label>
 <br>
 <% ArrayList<Trainer> trainerList1 = (ArrayList<Trainer>)request.getAttribute("trainerList1"); %>
<% if (trainerList1.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
<%	}
  else
  {
%>
<br>
    <table border="1">
       <tr>
          <th> <label for="message">  S.No.  </label> </th>
       	  <th> <label for="message">  Trainer ID  </label> </th>
          <th> <label for="message">  Trainer First Name  </label> </th>
          <th> <label for="message">  Trainer Last Name  </label> </th>
          <th> <label for="message">  Gender  </label> </th>
          <th> <label for="message">  Date Of Birth  </label> </th>
          <th> <label for="message">  Mobile No  </label> </th>
          <th> <label for="message">  Alternate Telephone No  </label> </th>
          <th> <label for="message">  Email Id  </label> </th>
          <th> <label for="message">  Trainer IC No  </label> </th>
          <th> <label for="message">  Availability  </label> </th>
          <th> <label for="message">  Trainer Specialization  </label> </th>
          <th> <label for="message">  Trainer Status  </label> </th>
          <th> <label for="message">  Trainer Work Status  </label> </th>
          <th> <label for="message">  Trainer Joining Date  </label> </th>
          <th> <label for="message">  Trainer Relieving Date </label> </th>
       </tr>
       <% int serialnumber = 1;
            for (Trainer trainer: trainerList1)
       {%>
       <tr>
       <td> <label for="message"> <%= serialnumber %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerId() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerFirstName() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerLastName() %> </label> </td>
       <td> <label for="message"> <%= trainer.getGender() %> </label> </td>
       
       <% Date DOB = trainer.getDateOfBirth();
         SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dobmdy = dobmdyFormat.format(DOB);
         %>
         
      <td> <label for="message"> <%= dobmdy %> </label> </td>
       <td> <label for="message"> <%= trainer.getMobileNo() %> </label> </td>
       <td> <label for="message"> <%= trainer.getAltTelphNo() %> </label> </td>
       <td> <label for="message"> <%= trainer.getEmail() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerICno() %> </label> </td>
       <td> <label for="message"> <%= trainer.getAvailability() %> </label> </td>
       <td> <label for="message"> 
       <%     String[] trainerspecialization = trainer.getTrainerSpecialization();
              for(int i=0; i < trainerspecialization.length; i++) 
       	      {
            	  out.println(trainerspecialization[i]);
       	}%> </label>
       </td>
       <td> <label for="message"> <%= trainer.getTrainerStatus() %> </label> </td>
       <td> <label for="message"> <%= trainer.getTrainerWorkStatus() %> </label> </td>
       <% Date DateOfJoining = trainer.getTrainerJoiningDate();
   		  SimpleDateFormat dojmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String dojmdy = dojmdyFormat.format(DateOfJoining);
 		%>
      <td><label for="header"><%= dojmdy %></label></td>
      <% Date DateOfRelieving = trainer.getTrainerRelievingDate();
   		  SimpleDateFormat dormdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String dormdy = dormdyFormat.format(DateOfRelieving);
 		%>
      <td><label for="header"><%= dormdy %></label></td>
       </tr>
       <% ++serialnumber; %>
       <% }
       %>
       </table>
       <% } %>
 
 <br>
 <br>
<label for="message">Courses Offered :-</label>
 <br>
 <% ArrayList<Course> courseList = (ArrayList<Course>)request.getAttribute("courseList"); %>
<% if (courseList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
<%	}
  else
  {
%>
<br>
    <table border="1">
       <tr>
          <th> <label for="message">  S.No.  </label> </th>
       	  <th> <label for="message">  Course ID  </label> </th>
          <th> <label for="message">  Course Name	 </label> </th>
          <th> <label for="message">  Course Session  </label> </th>
          <th> <label for="message">  Course Conducting On  </label> </th>
          <th> <label for="message">  Tentative Course Start Date  </label> </th>
          <th> <label for="message">  Tentative Course End Date  </label> </th>
       </tr>
       <%  int serialnumber = 1;
           for (Course course: courseList)
       {%>
       <tr>
       <td> <label for="message"> <%= serialnumber %> </label> </td>
       <td> <label for="message"> <%= course.getCourseId() %> </label> </td>
       <td> <label for="message"> <%= course.getCourseName() %> </label> </td>
       <td> <label for="message"> <%= course.getCourseSession() %> </label> </td>
       <td> <label for="message"> 
       <%     String[] CourseConductingOn = course.getCourseConductingOn();
              for(int i=0; i < CourseConductingOn.length; i++) 
       	      {
            	  out.println(CourseConductingOn[i]);
       	}%> </label>
       </td>
       <% Date CourseStartDate = course.getCourseStartDate();
                         		  SimpleDateFormat StartmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
    		                      String Startmdy = StartmdyFormat.format(CourseStartDate);
        %>		                      
       <td> <label for="message"> <%= Startmdy %> </label> </td>
       
       <% Date CourseEndDate = course.getCourseEndDate();
    		   					  SimpleDateFormat EndmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
               					  String Endmdy = EndmdyFormat.format(CourseEndDate);
         %>      					  
       <td> <label for="message"> <%= Endmdy %> </label> </td>
       </tr>
       <% ++serialnumber; %>
       <% }
       %>
       </table>
 <%} %>
 
 <br>
 <br>
 <p align="center">
 <input type="submit" name="action" value="Go To Previous Page"/>
 </p>
 </form>
</body>
</html>