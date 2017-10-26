package oscs;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.containers.Product_Description_container;
import com.containers.Products_container;


/**
 * Servlet implementation class ProductShowServlet
 */
@WebServlet("/ProductShowServlet")
public class ProductShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pid = request.getParameter("pid");
		JDBCCon db =  new JDBCCon();
		
		Product_Description_container list = new Product_Description_container();
		
		HttpSession session = request.getSession(true);
		
		System.out.println(pid);

		
		try {
			list = db.showdesc(pid);
			
			session.setAttribute("pdetail_list", list);
			response.sendRedirect("product_details.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}


