package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	/**
	 * 用户id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/**
	 * 用户名 (账户名)
	 */
	@Column(name = "name", length = 50)
	private String name;

	/**
	 * 用户登录密码
	 */
	@Column(name = "password", length = 50)
	private String password;
	/**
	 * 用户名户主民
	 */
	@Column(name = "uname", length = 50)
	private String uname;
	/**
	 * 用户类型 备用字段
	 */
	@Column(name = "utype", length = 50)
	private String utype;
	/**
	 * 用户住址
	 */
	@Column(name = "uaddress", length = 50)
	private String uaddress;
	/**
	 * 用户手机号
	 */
	@Column(name = "uphone", length = 50)
	private String uphone;

	/**
	 * 用户户型
	 */
	@Column(name = "housetype", length = 50)
	private String housetype;
	/**
	 * 房子面积大小
	 */
	@Column(name = "housearea", length = 50)
	private String housearea;

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

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getHousetype() {
		return housetype;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}

	public String getHousearea() {
		return housearea;
	}

	public void setHousearea(String housearea) {
		this.housearea = housearea;
	}

	public User(int id, String name, String password, String uname,
			String utype, String uaddress, String uphone, String housetype,
			String housearea) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.uname = uname;
		this.utype = utype;
		this.uaddress = uaddress;
		this.uphone = uphone;
		this.housetype = housetype;
		this.housearea = housearea;
	}

	public User() {
	}

}
