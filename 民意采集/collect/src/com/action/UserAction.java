package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Catelog;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;
import com.util.Page;
import com.util.Results;

//用户
public class UserAction extends ActionSupport {
	@Resource
	private UserService userService;
	private User user;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	// 用户添加
	@Action(value = "useradd", results = {
			@Result(name = "success", type="redirect", location = "/userlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		userService.save(user);
		return "success";
	}

	// 用户登录
	@Action(value = "userlogin", results = {
			@Result(name = "success", type="redirect", location = "/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String login() {
		try {
			User queryUser = userService.logins(user);
			if (queryUser != null && !queryUser.equals("")) {
				Map session = ActionContext.getContext().getSession();
				session.put("user", queryUser);
				return "success";
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}
	// 用户登录
	@Action(value = "useradminlogin", results = {
			@Result(name = "success", type="redirect", location = "/user/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String useradminlogin() {
		try {
			User queryUser = userService.logins(user);
			if (queryUser != null && !queryUser.equals("")) {
				Map session = ActionContext.getContext().getSession();
				session.put("user", queryUser);
				return "success";
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}

	// 用户登出
	@Action(value = "out", results = {
			@Result(name = "success",  type="redirect",location = "/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String out() {
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		session.remove("admin");
		return "success";
	}

	// 用户查询
	@Action(value = "userToUpdate", results = {
			@Result(name = "success", location = "/admin/userupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		User queryUser = userService.querybyid(user.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
		return "success";
	}

	// 用户修改
	@Action(value = "userupdate", results = {
			@Result(name = "success", location = "/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		userService.update(user);
		return "success";
	}
	// 找回的新密码修改
	@Action(value = "passwordupdate", results = {
			@Result(name = "success", location = "/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String passwordupdate() {
		User queryUser = userService.querybyid(user.getId());
		queryUser.setPassword(user.getPassword());
		userService.update(queryUser);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("nologin", "新密码修改成功");
		return "success";
	}

	// 用户列表
	@Action(value = "userlist", results = {
			@Result(name = "success", location = "/admin/userlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(6);// 设置每页页数
		Results result = userService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<User> userList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userList", userList);
		request.put("page", page);
		return "success";
	}

	// 管理员修改用户信息
	@Action(value = "auserupdate", results = {
			@Result(name = "success", type = "redirect", location = "/userlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mupdate() {
		userService.update(user);
		return "success";
	}

	// 管理员查询用户信息
	@Action(value = "adminuserToUpdate", results = {
			@Result(name = "success", location = "/admin/userupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mquerybyid() {
		User queryUser = userService.querybyid(user.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
		return "success";
	}

	// 管理员删除用户信息
	@Action(value = "userdelete", results = {
			@Result(name = "success", type = "redirect", location = "/userlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		userService.delete(user);
		return "success";
	}
	
	// ajax列表
	@Action(value = "userajaxlist")
	public void list2() throws IOException {
		List<User> userList = userService.ajaxList();// 获得列表对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(userList);
		System.out.println(json.toString());
		out.println(json.toString());
		out.flush();
		out.close();
	}
}
