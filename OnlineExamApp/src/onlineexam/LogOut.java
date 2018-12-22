package onlineexam;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOut
 */
//@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		
		String name=(String) session.getAttribute("name");
		System.out.println(name+"@!!!!!!!!@@@@@@$#");
		session.invalidate();
		//out.print("you are successfully logged out");
		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		rd.include(request, response);
		
		out.close();
		
		
		
		
	}

}
