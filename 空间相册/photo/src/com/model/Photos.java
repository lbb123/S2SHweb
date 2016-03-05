package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name = "Photos")  
public class Photos {  
    /** 
     * 相册id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "id")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;  
      
    /** 
     * 相册名
     */  
    @Column(name = "name", length = 50)  
    private String name;  
      
    /** 
     * 照片个数
     */  
    @Column(name = "num", length = 50)  
    private int  num;  
    
    /** 
     * 创建相册者
     */  
    @Column(name = "userId", length = 50)  
    private int  userId; 
  
    /** 
     * 最近上传
     */  
    @Column(name = "lastimage", length = 50)  
    private String lastimage;  
      
  
	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
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



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}







	public String getLastimage() {
		return lastimage;
	}



	public void setLastimage(String lastimage) {
		this.lastimage = lastimage;
	}





	public Photos(int id, String name, int num, int userId, String lastimage) {
		super();
		this.id = id;
		this.name = name;
		this.num = num;
		this.userId = userId;
		this.lastimage = lastimage;
	}



	public Photos() {
	}
   
}
