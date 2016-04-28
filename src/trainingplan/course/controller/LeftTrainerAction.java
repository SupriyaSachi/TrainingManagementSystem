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
import trainingplan.course.domain.Trainer;

/**
 * Servlet implementation class LeftTrainerAction
 */
@WebServlet("/LeftTrainerAction")
public class LeftTrainerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeftTrainerAction() {
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
		TrainerDAO trainerDAO = new TrainerDAO();
		
		if (request.getParameter("action").equals("Save"))
		{
			String TrainerId = request.getParameter("TrainerId");
			String TrainerFirstName = request.getParameter("TrainerFirstName");
			String TrainerLastName = request.getParameter("TrainerLastName");
			String Gender = request.getParameter("Gender");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date BirthDate = null, JoiningDate = null, RelievingDate = null;
			String DateOfBirth = request.getParameter("DateOfBirth");
			String MobileNo = request.getParameter("MobileNo");
			String AltTelphNo = request.getParameter("AltTelphNo");
			String Email = request.getParameter("Email");
			String TrainerICno = request.getParameter("TrainerICno");
			String Availability = request.getParameter("Availability");
			String TrainerJoiningDate = request.getParameter("DateOfJoining");
			String TrainerRelievingDate = request.getParameter("DateOfRelieving");
			String[] TrainerSpecialization = request.getParameterValues("TrainerSpecialization");
			String TrainerWorkStatus = request.getParameter("TrainerWorkStatus");
			String TrainerStatus = request.getParameter("TrainerStatus");
			
			if(TrainerId != null && TrainerFirstName != null &&
			   TrainerLastName != null && Gender != null && DateOfBirth != null &&
			   MobileNo != null && AltTelphNo != null && Email != null &&
			   TrainerICno != null && Availability != null && TrainerSpecialization != null
			   && TrainerStatus != null && TrainerJoiningDate != null && TrainerRelievingDate != null 
			   && TrainerWorkStatus != null)
			{
				try {
					BirthDate = (Date) sdf.parse(DateOfBirth);
					JoiningDate = (Date) sdf.parse(TrainerJoiningDate);
					RelievingDate = (Date) sdf.parse(TrainerRelievingDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				BatchDAO batchDAO = new BatchDAO();
				StudentDAO studentDAO = new StudentDAO();
				Batch batch = new Batch();
				
				if ((TrainerStatus.equals("Occupied")) && (TrainerWorkStatus.equals("Left")))
				{
					TrainerStatus = "Free";					
				}
				Trainer trainer = new Trainer(TrainerId, TrainerFirstName, TrainerLastName, Gender, BirthDate, MobileNo, 
						  AltTelphNo, Email, TrainerICno, Availability, TrainerSpecialization, 
						  TrainerStatus, JoiningDate, RelievingDate, TrainerWorkStatus);
				trainerDAO.updateTrainerDetails(trainer);
			
				
				if ((TrainerStatus.equals("Free")) && (TrainerWorkStatus.equals("Left")))
				{
					batch = batchDAO.listBatchByTrainerId(TrainerId);
					if (batch != null)
					{
						batch.setBatchStatus("Halt");
						batchDAO.update(batch);	
					    studentDAO.listBatchStatusForEachStudent(batch);
					}
				}
				request.setAttribute("trainerList", trainerDAO.listTrainer());
				request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
				forward = "ListTrainer.jsp";
			}
			else if (TrainerId != null)
			{
				request.setAttribute("ErrorMessage", "Invalid Empty Fields or No Selection Of Fields");
				CourseDAO courseDAO = new CourseDAO();
				request.setAttribute("courseList", courseDAO.listCourse());
				request.setAttribute("trainer", trainerDAO.listtrainerbyId(TrainerId));
				forward = "LeftTrainer.jsp";
			}
		}
		else if (request.getParameter("action").equals("Go To Previous Page"))
		{
			request.setAttribute("trainerList", trainerDAO.listTrainer());
			request.setAttribute("trainerList1", trainerDAO.listTrainerWhereTrainerWorkStatusIsLeft());
			forward = "ListTrainer.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

}
