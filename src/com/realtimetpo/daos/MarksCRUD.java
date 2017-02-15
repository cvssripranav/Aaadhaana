package com.realtimetpo.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import com.realtimetpo.daos.*;
import com.realtimetpo.entities.*;
import com.realtimetpo.factories.ConnectionFactory;


public class MarksCRUD {
	private Connection dbConnection;
	private PreparedStatement pStmt;
	private String passedpkey="";

	public MarksCRUD() {
		dbConnection = ConnectionFactory.getConnection();
	}

	public void addStudent(MarksModel student) {
		String insertQuery = "INSERT INTO marks(mroll, mscode, mmarks, mpof" +
				") VALUES (?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, student.getMroll());
			pStmt.setString(2, student.getMscode());
			pStmt.setInt(3, student.getMmarks());
			pStmt.setString(4, student.getMpof());
			
			
			
			/*pStmt.setString(3, student.getDepartment());
			pStmt.setString(4, student.getEmailId());
			*/pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteStudent(String mroll) {
		String deleteQuery = "DELETE FROM marks WHERE mroll = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setString(1, mroll);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(MarksModel student)  {
		String updateQuery = "UPDATE marks SET mmarks = ?, mpof = ?" +
				" WHERE mroll = ? and mscode=?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);		
			pStmt.setInt(1, student.getMmarks());
			pStmt.setString(2, student.getMpof());
			pStmt.setString(3, student.getMroll());
			pStmt.setString(4, student.getMscode());
			
			
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<MarksModel> getAllStudents(String pkey) {
		passedpkey= pkey;
		System.out.println(passedpkey);
		String query;
		List<MarksModel> students = new ArrayList<MarksModel>();
		if(passedpkey=="")
		query = "SELECT distinct * FROM marks ORDER BY mroll";
		else
			query="SELECT distinct * FROM marks where mroll = '"+passedpkey+"'";
		System.out.println(query);
		
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				MarksModel student = new MarksModel();

				student.setMroll(rs.getString("mroll"));
				student.setMscode(rs.getString("mscode"));
				student.setMmarks(rs.getInt("mmarks"));
				student.setMpof(rs.getString("mpof"));
				
				
				students.add(student);
				
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return students;
	}

}
