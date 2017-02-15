package com.realtimetpo.entities;

public class JTableModel {

private String sroll;
private String sname;
private String sbranch;
private String sphone;
private String smail;
private int semdone;

public String getSRoll() {
	return sroll;
}

public String getSName() {
	return sname;
}

public String getSBranch() {
	return sbranch;
}

public String getSPhone() {
	return sphone;
}

public String getSMail() {
	return smail;
}

public int getSemdone() {
	return semdone;
}

public void setSRoll(String sroll) { 
	this.sroll = sroll;
	System.out.println(sroll);
}

public void setSName(String sname) {
	this.sname = sname;
	System.out.println(sname);
}
public void setSBranch(String sbranch) {
	this.sbranch = sbranch;
	System.out.println(sbranch);
}

public void setSPhone(String sphone) {
	this.sphone= sphone;
	System.out.println(sphone);
}

public void setSMail(String smail) {
	this.smail= smail;
	System.out.println(smail);
}

public void setSemdone(int semdone) {
	this.semdone= semdone;
	System.out.println(semdone);
}
}














