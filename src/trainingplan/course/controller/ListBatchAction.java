package trainingplan.course.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import trainingplan.course.dao.BatchDAO;

/**
 * Servlet implementation class ListBatchAction
 */
@WebServlet("/ListBatchAction")
public class ListBatchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBatchAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 
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
		BatchDAO batchDAO = new BatchDAO();
		
		if(request.getParameter("action").equals("Edit"))
		{
			String batch_id = request.getParameter("selectedbatch");
			if (batch_id != null)
			{
				request.setAttribute("batch", batchDAO.listBatchById(batch_id));
				forward = "EditBatch.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
				request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
				request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
				request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
				forward = "ListBatch.jsp";
			}
		}
		else if(request.getParameter("action").equals("Resume Batch"))
		{
			String batch_id = request.getParameter("selectedbatch");
			if (batch_id != null)
			{
				request.setAttribute("batch", batchDAO.listBatchById(batch_id));
				forward = "ResumeBatch.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
				request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
				request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
				request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
				forward = "ListBatch.jsp";
			}
		}	
		else if(request.getParameter("action").equals("Delete"))
		{
			String[] batch_id = request.getParameterValues("selectedbatch");
			if (batch_id != null)
			{
				for (int i = 0; i < batch_id.length; i++)
				{
					batchDAO.delete(batch_id[i]);
				}
				request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
				request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
				request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
				request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
				forward = "ListBatch.jsp";
			}
			else
			{
				request.setAttribute("ErrorMessage", "Please select the row");
				request.setAttribute("batchList", batchDAO.listBatch("NotStarted"));
				request.setAttribute("batchList1", batchDAO.listBatch("Ongoing"));
				request.setAttribute("batchList3", batchDAO.listBatch("Halt"));
				request.setAttribute("batchList2", batchDAO.listBatch("Completed"));
				forward = "ListBatch.jsp";
			}
		}
		else if(request.getParameter("action").equals("Go To Previous Page"))
		{
			forward = "ListBatchOptions.jsp";			
		}
		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);

	}
	

}
