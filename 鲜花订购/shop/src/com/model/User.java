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
     * 真实姓名
     */  
    @Column(name = "uname", length = 50)  
    private String uname; 
    /** 
     * 性别
     */  
    @Column(name = "sex", length = 50)  
    private String sex; 
    /** 
     * 邮箱
     */  
    @Column(name = "email", length = 50)  
    private String email; 
    /** 
     * 身份证号
     */  
    @Column(name = "idcard", length = 50)  
    private String idcard; 
    /** 
     * 手机号
     */  
    @Column(name = "phone", length = 50)  
    private int phone;
    /** 
     * 用户地址
     */  
    @Column(name = "uaddress", length = 50)  
    private String uaddress; 
    /** 
     * 修改时间
     */  
    @Column(name = "udate", length = 50)  
    private String udate; 
    
  

	public User(int id, String name, String password, String uname, String sex,
			String email, String idcard, int phone, String uaddress,
			String udate) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.uname = uname;
		this.sex = sex;
		this.email = email;
		this.idcard = idcard;
		this.phone = phone;
		this.uaddress = uaddress;
		this.udate = udate;
	}



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



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		this.sex = sex;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getIdcard() {
		return idcard;
	}



	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}



	public int getPhone() {
		return phone;
	}



	public void setPhone(int phone) {
		this.phone = phone;
	}



	public String getUaddress() {
		return uaddress;
	}



	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}



	public String getUdate() {
		return udate;
	}



	public void setUdate(String udate) {
		this.udate = udate;
	}



	public User() {
	}
   
}
