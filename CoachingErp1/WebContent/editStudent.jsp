 <%@page import="java.util.*" %>
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>
<link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<jsp:useBean id="e" class="dao.Dao"  scope="session"/>
<%  HashMap<Object,Object> data=e.getDetail(request.getParameter("id"), " student where sid=?"); 
String message=request.getParameter("message");
String id=request.getParameter("id");
%>

<%@include file="checkUser.jsp" %>

<jsp:include page="nav.jsp"></jsp:include>

 

<section class="sectiondemo" >
 <header align="center"><h3>Update Student</h3></header>

<form action="updateProcess.jsp" align="center"  method="post">
 
  
   <table border="0" cellpadding="2" cellspacing="4">
   
   <tr>
     <td width="123">Course &nbsp; </td></tr><tr>
     <td width="152"> 
<select name="sCourse" width="20"  >
  
 <% 
ArrayList<String> list= e.courseList();
System.out.println(list);
for(String d:list){
	System.out.println("data "+data.get(4)+" d ");
	if(d.contains((String)data.get(4))){
%>
<option value=<%=d.substring(0,d.indexOf("+"))   %> selected>
<%=d.substring(d.indexOf("+")+1) %><%}else{ %>

<option value=<%=d.substring(0,d.indexOf("+"))   %>>
<%=d.substring(d.indexOf("+")+1) %><%} %>
<%} %>
</option>

 </select>     
     
     
     </td>
   </tr>
   
    
   <tr>
     <td width="123">First Name &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="sFName" size="20"  placeholder='<%=data.get(2) %>' ></td>
   </tr>
   <tr>
     <td width="123">Last Name </td></tr><tr>
     <td width="152"><input type="text" name="sLName" size="20" placeholder='<%=data.get(3) %>'></td>
   </tr>
   
   <tr>
     <td width="123">Registration Date  </td></tr><tr>
     <td width="152"><input type="text" name="sRegDate" size="20" placeholder='<%=data.get(5) %>' readonly > </td>
   </tr>
    
   <tr>
     <td width="123">City </td></tr><tr>
     <td width="152"><input type="text" name="sCity" size="20" placeholder='<%=data.get(7) %>'></td>
   </tr>
   
   <tr>
     <td width="123">Fees </td></tr><tr>
     <td width="152"><input type="text" name="sFees" size="20" placeholder='<%=data.get(6) %>'></td>
   </tr>
   
    
   <tr >
     <td width="123">&nbsp;</td></tr><tr>
     <td width="152">
 <button type="submit" value="Submit" >Update student</button></td>
   </tr>
   <tr >
      <input type="text" value=<%=id %> name="id" readonly hidden>
      </tr>
      <tr >
      <input type="text" value="student" name="update" hidden>
      </tr>
           </table>
            <% if(message!=null){%>
      
       	 <h4 class="error" id="error"  ><i class="fas fa-times" id="icon"></i><%=message %></h4>
      
      
      <%} %>
           
  </form>
  </section>
</body>
</html>