package com.realtimetpo.factories;

import com.realtimetpo.entities.Eligibility;

import com.realtimetpo.entities.Mailing;
import com.realtimetpo.entities.Status;
import com.realtimetpo.entities.StudentPercent;
import com.realtimetpo.entities.SubjectModel;
import com.realtimetpo.entities.Users;


public class EntityFactory {
	 public static Eligibility getEligible()
	    {
	        return new Eligibility();
	    }
	    
	 public static Mailing getMails()
	    {
	        return new Mailing();
	    }
	  public static Users getUser()
	    {
	        return new Users();
	    }
	  public static Status getStatus()
	    {
	        return new Status();
	    }
	  public static StudentPercent getStudent()
	    {
	        return new StudentPercent();
	    }
	  public static SubjectModel getSubject()
	    {
	        return new SubjectModel();
	    }
}
