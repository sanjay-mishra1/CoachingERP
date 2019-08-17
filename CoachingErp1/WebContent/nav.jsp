 
<div class="page-wrapper">
   <div class="grad-bar"></div>
    <% String isUser=(String)session.getAttribute("USERNAME"); %>
    
  <nav class="navbar">

    <img src="https://upload.wikimedia.org/wikipedia/en/thumb/c/c8/Bluestar_%28bus_company%29_logo.svg/1280px-Bluestar_%28bus_company%29_logo.svg.png" alt="Company Logo">
    <div class="menu-toggle" id="mobile-menu">
      <span class="bar"></span>
      <span class="bar"></span>
      <span class="bar"></span>
    </div>
   <%if(isUser!=null){ %> 
    <ul class="user-name">
    <li >

<div  class="card-profile" id="card-profile-id" src="https://images.unsplash.com/photo-1514846226882-28b324ef7f28?ixlib=rb-0.3.5&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE0NTg5fQ&s=427df64ea1bbb4c45008bd6ffe11812a"  class="hidden"> 
        </div>
        </li  >    
      <li  class="nav-item" style="margin-top: 11px;"><a href="#"><%=session.getAttribute("USERNAME") %></a></li>

       <li class="Logout" >
    <a href="logout.jsp"><i class="fas fa-power-off"></i> Logout</a></li>
  

 </ul>
 <%} %>
  </nav>
  
  </div>
   
 
<%if(isUser!=null){ %>
<div class="container-view">
  <div class="navside">
    <a href="newCourse.jsp"><i class="fas fa-book"></i><br>Course</a>
    <a href="studentRegistration.jsp"><i class="fas fa-user"></i><br>Student </a>
    <a href="search.jsp"><i class="fas fa-search"></i><br>Search</a>
    <a href="fees.jsp"><i class="fas fa-rupees"></i><br>Fees</a>
    <%String mob=(String)session.getAttribute("MOBILENUMBER"); System.out.println("nav mob"+mob);%>
    <a href="myAccount.jsp?id=<%=mob %>"><i class="fas fa-cog"></i><br>Account</a>
    

  </div></div>
<%} %>
