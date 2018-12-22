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
 * Servlet implementation class EditAdmServ
 */
//@WebServlet("/testPageServ")
public class testPageServ extends HttpServlet {
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
	     String dom=request.getParameter("dom");
		List<Bean2> list= Dac.getQuestionsByDom(dom);
	
		
		session.setAttribute("list", list);
		session.setAttribute("domain", dom);
		request.getRequestDispatcher("DisplayQuest.jsp").forward(request, response);
		
			}

}
