package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Temp_Details;
import dao.Dao;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Dao ob=new Dao();
	Temp_Details e=new Temp_Details();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ob.getConnection();
		HttpSession ses=request.getSession(false);
		e.setU_email((String)ses.getAttribute("EMAIL"));
		if(ob.placeOrder(e))
			request.getRequestDispatcher("CartAndOrder.jsp").forward(request, response);
		else
			System.out.println("Error");
	}
}
