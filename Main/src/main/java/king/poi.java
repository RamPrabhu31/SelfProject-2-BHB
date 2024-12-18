package king;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class poi
 */
@WebServlet("/poi")
public class poi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name= request.getParameter("name");
		String pass=request.getParameter("pass");
		
		System.out.println(name);
		
		try {
			Connection con=null;
			PreparedStatement ps=null;
			

			
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("dsfsdfsfsd");

			String path="jdbc:mysql://localhost:3306/log?user=root&password=rootram31";
			
			con=DriverManager.getConnection(path);
			
			String data="insert into info values(?,?)";
			
			ps=con.prepareStatement(data);
			ps.setString(1,name);
			
			ps.setString(2, pass);
			
			ps.executeUpdate();
			System.out.println("Done");
			
			
		}
		catch(ClassNotFoundException e) {
			
			System.out.println("not able to connect 1");
			e.getStackTrace();
			
		}
		catch(SQLException p) {
			System.out.println("not able to connect 2");
			p.getStackTrace();
		}
	

	}

}
