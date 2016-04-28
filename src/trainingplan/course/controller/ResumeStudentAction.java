package trainingplan.course.controller;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import trainingplan.course.dao.StudentDAO;


/**
 * Servlet implementation class ResumeStudentAction
 */
@WebServlet("/ResumeStudentAction")
public class ResumeStudentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeStudentAction() {
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
		String forward;
		String  BatchStatus = request.getParameter("BatchStatus");
		String StudentId = request.getParameter("StudentId");
		if (BatchStatus.equals("Ongoing") && StudentId != null)
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("student", studentDAO.ResumeStudentBatchHalted(StudentId));
			forward = "ResumeStudentBatchtHalted.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forward);
			rd.forward(request, response);
		}
		else if (BatchStatus.equals("Completed") && StudentId != null)
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("student", studentDAO.ResumeStudentBatchHalted(StudentId));
			forward = "StudentBatchCompletedFromHalted.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forward);
			rd.forward(request, response);
		}
		else if (request.getParameter("action").equals("Go To Previous Page"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchHaltedStudentList("Yes", "Halt"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchHaltedStudentList.jsp");
			rd.forward(request, response);
		}
		else if (request.getParameter("action").equals("Save"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("ErrorMessage", "Please select the Batch Status");
			request.setAttribute("studentList", studentDAO.BatchHaltedStudentList("Yes", "Halt"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchHaltedStudentList.jsp");
			rd.forward(request, response);
		}
		}

	

}
