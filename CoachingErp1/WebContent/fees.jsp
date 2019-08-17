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
<%@include file="checkUser.jsp" %>

<jsp:include page="nav.jsp"></jsp:include>

<section class="sectiondemo" >
 <header align="center"><h3>Deposit Fees</h3></header>
      <%String id=request.getParameter("sid"); %>
 <%if(id!=null){ %>
   <form action="process.jsp" align="center"  method="post">
   <table border="0" cellpadding="2" cellspacing="4">
   
    
   
  
   <jsp:useBean id="e" class="dao.Dao"  scope="session"/>
   <%String data[]=e.loadFees(id); %>
   <tr>
     <td width="123">Enter SID &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="sid" value=<%=data[0] %> size="20"   readonly placeholder=<%=data[0] %>></td>
   </tr>
   <tr>
     <td width="123">Name </td></tr><tr>
     <td width="152"><input type="text" name="store" size="20" value="fees"  readonly placeholder=<%=data[1] %>></td>
   </tr>
   
   <tr>
     <td width="123">Course</td></tr><tr>
     <td width="152"><input type="text" name="cid" size="20" value=<%=data[2] %>  readonly placeholder=<%=data[2] %>></td>
   </tr>
    
   <tr>
     <td width="123">Total Fees </td></tr><tr>
     <td width="152"><input type="text"  size="20"   readonly placeholder=<%=data[3] %>></td>
   </tr>
   
   <tr>
     <td width="123">Deposited </td></tr><tr>
     <td width="152"><input type="text"  size="20"   readonly placeholder= <%=data[4] %>> </td>
   </tr>
   <tr>
     <td width="123">Remaining </td></tr><tr>
     <td width="152"><input type="text"  size="20"   readonly placeholder=<%=data[5] %>></td>
   </tr>
   <tr>
     <td width="123">Enter amount to deposit </td></tr><tr>
     <td width="152"><input type="text" name="deposit" size="20" required></td>
   </tr>
   <tr>
     <td width="123">Date </td></tr><tr>
     <td width="152"><input type="text" name="date"  size="20" required></td>
   </tr>
   <tr>
     <td width="123">Receipt No </td></tr><tr>
     <td width="152"><input type="text" name="receiptno"  size="20"  ></td>
   </tr>
  
   <tr >
     <td width="123">&nbsp;</td></tr><tr>
     <td width="152">
 <button type="submit" value="Submit" >Submit</button></td>
   </tr>
      
   </table>
  </form> 
    <%}else{ %>
    <form action="fees.jsp" align="center"  method="post">
 	<%String message=request.getParameter("message"); 
  	if(message!=null){
  	%>
  	 	 <h4 class="error" id="error" <%if(!message.contains("Error")) { %> style="color:blue"<%} %>><i class="fas fa-times" id="icon"></i><%=message %> </h4>
  	
  	<% }%>
    
    <tr>
     <td width="123">Enter Student ID &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="sid" size="20" required></td>
   </tr>
  
   <tr >
     <td width="123">&nbsp;</td></tr><tr>
     <td width="152">
 <button type="submit" value="Submit" >Submit</button></td>
   </tr>
      
      </table>
  </form>
   <%} %>
  </section>
</body>
</html>