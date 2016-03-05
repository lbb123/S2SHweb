package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "company")  
public class Company {
	 /** 
     * 企业id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "id")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;  
      
    /** 
     * 企业账户名 
     */  
    @Column(name = "name", length = 50)  
    private String name; 
    /** 
     * 企业登录密码 
     */  
    @Column(name = "password", length = 50)  
    private String password;  
    /** 
     * 企业名称
     */  
    @Column(name = "companyname", length = 50)  
    private String companyname; 
    /** 
     * 企业电话
     */  
    @Column(name = "phone", length = 50)  
    private String phone;
    /** 
     * 企业邮箱
     */  
    @Column(name = "email", length = 50)  
    private String email;
    /** 
     * 企业简介
     */  
    @Column(name = "introduction", length = 250)  
    private String introduction;
    
    /** 
     * 企业地址
     */  
    @Column(name = "address", length = 250)  
    private String address;
    
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
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public Company(int id, String name, String password, String companyname,
			String phone, String email, String introduction, String address) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.companyname = companyname;
		this.phone = phone;
		this.email = email;
		this.introduction = introduction;
		this.address = address;
	}
	public Company() {
		super();
	}
  

}
