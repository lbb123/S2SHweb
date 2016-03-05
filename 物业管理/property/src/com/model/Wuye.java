package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wuye")
public class Wuye {
	/**
	 * 物业费id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "wid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int wid;

	/**
	 * 用户id
	 */
	@Column(name = "uid", length = 50)
	private int uid;
	/**
	 * 户主名
	 */
	@Column(name = "uname", length = 50)
	private String uname;

	/**
	 * 物业费详情
	 */
	@Column(name = "wdetail", length = 250)
	private String wdetail;
	/**
	 *应缴纳物业费
	 */
	@Column(name = "wprice", length = 50)
	private String wprice;
	/**
	 * 缴纳状态
	 */
	@Column(name = "wtype", length = 50)
	private String wtype;
	/**
	 * 发布时间
	 */
	@Column(name = "wdate", length = 50)
	private String wdate;

	public int getWid() {
		return wid;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getWdetail() {
		return wdetail;
	}

	public void setWdetail(String wdetail) {
		this.wdetail = wdetail;
	}

	public String getWprice() {
		return wprice;
	}

	public void setWprice(String wprice) {
		this.wprice = wprice;
	}

	public String getWtype() {
		return wtype;
	}

	public void setWtype(String wtype) {
		this.wtype = wtype;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public Wuye(int wid, int uid, String uname, String wdetail, String wprice,
			String wtype, String wdate) {
		super();
		this.wid = wid;
		this.uid = uid;
		this.uname = uname;
		this.wdetail = wdetail;
		this.wprice = wprice;
		this.wtype = wtype;
		this.wdate = wdate;
	}

	public Wuye() {
	}

}
