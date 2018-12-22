package onlineexam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CandiViewServ
 */
//@WebServlet("/CandiViewServ")
public class CandiViewServ extends HttpServlet {
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
		PrintWriter out=response.getWriter();
		List<Bean1> list=Dac.getAllCandidates("candidate");
		session.setAttribute("candlist",list);
		RequestDispatcher rd=request.getRequestDispatcher("Candidate.jsp");
	    rd.forward(request, response);
	}

}
