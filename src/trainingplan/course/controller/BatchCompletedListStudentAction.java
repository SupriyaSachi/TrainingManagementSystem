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
 * Servlet implementation class BatchCompletedListStudentAction
 */
@WebServlet("/BatchCompletedListStudentAction")
public class BatchCompletedListStudentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchCompletedListStudentAction() {
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
		StudentDAO studentDAO = new StudentDAO();
		if ((request.getParameter("action")).equals("Delete"))
		{
			String[] student_id = request.getParameterValues("selectedstudent");
			if (student_id != null)
			{
				for (int i = 0; i < student_id.length; i++)
				{
					studentDAO.delete(student_id[i]);
				}
				request.setAttribute("studentList", studentDAO.BatchCompletedStudentList("Yes", "Completed"));
				forward = "BatchCompletedStudentList.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("studentList", studentDAO.BatchCompletedStudentList("Yes", "Completed"));
				forward = "BatchCompletedStudentList.jsp";
			}	
		}
		else if ((request.getParameter("action")).equals("Go To Previous Page"))
		{
			forward = "ListStudentOptions.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}

}
