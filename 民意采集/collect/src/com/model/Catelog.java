package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "catelog")
public class Catelog {
	/**
	 * 类别id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "cid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cid;

	/**
	 * 类别名
	 */
	@Column(name = "cname", length = 50)
	private String cname;

	/**
	 * 类别类型状态
	 */
	@Column(name = "ctype", length = 50)
	private String ctype;

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public Catelog(int cid, String cname, String ctype) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.ctype = ctype;
	}

	public Catelog() {
	}

}
