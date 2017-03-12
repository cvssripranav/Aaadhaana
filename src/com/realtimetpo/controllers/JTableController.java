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
					System.out.println("Entered StudentInformation Phase");
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
					if (request.getParameter("roll") != null) {
						String roll = request.getParameter("roll");
						student.setRoll(roll);
					}

					if (request.getParameter("name") != null) {
						String name = request.getParameter("name");
						student.setName(name);
					}
					
					if (request.getParameter("branch") != null) {
						String branch = request.getParameter("branch");
						student.setBranch(branch);
					}
					
					if (request.getParameter("phone") != null) {
						String phone = request.getParameter("phone");
						student.setPhone(phone);
					}
					
					if (request.getParameter("email") != null) {
						String email = request.getParameter("email");
						student.setEmail(email);
					}
					
					if (request.getParameter("fathersname") != null) {
						String fathersname = request.getParameter("fathersname");
						student.setFathersname(fathersname);
					}
					
					if (request.getParameter("mothersname") != null) {
						String mothersname = request.getParameter("mothersname");
						student.setMothersname(mothersname);
					}
					
					
					if (request.getParameter("tenthpercent") != null) {
						Float tenthpercent = Float.parseFloat(request.getParameter("tenthpercent"));
						student.setTenthpercent(tenthpercent);
					}
					
					if (request.getParameter("twelfthpercent") != null) {
						Float twelfthpercent = Float.parseFloat(request.getParameter("twelfthpercent"));
						student.setTwelfthpercent(twelfthpercent);
					}
					
					if (request.getParameter("tenthschool") != null) {
						String tenthschool = request.getParameter("tenthschool");
						student.setTenthschool(tenthschool);
					}
					
					if (request.getParameter("twelthcollege") != null) {
						String twelthcollege = request.getParameter("twelthcollege");
						student.setTwelthcollege(twelthcollege);
					}
					
					
					if (request.getParameter("semdone") != null) {
						int semdone = Integer.parseInt(request.getParameter("semdone"));
						student.setSemdone(semdone);
					}
					
					if (request.getParameter("batch") != null) {
						int batch = Integer.parseInt(request.getParameter("batch"));
						student.setBatch(batch);
					}
					
					if (request.getParameter("address") != null) {
						String address = request.getParameter("address");
						student.setAddress(address);
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
					if (request.getParameter("roll") != null) {
						String roll = request.getParameter("roll");
						dao.deleteStudent(roll);

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