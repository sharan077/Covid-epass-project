package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.logindao;


@WebServlet("/Login")
public class Login extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	String usname=request.getParameter("username");
	String pwd=request.getParameter("passwd");
	
	logindao dao=new logindao();
	
	if(dao.check(usname,pwd)) {
		
		HttpSession session=request.getSession();
		session.setAttribute("user_name",usname);
		if(usname.equals("admin")) {
			response.sendRedirect("Admin-dashboard/admin-table.jsp");
		}else {
		response.sendRedirect("Form.jsp");
		}
		
	}else {
		
		response.sendRedirect("signin.html");
		
	}
	
	
	
	
	}

	

}
