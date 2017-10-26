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

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateCartDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter PW = response.getWriter();
		try{
		HttpSession session=request.getSession(false);  
		
	    String n=(String)session.getAttribute("uname"); 
	    
	    String pro_name= request.getParameter("pro_id");
	    
	    int qt= Integer.parseInt((String)request.getParameter("qty"));
	    
	    
	    if( qt<=0)
	    {
	    	PW.println("<script>alert('Enter a valid quantity!'); location.href='shoppingCart.jsp'; </script>");
	    	
	    }
	    else{
	    	JDBCCon dj= new JDBCCon();
		
		int t=dj.update_item(pro_name, n,qt );
		

	if(t<0)
	{
		PW.println("<script>alert('Enter a lesser quantity!'); location.href='shoppingCart.jsp'; </script>");
	}
	else
	{
		PW.println("<script>alert('Product details updated!'); location.href='shoppingCart.jsp'; </script>");

	}	}
	    
	    
		}
		catch( Exception NullPointerException)
		{
			 PW.println("<script> alert('User already logged out!');location.href='login.jsp'</script>");
				
		}
	}

}
