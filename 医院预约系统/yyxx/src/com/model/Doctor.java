package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "doctor")  
public class Doctor {  
    /** 
     * 医生id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "did")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int did;  
      
    /** 
     *  (账户名)
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
    @Column(name = "dname", length = 50)  
    private String dname; 
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
     * 户籍
     */  
    @Column(name = "daddress", length = 50)  
    private String daddress; 
    /** 
     * 年纪
     */  
    @Column(name = "age", length = 50)  
    private String age; 
    /** 
     * 科室
     */  
    @Column(name = "catelog", length = 50)  
    private String catelog; 
    /** 
     * 级别职务
     */  
    @Column(name = "dlevel", length = 50)  
    private String dlevel; 
    /** 
     * 擅长项目
     */  
    @Column(name = "dskill", length = 150)  
    private String dskill; 
  



	public Doctor(int did, String name, String password, String dname,
			String sex, String email, int phone, String daddress, String age,
			String catelog, String dlevel, String dskill) {
		super();
		this.did = did;
		this.name = name;
		this.password = password;
		this.dname = dname;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.daddress = daddress;
		this.age = age;
		this.catelog = catelog;
		this.dlevel = dlevel;
		this.dskill = dskill;
	}




	public int getDid() {
		return did;
	}




	public void setDid(int did) {
		this.did = did;
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




	public String getDname() {
		return dname;
	}




	public void setDname(String dname) {
		this.dname = dname;
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




	public String getDaddress() {
		return daddress;
	}




	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}




	public String getAge() {
		return age;
	}




	public void setAge(String age) {
		this.age = age;
	}




	public String getCatelog() {
		return catelog;
	}




	public void setCatelog(String catelog) {
		this.catelog = catelog;
	}




	public String getDlevel() {
		return dlevel;
	}




	public void setDlevel(String dlevel) {
		this.dlevel = dlevel;
	}




	public String getDskill() {
		return dskill;
	}




	public void setDskill(String dskill) {
		this.dskill = dskill;
	}




	public Doctor() {
	}
   
}
