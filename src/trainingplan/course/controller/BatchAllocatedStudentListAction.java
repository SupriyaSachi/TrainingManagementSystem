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
 * Servlet implementation class BatchAllocatedStudentListAction
 */
@WebServlet("/BatchAllocatedStudentListAction")
public class BatchAllocatedStudentListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchAllocatedStudentListAction() {
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
		
		if ((request.getParameter("action")).equals("Edit"))
		{
		//	int student_id = Integer.parseInt(request.getParameter("selectedstudent"));
			String student_id = request.getParameter("selectedstudent");
			if (student_id != null)
			{
				request.setAttribute("student", studentDAO.listStudentbyId(student_id));
				forward = "EditStudentBatchtAllocated.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("Yes", "Ongoing"));
				forward = "BatchAllocatedStudentList.jsp";
			}
		}
		else if ((request.getParameter("action")).equals("Delete"))
		{
			String[] student_id = request.getParameterValues("selectedstudent");
			if (student_id != null)
			{
				/*int[] student_id = new int[student_id1.length];
				for (int i = 0; i < student_id1.length; i++)
				{
					student_id[i] = Integer.parseInt(student_id1[i]);
				}*/
			
				for (int i = 0; i < student_id.length; i++)
				{
					studentDAO.delete(student_id[i]);
				}
				request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("Yes", "Ongoing"));
				forward = "BatchAllocatedStudentList.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("Yes", "Ongoing"));
				forward = "BatchAllocatedStudentList.jsp";
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
