package onlineexam;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewResume
 */

public class ViewResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final int BUFFER_SIZE = 4096;


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
	    
	   
		String name=request.getParameter("name");
		
		
		
		InputStream inputstream=Dac.getResume(name);
		String fileName=Dac.fileName;
		int fileLength = inputstream.available();
		
		   ServletContext context = getServletContext();
           
           // sets MIME type for the file download
           String mimeType = context.getMimeType(fileName);
           if (mimeType == null) {        
               mimeType = "application/octet-stream";
           }        
           System.out.println(mimeType);
            
           // set content properties and header attributes for the response
           response.setContentType(mimeType);
           response.setContentLength(fileLength);
       String headerKey = "Content-Disposition";
           String headerValue = String.format("attachment; filename=\"%s\"", fileName);
           response.setHeader(headerKey, headerValue);

      
		
     
        
       
         
OutputStream outStream = response.getOutputStream();
	  byte[] buffer = new byte[BUFFER_SIZE];
     int bytesRead = -1;
      
     while ((bytesRead = inputstream.read(buffer)) != -1) {
         outStream.write(buffer, 0, bytesRead);
     }
   
     inputstream.close();
     outStream.close();  
    
 } 
		
	}


