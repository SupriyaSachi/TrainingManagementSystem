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
 * Servlet implementation class ListStudentOptionsAction
 */
@WebServlet("/ListStudentOptionsAction")
public class ListStudentOptionsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListStudentOptionsAction() {
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
		if ((request.getParameter("action")).equals("Register Student"))
		{
			CourseDAO courseDAO = new CourseDAO();
			request.setAttribute("courseList", courseDAO.listCourse());
			RequestDispatcher rd = request.getRequestDispatcher("RegisterStudent.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("List Of All Students"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.listStudent());
			RequestDispatcher rd = request.getRequestDispatcher("ListStudent.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Batch Not Allocated Students List"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("No", "NotStarted")); /*BatchNotAllocatedStudentList*/
			RequestDispatcher rd = request.getRequestDispatcher("BatchNotAllocatedStudentList.jsp");  /*Batch not allocated Student list*/
			rd.forward(request, response);
		}
		if ((request.getParameter("action")).equals("Batch Allocated Students List"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("Yes", "Ongoing"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchAllocatedStudentList.jsp");
			rd.forward(request, response);
		}
		if ((request.getParameter("action")).equals("Batch Halted Students List"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchHaltedStudentList("Yes", "Halt"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchHaltedStudentList.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Batch Completed Students List"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchCompletedStudentList("Yes", "Completed"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchCompletedStudentList.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Go To Home"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
		}
	}

}
