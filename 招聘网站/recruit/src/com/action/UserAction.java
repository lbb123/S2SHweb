package com.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Company;
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
	private int currentPage;//page工具类
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

	//用户注册
	@Action(value = "useradd", results = {
			@Result(name = "success", location = "/user/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		userService.save(user);
		return "success";
	}
	//用户登录
	@Action(value = "userlogin", results = {
			@Result(name = "success",location = "/user/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String login() {
		try {
			User queryUser=userService.logins(user);
			if (queryUser != null && !queryUser.equals("")) {
				Map session = ActionContext.getContext().getSession();
				session.put("username", queryUser.getName());
				session.put("userId", queryUser.getId());
				return "success";
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}
	//用户登出
	@Action(value = "out", results = {
			@Result(name = "success",location = "/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String out() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		 session1.invalidate();
		return "success";
	}
	
	//用户查询
	@Action(value = "userToUpdate", results = {
			@Result(name = "success",location = "/user/update.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		User queryUser=userService.querybyid(user.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
		return "success";
	}
	
	//用户修改
	@Action(value = "userupdate", results = {
			@Result(name = "success",location = "/user/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		userService.update(user);
		return "success";
	}
	//用户列表
	@Action(value = "muserlist", results = {
			@Result(name = "success",location = "/manager/userlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =userService.companylist(page);
		page = result.getPage();//获得页数对象		
		List<User> userList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userList", userList);
		request.put("page", page);
		return "success";
	}
	//管理员修改
	@Action(value = "muserupdate", results = {
			@Result(name = "success",type="redirect",location = "/muserlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mupdate() {
		userService.update(user);
		return "success";
	}
	//管理员查询
	@Action(value = "muserToUpdate", results = {
			@Result(name = "success",location = "/manager/userupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mquerybyid() {
		User queryUser=userService.querybyid(user.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
		return "success";
	}
	//管理员删除
	@Action(value = "muserdelete", results = {
			@Result(name = "success", type="redirect",location = "/muserlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		userService.delete(user);
		return "success";
	}
}
