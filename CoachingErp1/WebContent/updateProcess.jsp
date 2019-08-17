<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 </head>
<body>
 <jsp:useBean id="e" class="dao.Dao" scope="session"/>
 <%String id=request.getParameter("id"); %>
<%String from=request.getParameter("update");  %>
<%if(from.equals("course")){
	System.out.println("update "+from+" inside course");
	%>
	<jsp:useBean id="c" class="com.app.Course" />
	<jsp:setProperty property="*" name="c"/>
	<% 
	String message=e.update(c, id);
	response.sendRedirect("editCourse.jsp?id="+id+"&message="+message);
}else if(from.equals("student")){System.out.println("update "+from+" inside st");
	%>
	<jsp:useBean id="s" class="com.app.Student" />
	<jsp:setProperty property="*" name="s"/>	
	<%
	String message=e.update(s, id);
	response.sendRedirect("editStudent.jsp?id="+id+"&message="+message);

}else if(from.equals("account")){System.out.println("update "+from+" inside ac");
	%>
	<jsp:useBean id="a" class="com.app.User" />
	<jsp:setProperty property="*" name="a"/>
	
	<%
	String message=e.update(a, id,session);
	if(message.contains("="))
		{id=message.substring(message.indexOf("=")+1);
		message=message.substring(0,message.indexOf("=")+1);	
		
		}
	response.sendRedirect("myAccount.jsp?id="+id+"&message="+message);
}else{
	response.sendRedirect("newCourse.jsp");
}
	%>

</body>
</html>