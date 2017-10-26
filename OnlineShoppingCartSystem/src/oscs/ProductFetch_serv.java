package oscs;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.containers.Cart_details_container;
import com.containers.Products_container;
import com.containers.category_Container;
import com.containers.department_Container;


/**
 * Servlet implementation class productFetch_serv
 */
@WebServlet("/ProductFetch_serv")
public class ProductFetch_serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter PW = response.getWriter();
		JDBCCon db =  new JDBCCon();
		ArrayList<Products_container> list = new ArrayList<Products_container>();
		Cart_details_container cartdetails = new Cart_details_container();
		ArrayList<department_Container> departments = new ArrayList<department_Container>();
		ArrayList<category_Container> categories= new ArrayList<category_Container>();
		
		try {
			list = db.showProds();
			departments = db.getDepartments();
			categories = db.getCategories();
			cartdetails = db.showcart();
			HttpSession session = request.getSession(true);
			session.setAttribute("prod_list", list);
			session.setAttribute("categories", categories);
			session.setAttribute("department", departments);
			session.setAttribute("cart_details", cartdetails);
			
			JDBCCon e = new JDBCCon();
			ArrayList<String> cartDetail = e.fetchUserCart((String)session.getAttribute("uname"));
			if(cartDetail.size()<=0)
			{
				session.setAttribute("cartItem","0");
				session.setAttribute("cartTotal","Rs. 0");

			}
			else{						session.setAttribute("cartItem",cartDetail.get(0));
										session.setAttribute("cartTotal",cartDetail.get(1));
		
			}
			response.sendRedirect("Products.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}


}
