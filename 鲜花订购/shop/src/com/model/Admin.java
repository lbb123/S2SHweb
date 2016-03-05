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
     * 管理员用户id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "id")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;  
      
    /** 
     * 管理员用户名 (账户名)
     */  
    @Column(name = "name", length = 50)  
    private String name;  
      
    /** 
     * 管理员用户登录密码 
     */  
    @Column(name = "password", length = 50)  
    private String password;  
    /** 
     * 管理员类型0默认管理员1添加的管理员
     */  
    @Column(name = "atype", length = 50)  
    private int atype; 



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



	public int getAtype() {
		return atype;
	}



	public void setAtype(int atype) {
		this.atype = atype;
	}



	public Admin(int id, String name, String password, int atype) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.atype = atype;
	}



	public Admin() {
	}
   
}
