package onlineexam;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EditServlet2
 */
// @WebServlet("/EditServlet2")
@MultipartConfig(maxFileSize = 16177215)
public class EditServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session=request.getSession(false);
		 if(session.getAttribute("name")==null)
		{  
		    
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request,response);
			
		}

			String name1 = (String) session.getAttribute("name");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

			
			String name = request.getParameter("name");
			String password = request.getParameter("pass2");
			String email = request.getParameter("email");
			String smob = request.getParameter("mob");
			long mob = Long.parseLong(smob);
			String syop = request.getParameter("yop");
			int yop = Integer.parseInt(syop);
			String aadhar = request.getParameter("aadhar");
			
			Bean1 e = new Bean1();
			e.setName(name);
			e.setPass2(password);
			e.setEmail(email);
			e.setMob(mob);
			e.setYop(yop);
			e.setAadhar(aadhar);
			
			int status = Dac.updateAdm(e,name1);

			if (status > 0 && name1 == "admin") {
				out.println("update successful");
				request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
			} else if (status > 0) {
				out.println("update successful");
				request.getRequestDispatcher("candidatelogin.jsp").include(request, response);
			} else {
				out.print("Sorry Update Failed");
				RequestDispatcher rd = request.getRequestDispatcher("EditAdmServ");
				rd.include(request, response);
			}
			out.close();
		} 
	}


