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
     * 姓名
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
     * 手机号
     */  
    @Column(name = "phone", length = 50)  
    private int phone;
    /** 
     * 用户户籍
     */  
    @Column(name = "uaddress", length = 50)  
    private String uaddress; 
    /** 
     * 用户年纪
     */  
    @Column(name = "uage", length = 50)  
    private String uage; 
  


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




	public String getUage() {
		return uage;
	}



	public void setUage(String uage) {
		this.uage = uage;
	}



	public User(int id, String name, String password, String uname, String sex,
			String email, int phone, String uaddress, String uage) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.uname = uname;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.uaddress = uaddress;
		this.uage = uage;
	}



	public User() {
	}
   
}
