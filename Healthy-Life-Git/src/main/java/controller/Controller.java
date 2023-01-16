package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = "/controller/*")

public class Controller extends HttpServlet {
	
	private String url = "http://localhost:8080/Healthy-Life-Git/";

	public void init() {     
        // TODO Write Constructor
    }

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("A");
		// Check what action the user has selected...
		String action = request.getPathInfo();
		System.out.println("action is " + action);
				
		
		if (action.equals("/login")) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("username", request.getParameter("username"));
			
			response.sendRedirect(url + "welcome.jsp");
			
		} else if(action.equals("/logout")) {
			
			//write logout code 
			
		} else if(action.equals("/signup")) {
			
			//write code
			
		} else if(action.equals("/addTarget")) {
			
			//write code
			
		} else if(action.equals("/recordMeal")) {
			
			//write code
			
		} else if(action.equals("/setDietReq")) {
			
			//write code
			
		} else if(action.equals("/addScheduleItem")) {
			
			//write code
			
		}
			

	}
	
	
	
	
	
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
