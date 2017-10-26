

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.JDBCCon;

/**
 * Servlet implementation class loginServ
 */
@WebServlet("/loginServ")
public class loginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
        

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uname = request.getParameter("uname");
		String pass = request.getParameter("password");
		JDBCCon db = new JDBCCon();
		int val = db.Authorize(uname, pass);
		
		System.out.println(uname+"   "+pass);
	
		if(val>=1)
		{
			String name = db.getName(uname); 
			HttpSession session = request.getSession(true);
			session.setAttribute("name", name);
		response.sendRedirect("index.jsp");
		}
		else
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("errormsg", "Invalid Username and Password!!!");
			response.sendRedirect("login.jsp");
		}
	}


}
