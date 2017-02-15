package com.realtimetpo.controllers;

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

import java.io.*;


@WebServlet("/JTableController")
public class JTableController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Object> JSONROOT = new HashMap<String, Object>();

	private JTableCRUD dao;

	public JTableController() {
		dao = new JTableCRUD();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		String pkey = request.getParameter("pkey");
		if(pkey==null)pkey="";
		System.out.println(action);
		System.out.println(pkey);
		
		List<JTableModel> studentList = new ArrayList<JTableModel>();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		response.setContentType("application/json");

		if (action != null) {
			try {
				if (action.equals("list")) {
					// Fetch Data from Student Table
					studentList = dao.getAllStudents(pkey);

					// Return in the format required by jTable plugin
					JSONROOT.put("Result", "OK");
					System.out.println("jroot1");
					JSONROOT.put("Records", studentList);
					System.out.println("jroot2");
					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT);
					response.getWriter().print(jsonArray);
					
				} else if (action.equals("create") || action.equals("update")) {
					JTableModel student = new JTableModel();
					if (request.getParameter("sroll") != null) {
						String sroll = request.getParameter("sroll");
						student.setSRoll(sroll);
					}

					if (request.getParameter("sname") != null) {
						String sname = request.getParameter("sname");
						student.setSName(sname);
					}
					
					if (request.getParameter("sbranch") != null) {
						String sbranch = request.getParameter("sbranch");
						student.setSBranch(sbranch);
					}
					
					if (request.getParameter("sphone") != null) {
						String sphone = request.getParameter("sphone");
						student.setSPhone(sphone);
					}
					
					if (request.getParameter("smail") != null) {
						String smail = request.getParameter("smail");
						student.setSMail(smail);
					}
					
					if (request.getParameter("semdone") != null) {
						int semdone = Integer.parseInt(request.getParameter("semdone"));
						student.setSemdone(semdone);
					}

					
					if (action.equals("create")) {
						// Create new record
						dao.addStudent(student);
					} else if (action.equals("update")) {
						// Update existing record
						dao.updateStudent(student);
					}

					// Return in the format required by jTable plugin
					JSONROOT.put("Result", "OK");
					JSONROOT.put("Record", student);

					// Convert Java Object to Json
					String jsonArray = gson.toJson(JSONROOT);
					response.getWriter().print(jsonArray);
				} else if (action.equals("delete")) {
					// Delete record
					if (request.getParameter("sroll") != null) {
						String sroll = request.getParameter("sroll");
						dao.deleteStudent(sroll);

						// Return in the format required by jTable plugin
						JSONROOT.put("Result", "OK");

						// Convert Java Object to Json
						String jsonArray = gson.toJson(JSONROOT);
						response.getWriter().print(jsonArray);
					}
				}
			} catch (Exception ex) {
				JSONROOT.put("Result", "ERROR");
				JSONROOT.put("Message", ex.getMessage());
				String error = gson.toJson(JSONROOT);
				response.getWriter().print(error);
			}
		}
	}
}