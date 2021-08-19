package com.cn.entity;

public class Goods {
	private String gno;
	private String gname;
	private String gsize;
	private int gnumber;
	private String infactory;
	public Goods(String gno, String gname, String gsize, int gnumber, String infactory) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.gsize = gsize;
		this.gnumber = gnumber;
		this.infactory = infactory;
	}
	public Goods() {
		
	}


	public Goods(String gno) {
		this.gno = gno;
	}
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGsize() {
		return gsize;
	}
	public void setGsize(String gsize) {
		this.gsize = gsize;
	}
	public int getGnumber() {
		return gnumber;
	}
	public void setGnumber(int gnumber) {
		this.gnumber = gnumber;
	}
	public String getInfactory() {
		return infactory;
	}
	public void setInfactory(String infactory) {
		this.infactory = infactory;
	}

}
