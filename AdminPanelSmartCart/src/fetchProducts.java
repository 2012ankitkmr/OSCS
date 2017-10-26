

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.containers.Productfill_container;

import jdbc.JDBCCon;

/**
 * Servlet implementation class fetchProducts
 */
@WebServlet("/fetchProducts")
public class fetchProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JDBCCon db = new JDBCCon();
		
		String p_id = request.getParameter("prod_id");
		
		Productfill_container pc = db.getProducts(p_id);
		HttpSession session = request.getSession(true);
		session.setAttribute("prod_details", pc);
		response.sendRedirect("editproduct.jsp");
		
	}

}
