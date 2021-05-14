package com.gticket.domain;

import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	
	/*
    EVT_NUM		 			NUMBER								PRIMARY KEY, 
    CG_CODE		 @			VARCHAR2(20)						NOT NULL, 
    CG_CODE_PRT  @          VARCHAR2(20)                        NOT NULL, 
    EVT_NAME	 @			VARCHAR2(50)						NOT NULL,
    EVT_PRICE	 @			NUMBER								NOT NULL,
    EVT_DISCOUNT @			NUMBER								NOT NULL,
    EVT_COMPANY	 @	    	VARCHAR2(30)						NOT NULL,
    EVT_DETAIL	 @			VARCHAR2(4000)					    NOT NULL,
    EVT_IMG		 			VARCHAR2(200)						NOT NULL,
    EVT_AMOUNT	 @		    NUMBER								NOT NULL,
    EVT_BUY		 @			CHAR(1)								NOT NULL,
    EVT_DATE_SUB @			DATE 						    	NOT NULL,
    EVT_DATE_UP	 	    	DATE DEFAULT SYSDATE			    NOT NULL,
    FOREIGN KEY(CG_CODE	)   REFERENCES CATEGORY_TBL(CG_CODE)
    
     */
	
	private int		evt_num;
	private String 	cg_code;
	private String 	cg_code_prt; // 추가
	private String 	evt_name;
	private int		evt_price;
	private int 	evt_discount;
	private String	evt_company;
	private String	evt_detail;
	private String	evt_img;
	private int		evt_amount;
	private String 	evt_buy;
	private Date	evt_date_sub;
	private Date	evt_date_up;
	
	private String evt_open_ts;
	private String evt_close_ts;
	
//	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	
	// 업로드 파일
	private MultipartFile file1;  // insert.jsp <input type="file" id="file1" name="file1" class="form-control" />
	
	public int getEvt_num() {
		return evt_num;
	}

	public void setEvt_num(int evt_num) {
		this.evt_num = evt_num;
	}

	public String getCg_code() {
		return cg_code;
	}

	public void setCg_code(String cg_code) {
		this.cg_code = cg_code;
	}

	public String getCg_code_prt() {
		return cg_code_prt;
	}

	public void setCg_code_prt(String cg_code_prt) {
		this.cg_code_prt = cg_code_prt;
	}

	public String getEvt_name() {
		return evt_name;
	}

	public void setEvt_name(String evt_name) {
		this.evt_name = evt_name;
	}

	public int getEvt_price() {
		return evt_price;
	}

	public void setEvt_price(int evt_price) {
		this.evt_price = evt_price;
	}

	public int getEvt_discount() {
		return evt_discount;
	}

	public void setEvt_discount(int evt_discount) {
		this.evt_discount = evt_discount;
	}

	public String getEvt_company() {
		return evt_company;
	}

	public void setEvt_company(String evt_company) {
		this.evt_company = evt_company;
	}

	public String getEvt_detail() {
		return evt_detail;
	}

	public void setEvt_detail(String evt_detail) {
		this.evt_detail = evt_detail;
	}

	public String getEvt_img() {
		return evt_img;
	}

	public void setEvt_img(String evt_img) {
		this.evt_img = evt_img;
	}

	public int getEvt_amount() {
		return evt_amount;
	}

	public void setEvt_amount(int evt_amount) {
		this.evt_amount = evt_amount;
	}

	public String getEvt_buy() {
		return evt_buy;
	}

	public void setEvt_buy(String evt_buy) {
		this.evt_buy = evt_buy;
	}

	public Date getEvt_date_sub() {
		return evt_date_sub;
	}

	public void setEvt_date_sub(Date evt_date_sub) {
		this.evt_date_sub = evt_date_sub;
	}

	public Date getEvt_date_up() {
		return evt_date_up;
	}

	public void setEvt_date_up(Date evt_date_up) {
		this.evt_date_up = evt_date_up;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	public String getEvt_open_ts() {
		return evt_open_ts;
	}

	public void setEvt_open_ts(String evt_open_ts) throws ParseException {
//		try {
//	    Date parsedDate = this.dateFormat.parse(evt_open_ts); 
//	    this.evt_open_ts = new Timestamp(parsedDate.getTime());
	    
//		} catch(Exception e) { //this generic but you can control another types of exception
//		    // look the origin of excption 
//			raise ;
//		}
		this.evt_open_ts = evt_open_ts;
	}
	
	public String getEvt_close_ts() {
		return evt_close_ts;
	}

	public void setEvt_close_ts(String evt_close_ts) {
//		try {
//		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
//		    Date parsedDate = dateFormat.parse(yourString);
//		    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
//		} catch(Exception e) { //this generic but you can control another types of exception
//		    // look the origin of excption 
//		}
//		this.evt_close_ts = Timestamp.valueOf(evt_close_ts);
		this.evt_close_ts = evt_close_ts;
	}
	
	/* toString() */
	@Override
	public String toString() {
		return "EventVO [evt_num=" + evt_num + ", cg_code=" + cg_code + ", cg_code_prt=" + cg_code_prt + ", evt_name="
				+ evt_name + ", evt_price=" + evt_price + ", evt_discount=" + evt_discount + ", evt_company="
				+ evt_company + ", evt_detail=" + evt_detail + ", evt_img=" + evt_img + ", evt_amount=" + evt_amount
				+ ", evt_buy=" + evt_buy + ", evt_date_sub=" + evt_date_sub + ", evt_date_up=" + evt_date_up
				+ ", evt_open_ts=" + evt_open_ts + ", evt_close_ts=" + evt_close_ts 
				+ ", file1=" + file1 + "]";
	}
	
}
