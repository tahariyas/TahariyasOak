package onlineexam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditAdmServ
 */
//@WebServlet("/EditAdmServ")
public class EditAdmServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		 if(session.getAttribute("name")==null)
		{  
		    
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request,response);
			
		}
	
		 String name1 = (String) session.getAttribute("name");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		
		//Bean1 b=(Bean1) request.getSession().getAttribute("c");
	
	

		Bean1 e=Dac.getEmployeeByName(name1);
		
	   
	    session.setAttribute("Bean", e);
	    request.getRequestDispatcher("EditP.jsp").forward(request, response);
	     
		
		
	}

}
