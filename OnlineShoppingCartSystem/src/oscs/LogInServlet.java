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

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/LogInServletPath")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	public static String md5(String input) {

		String md5 = null;

		if(null == input) return null;


		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(input.getBytes(), 0, input.length());

			//Converts message digest value in base 16 (hex) 
			md5 = new BigInteger(1, digest.digest()).toString(16);
		}
		catch (NoSuchAlgorithmException e) {

			e.printStackTrace();
		}

		return md5;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter PW = response.getWriter();		
	         
		String uname = request.getParameter("username"); 
		String pswd = request.getParameter("inputPassword1");
		JDBCCon dj= new JDBCCon();
		String md = md5(pswd);
	int t=dj.login_verify(uname, md);

		if(t>0)
		{
			
			HttpSession session=request.getSession();  
			session.setAttribute("uname",uname);
			PW.println("Successfully logged in");
			response.sendRedirect("ProductFetch_serv"); //index.jsp
		}
		else
		{
			PW.println("<script>alert('User Name Or Password is Incorrect!'); location.href='login.jsp'</script>");
			
		}
	
	}
}


