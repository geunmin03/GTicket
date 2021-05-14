package com.gticket.domain;

public class BuyVO {

	private int buy_code;
	private int evt_num;
	private String mb_id;
	private int buy_count;
	private int buy_totalprice;
	private String buy_date;
	private String buy_method;
	
	
	
	public int getBuy_code() {
		return buy_code;
	}
	public void setBuy_code(int buy_code) {
		this.buy_code = buy_code;
	}
	public int getEvt_num() {
		return evt_num;
	}
	public void setEvt_num(int evt_num) {
		this.evt_num = evt_num;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public int getBuy_totalprice() {
		return buy_totalprice;
	}
	public void setBuy_totalprice(int buy_totalprice) {
		this.buy_totalprice = buy_totalprice;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_method() {
		return buy_method;
	}
	public void setBuy_method(String buy_method) {
		this.buy_method = buy_method;
	}
	
	
	@Override
	public String toString() {
		return "BuyVO [buy_code=" + buy_code + ", evt_num=" + evt_num + ", mb_id=" + mb_id + ", buy_count=" + buy_count
				+ ", buy_totalprice=" + buy_totalprice + ", buy_date=" + buy_date + ", buy_method=" + buy_method + "]";
	}
	
	
	
	
}
