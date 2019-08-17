 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 </head>
<body>
<jsp:useBean id="e" class="dao.Dao"  scope="session"/>
<%
  String isStore=request.getParameter("store");

if(isStore.equals("cStore")){%>
<jsp:useBean id="c" class="com.app.Course"></jsp:useBean>

<jsp:setProperty property="*" name="c"/>

<%  e.saveToDatabase(c); response.sendRedirect("newCourseWithList.jsp");}else%>
 <% 
 
 if(isStore.equals("stStore")){%>
	 <jsp:useBean id="st" class="com.app.Student"></jsp:useBean>
	 <jsp:setProperty property="*" name="st"/>
	<% e.saveToDatabase(st); response.sendRedirect("studentRegistration.jsp");}else%>
 
 <% 
 
 if(isStore.equals("fees")){%>
	 <jsp:useBean id="f" class="com.app.Fees"></jsp:useBean>
	 <jsp:setProperty property="*" name="f"/>
	<%  response.sendRedirect("fees.jsp?message="+e.saveToDatabase(f));}%>
 
</body>
</html>