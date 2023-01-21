package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

/**
 * Servlet implementation class Controller
 */
@WebServlet(urlPatterns = "/controller/*")

public class Controller extends HttpServlet {
	
	private String url = "http://localhost:8080/Healthy-Life-Git/";
	private User currentUser; 

	public void init() {     
        // TODO Write Constructor
    }

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Check what action the user has selected...
		String action = request.getPathInfo();
		System.out.println("action is " + action);
		
		HttpSession session = request.getSession();
		currentUser = (User) session.getAttribute("user");
		
		if (action.equals("/login")) {
			
			//currentUser = (User) session.getAttribute("user");
			
			boolean isValid = currentUser.validateUser(request.getParameter("username"), request.getParameter("password"));
			
			if(isValid) {
				
				session.setAttribute("username", request.getParameter("username"));		
				session.setAttribute("sex", currentUser.getSex());
				response.sendRedirect(url + "welcome.jsp");
				
			} else {
				
				response.sendRedirect(url + "login.jsp");
				
				//TODO add error message
				
			}
			
		} else if(action.equals("/logout")) {
						
			
			session.setAttribute("username", null);
			session.setAttribute("sex", null);
			currentUser.logOut();
			response.sendRedirect(url + "logout.jsp");
			
		} else if(action.equals("/signup")) {
					
			String signUp = currentUser.signUp(request.getParameter("username"), request.getParameter("password"), request.getParameter("sex"));				
			System.out.println(signUp);
			
			if (signUp == "Sucess") {
				session.setAttribute("username", currentUser.getUsername());
				session.setAttribute("sex", currentUser.getSex());
				
				response.sendRedirect(url + "welcome.jsp");
			} else {
				response.sendRedirect(url + "signUp.jsp");
			}
			
		} else if(action.equals("/addTarget")) {
			
			//write code
			response.sendRedirect(url + "charts&Progress.jsp");
			
		} else if(action.equals("/recordMeal")) {
			
			//write code
			response.sendRedirect(url + "mealHistory.jsp");
			
		} else if(action.equals("/setDietReq")) {
			
			if(currentUser.getUsername() != null) {
				String V; if(request.getParameter("Vegetarian") != null){V = "V,";} else {V="";};
				String VV; if(request.getParameter("Vegan") != null){VV = "VV,";}else{VV = "";};
				String L; if(request.getParameter("LacInt") != null){L = "L,";}else{L = "";};
				String G; if(request.getParameter("GlucInt") != null){G = "G,";}else{G = "";};
				String N; if(request.getParameter("NutAlg") != null){N = "N,";}else{N = "";};
				String K; if(request.getParameter("Kosher") != null){K = "K,";}else{K = "";};
				String H; if(request.getParameter("Halal") != null){H = "H";}else{H = "";};
			
				currentUser.submitDietReqs(V+VV+L+G+N+K+H);	
				response.sendRedirect(url + "foodSettings.jsp");
				
			} else {
				response.sendRedirect(url + "foodSettings.jsp");
			}
		} else if(action.equals("/setDistance")) {
			
			if(currentUser.getUsername() != null) {
				currentUser.setGymDistance(request.getParameter("gyDiHR"), request.getParameter("gyDiMi"));
				currentUser.setParkDistance(request.getParameter("pkDiHR"), request.getParameter("pkDiMi"));
				
				response.sendRedirect(url + "exerciseSettings.jsp");
				
			} else {
			
				response.sendRedirect(url + "exerciseSettings.jsp");
			}
			
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
