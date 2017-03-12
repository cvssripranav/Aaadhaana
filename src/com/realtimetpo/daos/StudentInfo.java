package com.realtimetpo.daos;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.realtimetpo.factories.*;
import com.realtimetpo.entities.Eligibility;
import com.realtimetpo.entities.Status;
import com.realtimetpo.entities.StudentPercent;


public class StudentInfo {
	 Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    //List<Eligibility> userList = new ArrayList<Eligibility>();
	    public StudentInfo(){
	    	try {
	             con = ConnectionFactory.getConnection();
	             stmt = con.createStatement();
	         }catch(Exception e){System.out.println(e);}
	    }
	
	    public List<String> getEligibleColumns(String rno)
	    {
	    	List<String> columnList = new ArrayList<String>();
	    	 try
		        {
		        	//System.out.println(percent);
		            rs = stmt.executeQuery("select  RollNo,Name,Department ,Sem1percent,Sem2percent,Sem3percent,Sem4percent,Sem5percent,Sem6percent,Sem7percent,Sem8percent,Aggregate,Backlogs from semwisemarks where RollNo='"+ rno +"'");
	 
		           // while(rs.next())
		          //  {
		                //Eligibility eligibles = EntityFactory.getEligible();
		                
		                //ResultSet rs = stmt.executeQuery("SELECT a, b, c FROM TABLE2");
		                ResultSetMetaData rsmd = rs.getMetaData();
		                int columnCount = rsmd.getColumnCount();
System.out.println(columnCount);
		                // The column count starts from 1
		                for (int i = 1; i <= columnCount; i++ ) {
		                  String name = rsmd.getColumnName(i);
		                  System.out.println(name);
		                  // Do stuff with name
		                 // eligibles.setColumn(name);
		                  columnList.add(name);
		                 // System.out.println(columnList.get(i));
		                } 
		                
		           // }
		            System.out.println("outs  "+columnList.size());
		            
		        }catch(Exception e){System.out.println(e);}
		        
		        return columnList;

	    }
	    
	    public List<String> getStatusColumns(String rno)
	    {
	    	List<String> columnList = new ArrayList<String>();
	    	 try
		        {
		        	//System.out.println(percent);
		            rs = stmt.executeQuery("select * from test1.notify where roll='"+ rno +"'");
	 
		           // while(rs.next())
		          //  {
		                //Eligibility eligibles = EntityFactory.getEligible();
		                
		                //ResultSet rs = stmt.executeQuery("SELECT a, b, c FROM TABLE2");
		                ResultSetMetaData rsmd = rs.getMetaData();
		                int columnCount = rsmd.getColumnCount();
System.out.println(columnCount);
		                // The column count starts from 1
		                for (int i = 1; i <= columnCount; i++ ) {
		                  String name = rsmd.getColumnName(i);
		                  System.out.println(name);
		                  // Do stuff with name
		                 // eligibles.setColumn(name);
		                  columnList.add(name);
		                 // System.out.println(columnList.get(i));
		                } 
		                
		           // }
		            System.out.println("outs  "+columnList.size());
		            
		        }catch(Exception e){System.out.println(e);}
		        
		        return columnList;

	    }
	    
	    public List<StudentPercent> getMarksList(String rno)
	    {
	    	
	    	List<StudentPercent> marksList = new ArrayList<StudentPercent>();
	    	marksList.clear();
	    System.out.println("in  "+marksList.size());
	        try
	        {
	        	//System.out.println(percent);
	            rs = stmt.executeQuery("select  * from semwisemarks where RollNo='"+ rno +"'");
 
	            while(rs.next())
	            {
	                StudentPercent student = EntityFactory.getStudent();
	                
	                //eligible.setId(rs.getInt(1));
	                student.setRollNo(rs.getString("RollNo"));
	                student.setName(rs.getString("Name"));
	                student.setDepartment(rs.getString("Department"));
	                student.setSem1Percent(rs.getFloat("Sem1percent"));
	                student.setSem2Percent(rs.getFloat("Sem2percent"));
	              //  student.setFinalpercent(rs.getFloat("percent"));
	                student.setSem3Percent(rs.getFloat("Sem3percent"));
	                student.setSem4Percent(rs.getFloat("Sem4percent"));
	                student.setSem5Percent(rs.getFloat("Sem5percent"));
	                student.setSem6Percent(rs.getFloat("Sem6percent"));
	                student.setSem7Percent(rs.getFloat("Sem7percent"));
	                student.setSem8Percent(rs.getFloat("Sem8percent"));
	                student.setAggregate(rs.getFloat("Aggregate"));
	                student.setBacklogs(rs.getInt("Backlogs"));
	              /*  student.setSem5percent(sem5percent);
	                student.setSem6percent(sem6percent);
	                student.setSem7percent(sem7percent);
	                student.setSem8percent(sem8percent);*///user.setName(rs.getString(4));
	                //user.setMobile(rs.getString(5));
	                
	                marksList.add(student);
	            }
	            System.out.println("out  "+marksList.size());
	            
	        }catch(Exception e){System.out.println(e);}
	        
	        return marksList;
	    }
	    public List<Status> getRequestStatus(String rno)
	    {
	    	
	    	List<Status> requestsList = new ArrayList<Status>();
	    	requestsList.clear();
	   // System.out.println("in  "+marksList.size());
	        try
	        {
	        	//System.out.println(percent);
	            rs = stmt.executeQuery("select  * from test1.notify where roll='"+ rno +"'");
 
	            while(rs.next())
	            {
	                Status student = EntityFactory.getStatus();
	                
	                //eligible.setId(rs.getInt(1));
	                student.setrollId(rs.getString("roll"));
	                student.setName(rs.getString("name"));
	                student.setBranch(rs.getString("branch"));
	                student.setSubjects(rs.getString("subjects"));
	                student.setBatch(rs.getString("batch"));
	                student.setStatus(rs.getString("status"));
	                requestsList.add(student);
	            }
	            //System.out.println("out  "+marksList.size());
	            
	        }catch(Exception e){System.out.println(e);}
	        
	        return requestsList;
	    }


	    public List<StudentPercent> getSemMarksList(String rno)
	    {
	    	
	    	List<StudentPercent> semMarksList = new ArrayList<StudentPercent>();
	    	semMarksList.clear();
	    System.out.println("in  "+semMarksList.size());
	        try
	        {
	        	//System.out.println(percent);
	            rs = stmt.executeQuery("SELECT distinct m.mroll,st.name,m.mscode,s.suname,m.msem,m.mtot,s.sutot as maxmarks FROM test1.marksformat m,test1.subjectsformat s,test1.studentInformation st where m.mscode=s.sucode  and m.mroll=st.roll and roll='"+ rno +"'");
 
	            while(rs.next())
	            {
	                StudentPercent students = EntityFactory.getStudent();
	                
	                //eligible.setId(rs.getInt(1));
	                students.setRollNo(rs.getString("mroll"));
	                students.setName(rs.getString("name"));
	              /*  student.setBranch(rs.getString("sbranch"));
	                student.setSem1percent(rs.getFloat("sem1percent"));
	                student.setSem2percent(rs.getFloat("sem2percent"));
	                student.setFinalpercent(rs.getFloat("percent"));
	                student.setSem3percent(rs.getFloat("sem3percent"));*/
	              /*  student.setSem5percent(sem5percent);
	                student.setSem6percent(sem6percent);
	                student.setSem7percent(sem7percent);
	                student.setSem8percent(sem8percent);*///user.setName(rs.getString(4));
	                //user.setMobile(rs.getString(5));
	                students.setSubjectCode(rs.getString("mscode"));
	                students.setSubjectName(rs.getString("suname"));
	                students.setSemester(rs.getInt("msem"));
	                students.setMarksObtained(rs.getInt("mtot"));
	                students.setMaxMarks(rs.getInt("maxmarks"));
	                semMarksList.add(students);
	            }
	            System.out.println("out  "+semMarksList.size());
	            
	        }catch(Exception e){System.out.println(e);}
	        
	        return semMarksList;
	    }
	    public List<String> getSemMarksColumns(String rno)
	    {
	    	List<String> columnList = new ArrayList<String>();
	    	 try
		        {
		        	//System.out.println(percent);
		            rs = stmt.executeQuery("SELECT distinct m.mroll,st.name,m.mscode,s.suname,m.msem,m.mtot,s.sutot as maxmarks FROM test1.marksformat m,test1.subjectsformat s,test1.studentInformation st where m.mscode=s.sucode  and m.mroll=st.roll and roll='"+ rno +"'");
	 
		           // while(rs.next())
		          //  {
		                //Eligibility eligibles = EntityFactory.getEligible();
		                
		                //ResultSet rs = stmt.executeQuery("SELECT a, b, c FROM TABLE2");
		                ResultSetMetaData rsmd = rs.getMetaData();
		                int columnCount = rsmd.getColumnCount();
System.out.println(columnCount);
		                // The column count starts from 1
		                for (int i = 1; i <= columnCount; i++ ) {
		                  String name = rsmd.getColumnName(i);
		                  System.out.println(name);
		                  // Do stuff with name
		                 // eligibles.setColumn(name);
		                  columnList.add(name);
		                 // System.out.println(columnList.get(i));
		                } 
		                
		           // }
		            System.out.println("outs  "+columnList.size());
		            
		        }catch(Exception e){System.out.println(e);}
		        
		        return columnList;

	    }


}
