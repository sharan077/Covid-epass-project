package com.login.dao;

import java.sql.*;


public class logindao {
	
	public boolean check(String user_nam,String passwd) {
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/User_details","root","password@123");
		PreparedStatement st=con.prepareStatement("select * from details where uname=? and password=?");
		st.setString(1,user_nam);
		st.setString(2,passwd);		
		ResultSet rs=st.executeQuery();
		
		if(rs.next()) {
			return true;
		}
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return false;
	}

}
