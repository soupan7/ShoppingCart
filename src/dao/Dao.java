package dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.Properties;


import bean.Product_Details;
import bean.Temp_Details;
import bean.User_Profile;

public class Dao {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public void getConnection()
	{
//		Dao driver=new Dao);
		try
		{
			Driver driver = null;
			DriverManager.registerDriver(driver);
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean registerUser(User_Profile e)
	{
		try
		{
			String sql="insert into User_Profile values (?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, e.getEmail());
			ps.setString(2, e.getFname());
			ps.setString(3, e.getLname());
			ps.setString(4, e.getGender());
			ps.setString(5, e.getAddress());
			ps.setString(6, e.getPhone());
			ps.setString(7, e.getPassword());
			int ret=ps.executeUpdate();
			con.close();
			if(ret > 0)
				return true;
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
	public boolean addTemp(Temp_Details e)
	{
		try
		{
			String sql="insert into Temp_Details values (?,?)";
			ps=con.prepareStatement(sql);
			ps.setDouble(1, e.getP_id());
			ps.setString(2, e.getU_email());
			int ret=ps.executeUpdate();
			con.close();
			if(ret > 0)
				return true;
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
	public boolean removeTemp(Temp_Details e)
	{
		try
		{
			String sql="delete from Temp_Details where p_id=?";
			ps=con.prepareStatement(sql);
			ps.setDouble(1, e.getP_id());
			int ret=ps.executeUpdate();
			con.close();
			if(ret > 0)
				return true;
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
	public boolean checkTemp(Temp_Details e)
	{
		try
		{
			String sql="select * from Temp_Details where p_id=? and u_email=?";
			ps=con.prepareStatement(sql);
			ps.setDouble(1, e.getP_id());
			ps.setString(2, e.getU_email());
			rs=ps.executeQuery();
			if(rs.next())
				return true;
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
	@SuppressWarnings("deprecation")
	public boolean placeOrder(Temp_Details e)
	{
		try
		{
			Connection con1=con,con2=con;
			PreparedStatement ps1,ps2;
			String sql="select * from Temp_Details where u_email=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, e.getU_email());
			rs=ps.executeQuery();
			while(rs.next())
			{
				ps1=con1.prepareStatement("insert into Order_Details values (O_ID.NEXTVAL,?,?,?)");
				ps1.setDouble(1, rs.getDouble(1));
				ps1.setString(2, rs.getString(2));
				ps1.setString(3, ((new java.util.Date()).toLocaleString()));
				ps1.executeUpdate();
			}
			ps2=con2.prepareStatement("delete from Temp_Details where u_email=?");
			ps2.setString(1, e.getU_email());
			if(ps2.executeUpdate()>0)
				return true;
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}
	public boolean addProduct(Product_Details e){
		try{
			ps=con.prepareStatement("insert into Product_Details values(P_ID.NEXTVAL,?,?,?,?,?)");
			ps.setString(1,e.getCatagory());
			ps.setString(2,e.getName());
			ps.setDouble(3,e.getPrise());
			ps.setString(4,e.getDescription());
			ps.setString(5,e.getImage());
			if(ps.executeUpdate()>0){
				con.commit();
				return true;
			}
		}catch(SQLException sqle){
			System.out.println(sqle);
		}
		return false;
	}
	public boolean updateProduct(Product_Details e){
		try{
			ps=con.prepareStatement("update Product_Details set P_NAMES=?,P_PRICE=?,P_DESCRIPTION=?,P_IMAGE=? where P_ID=?");
			ps.setString(1,e.getName());
			ps.setDouble(2,e.getPrise());
			ps.setString(3,e.getDescription());
			ps.setString(4,e.getImage());
			ps.setDouble(5, e.getP_id());
			if(ps.executeUpdate()>0){
				con.commit();
				return true;
			}
		}catch(SQLException sqle){
			System.out.println(sqle);
		}
		return false;
	}
	public boolean deleteProduct(double id){
		try{
			ps=con.prepareStatement("delete from Product_Details where P_ID=?");
			ps.setDouble(1,id);
			if(ps.executeUpdate()>0){
				con.commit();
				return true;
			}
		}catch(SQLException sqle){
			System.out.println(sqle);
		}
		return false;
	}
	public User_Profile selectQuery(String email,String pass)
	{
		try
		{
			String sql = "select * from User_Profile where u_email=? and u_password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			if(rs.next())
			{
				User_Profile e=new User_Profile();
				e.setFname(rs.getString(2));
				e.setEmail(rs.getString(1));
				return e;
			}
		}
		catch(SQLException e) 
		{
			System.out.println(e);
		}
		return null;
	}
	public void closeAll(){
		try	{
			if(con!=null)
				con.close();
			if(ps!=null)
				ps.close();
			if(rs!=null)
				rs.close();
		}catch(Exception e){
			System.out.println(e);
		}	
	}
}
