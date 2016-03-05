package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "resume") 
public class Resume {
	 /** 
     * 简历id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "id")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;
    /** 
     * 简历名 
     */  
    @Column(name = "name", length = 50)  
    private String name;  
    
    /** 
     * 姓名 
     */  
    @Column(name = "username", length = 50)  
    private String username; 
    /** 
     * 姓别 
     */  
    @Column(name = "sex", length = 50)  
    private String sex; 
    /** 
     * 出生年月
     */  
    @Column(name = "birthday", length = 50)  
    private String birthday; 
    /** 
     * 现居地
     */  
    @Column(name = "address", length = 50)  
    private String address; 
    /** 
     * 手机
     */  
    @Column(name = "phone", length = 50)  
    private String phone; 
    /** 
     * 邮箱
     */  
    @Column(name = "email", length = 50)  
    private String email; 
    /** 
     * 学历
     */  
    @Column(name = "education", length = 50)  
    private String education; 
    /** 
     * 期望的工作
     */  
    @Column(name = "jobwant", length = 250)  
    private String jobwant; 
    /** 
     * 工作经历
     */  
    @Column(name = "experience", length = 550)  
    private String experience;
    /** 
     * 创建的用户id
     */  
    @Column(name = "uid", length = 50)  
    private int uid; 
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getJobwant() {
		return jobwant;
	}
	public void setJobwant(String jobwant) {
		this.jobwant = jobwant;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public Resume(int id, String name, String username, String sex,
			String birthday, String address, String phone, String email,
			String education, String jobwant, String experience, int uid) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.sex = sex;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.education = education;
		this.jobwant = jobwant;
		this.experience = experience;
		this.uid = uid;
	}
	public Resume() {
		super();
	} 

}
