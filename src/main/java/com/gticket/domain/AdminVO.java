package com.gticket.domain;

import java.sql.Date;

public class AdminVO {

	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private Date admin_date_late;
	private int admin_point;

	public int getAdmin_point() {
		return admin_point;
	}

	public void setAdmin_point(int admin_point) {
		this.admin_point = admin_point;
	}

	public String getAdmin_id() {  
		return admin_id; 
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public Date getAdmin_date_late() {
		return admin_date_late;
	}

	public void setAdmin_date_late(Date admin_date_late) {
		this.admin_date_late = admin_date_late;
	}

	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name=" + admin_name
				+ ", admin_date_late=" + admin_date_late + ", admin_point=" + admin_point + "]";
	}

}
