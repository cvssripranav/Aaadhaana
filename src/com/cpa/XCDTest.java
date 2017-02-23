package com.cpa;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.opencsv.*;
import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * Servlet implementation class XCD
 */
@WebServlet("/XCDTest")
public class XCDTest extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;
	 
	    private static final String UPLOAD_DIRECTORY = "upload";
	    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	    private static final String tablename="marksformat";
	    private static String fpath="";
		private static String subranch="";
		private static String susem="";
		private static String subatch="";
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Request does not contain upload data");
            writer.flush();
            return;
        }

         
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
         
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
         
        // constructs the directory path to store upload file
        String uploadPath = getServletContext().getRealPath("")
            + File.separator + UPLOAD_DIRECTORY;
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
         
        try {
            // parses the request's content to extract file data
            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();
             
            // iterates over form's fields
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    fpath = filePath;
                    File storeFile = new File(filePath);
                     
                    // saves the file on disk
                    item.write(storeFile);
                }
				if (item.isFormField())
				{
					String name = item.getFieldName();
					String value = item.getString();
					switch(name)
					{
					case "subranch" : subranch=value;break;
					case "susem" : susem=value;break;
					case "subatch" : subatch=value;break;
					
					}
					
				}
            }
            
  
            int i=0;
        	int j=0;
        	int ccount=1;
        	int k=0;
        	int z=0;
        	int subcount=0;
	  
     
	String cvalue="";
	String value="";
	String sql="";
	String subvalue="";
	String rollvalue="";
	String[] subjects = new String[10];
	Object element;
	
    
	  
	  
	  
      CSVReader reader = new CSVReader(new FileReader(fpath), ',', '"', 7);
       
      //Read all rows at once
		List<String[]> allRows = reader.readAll();
			

	  
      try{
			
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/cpa_test";
            Connection con = DriverManager.getConnection(url,"root","arjun@23");
			 Statement stmt = con.createStatement();
			 
			 
			 String query = "select sucode from subjectsformat where subranch="+"'"+subranch+"'"+" and susem="+"'"+susem+"'"+" and subatch="+"'"+subatch+"'";
			 System.out.println(query);
			 ResultSet rs = stmt.executeQuery(query);
			 System.out.println(query);
			 while(rs.next())
			 {
				 subjects[z]=rs.getString(1);
				 System.out.println(subjects[z]);
				 z++;
			 }
			 
			 subcount=z;
			 ccount = (subcount*4)+1;
			 z=0;
			  System.out.println(ccount);
			
			
			 for(i=0;i<allRows.size();i++)
			  {
				 element = allRows.get(i)[0];
				rollvalue = "'"+element.toString()+"'";
				
				  for(j=1;j<ccount;j=j+4)
				  {
					
					subvalue = "'"+subjects[z++]+"'";
					 
					 	for(k=0;k<4;k++)
						{
							
							element = allRows.get(i)[j+k];
						
							value = "'"+element.toString()+"'";
							
							if(k==3)//last column
								{
									
								cvalue=cvalue+value;
								sql= "Insert into "+tablename+" values "+"("+rollvalue+","+subvalue+","+cvalue+")";
								System.out.println(sql);
								int b = stmt.executeUpdate(sql);
								sql="";
								   if(b<0)System.out.println("Epic Fail!");
								   cvalue="";
								}
								
								else 
								{cvalue=cvalue+value+",";}
									
								
					  
						}
						
						 
				  }
				  z=0;
				 
				 

				  
			  }
				  
	 
	  
	   }catch(Exception d){d.printStackTrace();}
      
            request.setAttribute("message", "Upload has been done successfully!");
        } catch (Exception ex) {
            request.setAttribute("message", "There was an error: " + ex.getMessage());
        }
        getServletContext().getRequestDispatcher("/ExCDTest.jsp").forward(request, response);
	}

}
