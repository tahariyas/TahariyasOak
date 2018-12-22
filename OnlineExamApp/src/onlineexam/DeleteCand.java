package onlineexam;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteCand
 */
//@WebServlet("/DeleteCand")
public class DeleteCand extends HttpServlet {
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
	
		
		response.setContentType("text/html");
		String name=request.getParameter("name");
		Dac.deleteCandidate(name);
		request.getRequestDispatcher("CandiViewServ").forward(request, response);
	}

}
