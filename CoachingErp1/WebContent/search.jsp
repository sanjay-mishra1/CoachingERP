<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<%@include file="checkUser.jsp" %>
<%String search=(String)request.getParameter("search"); %>
<jsp:include page="nav.jsp"></jsp:include>
<section class="sectiondemo" >
 <header align="center"><h3>Search</h3></header>

	<form action="search.jsp" align="center" onsubmit="return checkForm(this)" method="post">
 
  
   <table border="0" cellpadding="2" cellspacing="4">
   <tr>
     <td width="123" id="course">Course &nbsp; </td></tr><tr>
     <td width="152"> 
<select name="sCourse" width="20"  >
<option value="" select>-empty-
 <jsp:useBean id="e" class="dao.Dao" scope="session"/>
 <jsp:useBean id="st" class="com.app.Student" />
<jsp:setProperty property="*" name="st"/>
 
 <% 
ArrayList<String> list= e.courseList();
System.out.println(list);
for(String d:list){
	
%>
<option value=<%=d.substring(0,d.indexOf("+"))  %>>
<%=d.substring(d.indexOf("+")+1) %><%} %>
</option>

 </select>     
     
     
     </td>
   </tr>
   
    
   <tr>
     <td width="123" >First Name &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" id="fname" name="sFName" size="20"   ></td>
   </tr>
   <tr>
     <td width="123">Last Name </td></tr><tr>
     <td width="152"><input type="text" id="lname" name="sLName" size="20"  ></td>
   </tr>
   
    
   <tr>
     <td width="152">
 <button type="submit" value="Submit" >Search</button></td>
   </tr>
      <tr >
      <input type="text" value="search" name="search" hidden>
      </tr>

	

 </table>
 <table border="1" cellpadding="2"   align="center" float="center">
 <%ArrayList<String> searchList=new ArrayList<>();
	if(search!=null){
	searchList=e.search(st);
	if(searchList.get(0)==null){
	%>	<h4 class="error" id="error1" ><i class="fas fa-times" ></i> No record found</h4>
	<h4 class="error" id="error" hidden><i class="fas fa-times" id="icon"></i> </h4>
	<% 
	}else{%>
		<h4 class="error" id="error" hidden><i class="fas times" id="icon"></i></h4>
	<% System.out.println(searchList);
	String[] head=searchList.get(searchList.size()-1).split("-");
	searchList.remove(searchList.size()-1);
	%>
	<tr class="smallbutton">
	<%for(String s:head){	%>
	<th><%=s %></th><%} %></tr>
  	<% for(String data:searchList) {String dataArray[]=data.split("="); %>
  	<tr>
  		<% for(int i=1;i<dataArray.length;i++) { %>
  	     <td width="77"><%=dataArray[i] %> &nbsp; </td>
  				
  <%}%><td width="77" style="height:74px"> <a  class="smallbutton"  href='editStudent.jsp?id=<%=dataArray[0] %>'>Edit</a> &nbsp; </td></tr><% }%>
  <%}}else{ 
	%>  
 	 <h4 class="error" id="error" hidden><i class="fas fa-times" id="icon"></i> </h4>
 	 <h4 class="error" id="error1" hidden><i class="fas fa-times" ></i> </h4>
 	 
 	    <%} %>
       
 </table>
 </form>
 
</section>
<script >
	function checkForm(form){
	var course=form.sCourse.value;
	var fname=form.sFName.value;
	var lname=form.sLName.value;
	if(fname=="" && lname=="" && course==""){
		console.log("Please input atleast one field");
		document.getElementById("error").hidden=false;
	var r=	document.getElementById("error1");
	if(r!=null){
		r.hidden=true;
	}
		document.getElementById("icon").textContent=' Please input atleast one value';
		return false;
	}
	return true;
	}
</script>
</body>
</html>