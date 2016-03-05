package com.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import com.util.Results;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;
import com.util.Page;

public class UserAction extends ActionSupport {
	
	@Resource
	private UserService userService;
	
	private int currentPage;//page工具类
	private User user;

	
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

//	//用户注册
	@Action(value = "adduser", results = {
			@Result(name = "success1", location = "/login.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String add() {
		userService.save(user);
		return "success1";
	}
//	//管理员添加用户
	@Action(value = "madduser", results = {
			@Result(name = "success1",  type="redirect",location = "muserlist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String madd() {
		userService.save(user);
		return "success1";
	}
	
	//用户列表
	@Action(value = "userlist", results = {
			@Result(name = "success1", location = "/page/list.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String list() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =userService.Listbypage(page);
		page = result.getPage();//获得页数对象		
		List<User> userList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userList", userList);
		request.put("page", page);
		return "success1";
	}
	//用户列表
	@Action(value = "muserlist", results = {
			@Result(name = "success1", location = "/muserlist.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String listm() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());//设置当前页数
		page.setEveryPage(3);//设置每页页数	
		Results result =userService.Listbypage(page);
		page = result.getPage();//获得页数对象		
		List<User> userList= result.getList();//获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userList", userList);
		request.put("page", page);
		return "success1";
	}
	
	//用户删除
	@Action(value = "userdelete", results = {
			@Result(name = "success1", type="redirect",location = "muserlist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String delete() {
		userService.delete(user);
		
		return "success1";
	}
	//用户删除
	@Action(value = "muserdelete", results = {
			@Result(name = "success1", type="redirect",location = "muserlist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String mdelete() {
		userService.delete(user);
		return "success1";
	}
	
	
	//用户修改
	@Action(value = "muserupdate", results = {
			@Result(name = "success1", type="redirect",location = "muserlist"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String update() {
		userService.update(user);
		return "success1";
	}
	
	//用户登录
	@Action(value = "userlogin", results = {
			@Result(name = "success1",location = "/index.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String login() {
		User queryUser=userService.logins(user);
		if (queryUser != null && !queryUser.equals("")) {
			Map session = ActionContext.getContext().getSession();
			session.put("username", queryUser.getUsername());
			session.put("userId", queryUser.getUserId());
			return "success1";
		} else {
			return "error";
		}
	}
	
	//用户查询
	@Action(value = "muserToupdate", results = {
			@Result(name = "success1",location = "/muserupdate.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String query() {
		User queryUser=userService.query(user);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
			return "success1";
	}
	//用户登出
	@Action(value = "out", results = {
			@Result(name = "success1",location = "/login.jsp"),
			@Result(name = "error", location = "/page/error.jsp") })
	public String out() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		 session1.invalidate();
		return "success1";
	}
}
