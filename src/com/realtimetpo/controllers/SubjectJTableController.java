package com.realtimetpo.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.realtimetpo.daos.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.realtimetpo.entities.*;
import java.util.*;

/**
 * Servlet implementation class SubjectJTableController
 */
@WebServlet("/SubjectJTableController")
public class SubjectJTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Object> JSONROOT3 = new HashMap<String, Object>();
	private SubjectCRUD dao;

  
    public SubjectJTableController() {
    	 dao = new SubjectCRUD();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		String pkey = request.getParameter("pkey");
		if(pkey==null)pkey="";
		System.out.println(action);
		System.out.println(pkey);
		
		List<SubjectModel> studentList = new ArrayList<SubjectModel>();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		response.setContentType("application/json");

		if (action != null) {
			try {
				if (action.equals("subjectlist")) {
					
					System.out.println("EnteredSubjectPhase");
					// Fetch Data from Student Table
					studentList = dao.getAllStudents(pkey);

					// Return in the format required by jTable plugin
					JSONROOT3.put("Result", "OK");
					System.out.println("jroot1");
					JSONROOT3.put("Records", studentList);
					System.out.println("jroot2");
					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT3);
					response.getWriter().print(jsonArray);
					
				} else if (action.equals("subjectcreate") || action.equals("subjectupdate")) {
					SubjectModel student = new SubjectModel();
					if (request.getParameter("sucode") != null) {
						String sucode = request.getParameter("sucode");
						student.setSucode(sucode);
					}

					if (request.getParameter("suname") != null) {
						String suname = request.getParameter("suname");
						student.setSuname(suname);
					}
					
			
						if (request.getParameter("suext") != null) {
						int suext = Integer.parseInt(request.getParameter("suext"));
						student.setSuext(suext);
					}
						
						if (request.getParameter("sutot") != null) {
							int sutot = Integer.parseInt(request.getParameter("sutot"));
							student.setSutot(sutot);
						}
					
					
					
					if (action.equals("subjectcreate")) {
						// Create new record
						dao.addStudent(student);
					} else if (action.equals("subjectupdate")) {
						// Update existing record
						dao.updateStudent(student);
					}

					// Return in the format required by jTable plugin
					JSONROOT3.put("Result", "OK");
					JSONROOT3.put("Record", student);

					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT3);
					response.getWriter().print(jsonArray);
				} else if (action.equals("subjectdelete")) {
					// Delete record
					if (request.getParameter("sucode") != null) {
						String sucode = request.getParameter("sucode");
						dao.deleteStudent(sucode);

						// Return in the format required by jTable plugin
						JSONROOT3.put("Result", "OK");

						// Convert Java Object to Json
						String jsonArray = gson.toJson(JSONROOT3);
						response.getWriter().print(jsonArray);
					}
				}
			} catch (Exception ex) {
				JSONROOT3.put("Result", "ERROR");
				JSONROOT3.put("Message", ex.getMessage());
				String error = gson.toJson(JSONROOT3);
				response.getWriter().print(error);
			}
		}
		
	}

}
