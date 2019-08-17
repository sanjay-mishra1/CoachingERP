<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Course</title>
<link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<%@include file="checkUser.jsp" %>
<jsp:include page="nav.jsp"></jsp:include>
 <section class="sectiondemo" >
 <header align="center"><h3>New Course</h3></header>

	<form action="process.jsp"  method="post">

						
			<table border="0" cellpadding="2" cellspacing="4" align="center">
    <tr>
     <td width="123">Course  Name &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="cName" size="20" required></td>
   </tr>
   <tr>
     <td width="123">Duration &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="cDuration" size="20" required></td>
   </tr>
   <tr>
     <td width="123">Fees &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="cFees" size="20" required></td>
   </tr>
   		<input type="text" hidden name="store" value="cStore">
   <tr>
     
     <td width="152"> <button type="submit" value="Submit" size="20" align="center">Add new course</button></td>
   </tr>
  </table> 
  
  
  
  
 	  <jsp:useBean id="e" class="dao.Dao"  scope="session"/>
	  <table border="1" cellpadding="2"   align="center" float="center">
<% 
	ArrayList<String> list=e.loadAllCourses();
	for(String data:list){
		%>
		 <tr>
     <td width="52"><%= data.substring(0,data.indexOf("+")) %> &nbsp; </td>
     <td width="55"><%= data.substring(data.indexOf("+")+1,data.indexOf("-")) %> </td>
     <td width="85"><%= data.substring(data.indexOf("-")+1,data.indexOf("*")) %></td>
     <td width="55"><%= data.substring(data.indexOf("*")+1) %></td>
     <td width="55"> <a class="smallbutton"   href='editCourse.jsp?id=<%=data.substring(0,data.indexOf("+")) %>'>Edit</a>&nbsp;
       
       </td>
   </tr>
	<%}
  
  %>  
  </table>
  </form>
</secion>
</body>

</html>