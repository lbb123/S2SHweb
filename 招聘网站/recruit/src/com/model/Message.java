package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity  
@Table(name = "message") 
public class Message {
	/** 
     * 简历回应id 必须有 无参数构造函数
     */  
    @Id  
    @Column(name = "id")  
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
    private int id;
    /** 
     * 简历id 
     */  
    @Column(name = "rid", length = 50)  
    private int rid;  
    /** 
     * 用户id 
     */  
    @Column(name = "uid", length = 50)  
    private int uid;  
    /** 
     * 用户名
     */  
    @Column(name = "uname", length = 50)  
    private String uname;  
    /** 
     * 公司id 
     */  
    @Column(name = "cid", length = 50)  
    private int cid;  
    /** 
     * 公司名
     */  
    @Column(name = "cname", length = 50)  
    private String cname; 
    /** 
     * 职位id 
     */  
    @Column(name = "jid", length = 50)  
    private int jid;  
    /** 
     * 职位名
     */  
    @Column(name = "jname", length = 50)  
    private String jname;
    /** 
     * 状态
     */  
    @Column(name = "mstatus", length = 50)  
    private String mstatus;
    /** 
     * 最后状态改变时间
     */  
    @Column(name = "mshijian", length = 50)  
    private String mshijian;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
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
	public String getMstatus() {
		return mstatus;
	}
	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}
	
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	
	public String getMshijian() {
		return mshijian;
	}
	public void setMshijian(String mshijian) {
		this.mshijian = mshijian;
	}
	
	
	public Message(int id, int rid, int uid, String uname, int cid,
			String cname, int jid, String jname, String mstatus, String mshijian) {
		super();
		this.id = id;
		this.rid = rid;
		this.uid = uid;
		this.uname = uname;
		this.cid = cid;
		this.cname = cname;
		this.jid = jid;
		this.jname = jname;
		this.mstatus = mstatus;
		this.mshijian = mshijian;
	}
	public Message() {
		super();
	} 
    
    

}
