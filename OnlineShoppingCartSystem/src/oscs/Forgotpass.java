package oscs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Forgotpass
 */
@WebServlet("/Forgotpass")
public class Forgotpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String uname = request.getParameter("uname");
		Long mobile_no = Long.parseLong(request.getParameter("mobileno"));

		
		JDBCCon dj = new JDBCCon();
		int psd = dj.forgetPass(uname,mobile_no);
		if(psd==0)
		{
			
		}
		else
		{

			HttpSession session=request.getSession();  
			session.setAttribute("uname",uname);
			response.sendRedirect("ResetPass.html");
		}
		
		
	}


}
