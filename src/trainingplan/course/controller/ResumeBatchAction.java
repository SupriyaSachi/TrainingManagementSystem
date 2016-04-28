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

import trainingplan.course.domain.Trainer;

/**
 * Servlet implementation class ResumeBatchAction
 */
@WebServlet("/ResumeBatchAction")
public class ResumeBatchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeBatchAction() {
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
			
		String  BatchStatus = request.getParameter("BatchStatus");
		if (BatchStatus.equals("Ongoing"))
		{
			BatchDAO batchDAO = new BatchDAO();
			String BatchId = request.getParameter("BatchId");
			String CourseName = request.getParameter("CourseName");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date StartDate = null, EndDate = null;
			String  BatchStartDate = request.getParameter("BatchStartDate");
			String  BatchEndDate = request.getParameter("BatchEndDate");
			String TrainerId = request.getParameter("TrainerId");
			
			if (BatchId != null && CourseName != null &&
				BatchStartDate != null && BatchEndDate != null &&
				BatchStatus != null && TrainerId != null)
			{
				try {
					StartDate = (Date) sdf.parse(BatchStartDate);
					EndDate = (Date) sdf.parse(BatchEndDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				CourseDAO courseDAO = new CourseDAO();
				String courseid = courseDAO.getcourseId(CourseName);
				Course course = new Course(courseid, CourseName);
				Trainer trainer = new Trainer();
				trainer.setTrainerId(TrainerId);
				Batch batch = new Batch(BatchId, StartDate, EndDate, BatchStatus, trainer, course);
				request.setAttribute("batch", batchDAO.ResumeBatch(batch));
				RequestDispatcher rd = request.getRequestDispatcher("ResumeBatchFromHalt.jsp");
				rd.forward(request, response);
		}
		}
		else if (BatchStatus.equals("Completed"))
		{
			BatchDAO batchDAO = new BatchDAO();
			if (request.getParameter("BatchId") != null)
			{
				request.setAttribute("batch", batchDAO.listBatchById(request.getParameter("BatchId")));	
				RequestDispatcher rd = request.getRequestDispatcher("EditBatch.jsp");
				rd.forward(request, response);  
			}
		}
		else if (request.getParameter("action").equals("Go To Previous Page"))
		{
			BatchDAO batchDAO = new BatchDAO();
			request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
			request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
			request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
			request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
			RequestDispatcher rd = request.getRequestDispatcher("ListBatch.jsp");
			rd.forward(request, response);
		}
		else if (request.getParameter("action").equals("Save"))
		{
			BatchDAO batchDAO = new BatchDAO();
			request.setAttribute("ErrorMessage", "Please select the Batch Status");
			request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
			request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
			request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
			request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
			RequestDispatcher rd = request.getRequestDispatcher("ListBatch.jsp");
			rd.forward(request, response);
		}
	}
}
