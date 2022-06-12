package com.jin.shop01.goods.vo;

import java.sql.Date;

public class GoodsVO {
	private int goods_id;
	private String goods_name;
	private String goods_sort;
	private int    goods_price;
	private String goods_des;
	private Date   goods_date;
	private String goods_status;
	private String fileName;
	private Date   goods_credate;
	
	public GoodsVO() {
	}



	public int getGoods_id() {
		return goods_id;
	}



	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}



	public String getGoods_name() {
		return goods_name;
	}



	public void setGoods_title(String goods_name) {
		this.goods_name = goods_name;
	}


	public String getGoods_sort() {
		return goods_sort;
	}

	public void setGoods_sort(String goods_sort) {
		this.goods_sort = goods_sort;
	}



	public int getGoods_price() {
		return goods_price;
	}



	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_des() {
		return goods_des;
	}

	public void setGoods_des(String goods_des) {
		this.goods_des = goods_des;
	}


	


	public Date getGoods_date() {
		return goods_date;
	}

	public void setGoods_date(Date goods_date) {
		this.goods_date = goods_date;
	}

	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	
	public String getGoods_status() {
		return goods_status;
	}





	public void setGoods_status(String goods_status) {
		this.goods_status = goods_status;
	}




	public Date getGoods_credate() {
		return goods_credate;
	}

	public void setGoods_credate(Date goods_credate) {
		this.goods_credate = goods_credate;
	}
	

}
