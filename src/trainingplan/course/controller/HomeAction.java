package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.CourseDAO;
import trainingplan.course.dao.StudentDAO;
import trainingplan.course.dao.TrainerDAO;


/**
 * Servlet implementation class HomeAction
 */
@WebServlet("/HomeAction")
public class HomeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeAction() {
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
		if ((request.getParameter("action")).equals("Student"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("ListStudentOptions.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Trainer"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("ListTrainerOptions.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Course"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("ListCourseOptions.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Batch"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("ListBatchOptions.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Training Plan Report"))
		{
			StudentDAO studentDAO = new StudentDAO();
			TrainerDAO trainerDAO = new TrainerDAO();
			CourseDAO courseDAO = new CourseDAO();
			request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("No", "NotStarted"));
			request.setAttribute("studentList1", studentDAO.BatchCompletedStudentList("Yes", "Completed"));
			request.setAttribute("studentList2", studentDAO.BatchAllocatedOrNotStudentList("Yes", "Ongoing"));
			request.setAttribute("trainerList", trainerDAO.listTrainer());
			request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
			request.setAttribute("courseList", courseDAO.listCourse());
			RequestDispatcher rd = request.getRequestDispatcher("BatchPlanner.jsp");
			
			rd.forward(request, response);
		}
	}

}
