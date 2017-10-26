

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.JDBCCon;

import com.containers.Productfill_container;

/**
 * Servlet implementation class EditProductServ
 */
@WebServlet("/EditProductServ")
public class EditProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		JDBCCon db =  new JDBCCon();
		Productfill_container  prod = new Productfill_container();
		
		prod.product_name = request.getParameter("prod_name");
		prod.brand = request.getParameter("brand");
		prod.brief_desc = request.getParameter("brief_desc");
		prod.category_id = request.getParameter("category");
		prod.features = request.getParameter("features");
		prod.qty = Integer.parseInt(request.getParameter("qty"));
		prod.price = Double.parseDouble(request.getParameter("price"));
		prod.type = request.getParameter("type");
		prod.pic_id = request.getParameter("image_id");
		prod.pic_id = prod.pic_id;
		prod.desc = request.getParameter("desc");
		prod.product_id = request.getParameter("prod_id");
		System.out.println(prod.product_id);
		HttpSession session = request.getSession(true);
		int ret = db.updatedetailsprod(prod);
		if(ret==1)
			session.setAttribute("prod_import","Success!!!");
		response.sendRedirect("editproduct.jsp");
	}


}
