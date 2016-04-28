<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="trainingplan.course.domain.Student" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="trainingplan.course.dao.CourseDAO" %>
<%@page import="trainingplan.course.domain.Course" %>
<%@page import="trainingplan.course.domain.Student" %>
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


input {
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 10px;
    outline: none;
}

.check {
    margin-left: 3px;
	font-size: 11px;
    color: #444;
    text-shadow: 0 1px 0 #fff;
}

input[type=submit] {
    float: right;
    margin-right: 30px;
    margin-top: 10px;
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

<form action="BatchNotAllocatedStudentListAction" method="post">
<% ArrayList<Student> studentList = (ArrayList<Student>)request.getAttribute("studentList"); %>
<br><br>
<% if (studentList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
	<p align="center">
	    <label for="message"><input type="submit" name="action" value="Go To Previous Page"/></label>
	    </p>
<%	}
else
{
%>
    <table border="1">
       <tr>
       	  <th> <label for="header">  S.No.  </label> </th>	
       	  <th> <label for="header">  Student Id   </label> </th>
          <th> <label for="header">  Student First Name   </label> </th>
          <th> <label for="header">  Student Last Name	  </label> </th>
          <th> <label for="header">  Gender   </label> </th>
          <th> <label for="header">  Date Of Birth   </label> </th>
          <th> <label for="header">  Mobile No Of Student   </label> </th>
          <th> <label for="header">  Mobile No Of Parent   </label> </th>
          <th> <label for="header">  Alternate Telephone No   </label> </th>
          <th> <label for="header">  Email   </label> </th>
          <th> <label for="header">  IC no of Student   </label> </th>
          <th> <label for="header">  IC no of Parent   </label> </th>
          <th> <label for="header">  Batch Allocation Status   </label> </th>
          <th> <label for="header">  Course Id   </label> </th>
          <th> <label for="header">  Course Title   </label> </th>
          <th> <label for="header">  Course Conducting On   </label> </th>
          <th> <label for="header">  Course Session   </label> </th>
       </tr>
       <% for (Student student: studentList)
       {%>
       <tr>
       <td><input type="checkbox" name="selectedstudent" value="<%= student.getStudentId() %>"></td>
       <td> <label for="header"> <%= student.getStudentId()%> </label> </td>
       <td> <label for="header"> <%= student.getStudentFirstName() %> </label> </td>
       <td> <label for="header"> <%= student.getStudentLastName() %> </label> </td>
       <td> <label for="header"> <%= student.getGender() %> </label> </td>
       
       <% Date DOB = student.getDateOfBirth();
         SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
         String dobmdy = dobmdyFormat.format(DOB);
         %>
       <td> <label for="header"> <%= dobmdy %> </label> </td>
       
       <td> <label for="header"> <%= student.getStudentMobileNo() %> </label> </td>
       <td> <label for="header"> <%= student.getParentMobileNo() %> </label> </td>
       <td> <label for="header"> <%= student.getAltTelphNo() %> </label> </td>
       <td> <label for="header"> <%= student.getEmail() %> </label> </td>
       <td> <label for="header"> <%= student.getStudentICno() %> </label> </td>
       <td> <label for="header"> <%= student.getParentICno() %> </label> </td>
       <td> <label for="header"> <%= student.getBatchAllocationStatus() %> </label> </td>
       <td> <label for="header"> <%= student.course.getCourseId() %> </label> </td>
       <td> <label for="header"> <%= student.course.getCourseName() %> </label> </td>
       <td> <label for="header"> <% String[] CourseConductingOn = student.course.getCourseConductingOn();
   	         	for(int i=0; i < CourseConductingOn.length; i++) 
     		      	{ 
          			  out.println(CourseConductingOn[i]);
     		      	}   			
       	 %></label>
       	</td>
       	<td> <label for="header"> <%= student.course.getCourseSession() %> </label> </td>
       <% } %>
       </tr>
       </table>
       <br>
    
       <input type="submit" name="action" value="Go To Previous Page"/> <input type="submit" name="action" value="Delete"/> <input type="submit" name="action" value="Allocate Batch"/> <input type="submit" name="action" value="Edit"/>
    
       <%} %>
 </form>
</body>
</html>