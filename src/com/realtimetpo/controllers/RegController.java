package com.realtimetpo.controllers;

import com.realtimetpo.daos.*;
import com.realtimetpo.entities.*;
import com.realtimetpo.factories.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegController extends HttpServlet {

    public void init(ServletConfig cnf)throws ServletException
    {
        super.init(cnf);
    }
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
    {
    //read all incoming req params from registration.html
    	String userid= request.getParameter("userid");
     /*String name = request.getParameter("username");*/
     String password = request.getParameter("password");
     String department=request.getParameter("dept");
     String name = request.getParameter("name");
     String mobile = request.getParameter("mobile");
     String email=request.getParameter("mail");
     String fathername=request.getParameter("fathername");
     String mothername=request.getParameter("mothername");
     float tenth=Float.parseFloat(request.getParameter("tenth"));
     float inter=Float.parseFloat(request.getParameter("inter"));
     int semester=Integer.parseInt(request.getParameter("sem"));
     String school=request.getParameter("school");
     String college=request.getParameter("college");
     String address=request.getParameter("address");
     int batch=Integer.parseInt(request.getParameter("batch"));
    //give these values to Users Entity
        Users user = EntityFactory.getUser();
        StudentPercent student=EntityFactory.getStudent();
        user.setUserid(userid);
        student.setRollNo(userid);
        //user.setUsername(username);
        user.setPassword(password);
        user.setName(name);
        student.setName(name);
        user.setMobile(mobile);
        student.setPhone(mobile);
        user.setDepartment(department);
student.setDepartment(department);
student.setEmailid(email);
student.setTenth(tenth);
student.setIntermediate(inter);
student.setSchoolName(school);
student.setInterCollege(college);
student.setSemesterCompleted(semester);
student.setStudentBatch(batch);
student.setAddress(address);
student.setFather(fathername);
student.setMother(mothername);
        //pass Users entity to DAO, tell him to insertUser
      UsersDAO udao = DAOFactory.getUsersDAO();
      boolean success = udao.insertUser(user,student);
      
    //read the response from DAO, show output to client 
    PrintWriter out = response.getWriter();
    RequestDispatcher rd = null;
    response.setContentType("text/html");
    
    if(success)
    {
        out.println("<font color=blue>Registration Successful. Please Login</font><br/>");
        rd = request.getRequestDispatcher("login.jsp");
        rd.include(request,response);
    }
    else
    {
        out.println("<font color=red>Unable to Register. Please Try again</font><br/>");
        rd = request.getRequestDispatcher("registration.html");
        rd.include(request,response);
    }
    }
    public void destroy()
    {
        System.out.println("Destroying Reg Controller!!");
    }
}
