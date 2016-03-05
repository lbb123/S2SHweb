package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Discuss;
import com.model.Doctor;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.DoctorService;
import com.service.UserService;
import com.util.Page;
import com.util.Results;

//医生
public class DoctorAction extends ActionSupport {
	@Resource
	private DoctorService doctorService;
	private Doctor doctor;
	private Discuss discuss;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	public Discuss getDiscuss() {
		return discuss;
	}

	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}

	// 添加医生
	@Action(value = "doctoradd", results = {
			@Result(name = "success",type="redirect", location = "/doctorlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		doctorService.save(doctor);
		return "success";
	}

	// 医生登录
	@Action(value = "doctorlogin", results = {
			@Result(name = "success", type="redirect", location = "/doctor/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String login() {
		try {
			Doctor querydoctor = doctorService.logins(doctor);
			if (querydoctor != null && !querydoctor.equals("")) {
				Map session = ActionContext.getContext().getSession();
				session.put("doctor", querydoctor);
				return "success";
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}


	// 医生查询
	@Action(value = "doctordetail", results = {
			@Result(name = "success", location = "/doctor/doctorupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Doctor querydoctor = doctorService.querybyid(doctor.getDid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("doctor", querydoctor);
		return "success";
	}
	// 医生详情
	@Action(value = "discussdoctordetail", results = {
			@Result(name = "success", location = "/doctordetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String discussdoctordetail() {
		Doctor querydoctor = doctorService.querybyid(doctor.getDid());
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = doctorService.queryDiscuss(page,doctor.getDid());
		page = result.getPage();// 获得页数对象
		List<Discuss> discussList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("doctor", querydoctor);
		request.put("discussList", discussList);
		return "success";
	}

	// 医生修改
	@Action(value = "doctorupdate", results = {
			@Result(name = "success", location = "/doctor/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		doctorService.update(doctor);
		return "success";
	}

	// 医生列表
	@Action(value = "doctorlist", results = {
			@Result(name = "success", location = "/admin/doctorlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = doctorService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<Doctor> doctorList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("doctorList", doctorList);
		request.put("page", page);
		return "success";
	}
	// 前台展示医生列表
	@Action(value = "alldoctorlist", results = {
			@Result(name = "success", location = "/doctorlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String alldoctorlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(10);// 设置每页页数
		Results result = doctorService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<Doctor> doctorList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("doctorList", doctorList);
		request.put("page", page);
		return "success";
	}

	// 管理员修改医生信息
	@Action(value = "adoctorupdate", results = {
			@Result(name = "success", type = "redirect", location = "/doctorlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mupdate() {
		doctorService.update(doctor);
		return "success";
	}

	// 管理员查询医生信息
	@Action(value = "adoctorToUpdate", results = {
			@Result(name = "success", location = "/admin/doctorupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mquerybyid() {
		Doctor query = doctorService.querybyid(doctor.getDid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("doctor", query);
		return "success";
	}

	// 管理员删除医生信息
	@Action(value = "doctordelete", results = {
			@Result(name = "success", type = "redirect", location = "/doctorlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		doctorService.delete(doctor);
		return "success";
	}
	
	// 评论添加
	@Action(value = "discussadd", results = {
			@Result(name = "success",type="redirect", location = "/alldoctorlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String discussadd() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		discuss.setDdate(dateString);
		doctorService.savediscuss(discuss);
		return "success";
	}
	// 管理员评论列表
	@Action(value = "discusslist", results = {
			@Result(name = "success", location = "/admin/discusslist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String discusslist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = doctorService.queryDiscusslist(page);
		page = result.getPage();// 获得页数对象
		List<Discuss> discussList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("discussList", discussList);
		return "success";
	}
	// 管理员删除评价
	@Action(value = "discussdelete", results = {
			@Result(name = "success", type = "redirect", location = "/discusslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String discussdelete() {
		doctorService.deletediscuss(discuss);
		return "success";
	}
}
