<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.logoutLblPos{
   position:fixed;
   left:10px;
   top:50px;
}
</style>
</head>
<body>


<div style="float:right">
<label> Welcome <%=(String)session.getAttribute("session_logname") %>!!! <a href="LogOut">LogOut</a> </label>
</div>


</body>
</body>
</html>