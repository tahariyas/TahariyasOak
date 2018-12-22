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
 * Servlet implementation class LoginServlet
 */
// @WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=null;
		response.setContentType("text/html");

		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String type = Dac.validate(name, pass);
		System.out.println("returning " + type);
  
		if (type.equals("admin")) {
		   
			 session= request.getSession();
			session.setAttribute("name", name);
			RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp");
			rd.include(request, response);
		}

		else{
			 session = request.getSession();
			session.setAttribute("name", name);
			RequestDispatcher rd = request.getRequestDispatcher("candidatelogin.jsp");
			rd.include(request, response);

		}

		/*else {
			// pw.print("Invalid Username or Password");
			RequestDispatcher rd = request.getRequestDispatcher("failure.jsp");
			rd.include(request, response);
		}*/

	}

}
