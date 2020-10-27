<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://image.flaticon.com/icons/svg/2790/2790616.svg?v=1.1.1" rel="icon">
<title>covid-ePass</title>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="form-style.css">
<style>
input.invalid {
  border-color: #ff4c4c;
}

.tab {
  display: none;
}

.topbar-divider {
  width: 0;
  border-right: 1px solid #e3e6f0;
  height: calc(4.375rem - 2rem);
  margin: auto 1rem;
}

textarea{
  margin-bottom: 15px;
  border-radius: 2rem;
  margin-top: 10px;
  margin-left: 4px;
}


button {
  background-color:#007bff ;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #007bff;
}

{
  border-radius: 2rem;
}

.custom-select{
  border-radius: 5rem;
  margin-bottom: 22px;
  height: 45px;
}

.custom-file{
  margin-top: 10px;
  margin-bottom: 25px;
  margin-left: 4px;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #007bff;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #3c94d0;
}

.status{
  margin-top:300px;
  padding:30px;
}
.status h1{
  color:orange;
  text-transform:uppercase;
}

</style>
</head>
<body>

<%
      response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      
      if(session.getAttribute("user_name")==null){
    	  response.sendRedirect("signin.html");
      }

%>



  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="fa fa-envelope" style="color:black;"></i> <a href="tnega@tn.gov.in">tnega@tn.gov.in</a>
        <i class="fa fa-phone" style="color:black;"></i> +91-44-40164907
      </div>
      </div>
    </div>


    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">

        <h1 class="logo mr-auto"><a href="index.html">Covid-<span>e</span>Pass</a></h1>
        <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="index.html#about">About</a></li>
          <li><a href="epass.html">E-pass</a></li>
          <li><a href="index.html#contact">Contact</a></li>
          
          <div class="topbar-divider d-none d-sm-block"></div>

          <a style="padding-top: 10px;"class="nav-link dropdown-toggle" href="#" id="userDropdown"  data-toggle="dropdown" >
          <span class="mr-2 d-none d-lg-inline  small">User profile</span>
          <i class="fa fa-user-circle-o" style="font-size:20px; color:#007bff;"></i>
          </a>

          <div class="dropdown-menu dropdown-menu-right">

            <a class="dropdown-item" href="status.jsp">
                  <i class="fa fa-table"></i>
                  Track-status
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout" >
                  <i class="fa fa-sign-out"></i>
                  Logout
                </a>
          </div>
        </ul>
      </nav>
    </div>
  </header>


  <section>
    
    <%
    String usr=String.valueOf(session.getAttribute("user_name"));
    Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/User_details","root","password@123");
	try{
    Statement st=con.createStatement();
    String query="select u_status from details where uname='"+usr+"'";
    ResultSet rs = st.executeQuery(query);
    while(rs.next()){
      
    %>
    <div class="card status">
    <marquee>Your status is : <h1><%=rs.getString(1) %>!</h1></marquee>
    </div>
    <% 
    }
	}
	catch(Exception e){
		out.print(e);
	}
    
    %>
    

  </section>

    