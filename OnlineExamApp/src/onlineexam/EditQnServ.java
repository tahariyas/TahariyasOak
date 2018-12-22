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
 * Servlet implementation class EditQnServ
 */
//@WebServlet("/EditQnServ")
public class EditQnServ extends HttpServlet {
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
	
		String vf=request.getParameter("VF");
		
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
		Bean2 e=Dac.getQnById(id);
		session.setAttribute("list", e);
		request.setAttribute("vf", vf);
		request.getRequestDispatcher("EditQuest.jsp").forward(request, response);
		
	}

}
