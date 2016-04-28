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

/**
 * Servlet implementation class ListStudentAction
 */
@WebServlet("/ListStudentAction")
public class ListStudentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListStudentAction() {
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
		if(request.getParameter("action").equals("Add Another Course"))
		{
			StudentDAO studentDAO = new StudentDAO();
			String studentid = request.getParameter("selectedstudent");
		//	int StudentId = Integer.parseInt(request.getParameter("StudentId"));
			if (studentid != null)
			{
				//int StudentId = Integer.parseInt(studentid);
				CourseDAO courseDAO = new CourseDAO();
				request.setAttribute("courseList", courseDAO.listCourse());
				request.setAttribute("student", studentDAO.listStudentbyId(studentid));
				forward = "AddAnotherCourseToStudent.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("studentList", studentDAO.listStudent());
				forward = "ListStudent.jsp";
			}
		}
		else if(request.getParameter("action").equals("Go To Previous Page"))
		{
			forward = "ListStudentOptions.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}

}
