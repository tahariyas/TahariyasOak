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
 * Servlet implementation class CalculateServ
 */

public class CalculateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		 if(session.getAttribute("name")==null)
		{  
		    
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request,response);
			
		}
		 PrintWriter out=response.getWriter();
		 String name1 = (String) session.getAttribute("name");
		 
			String soption,ans,option;
			int count=0;
			
			String set=request.getParameter("set");
			request.setAttribute("flag", set);
			
			String dom=(String) session.getAttribute("domain");
			
			String count1=request.getParameter("count");
			if(count1!=null)count=Integer.parseInt(count1);
			
			String pageStar=request.getParameter("pageStart");
			int pageStart=Integer.parseInt(pageStar);
			request.setAttribute("pageStart", pageStart);
			
			String flag=(String)request.getAttribute("flag");
			if (request.getParameter("prev") != null) 
		    {   
				request.setAttribute("count",count);
				
				
		    if(flag.equals("set"))
				{   
				
					count=count-1;
					request.setAttribute("count",count);
					
					
				}
				
				request.setAttribute("pageStart", pageStart-2);
		        RequestDispatcher rd=request.getRequestDispatcher("DisplayQuest.jsp");
			    rd.forward(request, response);
			}
		List<Bean2> list=(List<Bean2>)session.getAttribute("list");

		


	
			option="option"+list.get(pageStart-1).getId();
			soption=request.getParameter(option);
			if(soption!=null)
			{
			ans=list.get(pageStart-1).getAns();
            set="set";
			if(soption.equals(ans))
			{   request.setAttribute("flag", set);
				count++;
			}
			else
			{
				
				request.setAttribute("flag", null);
			}
		}
		request.setAttribute("count", count);
		
		if (request.getParameter("exam") != null) 
	    {
			request.setAttribute("count",count);
	        RequestDispatcher rd=request.getRequestDispatcher("DisplayQuest.jsp");
		    rd.forward(request, response);
		}
		else if(request.getParameter("submit")!=null)
		{
			
			int status=Dac.saveMarks(count,name1,dom);
			session.setAttribute("count",count);
			RequestDispatcher rd=request.getRequestDispatcher("result.jsp");
			rd.forward(request, response);
			out.close();
		}
	}

}