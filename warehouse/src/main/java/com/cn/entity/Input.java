package com.cn.entity;

public class Input {
	private String gno;
	private String infactory;
	private String intime;
	private String inplace;
	private String innumber;
	public Input(String gno, String infactory, String intime, String inplace, String innumber) {
		super();
		this.gno = gno;
		this.infactory = infactory;
		this.intime = intime;
		this.inplace = inplace;
		this.innumber = innumber;
	}
	public Input() {
		
	}
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getInfactory() {
		return infactory;
	}
	public void setInfactory(String infactory) {
		this.infactory = infactory;
	}
	public String getIntime() {
		return intime;
	}
	public void setIntime(String intime) {
		this.intime = intime;
	}
	public String getInplace() {
		return inplace;
	}
	public void setInplace(String inplace) {
		this.inplace = inplace;
	}
	public String getInnumber() {
		return innumber;
	}
	public void setInnumber(String innumber) {
		this.innumber = innumber;
	}

}
