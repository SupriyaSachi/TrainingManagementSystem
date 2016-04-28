package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import trainingplan.course.dao.LogInAndPassDAO;
import trainingplan.course.domain.LogInAndPass;

/**
 * Servlet implementation class LogInAction
 */
@WebServlet("/LogInAction")
public class LogInAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String LogInName = request.getParameter("LogInName");
		String Passwd = request.getParameter("Passwd");
		
		if (request.getParameter("action").equals("LogIn"))
		{
			if ((LogInName.isEmpty() && Passwd.isEmpty()) || ((LogInName != null) && (Passwd.isEmpty())) ||
				((LogInName.isEmpty()) && (Passwd != null)))
			{
				request.setAttribute("ErrorMessage", "Invalid Empty Fields");
				RequestDispatcher rd = request.getRequestDispatcher("LogIn.jsp");
				rd.forward(request,response);
			}
			else if ((LogInName != null) && (Passwd != null))
			{
				LogInAndPassDAO loginandpassDAO = new LogInAndPassDAO();
				LogInAndPass loginandpass = new LogInAndPass(LogInName, Passwd);
				LogInAndPass loginandpasswd = loginandpassDAO.listUserLogInDetailsbyUsernameandPasswd(loginandpass);
				if (loginandpasswd == null)
				{
					request.setAttribute("ErrorMessage", "Invalid Username or Password");
					RequestDispatcher rd = request.getRequestDispatcher("LogIn.jsp");
					rd.forward(request,response);
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
					HttpSession session = request.getSession(true);
					session.setAttribute("session_logname", LogInName);
					rd.forward(request,response);
				}
			}
			
		}
		else if (request.getParameter("action").equals("Sign Up"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("CreateNewUserAndPassword.jsp");
			rd.forward(request,response);
		}
		
	}

}
