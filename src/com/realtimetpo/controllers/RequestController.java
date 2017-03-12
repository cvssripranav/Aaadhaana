package com.realtimetpo.controllers;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.realtimetpo.daos.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.realtimetpo.entities.*;


/**
 * Servlet implementation class MainController
 */
@WebServlet("/RequestController")
public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HashMap<String, Object> JSONROOT = new HashMap<String, Object>();

	private OperationsDao dao;
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestController() {
    	dao = new OperationsDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		List<Status> employeeList = new ArrayList<Status>();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		response.setContentType("application/json");
		
		
		String ids=request.getParameter("eid1");
		String sub=request.getParameter("subject");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;

		boolean success=false;
		if(ids!=null && sub!=null){
			success=dao.deleteRequest(ids,sub);
			if(success){
				rd = request.getRequestDispatcher("requests.jsp");
		        rd.include(request, response);
		        out.println("<div id='ok'><center><font color=green>Deleted Successfully</font></center></div>");

			}
			else{
				rd = request.getRequestDispatcher("requests.jsp");
		        rd.include(request, response);
		        out.println("<div id='ok'><center><font color=red>Please try again</font></center></div>");

			}
		}

//String searchs=request.getParameter("eid");
//String months=request.getParameter("dept");
//System.out.println(months);
//System.out.print(search);
//System.out.println("1 "+request.getParameter("months"));
		if (action != null) {
			try {
				if (action.equals("list")) {
					// Fetch Data from Student Table
					System.out.println("rrrrrrrrrrr");
					employeeList = dao.getAllRequests();
										// Return in the format required by jTable plugin
					JSONROOT.put("Result", "OK");
					System.out.println("rrrrrrrrrrr");

					JSONROOT.put("Records", employeeList);
System.out.println("ooofff");
					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT);

					response.getWriter().print(jsonArray);
				} else if ( action.equals("update")) {
					Status student = new Status();
					if (request.getParameter("rollId") != null) {
						String roll = request.getParameter("rollId");
						System.out.println("hii" + roll);
						student.setrollId(roll);
					}
					if (request.getParameter("name") != null) {
						String name = (request.getParameter("name"));
						student.setName(name);
					}

					if (request.getParameter("branch") != null) {
						String branch = (request.getParameter("branch"));
						student.setBranch(branch);
					}
					if (request.getParameter("subjects") != null) {
						String subjects= (request.getParameter("subjects"));
						student.setSubjects(subjects);
					}
					if (request.getParameter("batch") != null) {
						String batch=(request.getParameter("batch"));
						student.setBatch(batch);
					}
					if (request.getParameter("status") != null) {
						String status= (request.getParameter("status"));
						student.setStatus(status);
					}

										
					if (action.equals("update")) {
						// Update existing record
						dao.updateRequest(request.getParameter("rollId"),request.getParameter("subjects"),request.getParameter("status"));
					System.out.println(request.getParameter("rollId")+ request.getParameter("subjects")+request.getParameter("status"));
					}
					// Return in the format required by jTable plugin
					JSONROOT.put("Result", "OK");
					JSONROOT.put("Record", student);

					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT);
					response.getWriter().print(jsonArray);
					}
				 else if (action.equals("delete")) {
					// Delete record
					// if (request.getParameter("rollId") != null) {

						String roll = request.getParameter("rollId");
						System.out.println("orey"+request.getParameter("subjects"));
						String subjects=request.getParameter("subjects");
						dao.deleteRequest(roll,subjects);
					 
						// Return in the format required by jTable plugin
						JSONROOT.put("Result", "OK");
					
						// Convert Java Object to Json
						String jsonArray = gson.toJson(JSONROOT);
						response.getWriter().print(jsonArray);
				 } 
				}
			catch (Exception ex) {
				JSONROOT.put("Result", "ERROR");
				JSONROOT.put("Message", ex.getMessage());
				String error = gson.toJson(JSONROOT);
				System.out.println(error);
				response.getWriter().print(error);
			}
		}

	}

}
