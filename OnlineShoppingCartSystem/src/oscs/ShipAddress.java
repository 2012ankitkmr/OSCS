package oscs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShipAddress
 */
@WebServlet("/ShipAddress")
public class ShipAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String data[]= new String[9];
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter PW = response.getWriter();			
		
		data[0]= (String) request.getSession().getAttribute("uname");
		data[1] = request.getParameter("name");
		data[2] = request.getParameter("phone");
		data[3] = request.getParameter("address");
		data[4] = request.getParameter("address2");
		data[5] = request.getParameter("area");
		data[6] = request.getParameter("city");
		data[7] = request.getParameter("state");
		data[8] = request.getParameter("postcode");

		
		JDBCCon dj = new JDBCCon();
		
		dj.insert_ShipAddress(data);
		
		
		PW.println("<script>alert('Shipping Address added');location.href='confirmation.jsp'</script>");
}

}
