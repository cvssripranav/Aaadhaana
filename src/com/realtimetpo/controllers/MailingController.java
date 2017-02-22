package com.realtimetpo.controllers;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.realtimetpo.daos.EligibilityDao;
import com.realtimetpo.daos.MailingDao;
import com.realtimetpo.entities.Eligibility;
import com.realtimetpo.entities.Mailing;
import com.realtimetpo.factories.DAOFactory;
import com.realtimetpo.factories.EntityFactory;

public class MailingController extends HttpServlet {

    public void init(ServletConfig cnf)throws ServletException
    {
        super.init(cnf);
    }
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
    {
        //read uname/pwd from index.html
        String percent = request.getParameter("hidden");
        String allDept=request.getParameter("allDepts");
        String cse=request.getParameter("cseDept");
        String ece=request.getParameter("eceDept");
        String eee=request.getParameter("eeeDept");
        String it=request.getParameter("itDept");
        String mech=request.getParameter("mechDept");
        String civil=request.getParameter("civDept");
        String chem=request.getParameter("chemDept");
        int semester=Integer.parseInt(request.getParameter("semester"));
   	 int batch=Integer.parseInt(request.getParameter("batch"));
   	 float tenth=Float.parseFloat(request.getParameter("tenth"));
   	 float inter=Float.parseFloat(request.getParameter("inter"));
   	 int backlogs=Integer.parseInt(request.getParameter("backlogs"));
   	String id=request.getParameter("sessionid");

        System.out.println("percent="+percent);
        String password = request.getParameter("pwd");
        String username=request.getParameter("uid");
        System.out.println(username);
        String subject=request.getParameter("subject");
        String body=request.getParameter("body");
        String attachment=request.getParameter("attachments");
        //supply this uname and pwd to Users
       Mailing mailss = EntityFactory.getMails();
    mailss.setUsername(username);
       mailss.setPassword(password);
        mailss.setSubject(subject);
        mailss.setText(body);
       mailss.setAttachment(attachment);
        //pass users obj to DAO ask him to check credentials
       MailingDao mdao = DAOFactory.getMailingDao();
    boolean success= mdao.sendMail(mailss,percent,id,allDept,cse,ece,eee,it,mech,civil,chem,semester,batch,inter,tenth,backlogs);
    PrintWriter out = response.getWriter();
    RequestDispatcher rd = null;
    response.setContentType("text/html");
    
    if(success==true)
    {
        out.println("<font color=blue>mail sent Successful. </font><br/>");
        rd = request.getRequestDispatcher("trytpo.jsp");
        rd.include(request,response);
    }
    else
    {
        out.println("<font color=red>Unable to send mail. Please Try again</font><br/>");
        rd = request.getRequestDispatcher("trytpo.jsp");
        rd.include(request,response);
    }
    }
    public void destroy()
    {
        System.out.println("Destroying Login Controller");
    }
}