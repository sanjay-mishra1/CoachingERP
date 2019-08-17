 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 </head>
<body>
<jsp:useBean id="e" class="dao.Dao"  scope="session"/>
<jsp:useBean id="c" class="com.app.User"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<%ArrayList<String> list=new ArrayList(); 
  String isStore=request.getParameter("login");
	if(isStore==null){
		response.sendRedirect("login.jsp");
	}else
 if(isStore.equals("yes")){
  list= e.login(c);
  if(list.get(0)==null){
	  request.setAttribute("error", list.get(1));
	%>
	<jsp:forward page="login.jsp"></jsp:forward>
	<%
  }else{System.out.println("session "+list.get(1));
  String data=list.get(1);
  session.setAttribute("USERNAME", data.substring(0,data.indexOf("=")));
	session.setAttribute("MOBILENUMBER",  data.substring(data.indexOf("=")+1));  response.sendRedirect("newCourse.jsp");}}
else if(isStore.equals("no")){
	list= e.signup(c);	
	if(list.get(0)==null){
		  request.setAttribute("error", list.get(1));
		%>
		<jsp:forward page="signup.jsp"></jsp:forward>
		<%
	  }else{System.out.println("session "+list.get(1));
	  		String data=list.get(1);
	  		session.setAttribute("USERNAME", data.substring(0,data.indexOf("=")));
	  		session.setAttribute("MOBILENUMBER",  data.substring(data.indexOf("=")+1));
		  response.sendRedirect("newCourse.jsp");
	  
	  }
	}else response.sendRedirect("login.jsp");
%>
 
 
 
</body>
</html>