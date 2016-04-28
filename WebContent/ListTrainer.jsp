<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="trainingplan.course.dao.TrainerDAO" %>
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
    float: left;
    margin-right: 20px;
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
<form action="ListTrainerAction" method="post">
<br><br>
<label for="list">Employed Trainer List:</label>
<br><br>
<% ArrayList<Trainer> trainerList = (ArrayList<Trainer>)request.getAttribute("trainerList"); %>
<% if (trainerList.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
<%	}
  else
  {
%>
    <table border="1">
       <tr> 
       	  <th><label for="header"> S.No. </label></th>	
          <th><label for="header"> Trainer ID </label></th>
          <th><label for="header"> Trainer First Name </label></th>
          <th><label for="header"> Trainer Last Name </label></th>
          <th><label for="header"> Gender </label></th>
          <th><label for="header"> Date Of Birth </label></th>
          <th><label for="header"> Mobile No </label></th>
          <th><label for="header"> Alternate Telephone No </label></th>
          <th><label for="header"> Email Id </label></th>
          <th><label for="header"> Trainer IC No </label></th>
          <th><label for="header"> Availability </label></th>
          <th><label for="header"> Trainer Specialization </label></th>
          <th><label for="header"> Trainer Status </label></th>
          <th><label for="header"> Trainer Work Status </label></th>
          <th><label for="header"> Trainer Joining Date </label></th>
   
       </tr>
       <% for (Trainer trainer: trainerList)
       {%>
       <tr>
       <td><input type="checkbox" name="selectedtrainer" value="<%= trainer.getTrainerId() %>"></td>
       <td><label for="header"><%= trainer.getTrainerId() %></label></td>
       <td><label for="header"><%= trainer.getTrainerFirstName() %></label></td>
       <td><label for="header"><%= trainer.getTrainerLastName() %></label></td>
       <td><label for="header"><%= trainer.getGender() %></label></td>
       <% Date DateOfBirth = trainer.getDateOfBirth();
   		  SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String dobmdy = dobmdyFormat.format(DateOfBirth);
 		%>
      <td><label for="header"><%= dobmdy %></label></td>
       <td><label for="header"><%= trainer.getMobileNo() %></label></td>
       <td><label for="header"><%= trainer.getAltTelphNo() %></label></td>
       <td><label for="header"><%= trainer.getEmail() %></label></td>
       <td><label for="header"><%= trainer.getTrainerICno() %></label></td>
       <td><label for="header"><%= trainer.getAvailability() %></label></td>
       <td><label for="header">
       <%     String[] trainerspecialization = trainer.getTrainerSpecialization();
              for(int i=0; i < trainerspecialization.length; i++) 
       	      {
            	  out.println(trainerspecialization[i]);
       		  }%></label>
       </td>
       <td><label for="header"><%= trainer.getTrainerStatus() %></label></td>
       <td><label for="header"><%= trainer.getTrainerWorkStatus() %></label></td>
       <% Date DateOfJoining = trainer.getTrainerJoiningDate();
   		  SimpleDateFormat dojmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String dojmdy = dojmdyFormat.format(DateOfJoining);
 		%>
      <td><label for="header"><%= dojmdy %></label></td>
       </tr>
       <% }
       %>
       </table>
       
       
       <input type="submit" name="action" value="Edit"/> 
       
       <% } %>      

<br><br><br>

<label for="list">Left Trainer List:</label>
<br><br>
<% ArrayList<Trainer> trainerList1 = (ArrayList<Trainer>)request.getAttribute("trainerList1"); %>
<% if (trainerList1.size() == 0)
	{ %>
	<label for="message"><font color='red'> <% out.println("Datas are not found !!!"); %> </font></label>
	    
	    
	    
<%	}
  else
  {
%>
 <table border="1">
       <tr>
       	  <th><label for="header"> S.No. </label></th>	
          <th><label for="header"> Trainer ID </label></th>
          <th><label for="header"> Trainer First Name </label></th>
          <th><label for="header"> Trainer Last Name </label></th>
          <th><label for="header"> Gender </label></th>
          <th><label for="header"> Date Of Birth </label></th>
          <th><label for="header"> Mobile No </label></th>
          <th><label for="header"> Alternate Telephone No </label></th>
          <th><label for="header"> Email Id </label></th>
          <th><label for="header"> Trainer IC No </label></th>
          <th><label for="header"> Availability </label></th>
          <th><label for="header"> Trainer Specialization </label></th>
          <th><label for="header"> Trainer Status </label></th>
          <th><label for="header"> Trainer Work Status </label></th>
          <th><label for="header"> Date Of Joining </label></th>
          <th><label for="header"> Date Of Relieving </label></th>
       </tr>
       <% for (Trainer trainer: trainerList1)
       {%>
       <tr>
       <td><input type="checkbox" name="selectedtrainer" value="<%= trainer.getTrainerId() %>"></td>
       <td><label for="header"><%= trainer.getTrainerId() %></label></td>
       <td><label for="header"><%= trainer.getTrainerFirstName() %></label></td>
       <td><label for="header"><%= trainer.getTrainerLastName() %></label></td>
       <td><label for="header"><%= trainer.getGender() %></label></td>
       
       <% Date DateOfBirth = trainer.getDateOfBirth();
   		  SimpleDateFormat dobmdyFormat = new SimpleDateFormat("yyyy-MM-dd");
          String dobmdy = dobmdyFormat.format(DateOfBirth);
 		%>
       <td><label for="header"><%= dobmdy %></label></td>
       
       <td><label for="header"><%= trainer.getMobileNo() %></label></td>
       <td><label for="header"><%= trainer.getAltTelphNo() %></label></td>
       <td><label for="header"><%= trainer.getEmail() %></label></td>
       <td><label for="header"><%= trainer.getTrainerICno() %></label></td>
       <td><label for="header"><%= trainer.getAvailability() %></label></td>
       <td><label for="header">
       <%     String[] trainerspecialization = trainer.getTrainerSpecialization();
              for(int i=0; i < trainerspecialization.length; i++) 
       	      {
            	  out.println(trainerspecialization[i]);
       	}%></label>
       </td>
       <td><label for="header"><%= trainer.getTrainerStatus() %></label></td>
       <td><label for="header"><%= trainer.getTrainerWorkStatus() %></label></td>
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
       <% }
       %>
       </table>
       <br>
       <input type="submit" name="action" value="Delete"/> <input type="submit" name="action" value="Go To Previous Page"/> 
 <% } %>
 <br><br>  
<% if((trainerList1.size() == 0) && (trainerList.size() == 0)) {%>
   
<input type="submit" name="action" value="Go To Previous Page"/>

<%}   
else if(trainerList1.size() == 0) {%>
   
<input type="submit" name="action" value="Go To Previous Page"/>

<%} %>  
       
 
       </form>
</body>
</html>