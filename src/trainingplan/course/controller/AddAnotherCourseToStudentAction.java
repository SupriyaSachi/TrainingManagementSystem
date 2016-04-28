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
import trainingplan.course.dao.StudentDAO;
import trainingplan.course.domain.Student;

/**
 * Servlet implementation class AddAnotherCourseToStudentAction
 */
@WebServlet("/AddAnotherCourseToStudentAction")
public class AddAnotherCourseToStudentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAnotherCourseToStudentAction() {
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
		if ((request.getParameter("action")).equals("Save"))
		{
			String StudentId = request.getParameter("StudentId");
			String StudentFirstName = request.getParameter("StudentFirstName");
			String StudentLastName = request.getParameter("StudentLastName");
			String Gender = request.getParameter("Gender");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date BirthDate = null;
			String DateOfBirth = request.getParameter("DateOfBirth");
			String StudentMobileNo = request.getParameter("StudentMobileNo");
			String ParentMobileNo = request.getParameter("ParentMobileNo");
			String AltTelphNo = request.getParameter("AltTelphNo");
			String Email = request.getParameter("Email");
			String StudentICno = request.getParameter("StudentICno");
			String ParentICno = request.getParameter("ParentICno");
			String CourseTitle = request.getParameter("CourseName");
			Date  CourseStartDate = null, CourseEndDate = null;
			String PrefCourseStartDate = request.getParameter("PrefCourseStartDate");
			String PrefCourseEndDate = request.getParameter("PrefCourseEndDate");
			String BatchAllocationStatus = request.getParameter("BatchAllocationStatus");
			String Findaboutus = request.getParameter("Findaboutus");
			String Reason = request.getParameter("Reason");
		
			if(StudentId != null && StudentFirstName != null && StudentLastName != null &&
			   Gender != null && DateOfBirth != null &&
			   StudentMobileNo != null && ParentMobileNo != null && AltTelphNo != null && Email != null &&
			   StudentICno != null && ParentICno != null && CourseTitle != null &&
			   PrefCourseStartDate != null && PrefCourseEndDate != null && BatchAllocationStatus != null &&
			   Findaboutus != null)
			{			
				if ((Findaboutus.equals("Others")) && (Reason == null))
				{
					request.setAttribute("ErrorMessage", "Invalid Empty Fields");
					CourseDAO courseDAO = new CourseDAO();
					request.setAttribute("courseList", courseDAO.listCourse());
					RequestDispatcher rd = request.getRequestDispatcher("AddAnotherCourseToStudent.jsp");
					rd.forward(request, response);
				}
				else
				{
					System.out.println("RUTVA");
					try {
						BirthDate = (Date) sdf.parse(DateOfBirth);
						CourseStartDate = (Date) sdf.parse(PrefCourseStartDate);
						CourseEndDate = (Date) sdf.parse(PrefCourseEndDate);
					} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					}
					Student student = new Student(StudentId, StudentFirstName, StudentLastName, Gender, BirthDate, StudentMobileNo, 
												   ParentMobileNo, AltTelphNo, Email, StudentICno, ParentICno, CourseTitle,
												   CourseStartDate, CourseEndDate, BatchAllocationStatus, Findaboutus, Reason);
					StudentDAO studentDAO = new StudentDAO();
					studentDAO.save(student);
					RequestDispatcher rd = request.getRequestDispatcher("SaveSuccessPage.jsp");
					rd.forward(request, response);
				}
			}
			else
			{
				if (StudentId != null)
				{	
					StudentDAO studentDAO = new StudentDAO();
					request.setAttribute("ErrorMessage", "Invalid Empty Fields");
					request.setAttribute("studentList", studentDAO.listStudent());
					RequestDispatcher rd = request.getRequestDispatcher("ListStudent.jsp");
					rd.forward(request, response);
				}
			}
		}
		else if ((request.getParameter("action")).equals("Go To Previous Page"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.listStudent());
			RequestDispatcher rd = request.getRequestDispatcher("ListStudent.jsp");
			rd.forward(request, response);
		}	

	}

}
