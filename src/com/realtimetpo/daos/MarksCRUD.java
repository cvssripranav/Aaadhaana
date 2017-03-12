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
		String insertQuery = "INSERT INTO test1.marksformat(mroll, mscode, mint, mext, mtot, mcredit, mbranch, msem, mbatch" +
				") VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			pStmt = dbConnection.prepareStatement(insertQuery);
			pStmt.setString(1, student.getMroll());
			pStmt.setString(2, student.getMscode());
			pStmt.setInt(3, student.getMint());
			pStmt.setInt(4, student.getMext());
			pStmt.setInt(5, student.getMtot());
			pStmt.setInt(6, student.getMcredit());
			pStmt.setString(7, student.getMbranch());
			pStmt.setInt(8, student.getMsem());
			pStmt.setInt(9, student.getMbatch());
			
			
			
			/*pStmt.setString(3, student.getDepartment());
			pStmt.setString(4, student.getEmailId());
			*/pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void deleteStudent(String mroll) {
		String deleteQuery = "DELETE FROM test1.marksformat WHERE mroll = ?";
		try {
			pStmt = dbConnection.prepareStatement(deleteQuery);
			pStmt.setString(1, mroll);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public void updateStudent(MarksModel student)  {
		String updateQuery = "UPDATE test1.marksformat SET mint = ?, mext = ?, mtot = ?, mcredit = ?, mbranch = ?, msem = ?, mbatch = ?," +
				" WHERE mroll = ? and mscode=?";
		try {
			pStmt = dbConnection.prepareStatement(updateQuery);		
			pStmt.setInt(1, student.getMint());
			pStmt.setInt(2, student.getMext());
			pStmt.setInt(3, student.getMtot());
			pStmt.setInt(4, student.getMcredit());
			pStmt.setString(5, student.getMbranch());
			pStmt.setInt(6, student.getMsem());
			pStmt.setInt(7, student.getMbatch());
			pStmt.setString(8, student.getMroll());
			pStmt.setString(9, student.getMscode());
			
			
			pStmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

	public List<MarksModel> getAllStudents(String pkey,String id,String subcode) {
		passedpkey= pkey;
		System.out.println(passedpkey);
		String query;
		List<MarksModel> students = new ArrayList<MarksModel>();
		//if(passedpkey=="")
		//query = "SELECT * FROM test1.marksformat ORDER BY mroll";
		//else
			query="SELECT * FROM test1.marksformat where mroll like '"+id+"' and mscode like '"+subcode+"'" ;
		System.out.println(query);
		
		try {
			Statement stmt = dbConnection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				MarksModel student = new MarksModel();

				student.setMroll(rs.getString("mroll"));
				student.setMscode(rs.getString("mscode"));
				student.setMint(rs.getInt("mint"));
				student.setMext(rs.getInt("mext"));
				student.setMtot(rs.getInt("mtot"));
				student.setMcredit(rs.getInt("mcredit"));
				student.setMbranch(rs.getString("mbranch"));
				student.setMsem(rs.getInt("msem"));
				student.setMbatch(rs.getInt("mbatch"));
				
				
				students.add(student);
				
				
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return students;
	}

}
