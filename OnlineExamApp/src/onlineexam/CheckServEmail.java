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
public class CheckServEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String email=request.getParameter("user");
		int status=Dac.checkemail(email);
		
		RequestDispatcher rd=request.getRequestDispatcher("Reg.jsp");

		if(status==1)
		{
			String userMsg="Email Already Exists";
		    session.setAttribute("userMsg1", userMsg);
		    session.setAttribute("flag1", "set");
		    rd.forward(request, response);
		    
		    
		}
		
		else
		{   session.setAttribute("userMsg1", email);
		    session.setAttribute("flag1", "notset");
			rd.forward(request, response);
		}
	}

}