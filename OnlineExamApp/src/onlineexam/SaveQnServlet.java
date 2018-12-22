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
 * Servlet implementation class SaveQnServlet
 */
//@WebServlet("/SaveQnServlet")
public class SaveQnServlet extends HttpServlet 

{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveQnServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

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
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String Dom=request.getParameter("dom");
		StringBuffer text = new StringBuffer(request.getParameter("qn"));
		int loc = (new String(text)).indexOf('\n');
		while(loc > 0){
		    text.replace(loc, loc+1, "<br>");
		    loc = (new String(text)).indexOf('\n');
		}

		loc = (new String(text)).indexOf(' ');
		while(loc > 0){
		    text.replace(loc, loc+1, "&nbsp;");
		    loc = (new String(text)).indexOf(' ');
		}

		String quest=new String(text);
		/*String quest=request.getParameter("qn");*/
		String o1=request.getParameter("o1");
		String o2=request.getParameter("o2");
		String o3=request.getParameter("o3");
		String o4=request.getParameter("o4");
		String o5=request.getParameter("a1");
		Bean2 b=new Bean2();
		
		b.setQuest(quest);
		b.setDom(Dom);
		b.setO1(o1);
		b.setO2(o2);
		b.setO3(o3);
		b.setO4(o4);
		b.setAns(o5);
		
		int status=Dac.saveQn(b);
		if(status>0)
		 {   
			 out.println("Question saved");
			 request.getRequestDispatcher("AddQuestion.jsp").include(request, response);  
			 
		 }
		 
		else
		 {
			 out.print("please try again");
			 request.getRequestDispatcher("AddQuestion.jsp").include(request, response);  
			 
		 }
		
	}

}
