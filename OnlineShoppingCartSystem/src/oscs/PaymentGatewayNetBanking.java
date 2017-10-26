package oscs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/PaymentGatewayNetBanking")
public class PaymentGatewayNetBanking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bank_name= request.getParameter("radio");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		System.out.println("here===="+bank_name);
		//RequestDispatcher rd = request.getRequestDispatcher("http://172.17.170.139:8989/PaymentGateway/Gateway");
		System.out.println(request.getServerPort());
		if(bank_name.equals("SkadooshBank"))
			response.sendRedirect("http://172.17.170.139:8989/SkadooshPaymentGateway/Gateway?to_accno=1626510262562188&ifsc_code=SBIL0000279&amount="+session.getAttribute("amount")+"&link=http://localhost:"+request.getServerPort()+"/OnlineShoppingCartSystem/Receipt.jsp?userid="+session.getAttribute("uname")+"@status=");
		else
			pw.println("<script>alert('Redirecting to payment gateway With information');alert('Your order is placed. Check your registered email-id for invoice.');location-href='Receipt.jsp?userid="+session.getAttribute("uname")+"@status=1'</script>");
	}


}
