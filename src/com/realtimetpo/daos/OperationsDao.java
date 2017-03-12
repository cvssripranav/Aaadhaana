package com.realtimetpo.daos;


	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.ArrayList;
	import java.util.List;



	import com.realtimetpo.entities.*;
	import com.realtimetpo.factories.*;

	public class OperationsDao {
		private Connection dbConnection;
		private PreparedStatement pStmt;

		public OperationsDao() {
			dbConnection = ConnectionFactory.getConnection();
		}
		
		public boolean deleteRequest(String roll,String subject) {
			boolean success=false;
			String deleteQuery = "DELETE FROM notify where  subjects=? and roll=?";
			try {
				pStmt = dbConnection.prepareStatement(deleteQuery);
				System.out.println(roll + subject);
				pStmt.setString(2, roll);
				pStmt.setString(1,subject);
				pStmt.executeUpdate();
				success=true;
				
			} catch (Exception e) {
				success=false;
				System.err.println(e.getMessage());
			}
			return success;
		}
		

		public void updateRequest(String roll,String subjects,String status)  {
			String updateQuery = "UPDATE notify SET status = ? " +
					" WHERE roll = ? and subjects=?";
			
			//System.out.println(employee.getConveyance());
			try {
				pStmt = dbConnection.prepareStatement(updateQuery);		
				pStmt.setString(2, roll);
				pStmt.setString(1,status);
				pStmt.setString(3,subjects);
				System.out.println(updateQuery);
								pStmt.executeUpdate();

			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
		}
	
		public List<Status> getAllRequests() {
			List<Status> status = new ArrayList<Status>();
			//System.out.println("2"+ searchs);
			String query="";
		/*	if(searchs==null || searchs.equalsIgnoreCase(""))
			searchs="%";	//query = "SELECT * FROM salaryview ";
			//else 
				//query = "SELECT * FROM salaryview where empid like'"+ searchs +"' and month like '%'";	
			if(months==null || months.equalsIgnoreCase("All months"))
				months="%";//query = "SELECT * FROM salaryview ";
		*/	//else
				query = "SELECT * FROM notify";	
	/*if(search.equalsIgnoreCase(null) || search.equalsIgnoreCase("all")){
	search="%";
	System.out.println(search);
	}		
	else
				 search=search;
	if(months.equalsIgnoreCase("All months") || months.equalsIgnoreCase(null)){
		System.out.println("oho");
		months="%";
	}
	else{
		System.out.println("in");
		months=months;}
	System.out.println("3"+ months);
	*/// query = "SELECT * FROM salaryview where empid like'"+ search +"' and month like '"+months+"'";
	//query = "SELECT * FROM salaryview ";
			try {
				Statement stmt = dbConnection.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
					Status requests = new Status();

					requests.setrollId(rs.getString("roll"));
					requests.setName((rs.getString("name")));
					requests.setBranch(rs.getString("branch"));
					requests.setStatus(rs.getString("status"));
					requests.setSubjects(rs.getString("subjects"));
					requests.setBatch(rs.getString("batch"));
						status.add(requests);
				}
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
			return status;
		}
		
}
