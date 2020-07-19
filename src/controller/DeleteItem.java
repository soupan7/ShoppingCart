package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

/**
 * Servlet implementation class DeleteItem
 */
@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		double id=Double.parseDouble(request.getParameter("PD_ID"));
		System.out.println(id);
		Dao ob=new Dao();
		ob.getConnection();
		if(ob.deleteProduct(id)){
			request.getRequestDispatcher("Admin.jsp").include(request, response);
			out.println("<div class='footer'><p>Item Deleted Successfully</p><!-- end .footer --></div>");
		}
		else{
			request.getRequestDispatcher("Admin.jsp").include(request, response);
			out.println("<div class='footer'><p>Failed To Delete..Some Customers Already Ordered This Product</p><!-- end .footer --></div>");
		}
		ob.closeAll();
	}

}
