package oscs;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dept_detail
 */
@WebServlet("/Dept_detailPath")
public class Register_User extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected String data[]=new String[14];
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter PW = response.getWriter();			

		data[0] = request.getParameter("titl"); //title
		data[1] = request.getParameter("inputFname");
		data[2] = request.getParameter("inputLnam");
		data[3] = request.getParameter("UserName");
		data[4] = request.getParameter("input_email");
		data[5] = request.getParameter("inputPassword");
		data[6] = request.getParameter("dob");
		data[7] = request.getParameter("phone");
		data[8] = request.getParameter("address");
		data[9] = request.getParameter("address2");
		data[10] = request.getParameter("area");
		data[11] = request.getParameter("city");
		data[12] = request.getParameter("state");
		data[13] = request.getParameter("postcode");

		DateFormat inputFormatter=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date;
		try {
			date = inputFormatter.parse(data[6]);
			DateFormat outputFormatter=new SimpleDateFormat("dd-MM-yyyy");
			data[6]=outputFormatter.format(date);
			Date today = new Date();

			if(today.before(date)){
				PW.println("<script>alert('Enter a valid Birthdate'); location.href='register.jsp';</script>");

			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		JDBCCon dj = new JDBCCon();
		int l= dj.RegisterUser(data);

		if(l==0)
		{
			PW.println("<script>alert('Account Already exists!'); location.href='login.jsp'</script>");

		}
		else{
			PW.println("<script>alert('Account Registered!'); location.href='login.jsp'</script>");
		}
	}
}




