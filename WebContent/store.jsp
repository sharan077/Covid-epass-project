<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%

String name= request.getParameter("fname");
String number=request.getParameter("num");
String birth=request.getParameter("dob");
String gendr=request.getParameter("Gender");
String Reasn=request.getParameter("reason");
String age=request.getParameter("age");
String email=request.getParameter("email");
String pname=request.getParameter("parentname");
String frmadrs=request.getParameter("From_addr");
String toadrs=request.getParameter("To_addr");
String occupation=request.getParameter("occ");
String aadhar=request.getParameter("aadhar");
String transport=request.getParameter("transport");
String traveldate=request.getParameter("travel_date");
String noofppl=request.getParameter("no_ppl");
String user=String.valueOf(session.getAttribute("user_name"));


try{
	out.println(user);
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/User_details","root","password@123");
	PreparedStatement ps=con.prepareStatement("update details set name=?,num=?,gender=?,Reason=?,age=?,email=?,Occupation=?,aadhar=?,From_Address=?,To_Address=?,Parent_name=?,Travel_date=?,Vehicle=?,DOB=?,no_ppl=? where uname=?");
	ps.setString(1,name);
	ps.setString(2,number);
	ps.setString(3,gendr);
	ps.setString(4,Reasn);
	ps.setString(5,age);
	ps.setString(6,email);
	ps.setString(7,occupation);
	ps.setString(8,aadhar);
	ps.setString(9,frmadrs);
	ps.setString(10,toadrs);
	ps.setString(11,pname);
	ps.setString(12,traveldate);
	ps.setString(13,transport);
	ps.setString(14,birth);
	ps.setString(15,noofppl);
	ps.setString(16,user);
	
	int i=ps.executeUpdate();
	
	if(i>0){
		response.sendRedirect("status.jsp");
	}

	
}catch(Exception e){
	out.println(e);
}


%>

</body>
</html>