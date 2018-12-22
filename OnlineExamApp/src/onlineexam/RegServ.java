package onlineexam;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class RegServ
 */
//@WebServlet("/RegServ")
@MultipartConfig(maxFileSize = 16177215)
public class RegServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		int status=0;
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String pass=request.getParameter("pass2");
		String email=request.getParameter("email");
		
		String m1=request.getParameter("mob");
		long mob=Long.parseLong(m1);
		String y=request.getParameter("yop");
		int yop=Integer.parseInt(y);
		String aadhar=request.getParameter("aadhar");
		Part filePart = request.getPart("resume");
		
		
		
		
		Bean1 e =new Bean1();
		e.setName(name);
		e.setPass2(pass);
		e.setEmail(email);
		e.setMob(mob);
		e.setYop(yop);
		//e.setDob(dob);
		e.setAadhar(aadhar);
		//e.setPan(pan);
		e.setResume(filePart);
		status=Dac.save(e);
		if(status>0)
		{
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}
		
		
	}

}
