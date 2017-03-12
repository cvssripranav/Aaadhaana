<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
<title>Change password </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
body{
	
	/*background:repeating-linear-gradient(to right,#222,#222 2px,#fff 2px,#fff 4px);
	margin-right:0px;*/
	background-image: url("grey.jpg");
    Background-attachment: fixed;
    background-position: top;
    background-repeat: no-repeat;
    background-size: cover;
	background-color:grey;
}
</style>
</head>

<body>
<%response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
 %>
<div class="container" id="con1">

		<div class="row" id="row1">
			<div class="col-xs-10">
			<img src="index_bg.png"  id="adminimg" height="150Px" width="750px"style="margin-left:180px"/>
			</div>
		</div>
		<br><h3 id="admin-heading" class="col-xs-offset-2" style="color:#1e90ff"> <span>ANURAG GROUP OF INSTITUTIONS - FINANCE DEPARTMENT</span></h3>
	</div>
<h2 align="center" Style="color:white;"><strong>Forgot Password </strong></h2>
<form name="ForotPasswordForm" method="post" action="ForgotPasswordController" >

<table border="0" align="center" bgcolor="grey">

<tr>
<td  Style="color:white;">User Name:</td>
<TD><input name="username" type="text" id="username" size="20"></td>
</tr>
<tr>
<td  Style="color:white;">User ID:</td>
<td><input name="userid" type="text" id="userid">
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="Save"></td>
</tr>

</table>
</form>
</body>
</html>