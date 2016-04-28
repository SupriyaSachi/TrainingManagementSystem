package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.LogInAndPassDAO;
import trainingplan.course.domain.LogInAndPass;

/**
 * Servlet implementation class ForgotUsernameOrPasswordAction
 */
@WebServlet("/ForgotUsernameOrPasswordAction")
public class ForgotUsernameOrPasswordAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotUsernameOrPasswordAction() {
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
		String UserFirstName = request.getParameter("UserFirstName");
		String UserLastName = request.getParameter("UserLastName");
		String UserICNo = request.getParameter("UserICNo");
		String UserName = request.getParameter("UserName");
		String Passwd = request.getParameter("Passwd");
		String Password = request.getParameter("repasswd");
		
		if (request.getParameter("action").equals("Save"))
		{
			LogInAndPassDAO loginandpassDAO = null;
			LogInAndPass loginandpass = null;
			
			if (UserFirstName.isEmpty() && UserLastName.isEmpty() &&
					UserICNo.isEmpty() && UserName.isEmpty() && 
					Passwd.isEmpty()	&&  Password.isEmpty())
			{
				request.setAttribute("ErrorMessage", "Invalid Empty Fields");
				RequestDispatcher rd = request.getRequestDispatcher("ForgotUsernameOrPasswordAction.jsp");
				rd.forward(request, response);
			}
			else if (UserFirstName != null && UserLastName != null &&
				UserICNo != null && UserName != null && 
				Passwd != null	&&  Password != null)
			{
				loginandpassDAO = new LogInAndPassDAO();
				loginandpass = new LogInAndPass();
				if (Passwd.equals(Password))
				{
					loginandpass = loginandpassDAO.listUserLogInDetailsbyUsernricno(UserICNo);
					if (loginandpass != null)
					{
						loginandpass = new LogInAndPass(UserFirstName, UserLastName, UserICNo, UserName, Passwd);
						loginandpassDAO.update(loginandpass);
						RequestDispatcher rd = request.getRequestDispatcher("SaveSuccessLogDetails.jsp");
						rd.forward(request, response);
					}
					else
					{
						request.setAttribute("ErrorMessage", "User Account does not exist !!!");
						RequestDispatcher rd = request.getRequestDispatcher("ForgotUsernameOrPasswordAction.jsp");
						rd.forward(request, response);
					}
				}
				else 
				{
					request.setAttribute("ErrorMessage", "Incorrect Password");
					RequestDispatcher rd = request.getRequestDispatcher("ForgotUsernameOrPassword.jsp");
					rd.forward(request, response);
				}
			}
		}
		else if (request.getParameter("action").equals("Cancel"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("LogIn.jsp");
			rd.forward(request, response);
		}

	}

}
