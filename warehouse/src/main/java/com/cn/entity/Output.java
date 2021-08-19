package com.cn.entity;

public class Output {
	private String gno;
	private String outfactory;
	private String outtime;
	private String outplace;
	private String outnumber;
	public Output(String gno, String outfactory, String outtime, String outplace, String outnumber) {
		super();
		this.gno = gno;
		this.outfactory = outfactory;
		this.outtime = outtime;
		this.outplace = outplace;
		this.outnumber = outnumber;
	}
	
	public Output() {

	}

	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getOutfactory() {
		return outfactory;
	}
	public void setOutfactory(String outfactory) {
		this.outfactory = outfactory;
	}
	public String getOuttime() {
		return outtime;
	}
	public void setOuttime(String outtime) {
		this.outtime = outtime;
	}
	public String getOutplace() {
		return outplace;
	}
	public void setOutplace(String outplace) {
		this.outplace = outplace;
	}
	public String getOutnumber() {
		return outnumber;
	}
	public void setOutnumber(String outnumber) {
		this.outnumber = outnumber;
	}


}
