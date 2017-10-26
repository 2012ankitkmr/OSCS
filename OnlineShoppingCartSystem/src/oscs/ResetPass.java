package oscs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ResetPass
 */
@WebServlet("/ResetPass")
public class ResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session=request.getSession(false); 
		String pass= request.getParameter("npass");
		JDBCCon dj = new JDBCCon();

		dj.UpdatePassword((String)session.getAttribute("uname"),pass);
session.invalidate();

PrintWriter pw =response.getWriter();

pw.print("<script> alert('Your Password has been Changed. Login with New Password.'); location.href='login.jsp';</script>");

	
		
		
	}


}
