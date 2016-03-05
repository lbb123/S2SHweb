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
    @Column(name = "userId")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int userId;  
      
    /** 
     * 用户名 
     */  
    @Column(name = "username", length = 50)  
    private String username;  
      
    /** 
     * 用户登录密码 
     */  
    @Column(name = "password", length = 50)  
    private String password;  
  
      
    public int getUserId() {  
        return userId;  
    }  
  
    public void setUserId(int userId) {  
        this.userId = userId;  
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User(int userId, String username, String password) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
	}  
	public User() {
	}
   
}
