package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User_Profile;
import dao.Dao;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		User_Profile e=new User_Profile();
		e.setEmail(request.getParameter("emailid"));
		e.setFname(request.getParameter("fname"));
		e.setLname(request.getParameter("lname"));
		if(request.getParameter("radio").equals("male"))
			e.setGender("Male");
		else
			e.setGender("Female");
		e.setAddress(request.getParameter("address"));
		e.setPhone(request.getParameter("phone"));
		e.setPassword((String)request.getParameter("pass"));
		Dao ob=new Dao();
		ob.getConnection();
		if(ob.registerUser(e))
		{
			HttpSession ses=request.getSession();
			ses.setAttribute("USER", request.getParameter("fname"));
			ses.setAttribute("EMAIL", request.getParameter("emailid"));
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else
		{
			out.println("Sorry..Some Error Occured!!");
		}
	}

}
