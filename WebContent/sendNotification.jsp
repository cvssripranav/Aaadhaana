<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>  
<%@ page import="java.io.*"%>   
<%  

 String sub=request.getParameter("sub"); 
String id=request.getParameter("id");
String dept=request.getParameter("dept");
String name=request.getParameter("name");
System.out.println("index"+sub);
if(sub==null || sub.trim().equals("")){  
out.print("Please enter values");  
 
 }else{  
//int id=Integer.parseInt(s);  
out.print(sub);  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test1","root","arjun@23");  
PreparedStatement ps=con.prepareStatement(  
"insert into test1.notify(roll,name,branch,subjects) values(?,?,?,?)");  
              
/* File f=new File(s);  
FileReader fr=new FileReader(f);  
 */ int count=0; 
 ps.setString(1,id);
ps.setString(2, name);  
ps.setString(3,dept);  
ps.setString(4,sub);  
int i=ps.executeUpdate();  
System.out.println(i+" records affected"); 
PreparedStatement ps1=con.prepareStatement("select * from test1.notify where roll='"+id+"'");  
//ps.setInt(1,id);  
ResultSet rs=ps1.executeQuery();  
while(rs.next()){  
//out.print(rs.getClob(1)+"\n "); 

count++;
out.print( '\n');
System.out.print(count +" subject added '\n'");
 } 
out.print(System.lineSeparator()+ count +" subjects added in total");
con.close();  
              
}catch (Exception e) {e.printStackTrace();
out.print(System.lineSeparator()+ " already added ");
}  
}  %>  


</body>
</html>