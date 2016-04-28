package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.BatchDAO;
import trainingplan.course.dao.StudentDAO;
import trainingplan.course.dao.TrainerDAO;
import trainingplan.course.domain.Batch;
import trainingplan.course.domain.Student;
import trainingplan.course.domain.Trainer;

/**
 * Servlet implementation class ResumeStudentBatchHaltedAction
 */
@WebServlet("/ResumeStudentBatchHaltedAction")
public class ResumeStudentBatchHaltedAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResumeStudentBatchHaltedAction() {
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
			String StudentId = request.getParameter("StudentId");
			String StudentFirstName = request.getParameter("StudentFirstName");
			String StudentLastName = request.getParameter("StudentLastName");
			String StudentICno = request.getParameter("StudentICno");
			String BatchAllocationStatus = request.getParameter("BatchAllocationStatus");
			String BatchId = request.getParameter("BatchId");
			String CourseName = request.getParameter("CourseName");  
			String BatchStatus = request.getParameter("BatchStatus");
			System.out.println("StudentId: "+StudentId);
			System.out.println("StudentFirstName: "+StudentFirstName);
			System.out.println("StudentLastName: "+StudentLastName);
			System.out.println("StudentICno: "+StudentICno);
			System.out.println("BatchAllocationStatus: "+BatchAllocationStatus);
			System.out.println("BatchId: "+BatchId);
			System.out.println("BatchStatus: "+BatchStatus);
			System.out.println("Course Name: "+CourseName);
			String TrainerId = request.getParameter("TrainerId");
			
			if(StudentId != null && StudentFirstName != null && StudentLastName != null &&
		       StudentICno != null && BatchAllocationStatus != null && BatchId != null && 
			   BatchStatus != null && TrainerId != null)
			{		
							Batch batch = new Batch(BatchId, BatchStatus);
							Trainer trainer = null;
							if (BatchStatus.equals("Ongoing")) 
							{
								trainer = new Trainer(TrainerId, "Occupied"); 
							}
							
							Student student = new Student(StudentId, StudentFirstName, StudentLastName,
														  StudentICno, CourseName, BatchAllocationStatus, trainer, batch);
							StudentDAO studentDAO = new StudentDAO();
							BatchDAO batchDAO = new BatchDAO();
							TrainerDAO trainerDAO = new TrainerDAO();
							studentDAO.update(student);
							batchDAO.updateBatchStatus(student);
							trainerDAO.updateTrainerStatus(student);
							if (BatchStatus.equals("Ongoing")) 
							{
								batch.setTrainer(trainer);
								studentDAO.listStudentsToUpdateBatchStatus(batch, "Occupied"); 
							}
							request.setAttribute("studentList", studentDAO.BatchHaltedStudentList("Yes", "Halt"));
							RequestDispatcher rd = request.getRequestDispatcher("BatchHaltedStudentList.jsp");  /*Batch not allocated Student list*/
							rd.forward(request, response);
			}
			else
			{
				if (StudentId != null)
				{
					StudentDAO studentDAO = new StudentDAO();
					request.setAttribute("ErrorMessage", "Invalid Empty Fields or No Selection Of Fields");
					request.setAttribute("student", studentDAO.listStudentbyIdToAllocateBatch(StudentId));
					RequestDispatcher rd = request.getRequestDispatcher("ResumeStudentBatchtHalted.jsp");  /*Batch not allocated Student list*/
					rd.forward(request, response);
				}
			}
		}
		else if (request.getParameter("action").equals("Go To Previous Page"))
		{
			StudentDAO studentDAO = new StudentDAO();
			request.setAttribute("studentList", studentDAO.BatchHaltedStudentList("Yes", "Halt"));
			RequestDispatcher rd = request.getRequestDispatcher("BatchHaltedStudentList.jsp");  /*Batch halt Student list*/
			rd.forward(request, response);
		}

	}

}
