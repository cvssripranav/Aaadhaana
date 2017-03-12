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
		String insertQuery = "INSERT INTO studentinformation(roll, name, branch, phone, email, fathersname, mothersname, tenthpercent, twefthpercent, tenthschool,twelthcollege, semdone, batch, address" +
				") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, student.getRoll());
			pStmt.setString(2, student.getName());
			pStmt.setString(3, student.getBranch());
			pStmt.setString(4, student.getPhone());
			pStmt.setString(5, student.getEmail());
			pStmt.setString(6, student.getFathersname());
			pStmt.setString(7, student.getMothersname());
			pStmt.setFloat(8, student.getTenthpercent());
			pStmt.setFloat(9, student.getTwelfthpercent());
			pStmt.setString(10, student.getTenthschool());
			pStmt.setString(11, student.getTwelthcollege());
			pStmt.setInt(12, student.getSemdone());
			pStmt.setInt(13, student.getBatch());
			pStmt.setString(14, student.getAddress());
			/*pStmt.setString(3, student.getDepartment());
			pStmt.setString(4, student.getEmailId());
			*/pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteStudent(String roll) {
		String deleteQuery = "DELETE FROM studentinformation WHERE roll = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setString(1, roll);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(JTableModel student)  {
		String updateQuery = "UPDATE studentinformation SET name = ?, branch=?, phone=?, email=?, fathersname=?, mthersname=?, tenthpercent=?, twelfthpercent=?, tenthschool=?, twelthcollege=?, semdone=?, batch=?, address=?" +
				" WHERE roll = ?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);		
			pStmt.setString(1, student.getName());
			pStmt.setString(2, student.getBranch());
			pStmt.setString(2, student.getPhone());
			pStmt.setString(4, student.getEmail());
			pStmt.setString(5, student.getFathersname());
			pStmt.setString(6, student.getMothersname());
			pStmt.setFloat(7, student.getTenthpercent());
			pStmt.setFloat(8, student.getTwelfthpercent());
			pStmt.setString(9, student.getTenthschool());
			pStmt.setString(10, student.getTwelthcollege());
			pStmt.setInt(11, student.getSemdone());
			pStmt.setInt(12, student.getBatch());
			pStmt.setString(13, student.getAddress());
			pStmt.setString(14, student.getRoll());
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
			query = "SELECT distinct * FROM studentinformation ORDER BY roll";
		else
			query = "SELECT distinct * FROM studentinformation  WHERE roll = '"+passedpkey+"'";
		System.out.println(query);
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				JTableModel student = new JTableModel();

				student.setRoll(rs.getString("roll"));
				student.setName(rs.getString("name"));
				student.setBranch(rs.getString("branch"));
				student.setPhone(rs.getString("phone"));
				student.setEmail(rs.getString("email"));
				student.setFathersname(rs.getString("fathersname"));
				student.setMothersname(rs.getString("mothersname"));
				student.setTenthpercent(rs.getFloat("tenthpercent"));
				student.setTwelfthpercent(rs.getFloat("twelfthpercent"));
				student.setTenthschool(rs.getString("tenthschool"));
				student.setTwelthcollege(rs.getString("twelthcollege"));
				student.setSemdone(rs.getInt("semdone"));
				student.setBatch(rs.getInt("batch"));
				student.setAddress(rs.getString("Address"));
				
				System.out.println(student);
				students.add(student);
				
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return students;
	}

}
