<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="admin-style.css">
</head>
<body >

<%
      response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      
      if(session.getAttribute("user_name")==null){
    	  response.sendRedirect("login.html");
      }

%>

<%
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "User_details";
String userId = "root";
String password = "password@123";

Class.forName("com.mysql.jdbc.Driver");

Connection con = null;
Statement st = null;
ResultSet rs = null;
%>
  <nav class="sb-topnav navbar navbar-expand">
    <button style="color:#fff;font-size:20px;" class="btn btn-link btn-sm order-1 order-lg-0" onclick="Nav()"><i class="fas fa-bars"></i></button>
      <a style="text-decoration:none;" class="nav-text" href="index.html">Covid-19 ePass</a>

      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
          <div class="input-group">
          </div>
      </form>


      <ul class="navbar-nav ml-auto ml-md-0">
          <li class="nav-item dropdown">
              <a style="color:#fff;" class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"><i class="fas fa-user fa-fw"></i></a>
              <div class="dropdown-menu dropdown-menu-right">
                  <a class="dropdown-item" href="logout"><i style="padding-right:5px;font-size:19px;" class="fas fa-sign-out-alt"></i>Logout</a>
              </div>
          </li>
      </ul>
  </nav>


  <div id="mySidenav" class="sidenav">
    <div class="sidenav-menu-heading">Core</div>
    <a  class="nav-link" href="index.html">
        <div class="sidenav-link-icon"><i style="font-size:25px;padding-right:10px;"class="fas fa-tachometer-alt"></i>
        Dashboard</div>
        </a>
    <div class="sidenav-menu-heading">content</div>
    <a class="nav-link" href="tables.html">
        <div class="sidenav-link-icon"><i style="font-size:25px;padding-right:10px;" class="fas fa-table"></i>Table</div>
    </a>
  </div>
  
  <div id="main">
  
      <table class="table table-bordered table-striped">
  <thead>
    <tr>
      <th>Name</th>
      <th>Contact</th>
      <th>Email</th>
      <th>From Address</th>
      <th>To Address</th>
      <th>Age</th>
      <th>Action</th>
    </tr>
  </thead>
	<%
	try{ 
	con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	st=con.createStatement();
	String sql ="select * from details where u_status='On request'";
	
	rs = st.executeQuery(sql);
	while(rs.next()){
	%>
  <tbody>
  <tr bgcolor="#DEB887">
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getString("num") %></td>
	<td><%=rs.getString("email") %></td>
	<td><%=rs.getString("From_Address") %></td>
	<td><%=rs.getString("To_Address") %></td>
	<td><%=rs.getString("age") %></td>
	<td><a href="test.jsp?username=<%=rs.getString("uname")%>">edit</a></td>
  </tr>     
  </tbody>
  <% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
  %>
  
  </table>
  
  </div>
  
</body>
  <script>
var i=0;
function Nav() {
  if(i==0){
    i=1;
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft="250px";

  }
else{
    i=0;
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft="0";
  }
}
</script> 
</html>





