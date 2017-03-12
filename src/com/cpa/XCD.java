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
@WebServlet("/XCD")
public class XCD extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;
	 
	    private static final String UPLOAD_DIRECTORY = "upload";
	    private static final int THRESHOLD_SIZE     = 1024 * 1024 * 3;  // 3MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	    private static String fpath="";
		private static String tablename="";
    
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
					tablename=value;
					
				}
            }
            
  
	  
	  
      	int i=0;
	int j=0;
	int ccount=1;
	String cvalue="";
	String value="";
	String sql="";
	
	
    
	  
	  
	  
      CSVReader reader = new CSVReader(new FileReader(fpath), ',', '"', 0);
       
      //Read all rows at once
		List<String[]> allRows = reader.readAll();
			

	  
      try{
			
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
            Connection con = DriverManager.getConnection(url,"root","arjun@23");
			 Statement stmt = con.createStatement();
			
			
		
	  for(i=0;i<allRows.size();i++)
	  {
		 
		  for(j=0;j<ccount;j++)
		  {
			 
				
			  if(i==0)
			  {		
					try
					{
						  Object element = allRows.get(i)[j];
							cvalue = element.toString();
					}
					catch(ArrayIndexOutOfBoundsException exception)
					{
						ccount=ccount-2;
						
					}
				 ccount++;
				
				  
			  }
			  else{
				   
					  
					   Object element = allRows.get(i)[j];
						value = "'"+element.toString()+"'";
						if(j==ccount-1)
						{
						cvalue=cvalue+value;
						sql= "Insert into "+tablename+" values "+" ("+cvalue+")";
						System.out.println(sql);
						int b = stmt.executeUpdate(sql);
						sql="";
						   if(b<0)System.out.println("Epic Fail!");
						   
						}
						else 
						{cvalue=cvalue+value+",";}
						
						
			  }
			   
				  
		  }
		  cvalue="";
		 if(i==0)ccount=j-1;
		 

		  
	  }
	 
	   request.setAttribute("message", "Upload has been done successfully!");
	   }catch(Exception d){d.printStackTrace(); request.setAttribute("message", "There was an error: ");}
      
         
        } catch (Exception ex) {
        	request.setAttribute("message", "There was an error: " + ex.getMessage());
        }
        getServletContext().getRequestDispatcher("/ExCD.jsp").forward(request, response);
	}

}
