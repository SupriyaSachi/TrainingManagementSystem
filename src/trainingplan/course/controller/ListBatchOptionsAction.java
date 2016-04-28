package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.BatchDAO;
import trainingplan.course.dao.CourseDAO;

/**
 * Servlet implementation class ListBatchOptionsAction
 */
@WebServlet("/ListBatchOptionsAction")
public class ListBatchOptionsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBatchOptionsAction() {
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
		if ((request.getParameter("action")).equals("Plan Batch"))
		{
			CourseDAO courseDAO = new CourseDAO();
			request.setAttribute("courseList", courseDAO.listCourse());
			RequestDispatcher rd = request.getRequestDispatcher("PlanBatch.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("List Batch"))
		{
			BatchDAO batchDAO = new BatchDAO();
			request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
			request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
			request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
			request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
			RequestDispatcher rd = request.getRequestDispatcher("ListBatch.jsp");
			rd.forward(request, response);
		}
		else if ((request.getParameter("action")).equals("Go To Home"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
		}

	}

}
