package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.CourseDAO;

/**
 * Servlet implementation class ListCourseAction
 */
@WebServlet("/ListCourseAction")
public class ListCourseAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCourseAction() {
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
		CourseDAO courseDAO = new CourseDAO();
		
		if(request.getParameter("action").equals("Edit"))
		{
			String course_id = request.getParameter("selectedcourse");
			if (course_id != null)
			{
				request.setAttribute("course", courseDAO.listcoursebyId(course_id));
				forward = "EditCourse.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("courseList", courseDAO.listCourse());
				forward = "ListCourse.jsp";
			}
		}
		else if(request.getParameter("action").equals("Delete"))
		{
			String[] course_id = request.getParameterValues("selectedcourse");
			if (course_id != null)
			{
				for (int i = 0; i < course_id.length; i++)
				{
					courseDAO.delete(course_id[i]);
				}
				request.setAttribute("courseList", courseDAO.listCourse());
				forward = "ListCourse.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("courseList", courseDAO.listCourse());
				forward = "ListCourse.jsp";
			}
		}
		else if(request.getParameter("action").equals("Go To Previous Page"))
		{
			forward = "ListCourseOptions.jsp";			
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}

}
