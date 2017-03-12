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
}.help-tip{
	position: absolute;
	/* top: 18px;
	right: 18px; */
	text-align: center;
	background-color: #BCDBEA;
	border-radius: 50%;
	width: 24px;
	height: 24px;
	font-size: 14px;
	line-height: 26px;
	cursor: default;
}

.help-tip:before{
	content:'?';
	font-weight: bold;
	color:#fff;
}

.help-tip:hover p{
	display:block;
	transform-origin: 100% 0%;

	-webkit-animation: fadeIn 0.3s ease-in-out;
	animation: fadeIn 0.3s ease-in-out;

}

.help-tip p{	/* The tooltip */
	display: none;
	text-align: left;
	background-color: #1E2021;
	padding: 20px;
	width: 300px;
	position: absolute;
	border-radius: 3px;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
	right: -4px;
	color: #FFF;
	font-size: 13px;
	line-height: 1.4;
}

.help-tip p:before{ /* The pointer of the tooltip */
	position: absolute;
	content: '';
	width:0;
	height: 0;
	border:6px solid transparent;
	border-bottom-color:#1E2021;
	right:10px;
	top:-12px;
}

.help-tip p:after{ /* Prevents the tooltip from being hidden */
	width:100%;
	height:40px;
	content:'';
	position: absolute;
	top:-40px;
	left:0;
}

/* CSS animation */

@-webkit-keyframes fadeIn {
	0% { 
		opacity:0; 
		transform: scale(0.6);
	}

	100% {
		opacity:100%;
		transform: scale(1);
	}
}

@keyframes fadeIn {
	0% { opacity:0; }
	100% { opacity:100%; }
}

</style>
</head>

<body>
<div class="container" id="con1">

		<div class="row" id="row1">
			<div class="col-xs-10">
			<img src="index_bg.png"  id="adminimg" height="150Px" width="750px"style="margin-left:180px"/>
			</div>
		</div>
		<br><h3 id="admin-heading" class="col-xs-offset-2" style="color:#1e90ff"> <span>ANURAG GROUP OF INSTITUTIONS - PLACEMENT DEPARTMENT</span></h3>
	</div>
<h2 align="center" Style="color:white;"><strong>Change password</strong></h2>
<script>    function CheckPassword()   
          {   
        	  var pwd=document.getElementById("password");
        	    var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;  
        	    if(pwd.value.match(passw))   
        	    {   
        	    alert('Correct, try another...')  
        	    return true;  
        	    }  
        	    else  
        	    {   
        	    alert('Wrong...!Password should contain  6 to 20 characters which should contain at least one numeric digit, one uppercase, and one lowercase letter')  
        	    return false;  
        	    }  
        	    }  </script>
<script language="javascript">
function fncSubmit()
{

if(document.ChangePasswordForm.OldPassword.value == "")
{
alert('Please input old password');
document.ChangePasswordForm.OldPassword.focus();
return false;
} 

if(document.ChangePasswordForm.newpassword.value == "")
{
alert('Please input Password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.conpassword.value == "")
{
alert('Please input Confirm Password');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>
<form name="ChangePasswordForm" method="post" action="ChangePasswordController" OnSubmit="return fncSubmit();">
<input type="hidden" name="userid" value=<%=session.getAttribute("username") %>>
<table border="0" align="center" bgcolor="grey">

<tr>
<td  Style="color:white;">Old Pasword</td>
<TD><input name="OldPassword" type="password" id="OLDpwd" size="20"></td>
</tr>
<tr>
<td  Style="color:white;">New Password</td>
<td><input name="newpassword" type="password" id="newpassword" onblur="CheckPassword()" >
</td>
</tr>
<tr>
<td  Style="color:white;">Confirm Password</td>
<td><input name="conpassword" type="password" id="conpassword">
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