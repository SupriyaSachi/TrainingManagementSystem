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
<form action="ListCourseAction" method="post">
<% ArrayList<Course> courseList = (ArrayList<Course>)request.getAttribute("courseList"); %>
<br><br><br>
<% if (courseList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
	    
	    <input type="submit" name="action" value="Go To Previous Page"/>
	    
<%	}
  else
  {
%>
    <table border="1">
       <tr>
       	  <th><label for="header"> S.No. </label></th>	
          <th><label for="header"> Course ID  </label></th>
          <th><label for="header"> Course Name	 </label></th>
          <th><label for="header"> Course Session  </label></th>
          <th><label for="header"> Course Conducting On  </label></th>
          <th><label for="header"> Tentative Course Start Date  </label></th>
          <th><label for="header"> Tentative Course End Date  </label></th>
       </tr>
       <% for (Course course: courseList)
       {%>
       <tr>
       <td><input type="checkbox" name="selectedcourse" value="<%= course.getCourseId() %>"></td>
       <td><label for="header"><%= course.getCourseId() %></label></td>
       <td><label for="header"><%= course.getCourseName() %></label></td>
       <td><label for="header"><%= course.getCourseSession() %></label></td>
       <td><label for="header">
       <%     String[] CourseConductingOn = course.getCourseConductingOn();
              for(int i=0; i < CourseConductingOn.length; i++) 
       	      {
            	  if (CourseConductingOn[i] != null)
            	  {	  
            	  	out.println(CourseConductingOn[i]);
            	  }
       	}%> </label>
       </td>
       <td><label for="header"><% Date CourseStartDate = course.getCourseStartDate();
                         		  SimpleDateFormat StartmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
    		                      String Startmdy = StartmdyFormat.format(CourseStartDate);
    		                      out.println(Startmdy);
                                %></label></td>
                                
       <td><label for="header"><% Date CourseEndDate = course.getCourseEndDate();
    		   					  SimpleDateFormat EndmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
               					  String Endmdy = EndmdyFormat.format(CourseEndDate);
               					  out.println(Endmdy);
    		                   %></label></td>
       </tr>
       <% }
       %>
       </table>
       <br>
      <input type="submit" name="action" value="Go To Previous Page"/> <input type="submit" name="action" value="Delete"/> <input type="submit" name="action" value="Edit"/>  
       
       <% } %> 
       </form>

</body>
</html>