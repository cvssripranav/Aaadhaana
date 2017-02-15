package com.realtimetpo.entities;

public class MarksModel {

private String mroll;
private String mscode;
private int mmarks;
private String mpof;


public String getMroll() {
	return mroll;
}

public String getMscode() {
	return mscode;
}

public int getMmarks() {
	return mmarks;
}

public String getMpof() {
	return mpof;
}



public void setMroll(String mroll) { 
	this.mroll = mroll;
	System.out.println(mroll);
}

public void setMscode(String mscode) {
	this.mscode = mscode;
	System.out.println(mscode);
}
public void setMpof(String mpof) {
	this.mpof = mpof;
	System.out.println(mpof);
}


public void setMmarks(int mmarks) {
	this.mmarks= mmarks;
	System.out.println(mmarks);
}
}














