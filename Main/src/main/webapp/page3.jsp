
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection cn= DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&password=rootram31");     
	String nn= request.getParameter("an1");
	String amnt1= request.getParameter("ad1");
	PreparedStatement ps =cn.prepareStatement("update user_amnt set amnt=amnt+? where account=?;");
	ps.setString(1,amnt1);
	ps.setString(2,nn);
	int r=ps.executeUpdate();
	out.println("<a href=page3.html><font size='10'><center>Transaction Successful</center></font></a>");
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



