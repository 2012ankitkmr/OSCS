package oscs;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oscs.JDBCCon;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		response.setContentType("text/html");
		PrintWriter PW = response.getWriter();
		try
		{
		HttpSession session=request.getSession(false);  
		
	    String n=(String)session.getAttribute("uname"); 
	    
	    String pro_id= request.getParameter("pro_id");
	    
		JDBCCon dj= new JDBCCon();
		
		dj.delete_item(pro_id, n);
	
		PW.println("<script>alert('Item deleted from your cart!'); location.href='shoppingCart.jsp'; </script>");
	
	}
		catch( Exception NullPointerException)
		{
			 PW.println("<script> alert('User already logged out!');location.href='login.jsp'</script>");
				
		}
		}
	

}
