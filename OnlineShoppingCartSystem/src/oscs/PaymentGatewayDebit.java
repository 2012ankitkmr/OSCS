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
 * Servlet implementation class PaymentGatewayCredit
 */
@WebServlet("/PaymentGatewayDebit")
public class PaymentGatewayDebit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		PrintWriter pw = response.getWriter();
	String name_on_card = request.getParameter("name_on_card");
	String card_number = request.getParameter("card_number");
	String month_exp = request.getParameter("month_exp");
	String year_exp = request.getParameter("year_exp");
	String cvv = request.getParameter("cvv");
	HttpSession session = request.getSession();


	if(card_number.length()!=16)
	{
		pw.println("<script> alert('Master card length should be 16 digit only');location.href='payment.jsp';</script>");
	}
	else if(!card_number.substring(0,2).equals("51") && !card_number.substring(0,2).equals("55"))
	{
		pw.println("<script> alert('Enter a valid mastercard Number');location.href='payment.jsp';</script>");
			
	}
	else
	{
pw.println("<script>alert('Your Order has been placed!');location.href='Receipt.jsp?userid="+session.getAttribute("uname")+"@status=1'</script>");
	
	}

	
	//response.sendRedirect("URL of Payment Gateway!");
	}

}
