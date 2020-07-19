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
 * Servlet implementation class AddTemp
 */
@WebServlet("/AddTemp")
public class AddTemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Dao ob=new Dao();
	Temp_Details e=new Temp_Details();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession ses=request.getSession(false);
		if(ses.getAttribute("USER")!=null)
		{
			double id=Double.parseDouble(request.getParameter("text1"));
			e.setP_id(id);
			e.setU_email((String)ses.getAttribute("EMAIL"));
			ob.getConnection();
			if(ob.checkTemp(e))
			{
				request.getRequestDispatcher("CartAndOrder.jsp").include(request, response);
			}
			else
			{
				if(ob.addTemp(e))
					request.getRequestDispatcher("CartAndOrder.jsp").include(request, response);
			}
		}
		else
		{
			request.getRequestDispatcher("login.jsp").include(request, response);
		}
	}

}
