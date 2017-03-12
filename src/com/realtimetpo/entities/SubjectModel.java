package com.realtimetpo.entities;

public class SubjectModel {

private String sucode;
private String suname;
private int suext;
private int sutot;



public String getSucode() {
	return sucode;
}

public String getSuname() {
	return suname;
}


public int getSuext() {
	return suext;
}

public int getSutot() {
	return sutot;
}





public void setSucode(String sucode) { 
	this.sucode = sucode;
	System.out.println(sucode);
}

public void setSuname(String suname) {
	this.suname = suname;
	System.out.println(suname);
}



public void setSuext(int suext) {
	this.suext= suext;
	System.out.println(suext);
}

public void setSutot(int sutot) {
	this.sutot= sutot;
	System.out.println(sutot);
}


}














