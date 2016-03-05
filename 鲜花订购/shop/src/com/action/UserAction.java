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

import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;
import com.util.Cart;
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

	// 用户注册
	@Action(value = "useradd", results = {
			@Result(name = "success", location = "/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		user.setUdate(dateString);
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
				 Cart cart=new Cart();
				 session.put("cart", cart);
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
			@Result(name = "success", location = "/index.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String out() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = request.getSession();
		session1.invalidate();
//		Map session= ServletActionContext.getContext().getSession();
//		session.remove("user");
		return "success";
	}

	// 用户查询
	@Action(value = "userToUpdate", results = {
			@Result(name = "success", location = "/user/update.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		User queryUser = userService.querybyid(user.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
		return "success";
	}
	// 用户密码找回
	@Action(value = "passwordquery", results = {
			@Result(name = "success", location = "/passwordupdate.jsp"),
			@Result(name = "error", location = "/password.jsp") })
	public String passwordquery() {
		Map request = (Map) ActionContext.getContext().get("request");
		try {
			User queryUser = userService.passwordquery(user.getName(),user.getEmail());
			if (queryUser != null && !queryUser.equals("")) {
				request.put("user", queryUser);
				return "success";
			} else {
				request.put("error", "账户或邮箱错误");
				return "error";
			}
		} catch (Exception e) {
			request.put("error", "账户或邮箱错误");
			return "error";
		}
	}

	// 用户修改
	@Action(value = "userupdate", results = {
			@Result(name = "success", location = "/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		user.setUdate(dateString);
		userService.update(user);
		return "success";
	}
	// 找回的新密码修改
	@Action(value = "passwordupdate", results = {
			@Result(name = "success", location = "/login.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String passwordupdate() {
		User queryUser = userService.querybyid(user.getId());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		queryUser.setUdate(dateString);
		queryUser.setPassword(user.getPassword());
		userService.update(queryUser);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("nologin", "新密码修改成功");
		return "success";
	}

	// 用户列表
	@Action(value = "muserlist", results = {
			@Result(name = "success", location = "/manager/userlist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserlist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(3);// 设置每页页数
		Results result = userService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<User> userList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("userList", userList);
		request.put("page", page);
		return "success";
	}

	// 管理员修改
	@Action(value = "muserupdate", results = {
			@Result(name = "success", type = "redirect", location = "/muserlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String mupdate() {
		userService.update(user);
		return "success";
	}

	// 管理员查询
	@Action(value = "muserToUpdate", results = {
			@Result(name = "success", location = "/manager/userupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mquerybyid() {
		User queryUser = userService.querybyid(user.getId());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", queryUser);
		return "success";
	}

	// 管理员删除
	@Action(value = "muserdelete", results = {
			@Result(name = "success", type = "redirect", location = "/muserlist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		userService.delete(user);
		return "success";
	}
}
