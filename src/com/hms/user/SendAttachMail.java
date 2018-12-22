package com.hms.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendAttachMail
 */
@WebServlet("/SendAttachMail")
public class SendAttachMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private String host;
	    private String port;
	    private String user;
	    private String pass;
	 
	    public void init() {
	        // reads SMTP server setting from web.xml file
	        ServletContext context = getServletContext();
	        host = context.getInitParameter("host");
	        port = context.getInitParameter("port");
	        user = context.getInitParameter("user");
	        pass = context.getInitParameter("pass");
	    }
 
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String email= request.getParameter("email");
		
	//Giving the image path for sending the image
	       String attachFiles = "D:/java/NewProject/EverGreenHospitals/images/hospital_info.pdf";
	       
			String recipient = email;
	        String subject = "Hospital info pdf";
	        String content = "You will get a call shortly and thank you for contacting us";
	 
	        try {
	           EmailAttach.sendEmailWithAttachments(host, port, user, pass, recipient,
	                subject, content, attachFiles);
	         //Sending the request using request dispatcher
	           request.getRequestDispatcher("welcome.jsp").forward(request, response); 
	            
	        } catch (Exception ex) {
	        	//Sending the request using request dispatcher
	        	request.getRequestDispatcher("welcome.jsp").forward(request, response); 
	        	ex.printStackTrace();
	        }
	
	}

}
