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

import trainingplan.course.dao.BatchDAO;
import trainingplan.course.dao.CourseDAO;
import trainingplan.course.domain.Batch;
import trainingplan.course.domain.Course;

/**
 * Servlet implementation class PlanBatchAction
 */
@WebServlet("/PlanBatchAction")
public class PlanBatchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanBatchAction() {
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
			String BatchId = request.getParameter("BatchId");
			String CourseName = request.getParameter("CourseName");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date StartDate = null, EndDate = null;
			String  BatchStartDate = request.getParameter("BatchStartDate");
			String  BatchEndDate = request.getParameter("BatchEndDate");
			String BatchStatus = request.getParameter("BatchStatus");
			
		
			if (BatchId != null && CourseName != null &&
				BatchStartDate != null &&
				BatchEndDate != null && BatchStatus != null)
			{
				try {
					StartDate = (Date) sdf.parse(BatchStartDate);
					EndDate = (Date) sdf.parse(BatchEndDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				CourseDAO courseDAO = new CourseDAO();
				String CourseId = courseDAO.getcourseId(CourseName);
				Course course = new Course(CourseId, CourseName);
				Batch batch = new Batch(BatchId, StartDate, EndDate, BatchStatus, course);
			    BatchDAO batchDAO = new BatchDAO();
			    batchDAO.save(batch);
				RequestDispatcher rd = request.getRequestDispatcher("SaveSuccessPage.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("ErrorMessage", "Invalid Empty Fields");
				RequestDispatcher rd = request.getRequestDispatcher("PlanBatch.jsp");
				rd.forward(request, response);
			}
		}
		else if ((request.getParameter("action")).equals("Go To Previous Page"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("ListBatchOptions.jsp");
			rd.forward(request, response);
		}	  

	}

}
