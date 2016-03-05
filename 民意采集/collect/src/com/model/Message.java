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
	 * 民意建言id 必须有 无参数构造函数
	 */
	@Id
	@Column(name = "mid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mid;
	/**
	 * 民意标题
	 */
	@Column(name = "mtitle", length = 150)
	private String mtitle;
	/**
	 * 民意分类
	 */
	@Column(name = "mcatelog", length = 50)
	private String mcatelog;
	/**
	 * 民意分类id
	 */
	@Column(name = "cid", length = 50)
	private int cid;
	/**
	 * 民意原内容(上报前内容)
	 */
	@Column(name = "mcontent", length = 250)
	private String mcontent;
	/**
	 * 民意修改后内容(上报后修改的内容)
	 */
	@Column(name = "mnewcontent", length = 250)
	private String mnewcontent;
	/**
	 * 报送单位
	 */
	@Column(name = "uname", length = 50)
	private String uname;
	/**
	 * 报送单位id
	 */
	@Column(name = "uid", length = 50)
	private int uid;
	/**
	 * 紧急程度
	 */
	@Column(name = "mlevel", length = 50)
	private String mlevel;
	
	/**
	 * 信息来源
	 */
	@Column(name = "utype", length = 50)
	private String utype;
	
	/**
	 * 反映人
	 */
	@Column(name = "mauthor", length = 50)
	private String mauthor;
	/**
	 * 批复人
	 */
	@Column(name = "mpifu", length = 50)
	private String mpifu;
	/**
	 * 编辑人
	 */
	@Column(name = "mbianji", length = 50)
	private String mbianji;
	/**
	 * 备注
	 */
	@Column(name = "mbeizhu", length = 50)
	private String mbeizhu;
	/**
	 * 上报单位
	 */
	@Column(name = "msendname", length = 50)
	private String msendname;
	/**
	 * 上报单位id
	 */
	@Column(name = "msendid", length = 50)
	private int msendid;
	/**
	 * 上报单位权限//评分可用
	 */
	@Column(name = "msendrole", length = 50)
	private String msendrole;
	
	/**
	 * 处理状态/是否采纳
	 */
	@Column(name = "mtype", length = 50)
	private String mtype;

	
	/**
	 * 上报时间
	 */
	@Column(name = "mdate", length = 50)
	private String mdate;
	/**
	 * 民意评分分数
	 */
	@Column(name = "mfenshu", length = 50)
	private String mfenshu;
	/**
	 * 民意评分分数时间/采纳时间
	 */
	@Column(name = "mfenshudate", length = 50)
	private String mfenshudate;


	public int getMid() {
		return mid;
	}


	public void setMid(int mid) {
		this.mid = mid;
	}


	public String getMtitle() {
		return mtitle;
	}


	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}


	public String getMcatelog() {
		return mcatelog;
	}


	public void setMcatelog(String mcatelog) {
		this.mcatelog = mcatelog;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getMcontent() {
		return mcontent;
	}


	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}


	public String getMnewcontent() {
		return mnewcontent;
	}


	public void setMnewcontent(String mnewcontent) {
		this.mnewcontent = mnewcontent;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getMlevel() {
		return mlevel;
	}


	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}


	public String getUtype() {
		return utype;
	}


	public void setUtype(String utype) {
		this.utype = utype;
	}


	public String getMauthor() {
		return mauthor;
	}


	public void setMauthor(String mauthor) {
		this.mauthor = mauthor;
	}


	public String getMpifu() {
		return mpifu;
	}


	public void setMpifu(String mpifu) {
		this.mpifu = mpifu;
	}


	public String getMbianji() {
		return mbianji;
	}


	public void setMbianji(String mbianji) {
		this.mbianji = mbianji;
	}


	public String getMbeizhu() {
		return mbeizhu;
	}


	public void setMbeizhu(String mbeizhu) {
		this.mbeizhu = mbeizhu;
	}


	public String getMsendname() {
		return msendname;
	}


	public void setMsendname(String msendname) {
		this.msendname = msendname;
	}


	public int getMsendid() {
		return msendid;
	}


	public void setMsendid(int msendid) {
		this.msendid = msendid;
	}


	public String getMsendrole() {
		return msendrole;
	}


	public void setMsendrole(String msendrole) {
		this.msendrole = msendrole;
	}


	public String getMtype() {
		return mtype;
	}


	public void setMtype(String mtype) {
		this.mtype = mtype;
	}


	public String getMdate() {
		return mdate;
	}


	public void setMdate(String mdate) {
		this.mdate = mdate;
	}


	public String getMfenshu() {
		return mfenshu;
	}


	public void setMfenshu(String mfenshu) {
		this.mfenshu = mfenshu;
	}


	public String getMfenshudate() {
		return mfenshudate;
	}


	public void setMfenshudate(String mfenshudate) {
		this.mfenshudate = mfenshudate;
	}


	public Message(int mid, String mtitle, String mcatelog, int cid,
			String mcontent, String mnewcontent, String uname, int uid,
			String mlevel, String utype, String mauthor, String mpifu,
			String mbianji, String mbeizhu, String msendname, int msendid,
			String msendrole, String mtype, String mdate, String mfenshu,
			String mfenshudate) {
		super();
		this.mid = mid;
		this.mtitle = mtitle;
		this.mcatelog = mcatelog;
		this.cid = cid;
		this.mcontent = mcontent;
		this.mnewcontent = mnewcontent;
		this.uname = uname;
		this.uid = uid;
		this.mlevel = mlevel;
		this.utype = utype;
		this.mauthor = mauthor;
		this.mpifu = mpifu;
		this.mbianji = mbianji;
		this.mbeizhu = mbeizhu;
		this.msendname = msendname;
		this.msendid = msendid;
		this.msendrole = msendrole;
		this.mtype = mtype;
		this.mdate = mdate;
		this.mfenshu = mfenshu;
		this.mfenshudate = mfenshudate;
	}


	public Message() {
	}

}
