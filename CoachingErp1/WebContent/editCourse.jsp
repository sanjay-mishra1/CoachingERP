<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Course</title>
<link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<%@include file="checkUser.jsp" %>
<jsp:include page="nav.jsp"></jsp:include>
<jsp:useBean id="e" class="dao.Dao"  scope="session"/>
 
<%  HashMap<Object,Object> data=e.getDetail(request.getParameter("id"), " course where cid=?"); %>
 <section class="sectiondemo" >
 <header align="center"><h3>Update Course</h3></header>
	<form action="updateProcess.jsp" align="center"  method="get">
					
	<table border="0" cellpadding="2" cellspacing="4">
	<tr>
     <td width="123">Course ID &nbsp; </td></tr>
   
	<tr>
     <td width="152"> <input type="text" value='<%= data.get(1) %>' name="id"  size="20"   readonly></td>
   </tr>
   <tr>
     <td width="123">Course Name &nbsp; </td></tr>
   
	<tr>    
  	<tr>
     <td width="152"> <input type="text" placeholder='<%=data.get(2) %>' name="cName" size="20"  ></td>
   </tr>
   <tr>
     <td width="123">Duration &nbsp; </td></tr>
     <tr>
     <td width="152"> <input type="text" placeholder='<%=data.get(3) %>' name="cDuration" size="20" defaultValue="ss"  ></td>
   </tr>
   <tr>
     <td width="123">Fees &nbsp; </td></tr>
     <tr>
     <td width="152"> <input type="text" placeholder='<%=data.get(4) %>' name="cFees" size="20"  ></td>
   </tr>
   		<input type="text" hidden name="update" value="course">
   <tr>
     
     <td width="152"> <button type="submit" value="Submit" size="20" align="center">Update course</button></td>
   </tr>
   </table>
  </form>
  </section>
 </body>
</html>