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
import trainingplan.course.dao.StudentDAO;
import trainingplan.course.dao.TrainerDAO;
import trainingplan.course.domain.Batch;
import trainingplan.course.domain.Course;
import trainingplan.course.domain.Student;
import trainingplan.course.domain.Trainer;

/**
 * Servlet implementation class ResumeBatchFromHaltAction
 */
@WebServlet("/ResumeBatchFromHaltAction")
public class ResumeBatchFromHaltAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeBatchFromHaltAction() {
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
		BatchDAO batchDAO = new BatchDAO();
		if (request.getParameter("action").equals("Save"))
		{
			String BatchId = request.getParameter("BatchId");
			String CourseName = request.getParameter("CourseName");
		//	String selected = request.getParameter("selected");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date StartDate = null, EndDate = null;
			String  BatchStartDate = request.getParameter("BatchStartDate");
			String  BatchEndDate = request.getParameter("BatchEndDate");
			String  BatchStatus = request.getParameter("BatchStatus");
			String TrainerId = request.getParameter("TrainerId");
			
			if (BatchId != null && CourseName != null &&
				BatchStartDate != null && BatchEndDate != null &&
				BatchStatus != null )
			{
				try {
					StartDate = (Date) sdf.parse(BatchStartDate);
					EndDate = (Date) sdf.parse(BatchEndDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				CourseDAO courseDAO = new CourseDAO();
				StudentDAO studentDAO = new StudentDAO();
				TrainerDAO trainerDAO = new TrainerDAO();
			    String courseid = courseDAO.getcourseId(CourseName);
				Course course = new Course(courseid, CourseName);
				Trainer trainer = new Trainer();
				trainer.setTrainerId(TrainerId);
				Batch batch = new Batch(BatchId, StartDate, EndDate, BatchStatus, trainer, course);
			/*	if (BatchStatus.equals("Completed"))
				{
					studentDAO.updateBatchDetails(batch);
					student = studentDAO.updateTrainerDetails(batch);
					trainerDAO.updateTrainerStatus(student);
					
				}*/
				batchDAO.update(batch);
				if (BatchStatus.equals("Ongoing"))
				{
					Student student = new Student();
					student = studentDAO.listStudentsToUpdateBatchStatus(batch, "Occupied");
					trainerDAO.updateTrainerStatus(student);
				}
				else if (BatchStatus.equals("Completed"))
				{
					Student student = new Student();
					student = studentDAO.listStudentsToUpdateBatchStatus(batch, "Free");
					trainerDAO.updateTrainerStatus(student);
				}
				
				request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
				request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
				request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
				request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
				RequestDispatcher rd = request.getRequestDispatcher("ListBatch.jsp");
				rd.forward(request, response);
			}
			else
			{
				if (BatchId != null)
				{
					request.setAttribute("ErrorMessage", "Invalid Empty Fields or No Selection Of Fields");
					request.setAttribute("batch", batchDAO.listBatchById(BatchId));
					RequestDispatcher rd = request.getRequestDispatcher("EditBatch.jsp");
					rd.forward(request, response);
				}
			}
		}
		else if (request.getParameter("action").equals("Go To Previous Page"))
		{
			request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
			request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
			request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
			request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
			RequestDispatcher rd = request.getRequestDispatcher("ListBatch.jsp");
			rd.forward(request, response);
		}

	}

}
