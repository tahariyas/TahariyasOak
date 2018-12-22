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
 * Servlet implementation class CheckServ
 */
//@WebServlet("/CheckServ")
public class CheckServMob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       HttpSession session=request.getSession(false);
		String mob1=request.getParameter("user");
		long mob=Long.parseLong(mob1);
		int status=Dac.checkmob(mob);
		
		RequestDispatcher rd=request.getRequestDispatcher("Reg.jsp");

		if(status==1)
		{
			String userMsg="Mobile Already Exists";
		    session.setAttribute("userMsg2", userMsg);
		    session.setAttribute("flag2", "set");
		    rd.forward(request, response);
		    
		    
		}
		
		else
		{   session.setAttribute("userMsg2", mob1);
		     session.setAttribute("flag2", "notset");
			rd.forward(request, response);
		}
	}

}