package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Temp_Details;
import dao.Dao;

/**
 * Servlet implementation class RemoveTemp
 */
@WebServlet("/RemoveTemp")
public class RemoveTemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Dao ob=new Dao();
	Temp_Details e=new Temp_Details();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		double id=Double.parseDouble(request.getParameter("text1"));
		e.setP_id(id);
		ob.getConnection();
		if(ob.removeTemp(e))
			request.getRequestDispatcher("CartAndOrder.jsp").include(request, response);
	}
}
