package onlineexam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewQnServ
 */
//@WebServlet("/ViewQnServ")
public class ViewQnServ extends HttpServlet {
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
		 
		 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		List<Bean2> list=Dac.getAllQuestions();
	    /* Iterator itr=list.iterator();
	     while(itr.hasNext())
	     {
	    	 System.out.println(itr.next());
	     }*/
		
		
		session.setAttribute("listqn", list);
		request.getRequestDispatcher("ViewQn.jsp").forward(request, response);
			}

}
