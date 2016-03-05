package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "discuss")
public class Discuss {
	/**
	 * 评价id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/**
	 * 评价医生id
	 */
	@Column(name = "did", length = 50)
	private int did;
	/**
	 * 评价用户id
	 */
	@Column(name = "uid", length = 50)
	private int uid;
	/**
	 * 评价用户名字
	 */
	@Column(name = "uname", length = 50)
	private String uname;

	/**
	 * 评价内容
	 */
	@Column(name = "dcontent", length = 250)
	private String dcontent;
	/**
	 * 评价时间
	 */
	@Column(name = "ddate", length = 50)
	private String ddate;



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getDid() {
		return did;
	}



	public void setDid(int did) {
		this.did = did;
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



	public String getDcontent() {
		return dcontent;
	}



	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}



	public String getDdate() {
		return ddate;
	}



	public void setDdate(String ddate) {
		this.ddate = ddate;
	}



	public Discuss(int id, int did, int uid, String uname, String dcontent,
			String ddate) {
		super();
		this.id = id;
		this.did = did;
		this.uid = uid;
		this.uname = uname;
		this.dcontent = dcontent;
		this.ddate = ddate;
	}



	public Discuss() {
	}

}
