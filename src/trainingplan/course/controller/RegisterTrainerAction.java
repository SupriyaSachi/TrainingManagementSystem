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
import trainingplan.course.dao.TrainerDAO;
import trainingplan.course.domain.Trainer;

/**
 * Servlet implementation class RegisterTrainerAction
 */
@WebServlet("/RegisterTrainerAction")
public class RegisterTrainerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterTrainerAction() {
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
			String TrainerId = request.getParameter("TrainerId");
			String TrainerFirstName = request.getParameter("TrainerFirstName");
			String TrainerLastName = request.getParameter("TrainerLastName");
			String Gender = request.getParameter("Gender");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date BirthDate = null, JoiningDate = null;
			String DateOfBirth = request.getParameter("DateOfBirth");
			String MobileNo = request.getParameter("MobileNo");
			String AltTelphNo = request.getParameter("AltTelphNo");
			String Email = request.getParameter("Email");
			String TrainerICno = request.getParameter("TrainerICno");
			String Availability = request.getParameter("Availability");
			String TrainerJoiningDate = request.getParameter("DateOfJoining");
			String TrainerWorkStatus = request.getParameter("TrainerWorkStatus");
			String[] TrainerSpecialization = request.getParameterValues("TrainerSpecialization");
			
			String TrainerStatus = request.getParameter("TrainerStatus");
		
			
			if(TrainerId != null && TrainerFirstName != null &&
			   TrainerLastName != null && Gender != null && DateOfBirth != null &&
			   MobileNo != null && AltTelphNo != null && Email != null &&
			   TrainerICno != null && Availability != null && TrainerSpecialization != null &&
			   TrainerStatus != null && TrainerJoiningDate != null && TrainerWorkStatus != null)
			{
				try {
					BirthDate = (Date) sdf.parse(DateOfBirth);
					JoiningDate = (Date) sdf.parse(TrainerJoiningDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				Trainer trainer = new Trainer(TrainerId, TrainerFirstName, TrainerLastName, Gender, BirthDate, MobileNo, 
											  AltTelphNo, Email, TrainerICno, Availability, TrainerSpecialization, 
											  TrainerStatus, JoiningDate, TrainerWorkStatus);
				TrainerDAO trainerDAO = new TrainerDAO();
				trainerDAO.save(trainer);
				RequestDispatcher rd = request.getRequestDispatcher("SaveSuccessPage.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("ErrorMessage", "Invalid Empty Fields");
				CourseDAO courseDAO = new CourseDAO();
				request.setAttribute("courseList", courseDAO.listCourse());
				RequestDispatcher rd = request.getRequestDispatcher("RegisterTrainer.jsp");
				rd.forward(request, response);
			}
		}
		else if ((request.getParameter("action")).equals("Go To Previous Page"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("ListTrainerOptions.jsp");
			rd.forward(request, response);
		}	
	}

}
