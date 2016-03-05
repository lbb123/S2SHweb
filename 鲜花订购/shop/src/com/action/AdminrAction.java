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

import com.model.Admin;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.util.Page;
import com.util.Results;

//管理员
public class AdminrAction extends ActionSupport {
	@Resource
	private AdminService adminService;
	private Admin admin;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	//管理员添加
	@Action(value = "adminadd", results = {
			@Result(name = "success",type="redirect", location = "/adminlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		adminService.save(admin);
		return "success";
	}

	//管理员登录
	@Action(value = "adminlogin", results = {
			@Result(name = "success", type="redirect", location = "/admin/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String login() {
			Admin queryAdmin = adminService.logins(admin);
			if (queryAdmin != null && !queryAdmin.equals("")) {
				Map session = ActionContext.getContext().getSession();
				session.put("admin", queryAdmin);
				return "success";
			} else {
				return "error";
			}
	}

	//管理员查询
	@Action(value = "adminToUpdate", results = {
			@Result(name = "success", location = "/admin/adminupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Admin query= adminService.querybyid(admin.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("admin", query);
		return "success";
	}

	//修改
	@Action(value = "adminupdate", results = {
			@Result(name = "success", type="redirect", location = "/adminlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		adminService.update(admin);
		return "success";
	}
//
	//管理员列表
	@Action(value = "adminlist", results = {
			@Result(name = "success", location = "/admin/adminlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = adminService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<Admin> adminList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("adminList", adminList);
		request.put("page", page);
		return "success";
	}

	// 管理员删除
	@Action(value = "admindelete", results = {
			@Result(name = "success", type = "redirect", location = "/adminlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		adminService.delete(admin);
		return "success";
	}
}
