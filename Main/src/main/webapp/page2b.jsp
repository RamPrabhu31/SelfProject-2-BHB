<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>



<%
String name= request.getParameter("nam");
String password= request.getParameter("pass");
String accountno = request.getParameter("anc");
String nation= request.getParameter("nn");
String state= request.getParameter("ss");
String email= request.getParameter("ee1");
String nearby = request.getParameter("nbb");


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root&password=rootram31");
	PreparedStatement ps= conn.prepareStatement("insert into user_info(name,password,accountno,nation,state,email,nearby)values(?,?,?,?,?,?,?);");
	PreparedStatement ps1=conn.prepareStatement("insert into user_amnt(account,amnt)values(?,1000);");
	ps.setString(1,name);
	ps.setString(2,password);
	ps.setString(3,accountno);
	ps.setString(4,nation);
	ps.setString(5,state);
	ps.setString(6,email);
	ps.setString(7,nearby);
	ps1.setString(1,accountno);
	
	int x =ps.executeUpdate();
	int y=ps1.executeUpdate();
	if(x>0){
		RequestDispatcher rd=request.getRequestDispatcher("page3.html");
		rd.forward(request,response);
	}
	else{
		out.println("failed");
	}
	ps.close();
	ps1.close();
	conn.close();
}

catch (Exception e){
	out.println(e);
}
%>


