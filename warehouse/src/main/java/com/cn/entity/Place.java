package com.cn.entity;

public class Place {
	private String gno;
	private String place;
	private int wnumber;
	public Place(String gno, String place, int wnumber) {
		super();
		this.gno = gno;
		this.place = place;
		this.wnumber = wnumber;
	}
	public Place() {
	}
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getWnumber() {
		return wnumber;
	}
	public void setWnumber(int wnumber) {
		this.wnumber = wnumber;
	}
	

}
