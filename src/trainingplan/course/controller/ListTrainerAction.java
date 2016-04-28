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
 * Servlet implementation class ListTrainerAction
 */
@WebServlet("/ListTrainerAction")
public class ListTrainerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTrainerAction() {
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
		String forward = null;
		TrainerDAO trainerDAO = new TrainerDAO();
		
		if(request.getParameter("action").equals("Edit"))
		{
			String trainer_id = request.getParameter("selectedtrainer");
			if (trainer_id != null)
			{
				CourseDAO courseDAO = new CourseDAO();
				request.setAttribute("courseList", courseDAO.listCourse());
				request.setAttribute("trainer", trainerDAO.listtrainerbyId(trainer_id));
				forward = "EditTrainer.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("trainerList", trainerDAO.listTrainer());
				request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
				forward = "ListTrainer.jsp";
			}
		}
		else if(request.getParameter("action").equals("Delete"))
		{
			String[] trainer_id = request.getParameterValues("selectedtrainer");
			if (trainer_id != null)
			{
				for (int i = 0; i < trainer_id.length; i++)
				{
					trainerDAO.delete(trainer_id[i]);
				}
				request.setAttribute("trainerList", trainerDAO.listTrainer());
				request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
				forward = "ListTrainer.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("trainerList", trainerDAO.listTrainer());
				request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
				forward = "ListTrainer.jsp";
			}
		}
		else if(request.getParameter("action").equals("Go To Previous Page"))
		{
			forward = "ListTrainerOptions.jsp";			
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

}
