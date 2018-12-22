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
 * Servlet implementation class UpdateQnServ
 */
//@WebServlet("/UpdateQnServ")
public class UpdateQnServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
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
		String vf1=request.getParameter("vf1");
		//System.out.println(vf1);
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
	
		String Dom=request.getParameter("dom");
		String quest=request.getParameter("qn");
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String c=request.getParameter("c");
		String d=request.getParameter("d");
		String ans=request.getParameter("ans");
		
		Bean2 b2=new Bean2();
		b2.setId(id);
		b2.setQuest(quest);
		b2.setDom(Dom);
		b2.setO1(a);
		b2.setO2(b);
		b2.setO3(c);
		b2.setO4(d);
		b2.setAns(ans);
		int status=Dac.editQn(b2);
		
		if(status>0&&vf1.equals("set"))
		{  
			request.getRequestDispatcher("ViewQnServ").forward(request, response);
		}
		else if(status>0)
		{
			request.setAttribute("domain",Dom);
			request.getRequestDispatcher("ViewDomServ").forward(request, response);
		}
	}

}
