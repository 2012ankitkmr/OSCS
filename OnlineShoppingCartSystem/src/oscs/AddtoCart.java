package oscs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.containers.Products_container;

/**
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter PW = response.getWriter();
		String pid = null;


		HttpSession session=request.getSession(false);  

		if((String)session.getAttribute("uname")==null)
		{
			PW.println("<script> alert('Please Register or Login for add to cart'); location.href='login.jsp'</script>");
		}
		else{
			try{

				String uname=(String)session.getAttribute("uname");  

				pid = request.getParameter("pid");

				System.out.println("p="+pid+","+uname);
				JDBCCon dj= new JDBCCon();
				int check= dj.add_product(pid,uname);
				if(check<0)
				{
					PW.println("<script> alert('Product is already added in shopping cart');location.href='Products.jsp'</script>");
				}
				else{
					response.sendRedirect("shoppingCart.jsp");
				}
			}
			catch(Exception e)
			{
				PW.println("<script> alert('User already logged out!');location.href='login.jsp'</script>");
			}
		}
	}


}
