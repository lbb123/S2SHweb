package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "job")  
public class Job {
    /** 
     * 职位id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "id")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;  
    /** 
     * 职位名 
     */  
    @Column(name = "name", length = 50)  
    private String name;  
    /** 
     * 需求人数 
     */  
    @Column(name = "num", length = 50)  
    private int num;  
    /** 
     * 要求 
     */  
    @Column(name = "yaoqiu", length = 250)  
    private String require; 
    /** 
     * 工作地址
     */  
    @Column(name = "address", length = 250)  
    private String address; 
    /** 
     * 薪资
     */  
    @Column(name = "xinzi", length = 50)  
    private String salary;
    
    /** 
     * 发布日期
     */  
    @Column(name = "riqi", length = 50)  
    private String sendtime;
    /** 
     * 发布者公司id
     */  
    @Column(name = "cid", length = 50)  
    private int cid;
    /** 
     * 发布者公司名称
     */  
    @Column(name = "cname", length = 50)  
    private String cname;
    
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRequire() {
		return require;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	
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
	public Job() {
		super();
	}
	public Job(int id, String name, int num, String require, String address,
			String salary, String sendtime, int cid, String cname) {
		super();
		this.id = id;
		this.name = name;
		this.num = num;
		this.require = require;
		this.address = address;
		this.salary = salary;
		this.sendtime = sendtime;
		this.cid = cid;
		this.cname = cname;
	}
	
}
