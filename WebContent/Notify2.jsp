<%@page import="com.realtimetpo.daos.EligibilityDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Notify</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	
   


var request;  
function sendInfos()  
{  
	alert("hii");
var v=document.notify.subjects.value; 
var id=document.notify.rno.value;
var ids=document.notify.department.value;
var name="<%=session.getAttribute("name")%>";
 

	var url="sendNotification.jsp?sub="+v+"&id="+id+"&dept="+ids+"&name="+name;  
	//?sub="+v+"&id="+id+"&dept="+ids+"&name="+name
   /* var links=v; 
   alert("Result from second.jsp: " + links ); */ 
 if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send(null);  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('op').innerHTML=val;  

}  
 
 } 
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
  	html,body{height:100%; margin:0px;}	
	
	 body {
    background-image: url('imges/websiteBackground.jpg');
 background-position:right bottom , left top;
  background-repeat: no-repeat;
   background-size:cover;
   background-attachment:fixed;
    
 

} 
form.inset {border-style: inset;}

#div1 {
    border-radius: 15px;
        border: 2px solid grey;
    padding: 50px;
    margin:30px;
}#serch,a:link, a:visited {
   background-image: url('imges/websiteBackground.jpg');
    color: grey;
    border: 2px solid skyblue;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    
}

#serch:hover,#serch:active,a:hover, a:active {
    background-color: white;
    color: brown;
    font-size:105%;
}table {
    border-collapse: collapse;
    width: 100%;
    
}

table, td, th {
    border: 1px solid grey;
    text-align:center;
    height:20px;
}
tr,td{
background-color:skyblue;}
th{
background-color:#5bc0de;}

  </style>
    <!-- <link 
href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" 
rel="stylesheet">
     -->  <!--  <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
    <!--    <script 
src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    -->
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
           
</head>
<body>
<%@page import="java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
 
 if(null==session.getAttribute("username"))
{
	 response.setContentType("text/html"); 
	PrintWriter outs=response.getWriter();
	 request.getRequestDispatcher("login.jsp").include(request, response);  
		//rd = request.getRequestDispatcher("registration.html");
	    //rd.include(request, response);
	 // response.sendRedirect(request.getContextPath() + "/index.jsp");
		outs.println("<center><font color=red>Please login to continue</font></center>");
		outs.close();
	}


 else
 {
String rno=request.getParameter("rno");
String department=request.getParameter("department");

%>
<!-- <a href="attendbydate.jsp" target="f2">REFRESH</a>
<a href="result.jsp" target="f2" style="float: right;">HOME</a><br><br> -->

<a href="Logout" style="float:right">Logout</a>
<a href=<%= "\"RequestStatus.jsp?rno=" + request.getParameter("rno") + "&department="+request.getParameter("department")+"\"" %>  id="semMarks">RequestStatuss</a>
<a href=<%= "\"StudentSemPerformance2.jsp?rno=" + rno + "&department="+department+"\"" %>  id="semMarks">SemMarks</a>
<a href=<%= "\"StdentDetails2.jsp?rno=" +rno+"&department="+department+ "\"" %>  id="studentMarks">CompleteDetails</a>
<%@ page import ="com.realtimetpo.daos.*"%>
<%@ page import ="com.realtimetpo.entities.*"%>
<%@ page import=" com.realtimetpo.factories.*"%>
<%EligibilityDao edao=DAOFactory.getEligibleDao();
List<SubjectModel> subject=new ArrayList<SubjectModel>();
subject=edao.getSubjectList(request.getParameter("department"));
%>
<div id="op"></div>
<center><div id="div1">


<form name="notify" action="NotifyController"> 
Roll number:<input type="text" name="rno" id="rno" value=<%=request.getParameter("rno")%> required> 
<br><br>
Department:<input type="text" name="department" id="department" value=<%=request.getParameter("department")%> required ><br><br>
Batch:<input type="text" name="batch" id="batch"><br><br>
Subjects:<Select name="subjects">
<%
for(SubjectModel str:subject)
{
%>
<option value=<%=str.getSucode() %>-<%=str.getSuname() %>><%=str.getSucode() %>-<%=str.getSuname() %></option>
<%} %>
</Select>&emsp;<br><br>

 <input type="button" name="send" id="send" value="AddSubject" onClick="sendInfos()">&nbsp;

<!-- <input type="submit" name="notify" value="Notify" id="notify"> --> 
<input type="reset" name="reset"	value="Reset" id="reset">

</form>
</div>

</center>
<%
}
%>
</body>
</html>
