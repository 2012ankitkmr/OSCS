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
 * Servlet implementation class LogOutServlet
 */
@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		
		String n =(String)session.getAttribute("uname");
		
		session.invalidate();
		
		pw.println("<html><head><title></title><SCRIPT type='text/javascript'> window.history.forward();  function noBack() { window.history.forward(); }</SCRIPT><script> alert('User "+n+" is logged Out'); window.location.replace('login.jsp'); </script></head><body  onload='noBack();' onpageshow='if (event.persisted) noBack();' onunload=''></body></html>");
		
	
	}

}
