package com.realtimetpo.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import com.realtimetpo.entities.*;
import com.realtimetpo.daos.*;
import com.realtimetpo.factories.ConnectionFactory;


public class SubjectCRUD {
	private Connection dbConnection;
	private PreparedStatement pStmt;
	private String passedpkey="";

	public SubjectCRUD() {
		dbConnection = ConnectionFactory.getConnection();
	}

	public void addStudent(SubjectModel student) {
		String insertQuery = "INSERT INTO subjects(sucode, suname , subranch, susem, sumarks" +
				") VALUES (?,?,?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, student.getSucode());
			pStmt.setString(2, student.getSuname());
			pStmt.setString(3, student.getSubranch());
			pStmt.setInt(5, student.getSusem());
			pStmt.setInt(6, student.getSumarks());
			
			
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteStudent(String sucode) {
		String deleteQuery = "DELETE FROM subjects WHERE sucode = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setString(1, sucode);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(SubjectModel student)  {
		String updateQuery = "UPDATE subjects SET sumarks= ?, susem = ?, suname = ?" +
				" WHERE sucode = ? and subranch = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);		
			pStmt.setInt(1, student.getSumarks());
			pStmt.setInt(2, student.getSusem());
			pStmt.setString(3, student.getSuname());
			pStmt.setString(3, student.getSucode());
			pStmt.setString(4, student.getSubranch());
			
			
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<SubjectModel> getAllStudents(String pkey) {
		passedpkey= pkey;
		System.out.println(passedpkey);
		String query;
		List<SubjectModel> students = new ArrayList<SubjectModel>();
		if(passedpkey=="")
		query = "SELECT distinct * FROM subjects ORDER BY sucode";
		else
			query="SELECT * FROM subjects where sucode = '"+passedpkey+"'";
		System.out.println(query);
		
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				SubjectModel student = new SubjectModel();

				student.setSucode(rs.getString("sucode"));
				student.setSuname(rs.getString("suname"));
				student.setSubranch(rs.getString("subranch"));
				student.setSusem(rs.getInt("susem"));
				student.setSumarks(rs.getInt("sumarks"));
			
				
				
				students.add(student);
				
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return students;
	}

}
