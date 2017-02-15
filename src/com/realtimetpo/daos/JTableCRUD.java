package com.realtimetpo.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import com.realtimetpo.factories.*;
import com.realtimetpo.entities.*;


public class JTableCRUD {
	private Connection dbConnection;
	private PreparedStatement pStmt;
	private String passedpkey="";

	public JTableCRUD() {
		dbConnection = ConnectionFactory.getConnection();
	}

	public void addStudent(JTableModel student) {
		String insertQuery = "INSERT INTO student(sroll, sname, sbranch, sphone, smail, semdone" +
				") VALUES (?,?,?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, student.getSRoll());
			pStmt.setString(2, student.getSName());
			pStmt.setString(3, student.getSBranch());
			pStmt.setString(4, student.getSPhone());
			pStmt.setString(5, student.getSMail());
			pStmt.setInt(6, student.getSemdone());
			
			/*pStmt.setString(3, student.getDepartment());
			pStmt.setString(4, student.getEmailId());
			*/pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteStudent(String sroll) {
		String deleteQuery = "DELETE FROM student WHERE sroll = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setString(1, sroll);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(JTableModel student)  {
		String updateQuery = "UPDATE student SET sname = ?, sbranch=?, sphone=?, smail=?, semdone=?" +
				" WHERE STUDENTID = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);		
			pStmt.setString(1, student.getSName());
			pStmt.setString(2, student.getSBranch());
			pStmt.setString(2, student.getSPhone());
			pStmt.setString(4, student.getSMail());
			pStmt.setInt(5, student.getSemdone());
			pStmt.setString(6, student.getSRoll());
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<JTableModel> getAllStudents(String pkey) {
		passedpkey= pkey;
		System.out.println(passedpkey);
		String query;
		List<JTableModel> students = new ArrayList<JTableModel>();
		if(passedpkey=="")
			query = "SELECT distinct * FROM student ORDER BY sroll";
		else
			query = "SELECT distinct * FROM student  WHERE sroll = '"+passedpkey+"'";
		System.out.println(query);
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				JTableModel student = new JTableModel();

				student.setSRoll(rs.getString("sroll"));
				student.setSName(rs.getString("sname"));
				student.setSBranch(rs.getString("sbranch"));
				student.setSPhone(rs.getString("sphone"));
				student.setSMail(rs.getString("smail"));
				student.setSemdone(rs.getInt("semdone"));
				students.add(student);
				
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return students;
	}

}
