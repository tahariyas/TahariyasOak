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
 * Servlet implementation class DeleteQnServ
 */
//@WebServlet("/DeleteQnServ")
public class DeleteQnServ extends HttpServlet {
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
		String vf=request.getParameter("VF");
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
		Bean2 e=Dac.getQnById(id);
		String Dom=e.getDom();
		int status=Dac.delete(id);
		//System.out.println(vf);
		if(status>0&&vf.equals("set"))
		{  // System.out.println("am in set");
			request.getRequestDispatcher("ViewQnServ").forward(request, response);
			
		}
		else if(status>0)
		{   //System.out.println("am in dewfault");
		   // System.out.println(vf);
			request.setAttribute("domain",Dom);
			request.getRequestDispatcher("ViewDomServ").forward(request, response);
		}
	}

}
