package com.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Registerdb")
public class Registerdb extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid=request.getParameter("userid");
		String paswd=request.getParameter("pass1");
		
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/User_details","root","password@123");
		PreparedStatement st=con.prepareStatement("insert into details(uname,password) values(?,?)");
		
		st.setString(1,userid);
		st.setString(2,paswd);
		
		int i=st.executeUpdate();
		if(i>0) {
			response.sendRedirect("Form.jsp");
		}else {
			response.sendRedirect("signup.html");
		}
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
