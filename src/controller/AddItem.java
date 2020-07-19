package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.Product_Details;
import dao.Dao;

/**
 * Servlet implementation class AddItem
 */
@WebServlet("/AddItem")
@MultipartConfig(location="",fileSizeThreshold=1024*1024*5,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		Part part=request.getPart("PA_IMAGE");
		
		String contentDisp=part.getHeader("content-disposition");
		System.out.println(contentDisp);
		
		String ext=contentDisp.substring(contentDisp.trim().lastIndexOf("."),contentDisp.trim().length()-1);
		System.out.println(ext);
		
		String realPath=request.getServletContext().getRealPath("");
		System.out.println(realPath);
		
		String filePath=realPath+File.separator+"images"+File.separator+request.getParameter("PA_NAME")+ext;
		String databasepath="images"+File.separator+request.getParameter("PA_NAME")+ext;
		System.out.println(filePath);
		
		part.write(filePath);
		
		Dao d=new Dao();
		d.getConnection();
		
		Product_Details e = new Product_Details();
		e.setCatagory(( request.getParameter("text1")));
		e.setName(request.getParameter("PA_NAME"));
		e.setPrise(Double.parseDouble(request.getParameter("PA_PRICE")));
		e.setDescription(request.getParameter("PA_DETAILS"));
		e.setImage(databasepath);
		
		if(d.addProduct(e)){
			request.getRequestDispatcher("Admin.jsp").include(request, response);
			out.println("<div class='footer'><p>Item Added Successfully</p><!-- end .footer --></div>");
		}
		else{
			request.getRequestDispatcher("Admin.jsp").include(request, response);
			out.println("<div class='footer'><p>Error Occured!!!!</p><!-- end .footer --></div>");
		}
		d.closeAll();
	}
}
