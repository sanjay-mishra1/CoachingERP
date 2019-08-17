<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup</title>
<title>New Course</title>
<link href="style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400" rel="stylesheet"> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<body>
<% String error=(String)request.getAttribute("error"); %>
<jsp:include page="nav.jsp"></jsp:include>
 <section class="sectiondemo" >
 
 <header align="center"><h3>New User</h3></header>
	<form action="userProcess.jsp" align="center"   method="post">
 
  
   <table border="0" cellpadding="2" cellspacing="4">
    
   <tr>
     <td width="123">Name &nbsp; </td></tr><tr>
     <td width="152"> <input type="text" name="name" size="20" required ></td>
   </tr>
   <tr>
     <td width="123">Gender </td></tr><tr>
     <td width="152"><select name="gender"><option name="gender" value="male" required>Male<option name="gender" value="female">Female</select></td>
   </tr>
   
   <tr>
     <td width="123">Mobile number  </td></tr><tr>
     <td width="152"><input type="text" name="mobilenumber"  pattern="[0-9]{10}" size="20" required> </td>
   </tr>
    
   <tr>
     <td width="123">City </td></tr><tr>
     <td width="152"><input type="text" name="city" size="20" required></td>
   </tr>
   
   <tr>
     <td width="123">Password </td></tr><tr>
     <td width="152"><input type="password" name="password" id="password" size="20"   onKeypress="return mainPass(event)"  required></td>
   </tr>
   <tr>
     <td width="123">Confirm Password </td></tr><tr>
     <td width="152"><input type="text"  size="20" id="confirm_password"  onKeypress="return confPass(event)" required></td>
   </tr>
   
    
   <tr >
     <td width="123">&nbsp;</td></tr><tr>
     <td width="152">
 <button type="submit" id="submit" value="Submit" disabled>Signup</button></td>
   </tr>
      <tr >
      <input type="text" value="no" name="login" hidden>
      </tr>
      
        <tr>
      
    </tr>
      
      </table>
      <a href="login.jsp" style="padding-bottom:10px;margin-left:40px;">Already have account? Login</a>
      <%if(error!=null){ %>
      <div class="error">
      
      <h4>Error:<%=error %></h4></div>
      <%} %>
      </form>
  </section>
<script>
		
	function check_pass(pass,conf_pass)
	{
		if(pass==conf_pass)
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
	function mainPass(e){
		var pass;
		var conf_pass=document.getElementById("password").value;
		
		if(window.event){
			pass=e.keyCode;
			
		}else if(e.which){
			
			pass=e.which;
			
		}
		if(pass==8){
			conf_pass=document.getElementById("password").value;
			conf_pass=conf_pass.substring(0,conf_pass.length-1);

		}else
		conf_pass=conf_pass+String.fromCharCode(pass);
		check_pass(conf_pass,document.getElementById("confirm_password").value)
 	}
	function confPass(e){
		var pass;
		var conf_pass=document.getElementById("confirm_password").value;
		
		if(window.event){
			pass=e.keyCode;
 			
		}else if(e.which){
			pass=e.which;
 	

		}

		if(pass==8){
			conf_pass=document.getElementById("password").value;
			conf_pass=conf_pass.substring(0,conf_pass.length-1);

		}else
		
		conf_pass=conf_pass+String.fromCharCode(pass);
		check_pass(conf_pass,document.getElementById("password").value)
 	}

</script>
</body>
</html>