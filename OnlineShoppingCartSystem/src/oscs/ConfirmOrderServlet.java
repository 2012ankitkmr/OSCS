package oscs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ConfirmOrderServlet
 */
@WebServlet("/ConfirmOrderServlet")
public class ConfirmOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession session=request.getSession(false); 
		try{
			String uname= (String)session.getAttribute("uname");
			JDBCCon dj= new JDBCCon();
			dj.delete_ItemFromCart(uname);
			PrintWriter PW = response.getWriter();
			PW.println("<script>alert('Your Order is Ready. Proceed to select payment methods.'); location.href='payment.jsp';</script>");

		}
		catch(Exception e)
		{
			System.out.println("Exception occur");
		}

	}

}
