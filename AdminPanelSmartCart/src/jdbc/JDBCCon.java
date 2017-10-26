package jdbc;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Pattern;

import com.containers.*;
public class JDBCCon {

	
	public int Authorize(String uname,String pass)
	{

		int ret = 0;
		try{

			//loading drivers
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String md = md5(pass);
			System.out.println(md);
			String sql = "SELECT COUNT(*) FROM Users WHERE user_id='"+ uname+"' AND password='"+md+"' AND flag=1";
			ResultSet rs = stmt.executeQuery(sql);

			int cnt=0;
			while(rs.next())
			{
				cnt = rs.getInt(1);
			}
			ret=cnt;
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		return ret;
	}

	
	public String getName(String uname)
	{
		String name = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "SELECT first_name FROM Users WHERE user_id = '"+ uname+"'";
			ResultSet rs = stmt.executeQuery(sql);


			while(rs.next())
			{
				name = rs.getString(1);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return name;
	}

	
	public AnalyticsContainer getAnalytics()
	{
		AnalyticsContainer ans = new AnalyticsContainer();

		try
		{

			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();

			// New Orders
			String sql = "SELECT COUNT(*) FROM Orders WHERE status='Confirmed'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ans.newOrders = rs.getInt(1);
			}

			// Total Sales
			sql = "SELECT COUNT(*) FROM Orders WHERE status='Delivered'";
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ans.sales = rs.getInt(1);
			}

			// Total Members
			sql = "SELECT COUNT(*) FROM Users";
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ans.userRegistration = rs.getInt(1);
			}

			// Total Revenue
			sql = "SELECT SUM(quantity*unit_cost) FROM ORDER_DETAIL";
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ans.totalRevenue = rs.getInt(1);
			}

			// Total Revenue
			sql = "SELECT COUNT(DISTINCT u.user_id) FROM Users u,Orders o WHERE u.user_id=o.cust_id";
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ans.newMembers = ans.userRegistration-rs.getInt(1);
			}

			ans.totalprofit = (ans.totalRevenue)*(Constants.PROFIT);
			ans.totalCost = ans.totalRevenue-ans.totalprofit;
			ans.goalcompletion = Constants.TARGET - ans.sales;
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return ans;
	}

	
	public ArrayList<OrdersContainer> getorders()
	{
		ArrayList<OrdersContainer> ords = new ArrayList<OrdersContainer>();

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();

			// New Orders
			String sql = "SELECT o.order_id,p.product_name,o.status FROM Order_detail od,Orders o,Product p WHERE o.order_id=od.order_id AND od.product_id=p.product_id AND ROWNUM<=5";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				OrdersContainer ord = new OrdersContainer();
				ord.order_id=rs.getString(1);
				ord.order_name =rs.getString(2);
				ord.status=rs.getString(3);
				ords.add(ord);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ords;
	}


	public ArrayList<ProductsContainer> getproducts()
	{
		ArrayList<ProductsContainer> prods = new ArrayList<>();

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();

			// New Orders
			String sql = "SELECT pic_id,product_name,unit_price FROM Product WHERE ROWNUM<=5";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				ProductsContainer prod = new ProductsContainer();
				prod.pic_id=rs.getString(1);
				prod.desc =rs.getString(2);
				prod.price=rs.getDouble(3);
				prod.name = (prod.desc.split(Pattern.quote(" ")))[0];
				prods.add(prod);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return prods;
	}

	public int getProducts() throws SQLException
	{	
		int temp=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "SELECT COUNT(product_id) FROM Product";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				temp= (rs.getInt(1));
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

		return temp;
	}
	
	
	public Productfill_container getProducts(String pid)
	{
		Productfill_container pc = new Productfill_container();
		pc.product_id="NONE";

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();

			// New Orders
			String sql = "SELECT * FROM Product p,ProductDescription pd WHERE p.product_id=pd.product_id AND p.product_id='"+pid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				pc.product_id=pid;
				pc.category_id=rs.getString(2);
				pc.pic_id=rs.getString(3);
				pc.product_name=rs.getString(5);
				pc.price=rs.getDouble(6);
				pc.qty = rs.getInt(7);
				pc.brief_desc=rs.getString(10);
				pc.desc =rs.getString(11);
				pc.brand =rs.getString(12);
				pc.type=rs.getString(13);
				pc.features=rs.getString(14);
			}
			con.close();
			return pc;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return pc;
	}
	

	public String getDepartment(String c_id) throws SQLException
	{
		String d_id= null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");

			Statement stmt=con.createStatement();
			String sql = "SELECT dept_id FROM Category WHERE category_id='"+c_id+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				d_id =rs.getString(1);		
			}
			con.close();

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return d_id;

	}
	

	public int addproduct(Productfill_container pc) throws SQLException
	{
		int ret=0;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			if(pc.product_id==null)
			{
				int count=getProducts()+1;
				pc.product_id="P10"+count;
			}
			String sql = "INSERT INTO Product(category_id,product_id,pic_id,product_name,quantity,unit_price,dept_id) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1,pc.category_id);
			stmt.setString(2, pc.product_id);
			stmt.setString(3, pc.pic_id);
			stmt.setString(4, pc.product_name);
			stmt.setInt(5, pc.qty);
			stmt.setDouble(6, pc.price);
			stmt.setString(7, getDepartment(pc.category_id));

			int i = stmt.executeUpdate();

			String sql1 = "INSERT INTO ProductDescription(brief_description,description,brand,type,features,product_id,product_name) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement  stmt1 = con.prepareStatement(sql1);
			stmt1.setString(1,pc.brief_desc);
			stmt1.setString(2,pc.desc);
			stmt1.setString(3, pc.brand);
			stmt1.setString(4, pc.type);
			stmt1.setString(5, pc.features);
			stmt1.setString(6, pc.product_id);
			stmt1.setString(7, pc.product_name);

			int j = stmt1.executeUpdate();	
			ret = i&j;
			con.close();

		}
		catch(Exception e)
		{
			System.out.println(e);
			System.out.println("Add Product Issue");
		}
		return ret;
	}
	
	
	public int updatedetailsprod(Productfill_container prod)
	{

		int ret=0;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			String sql =null;

			sql = "Update ProductDescription SET Product_name='"+prod.product_name +"',BRIEF_DESCRIPTION='"+prod.brief_desc+"',DESCRIPTION='"+prod.desc+"',BRAND='"+prod.brand+"',TYPE='"+prod.type+"',FEATURES='"+prod.features+"' WHERE product_id='"+prod.product_id+"'";
			PreparedStatement stmt1 = con.prepareStatement(sql);
			int j = stmt1.executeUpdate();


			sql = "Update Product SET Product_name='"+prod.product_name +"',category_id='"+prod.category_id+"',pic_id='"+prod.pic_id+"',dept_id='"+getDepartment(prod.category_id)+"',UNIT_PRICE='"+prod.price+"',quantity='"+prod.qty+"' WHERE product_id='"+prod.product_id+"'";
			PreparedStatement stmt = con.prepareStatement(sql);
			int i = stmt.executeUpdate();


			ret = i&j;
			con.close();

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return ret;
	}



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

}
