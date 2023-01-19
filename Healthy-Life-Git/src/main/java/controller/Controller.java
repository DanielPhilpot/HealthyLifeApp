package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.login;

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
		// Check what action the user has selected...
		String action = request.getPathInfo();
		System.out.println("action is " + action);
		
		HttpSession session = request.getSession();
		
		if (action.equals("/login")) {
			
			login login = new login();
			
			boolean isValid = login.validateUser(request.getParameter("username"), request.getParameter("password"));
			
			if(isValid) {
				
				session.setAttribute("username", request.getParameter("username"));			
				response.sendRedirect(url + "welcome.jsp");
				
			} else {
				
				response.sendRedirect(url + "login.jsp");
				
				//TODO add error message
				
			}
			
		} else if(action.equals("/logout")) {
						
			session.setAttribute("username", null);
			
			session.setAttribute("sex", null);
			
			response.sendRedirect(url + "logout.jsp");
			
		} else if(action.equals("/signup")) {
					
			session.setAttribute("username", request.getParameter("username"));
			
			session.setAttribute("sex", request.getParameter("sex"));
			
			response.sendRedirect(url + "welcome.jsp");
			
		} else if(action.equals("/addTarget")) {
			
			//write code
			response.sendRedirect(url + "charts&Progress.jsp");
			
		} else if(action.equals("/recordMeal")) {
			
			//write code
			response.sendRedirect(url + "mealHistory.jsp");
			
		} else if(action.equals("/setDietReq")) {
			
			//write code
			response.sendRedirect(url + "foodSettings.jsp");
			
		} else if(action.equals("/addScheduleItem")) {
			
			//write code
			response.sendRedirect(url + "scheduleBuilder.jsp");
			
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
