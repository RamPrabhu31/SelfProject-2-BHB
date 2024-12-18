<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection cn= DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&password=rootram31");     
	String name= request.getParameter("ann");
	String password= request.getParameter("pass1");
	PreparedStatement ps =cn.prepareStatement("select * from user_info where accountno = ? and password = ?");
	ps.setString(1,name);
	ps.setString(2,password); 
	ResultSet rs= ps.executeQuery();
	if(rs.next())
	{
		RequestDispatcher rd=request.getRequestDispatcher("page3.html");
		rd.forward(request,response);
	}
	else
	{
		out.println("<a href=page2a.html><font size='10'><center>Login Failed</center></size></a>");
	}
	ps.close();
	cn.close();
}

catch (ClassNotFoundException e){
	e.printStackTrace();
}
catch (SQLException e){
	e.printStackTrace();
}
%>    
