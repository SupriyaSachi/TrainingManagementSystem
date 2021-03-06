package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.CourseDAO;
import trainingplan.course.dao.TrainerDAO;

/**
 * Servlet implementation class ListTrainerOptionsAction
 */
@WebServlet("/ListTrainerOptionsAction")
public class ListTrainerOptionsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTrainerOptionsAction() {
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
		if ((request.getParameter("action")).equals("Register Trainer"))
		{
			CourseDAO courseDAO = new CourseDAO();
			request.setAttribute("courseList", courseDAO.listCourse());
			RequestDispatcher rd = request.getRequestDispatcher("RegisterTrainer.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("List Trainer"))
		{
			TrainerDAO trainerDAO = new TrainerDAO();
			request.setAttribute("trainerList", trainerDAO.listTrainer());
			request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
			RequestDispatcher rd = request.getRequestDispatcher("ListTrainer.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Go To Home"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
		}
	}

}
