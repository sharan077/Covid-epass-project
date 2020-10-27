<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="admin-style.css">
</head>
<body>


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
                  <a class="dropdown-item" href="login.html"><i style="padding-right:5px;font-size:19px;" class="fas fa-sign-out-alt"></i>Logout</a>
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


<%
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "User_details";
String userId = "root";
String password = "password@123";

Connection con = null;
Statement st = null;
PreparedStatement ps=null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
%>

<form id="main"  method="post">
    <%
    st=con.createStatement();
    String usrname=request.getParameter("username");
    String sql="select * from details where uname='"+usrname+"'";
    rs=st.executeQuery(sql);
    while(rs.next()){
    %>
    <input type="hidden" name="usname" value="<%=rs.getString("uname") %>">
    
    <div class="form-group">
    <label>Name : </label>
    <input type="text" name="name" value="<%=rs.getString("name") %>" disabled>
    </div>
     <div class="row">
    <div class="form-group col-md-6">
    <label>Email : </label>
    <input type="email" name="uemail" value="<%=rs.getString("email") %>" disabled>
    </div>
    <div class="form-group col-md-6">
    <label>Phone number : </label>
     <input type="number" name="contact" value="<%=rs.getString("num") %>" disabled>
    </div></div>
    <div class="form-group">
    <label>Age : </label>
     <input type="number" name="uage" value="<%=rs.getString("age") %>" disabled>
    </div>
    <div class="row">
    <div class="form-group col-md-6">
    <label>From Address : </label>
    <input type="text" name="frm_ad" value="<%=rs.getString("From_Address") %>" disabled>
    </div>
    <div class="form-group col-md-6">
    <label>To Address :</label>
     <input type="text" name="to_ad" value="<%=rs.getString("To_Address") %>" disabled>
    </div>
    </div>
    <div class="row">
    <div class="form-group col-md-6">
    <label>Parent Name :</label>
     <input type="text" name=""  value="<%=rs.getString("Parent_name") %>" disabled>
    </div>
    <div class="form-group col-md-6">
    <label>Aadhar No : </label>
    <input type="number" name="adhaaar"  value="<%=rs.getString("aadhar") %>" disabled>
    </div>
    </div>
    <div class="form-group">
    <label>Reason : </label>
    <input type="text" name=""  value="<%=rs.getString("Reason") %>" disabled>
    </div>
    <div class="row">
    <div class="form-group col-md-6">
    <label>Travel Date : </label>
    <input type="text" name=""  value="<%=rs.getString("Travel_date") %>" disabled>
    </div>
    <div class="form-group col-md-6">
    <label>No of people :</label>
    <input type="number" name=""  value="<%=rs.getString("no_ppl") %>" disabled>
    </div>
    </div>
    <div class="row">
    <div class="form-group col-md-6">
    <label>Tranport : </label>
    <input type="text" name=""  value="<%=rs.getString("Vehicle") %>" disabled>
    </div>
    <div class="form-group col-md-6">
    <label>User status :</label>
    <input type="text"   name="status" value="<%=rs.getString("u_status") %>" >
    </div>
    </div>
    <%
    }
    %>
    <button style="margin-left:35rem;margin-top:2rem;" class="btn btn-primary" type="submit">Update</button>


</form>
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

<%

	 String user=request.getParameter("usname");
	 String ustatus=request.getParameter("status");
	 if(ustatus!=null){
		 String query="update details set u_status=? where uname=?";
		 ps=con.prepareStatement(query);
		 ps.setString(1,ustatus);
		 ps.setString(2,user);
		 ps.executeUpdate();
		 response.sendRedirect("admin-table.jsp");
	 }

%>
