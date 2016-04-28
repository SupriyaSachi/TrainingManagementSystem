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

import trainingplan.course.dao.StudentDAO;
import trainingplan.course.domain.Student;

/**
 * Servlet implementation class EditStudentBatchNotAllocatedListAction
 */
@WebServlet("/EditStudentBatchNotAllocatedListAction")
public class EditStudentBatchNotAllocatedListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudentBatchNotAllocatedListAction() {
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
		if (request.getParameter("action").equals("Save"))
		{
			//int StudentId = Integer.parseInt(request.getParameter("StudentId"));
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
			String CourseId = request.getParameter("CourseId");
			String CourseTitle = request.getParameter("CourseTitle");
			String BatchAllocationStatus = request.getParameter("BatchAllocationStatus");
			
			
			if(StudentId != null && StudentFirstName != null && StudentLastName != null &&
			   Gender != null && DateOfBirth != null &&
			   StudentMobileNo != null && ParentMobileNo != null && AltTelphNo != null && Email != null &&
			   StudentICno != null && ParentICno != null && CourseId != null && CourseTitle != null &&
			  BatchAllocationStatus != null)
			{				
					try {
						BirthDate = (Date) sdf.parse(DateOfBirth);
					} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					}
					
					Student student = new Student(StudentId, StudentFirstName, StudentLastName, Gender, BirthDate, StudentMobileNo, 
												   ParentMobileNo, AltTelphNo, Email, StudentICno, ParentICno, CourseTitle, BatchAllocationStatus);
					StudentDAO studentDAO = new StudentDAO();
					studentDAO.update(student);
				//	BatchDAO batchDAO = new BatchDAO();
					//batchDAO.update(student);
					request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("No", "NotStarted"));
					RequestDispatcher rd = request.getRequestDispatcher("BatchNotAllocatedStudentList.jsp");  /*Batch not allocated Student list*/
					rd.forward(request, response);
			}
			else if (StudentId != null)
			{
			//	int student_id = Integer.parseInt(Student_Id);
				StudentDAO studentDAO = new StudentDAO();
				request.setAttribute("ErrorMessage", "Invalid Empty Fields or No Selection Of Fields");
				request.setAttribute("student", studentDAO.listStudentbyId(StudentId));
				RequestDispatcher rd = request.getRequestDispatcher("EditStudentBatchNotAllocated.jsp");
				rd.forward(request, response);
			}
	}
	if (request.getParameter("action").equals("Cancel"))
	{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchAllocatedOrNotStudentList("No", "NotStarted"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchNotAllocatedStudentList.jsp");  /*Batch not allocated Student list*/
			rd.forward(request, response);
	}

	}

}
