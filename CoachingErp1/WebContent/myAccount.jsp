<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Account</title>
 <link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<jsp:useBean id="e" class="dao.Dao"  scope="session"/>
<%  HashMap<Object,Object> data=e.getDetail(request.getParameter("id"), " users where mobilenumber=?"); %>
<% String error=(String)request.getAttribute("error"); %>
<jsp:include page="nav.jsp"></jsp:include>
 <section class="sectiondemo" >
 <%String id=request.getParameter("id"); %>
 <header align="center"><h3>My Account</h3></header>
	<form action="updateProcess.jsp" align="center"  method="post">
 
  
   <table border="0" cellpadding="2" cellspacing="4">
    
   <tr>
     <td width="123">Name &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="name" size="20"   placeholder='<%=data.get(2) %>'></td>
   </tr>
   <tr>
     <td width="123">Gender </td></tr><tr>
     <td width="152"><select name="gender">
     
     <%if(data.get(4).equals(("male"))){
    	 System.out.println("myaccount gender male=>"+data.get(4));
    	 %>
     <% %>
     <option name="gender" value="male"  selected>Male
     <option name="gender" value="female">Female</select></td>
     <%}else{ System.out.println("myaccount gender female=>"+data.get(4));%>
     <option name="gender" value="male"  >Male
     <option name="gender" value="female" selected>Female</select></td>
    <%} %>
     
   </tr>
   
   <tr>
     <td width="123">Mobile number  </td></tr><tr>
     <td width="152"><input type="text" name="mobilenumber"  pattern="[0-9]{10}" size="20"  placeholder='<%=data.get(1) %>'> </td>
   </tr>
    
   <tr>
     <td width="123">City </td></tr><tr>
     <td width="152"><input type="text" name="city" size="20"  placeholder='<%=data.get(5) %>'></td>
   </tr>
   
   <tr>
     <td width="123">Old Password </td></tr><tr>
     <td width="152"><input type="password" name="confirm_password" id="password" size="20"   ></td>
   </tr>
   <tr>
     <td width="123">New Password </td></tr><tr>
     <td width="152"><input type="text"  size="20" id="password"   ></td>
   </tr>
   
    
   <tr >
     <td width="123">&nbsp;</td></tr><tr>
     <td width="152">
 <button type="submit" id="submit" value="Submit"  >Update</button></td>
   </tr>
      <tr >
      <input type="text" value="account" name="update" hidden>
      </tr>
      
        <tr >
      <input type="text" value=<%=id %> name="id" readonly hidden>
      </tr>
      
      </table>
       <%if(error!=null){ %>
      <div class="error">
      
      <h4>Error:<%=error %></h4></div>
      <%} %>
      </form>
  </section>
<script>
	
	function check_pass(){
		var password=document.getElementById("password");
		var pass_conf=document.getElementById("confirm_password");
		password.addEventListener('keypress',function(e){
			console.log("conf Event"+e.keyCode);
			pass();
		});
		pass_conf.addEventListener('keypress',function(e){
			console.log("conf Event"+e.keyCode);
			pass();
		});
					
	}
	function pass()
	{
		if(document.getElementById("password").value==document.getElementById("confirm_password").value)
		{
		document.getElementById("submit").disabled=false;
		document.getElementById("submit").style="background-color:turquoise";
		console.log("same pass=>"+document.getElementById("password").value
		+"conf=>"+document.getElementById("confirm_password").value		
		);
	}else
	{	
		document.getElementById("submit").disabled=true;
		document.getElementById("submit").style="background-color:white";
		console.log("not same pass=>"+document.getElementById("password").value
				+"conf=>"+document.getElementById("confirm_password").value	);
	}

	}

</script>
</body>
</html>