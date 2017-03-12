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
 * Servlet implementation class MarksJTableController
 */
@WebServlet("/MarksJTableController")
public class MarksJTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Object> JSONROOT2 = new HashMap<String, Object>();

	private MarksCRUD dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarksJTableController() {
       dao = new MarksCRUD();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		String pkey = request.getParameter("pkey");
		String id=request.getParameter("sid");
		String subcode=request.getParameter("scode");
		if(id==null)
			id="%";
		if(subcode==null)
			subcode="%";
		if(pkey==null)pkey="";
		System.out.println(action);
		System.out.println(pkey);
		
		List<MarksModel> studentList = new ArrayList<MarksModel>();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		response.setContentType("application/json");

		if (action != null) {
			try {
				if (action.equals("markslist")) {
					
					System.out.println("EnteredMarksPhase");
					// Fetch Data from Student Table
					studentList = dao.getAllStudents(pkey,id,subcode);

					// Return in the format required by jTable plugin
					JSONROOT2.put("Result", "OK");
					System.out.println("jroot1");
					JSONROOT2.put("Records", studentList);
					System.out.println("jroot2");
					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT2);
					response.getWriter().print(jsonArray);
					
				} else if (action.equals("markscreate") || action.equals("marksupdate")) {
					MarksModel student = new MarksModel();
					if (request.getParameter("mroll") != null) {
						String mroll = request.getParameter("mroll");
						student.setMroll(mroll);
					}

					if (request.getParameter("mscode") != null) {
						String mscode = request.getParameter("mscode");
						student.setMscode(mscode);
					}
					
			
						if (request.getParameter("mint") != null) {
						int mint = Integer.parseInt(request.getParameter("mint"));
						student.setMint(mint);
					}
						
						if (request.getParameter("mext") != null) {
							int mext = Integer.parseInt(request.getParameter("mext"));
							student.setMext(mext);
						}
						
						
						if (request.getParameter("mtot") != null) {
							int mtot = Integer.parseInt(request.getParameter("mtot"));
							student.setMtot(mtot);
						}
						
						if (request.getParameter("mcredit") != null) {
							int mcredit = Integer.parseInt(request.getParameter("mcredit"));
							student.setMcredit(mcredit);
						}
					
					if (request.getParameter("mbranch") != null) {
						String mbranch = request.getParameter("mbranch");
						student.setMbranch(mbranch);
					}
					
					if (request.getParameter("msem") != null) {
						int msem = Integer.parseInt(request.getParameter("msem"));
						student.setMsem(msem);
					}
					
					if (request.getParameter("mbatch") != null) {
						int mbatch = Integer.parseInt(request.getParameter("mbatch"));
						student.setMbatch(mbatch);
					}

					
					if (action.equals("markscreate")) {
						// Create new record
						dao.addStudent(student);
					} else if (action.equals("marksupdate")) {
						// Update existing record
						dao.updateStudent(student);
					}

					// Return in the format required by jTable plugin
					JSONROOT2.put("Result", "OK");
					JSONROOT2.put("Record", student);

					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT2);
					response.getWriter().print(jsonArray);
				} else if (action.equals("marksdelete")) {
					// Delete record
					if (request.getParameter("mroll") != null) {
						String mroll = request.getParameter("mroll");
						dao.deleteStudent(mroll);

						// Return in the format required by jTable plugin
						JSONROOT2.put("Result", "OK");

						// Convert Java Object to Json
						String jsonArray = gson.toJson(JSONROOT2);
						response.getWriter().print(jsonArray);
					}
				}
			} catch (Exception ex) {
				JSONROOT2.put("Result", "ERROR");
				JSONROOT2.put("Message", ex.getMessage());
				String error = gson.toJson(JSONROOT2);
				response.getWriter().print(error);
			}
		}
	}

}
