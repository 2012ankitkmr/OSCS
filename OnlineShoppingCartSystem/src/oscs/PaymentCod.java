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
 * Servlet implementation class PaymentCod
 */
@WebServlet("/PaymentCod")
public class PaymentCod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("asdfds");
		PrintWriter PW = response.getWriter();
		HttpSession session=request.getSession();
		response.sendRedirect("Receipt.jsp?userid="+session.getAttribute("uname")+"@status=1");
		
		
		
	}

	

}
