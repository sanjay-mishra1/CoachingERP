<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<title>New Course</title>
<link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<% String error=(String)request.getAttribute("error"); %>

<jsp:include page="nav.jsp"></jsp:include>
 <section class="sectiondemo" >
 <header align="center"><h3>Login</h3></header>
	<form action="userProcess.jsp" align="center"  method="post">

						
			<table border="0" cellpadding="2" cellspacing="4">
    <tr>
     <td width="123">Mobile  Number &nbsp; </td></tr>
     <tr>
     <td width="152"> <input type="text" name="mobilenumber" size="20" required></td>
   </tr>
   <tr>
     <td width="123">Password &nbsp; </td></tr>
     <tr>
     <td width="152"> <input type="password" name="password" size="20" required></td>
   </tr>
   
   		<input type="text" hidden name="login" value="yes">
   <tr>
     
     <td width="152"> <button type="submit" value="Submit" size="20" align="center">Login</button></td>
   </tr>
   
   </table>
         <a href="signup.jsp" style="padding-bottom:10px;margin-left:40px;">Don't have account? Signup</a>
   
   <%if(error!=null){ %>
      <div class="error">
      
      <h4>Error:<%=error %></h4></div>
      <%} %>
  </form>
  </section>

</body>
</html>