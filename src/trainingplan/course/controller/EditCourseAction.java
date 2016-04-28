package trainingplan.course.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.CourseDAO;
import trainingplan.course.domain.Course;

/**
 * Servlet implementation class EditCourseAction
 */
@WebServlet("/EditCourseAction")
public class EditCourseAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCourseAction() {
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

		if (request.getParameter("action").equals("Save"))
		{
			String CourseId = request.getParameter("CourseId");
			String CourseName = request.getParameter("CourseName");
		//	String selected = request.getParameter("selected");
			String CourseSession = request.getParameter("CourseSession");
			String[] CourseConductingOn = request.getParameterValues("CourseConductingOn");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date StartDate = null, EndDate = null;
			String  CourseStartDate = request.getParameter("CourseStartDate");
			String  CourseEndDate = request.getParameter("CourseEndDate");
			
			if (CourseId != null && CourseName != null &&
					   CourseSession != null &&
					   CourseStartDate != null &&
					   CourseConductingOn != null && 
					   CourseEndDate != null)
			{
				try {
					StartDate = (Date) sdf.parse(CourseStartDate);
					EndDate = (Date) sdf.parse(CourseEndDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				Course course = new Course(CourseId, CourseName, CourseSession, CourseConductingOn, StartDate, EndDate);
				//courseDAO = new CourseDAO();
				courseDAO.update(course);
				request.setAttribute("courseList", courseDAO.listCourse());
				forward = "ListCourse.jsp";
			}
			else
			{
				if (CourseId != null)
				{
					request.setAttribute("ErrorMessage", "Invalid Empty Fields or No Selection Of Fields");
					request.setAttribute("course", courseDAO.listcoursebyId(CourseId));
					forward = "EditCourse.jsp";
				}
			}
		}
		else if (request.getParameter("action").equals("Go To Previous Page"))
		{
			request.setAttribute("courseList", courseDAO.listCourse());
			forward = "ListCourse.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}

}
