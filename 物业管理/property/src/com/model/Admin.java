package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin {
	/**
	 * 宣传部管理员id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/**
	 * 管理员名 (账户名)
	 */
	@Column(name = "name", length = 50)
	private String name;

	/**
	 * 管理员登录密码
	 */
	@Column(name = "password", length = 50)
	private String password;
	/**
	 * 管理员名称
	 */
	@Column(name = "aname", length = 50)
	private String aname;
	/**
	 * 管理员类型
	 */
	@Column(name = "atype", length = 50)
	private String atype;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAtype() {
		return atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public Admin(int id, String name, String password, String aname,
			String atype) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.aname = aname;
		this.atype = atype;
	}

	public Admin() {
	}

}
