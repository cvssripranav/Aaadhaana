package com.realtimetpo.daos;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 import org.apache.poi.xssf.usermodel.XSSFCell;
 import org.apache.poi.xssf.usermodel.XSSFRow;
 import org.apache.poi.xssf.usermodel.XSSFSheet;
 import org.apache.poi.xssf.usermodel.XSSFWorkbook;
  import java.io.File;
  import java.io.FileOutputStream;


import com.realtimetpo.factories.*;
import com.realtimetpo.entities.Eligibility;
public class EligibilityDao {
	 Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    ResultSet rs1=null;
	    //List<Eligibility> userList = new ArrayList<Eligibility>();
	    public EligibilityDao(){
	    	try {
	             con = ConnectionFactory.getConnection();
	             stmt = con.createStatement();
	         }catch(Exception e){System.out.println(e);}
	    }
	    public List<String> getEligibleColumns(String percent,String allDept,String cse,String ece,String eee,String it,String mech,String civil,String chem,int semester,int batch,float tenth,float inter,int backlogs)
	    {
	    	List<String> columnList = new ArrayList<String>();
	    	 try
		        {
	    		 if(cse==null)
		        		cse="%";
		        	if(ece==null)
		        		ece="%";
		        	if(eee==null)
		        		eee="%";
		        	if(it==null)
		        		it="%";
		        	if(mech==null)
		        		mech="%";
		        	if(civil==null)
		        		civil="%";
		        	if(chem==null)
		        		chem="%";
		        	System.out.println(percent);
		        	if(allDept!=null)
		            rs = stmt.executeQuery("select  * from semmrks4 where Aggregate>='"+ percent +"' and Tenth>='"+tenth+"'and Intermediate>='"+inter+"' and Backlogs<='"+backlogs+"' and SemesterCompleted='"+semester+"' and studentBatch='"+batch+"'");
		        	else
		        		rs = stmt.executeQuery("select  * from semmrks4 where Aggregate>='"+ percent +"' and SemesterCompleted='"+semester+"' and Tenth>='"+tenth+"'and Intermediate>='"+inter+"' and Backlogs<='"+backlogs+"' and studentBatch='"+batch+"' and sbranch in('"+ cse +"','"+ ece +"','"+ eee +"','"+ it +"','"+ mech +"','"+ civil +"','"+ chem +"')");	
	 
System.out.println(percent);
		            //rs = stmt.executeQuery("select  * from smmrks where percent>='"+ percent +"' and sbranch in('"+ cse +"','"+ ece +"','"+ eee +"','"+ it +"','"+ mech +"','"+ civil +"','"+ chem +"')");
	 
		           // while(rs.next())
		          //  {
		                Eligibility eligibles = EntityFactory.getEligible();
		                
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
	    
	    public List<Eligibility> getEligibleList(String percent,String allDept,String cse,String ece,String eee,String it,String mech,String civil,String chem,int semester,int batch,float tenth,float inter,int backlogs)
	    {
	    	
	    	List<Eligibility> eligibleList = new ArrayList<Eligibility>();
	    	
	    	eligibleList.clear();
	    System.out.println("in  "+eligibleList.size());
	        try
	        {
	        	if(cse==null)
	        		cse="%";
	        	if(ece==null)
	        		ece="%";
	        	if(eee==null)
	        		eee="%";
	        	if(it==null)
	        		it="%";
	        	if(mech==null)
	        		mech="%";
	        	if(civil==null)
	        		civil="%";
	        	if(chem==null)
	        		chem="%";
	        	System.out.println(cse);
	        	if(allDept!=null)
		            rs = stmt.executeQuery("select  * from semmrks4 where Aggregate>='"+ percent +"' and Tenth>='"+tenth+"'and Intermediate>='"+inter+"' and Backlogs<='"+backlogs+"' and SemesterCompleted='"+semester+"' and StudentBatch='"+batch+"'");
		        	else
		        		rs = stmt.executeQuery("select  * from semmrks4 where Aggregate>='"+ percent +"' and SemesterCompleted='"+semester+"' and StudentBatch='"+batch+"' and Tenth>='"+tenth+"'and Intermediate>='"+inter+"' and Backlogs<='"+backlogs+"'and Department in('"+ cse +"','"+ ece +"','"+ eee +"','"+ it +"','"+ mech +"','"+ civil +"','"+ chem +"')");	
	  
	            while(rs.next())
	            {
	            	Eligibility eligible = EntityFactory.getEligible(); 
	                
	                eligible.setRollNo(rs.getString("RollNo"));
	                eligible.setName(rs.getString("Name"));
	                eligible.setDepartment(rs.getString("Department"));
	                eligible.setEmailid(rs.getString("EmailId"));
	                eligible.setPhone(rs.getString("Phone"));
	               eligible.setTenth(rs.getFloat("Tenth"));
	               eligible.setIntermediate(rs.getFloat("Intermediate"));
	               eligible.setInterCollege(rs.getString("InterCollege"));
	               eligible.setSchoolName(rs.getString("SchoolName"));
	               eligible.setSem1Marks(rs.getInt("Sem1Marks"));
	               eligible.setSem1Total(rs.getInt("Sem1total"));
	               eligible.setSem1Percent(rs.getFloat("Sem1percent"));
	               eligible.setSem2Marks(rs.getInt("Sem2Marks"));
	               eligible.setSem2Total(rs.getInt("Sem2total"));
	               eligible.setSem2Percent(rs.getFloat("Sem2percent"));
	               eligible.setSem3Marks(rs.getInt("Sem3Marks"));
	               eligible.setSem3Total(rs.getInt("Sem3total"));
	               eligible.setSem3Percent(rs.getFloat("Sem3percent"));
	               eligible.setSem4Marks(rs.getInt("Sem4Marks"));
	               eligible.setSem4Total(rs.getInt("Sem4total"));
	               eligible.setSem4Percent(rs.getFloat("Sem4percent"));
	               eligible.setSem5Marks(rs.getInt("Sem5Marks"));
	               eligible.setSem5Total(rs.getInt("Sem5total"));
	               eligible.setSem5Percent(rs.getFloat("Sem5percent"));
	               eligible.setSem6Marks(rs.getInt("Sem6Marks"));
	               eligible.setSem6Total(rs.getInt("Sem6total"));
	               eligible.setSem6Percent(rs.getFloat("Sem6percent"));
	               eligible.setSem7Marks(rs.getInt("Sem7Marks"));
	               eligible.setSem7Total(rs.getInt("Sem7total"));
	               eligible.setSem7Percent(rs.getFloat("Sem7percent"));
	               eligible.setSem8Marks(rs.getInt("Sem8Marks"));
	               eligible.setSem8Total(rs.getInt("Sem8total"));
	               eligible.setSem8Percent(rs.getFloat("Sem8percent"));
	               eligible.setAggregate(rs.getFloat("Aggregate"));
	               eligible.setBacklogs(rs.getInt("Backlogs"));
	               eligible.setSemesterCompleted(rs.getInt("SemesterCompleted"));
	               eligible.setStudentBatch(rs.getInt("StudentBatch"));
	               
	               
	               
	               
	               
	               
	               
	                //user.setMobile(rs.getString(5));
	                
	                eligibleList.add(eligible);
	            }
	            System.out.println("out  "+eligibleList.size());
	            
	        }catch(Exception e){System.out.println(e);}
	        
	        return eligibleList;
	    }
	  /*  public void emptys()
	    {
	    	System.out.println("hii");
	    	  userList.clear();
	    }*/

	  /*  public void generateEligibleList(String percent,String filename)
	    {
	    	  List<Eligibility> eligibleList = new ArrayList<Eligibility>();
	    	  List<String> columnList = new ArrayList<String>();
	    	try{
	    		rs=stmt.executeQuery("select * from mails where percent>='"+ percent +"' ");
	    		 while(rs.next())
		            {
		                Eligibility eligible = EntityFactory.getEligible();
		                
		                //eligible.setId(rs.getInt(1));
		                eligible.setPercent(rs.getFloat(1));
		                eligible.setMailid(rs.getString(2));
		                //user.setName(rs.getString(4));
		                //user.setMobile(rs.getString(5));
		                
		                eligibleList.add(eligible);
		            }
		            
		        		        
		        
		    
	    	
           	 XSSFWorkbook workbook = new XSSFWorkbook(); 
             XSSFSheet spreadsheet = workbook
             .createSheet("employe db");
             XSSFRow row=spreadsheet.createRow(1);
             XSSFCell cell;
             ResultSetMetaData rsmd = rs.getMetaData();
             int columnCount = rsmd.getColumnCount();
System.out.println(columnCount);
             // The column count starts from 1
             for (int i = 1; i <= columnCount; i++ ) {
               String name = rsmd.getColumnName(i);
               System.out.println(name);
               // Do stuff with name
              // eligibles.setColumn(name);
            //   columnList.add(name);
              // System.out.println(columnList.get(i));
               cell=row.createCell(i);
               cell.setCellValue(name);
             
             } 
         
            // cell=row.createCell(2);
            // cell.setCellValue(" Mailid");
             cell=row.createCell(3);
             cell.setCellValue("brnch");
             cell=row.createCell(4);
             cell.setCellValue("percent");
             cell=row.createCell(5);
             cell.setCellValue("bklogs");
             int i=2;
             
             for(Eligibility str: eligibleList){
             
             row=spreadsheet.createRow(i);
             cell=row.createCell(1);
             cell.setCellValue(str.getPercent());
             cell=row.createCell(2);
             cell.setCellValue(str.getMailid());
             cell=row.createCell(3);
             cell.setCellValue(resultSet.getString("sbranch"));
             cell=row.createCell(4);
             cell.setCellValue(resultSet.getFloat("percent"));
             cell=row.createCell(5);
             cell.setCellValue(resultSet.getInt("backlogs"));
             i++;
          }
          FileOutputStream os = new FileOutputStream(
          new File("d:\\"+ filename +".xls"));
          workbook.write(os);
         	                 

         // out.close();
        System.  out.println(
          "exceldatabase.xlsx written successfully"+ filename);
       
	    	}catch(Exception e){System.out.println(e);}


		  


	    }
*/	    public List<String> getInchargeList(String department)
	    {
	    	
	    	List<String> inchargeList = new ArrayList<String>();
	    	inchargeList.clear();
	    System.out.println("in  "+inchargeList.size());
	        try
	        {
	        	System.out.println(department);
	            rs = stmt.executeQuery("select  * from incharge where department='"+ department +"'");
 
	            while(rs.next())
	            {
	                //Eligibility eligible = EntityFactory.getEligible();
	                
	                //eligible.setId(rs.getInt(1));
	              /*  eligible.setPercent(rs.getFloat(1));
	                eligible.setMailid(rs.getString(2));
	              */  //user.setName(rs.getString(4));
	                //user.setMobile(rs.getString(5));
	                
	                inchargeList.add(rs.getString("email"));
	            }
	            System.out.println("out  "+inchargeList.size());
	            
	        }catch(Exception e){System.out.println(e);}
	        
	        return inchargeList;
	    }
	  /*  public void emptys()
	    {
	    	System.out.println("hii");
	    	  userList.clear();
	    }*/
	    public List<String> getOptions(){
	    	
	    int i=0;
	    List<String> options=new ArrayList<String>();
	    	try{
	    		rs=stmt.executeQuery("Select RollNo,Name,Department,EmailId,Phone,Tenth,Intermediate,Sem1percent,Sem2percent,Sem3percent,Sem4percent,Sem5percent,Sem6percent,Sem7percent,Sem8percent,Aggregate,Backlogs,SemesterCompleted,StudentBatch from semmrks4");
	    		  ResultSetMetaData rsmd = rs.getMetaData();
	                 int count=rsmd.getColumnCount();
	                 while(i<count){
	                	 ++i;
	               options.add(rsmd.getColumnName(i));
	    	}}catch(Exception e){
	    		
	    	}
	    	return options;
	    }
	    public List<Eligibility> getCustomizedEligibles(List<String> check2,String percent,String allDept3,String cse3,String ece3,String eee3,String it3,String mech3,String civil3,String chem3,String semester,String batch,String tenth,String inter,String backlogs){
	    	List<Eligibility> userList=new ArrayList<Eligibility>();
	    	ResultSet RS=null;
	    	System.out.println("my percent="+percent);
	    	int length=check2.size();
	    	int j=0;
	    	String q="select distinct RollNo,Name,Department,EmailID,Phone,Tenth,Intermediate,Sem1percent,Sem2percent,Sem3percent,Sem4percent,Sem5percent,Sem6percent,Sem7percent,Sem8percent,Aggregate,Backlogs,SemesterCompleted,StudentBatch ";
	    	/*for(String str:check2){
	    		++j;
	    		if(j<length){
	    			q=q+str+",";
	    		}
	    		else
	    			q=q+str;
	    		
	    		}
	    	*/
	    	q=q+" from semmrks4 where Aggregate>='"+percent+"' and SemesterCompleted='"+semester+"' and StudentBatch='"+batch+"' and Tenth>='"+tenth+"' and Intermediate>='"+inter+"' and Backlogs<='"+backlogs+"'";
	    	try{
	    		if(cse3.equalsIgnoreCase("null"))
	        		cse3="%";
	        	if(ece3.equalsIgnoreCase("null"))
	        		ece3="%";
	        	if(eee3.equalsIgnoreCase("null"))
	        		eee3="%";
	        	if(it3.equalsIgnoreCase("null"))
	        		it3="%";
	        	if(mech3.equalsIgnoreCase("null"))
	        		mech3="%";
	        	if(civil3.equalsIgnoreCase("null"))
	        		civil3="%";
	        	if(chem3.equalsIgnoreCase("null"))
	        		chem3="%";
	        	System.out.println("oof22222"+allDept3 + cse3+ece3+mech3+eee3+it3+civil3+chem3);
	        	if(!allDept3.equalsIgnoreCase("null")){
	        		System.out.println("oof22222"+q);
		            RS = stmt.executeQuery(q);
		            
	        	}
		        	else{
		        		System.out.println("oof");
		        		RS = stmt.executeQuery(q+" and sbranch in('"+ cse3 +"','"+ ece3 +"','"+ eee3 +"','"+ it3 +"','"+ mech3 +"','"+ civil3 +"','"+ chem3 +"')");	
	 
		        	}
	    	//	rs=stmt.executeQuery(q);
	    		
	            while(RS.next())
	            {
	            	System.out.println("orey");
	            	Eligibility eligible = EntityFactory.getEligible(); 
	            	eligible.setRollNo(RS.getString("RollNo"));
	                eligible.setName(RS.getString("Name"));
	                eligible.setDepartment(RS.getString("Department"));
	                eligible.setEmailid(RS.getString("EmailID"));
	                eligible.setPhone(RS.getString("Phone"));
	               eligible.setTenth(RS.getFloat("Tenth"));
	               eligible.setIntermediate(RS.getFloat("Intermediate"));
	            //   eligible.setInterCollege(rs.getString("InterCollege"));
	              // eligible.setSchoolName(rs.getString("SchoolName"));
	               //eligible.setSem1Marks(rs.getInt("Sem1Marks"));
	               //eligible.setSem1Total(rs.getInt("Sem1total"));
	               eligible.setSem1Percent(RS.getFloat("Sem1percent"));
	               //eligible.setSem2Marks(rs.getInt("Sem2Marks"));
	               //eligible.setSem2Total(rs.getInt("Sem2total"));
	               eligible.setSem2Percent(RS.getFloat("Sem2percent"));
	               //eligible.setSem3Marks(rs.getInt("Sem3Marks"));
	               //eligible.setSem3Total(rs.getInt("Sem3total"));
	               eligible.setSem3Percent(RS.getFloat("Sem3percent"));
	               //eligible.setSem4Marks(rs.getInt("Sem4Marks"));
	               //eligible.setSem4Total(rs.getInt("Sem4total"));
	               eligible.setSem4Percent(RS.getFloat("Sem4percent"));
	               //eligible.setSem5Marks(rs.getInt("Sem5Marks"));
	               //eligible.setSem5Total(rs.getInt("Sem5total"));
	               eligible.setSem5Percent(RS.getFloat("Sem5percent"));
	               //eligible.setSem6Marks(rs.getInt("Sem6Marks"));
	               //eligible.setSem6Total(rs.getInt("Sem6total"));
	               eligible.setSem6Percent(RS.getFloat("Sem6percent"));
	               //eligible.setSem7Marks(rs.getInt("Sem7Marks"));
	               //eligible.setSem7Total(rs.getInt("Sem7total"));
	               eligible.setSem7Percent(RS.getFloat("Sem7percent"));
	               //eligible.setSem8Marks(rs.getInt("Sem8Marks"));
	               //eligible.setSem8Total(rs.getInt("Sem8total"));
	               eligible.setSem8Percent(RS.getFloat("Sem8percent"));
	               eligible.setAggregate(RS.getFloat("Aggregate"));
	               eligible.setBacklogs(RS.getInt("Backlogs"));
	               eligible.setSemesterCompleted(RS.getInt("SemesterCompleted"));
	               eligible.setStudentBatch(RS.getInt("StudentBatch"));
	               
	               
	               
	                //eligible.setId(rs.getInt(1));
	             //   eligible.setPercent(rs.getFloat("percent"));
	             //   eligible.setId(rs.getString(1));
	                //eligible.setMailid(rs.getString(2));
	              //  eligible.setName(rs.getString(4));
	                //user.setMobile(rs.getString(5));
	                
	                userList.add(eligible);
	              //  System.out.println(eligible.getId());
	            }
	    	}catch(Exception e){
	    		
	    	}

	    	return userList;
	    }

	 }
