package com.realtimetpo.entities;

public class SubjectModel {

private String sucode;
private String suname;
private String subranch;
private int susem;
private int sumarks;



public String getSucode() {
	return sucode;
}

public String getSuname() {
	return suname;
}

public String getSubranch() {
	return subranch;
}


public int getSusem() {
	return susem;
}

public int getSumarks() {
	return sumarks;
}





public void setSucode(String sucode) { 
	this.sucode = sucode;
	System.out.println(sucode);
}

public void setSuname(String suname) {
	this.suname = suname;
	System.out.println(suname);
}
public void setSubranch(String subranch) {
	this.subranch = subranch;
	System.out.println(subranch);
}


public void setSusem(int susem) {
	this.susem= susem;
	System.out.println(susem);
}

public void setSumarks(int sumarks) {
	this.sumarks= sumarks;
	System.out.println(sumarks);
}


}














