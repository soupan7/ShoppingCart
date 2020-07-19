package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User_Profile;
import dao.Dao;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		HttpSession ses=request.getSession();
		if(email.equals("admin@gmail.com") && pass.equals("admin1234"))
		{
			ses.setAttribute("USER", "ADMIN");
			request.getRequestDispatcher("Admin.jsp").forward(request, response);
		}
		else {
			User_Profile e=new User_Profile();
			Dao ob=new Dao();
			ob.getConnection();
			e=ob.selectQuery(email,pass);
			if(e!=null)
			{
				ses.setAttribute("USER", e.getFname());
				ses.setAttribute("EMAIL", e.getEmail());
			}
			request.getRequestDispatcher("index.jsp").include(request, response);
		}
	}
}
