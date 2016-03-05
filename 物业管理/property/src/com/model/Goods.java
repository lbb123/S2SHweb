package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "goods")
public class Goods {
	/**
	 * 物业设备id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "gid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int gid;

	/**
	 * 设备名称
	 */
	@Column(name = "gname", length = 50)
	private String gname;

	/**
	 * 设备价格
	 */
	@Column(name = "gprice", length = 50)
	private String gprice;
	/**
	 * 购买日期
	 */
	@Column(name = "gdate", length = 50)
	private String gdate;
	/**
	 * 使用状态
	 */
	@Column(name = "gtype", length = 50)
	private String gtype;

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGprice() {
		return gprice;
	}

	public void setGprice(String gprice) {
		this.gprice = gprice;
	}

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public Goods(int gid, String gname, String gprice, String gdate,
			String gtype) {
		super();
		this.gid = gid;
		this.gname = gname;
		this.gprice = gprice;
		this.gdate = gdate;
		this.gtype = gtype;
	}

	public Goods() {
	}

}
