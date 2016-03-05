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
import com.model.Catelog;
import com.model.Message;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.MessageService;
import com.util.Page;
import com.util.Results;

//民意
public class MessageAction extends ActionSupport {
	@Resource
	private MessageService messageService;
	private Message message;
	private Catelog catelog;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Catelog getCatelog() {
		return catelog;
	}

	public void setCatelog(Catelog catelog) {
		this.catelog = catelog;
	}

	// 添加民意
	@Action(value = "messageadd", results = {
			@Result(name = "success", type = "redirect", location = "/messagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		Catelog queryCatelog = messageService.queryCatelog(message.getCid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		message.setMdate(dateString);
		message.setMcatelog(queryCatelog.getCname());
		message.setMtype("等待上报");
		messageService.save(message);
		return "success";
	}
	// 添加民意
	@Action(value = "peoplemessageadd", results = {
			@Result(name = "success", location = "/peoplemessageadd.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String peoplemessageadd() {
		Catelog queryCatelog = messageService.queryCatelog(message.getCid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		message.setMdate(dateString);
		message.setMcatelog(queryCatelog.getCname());
		message.setMtype("等待上报");
		messageService.save(message);
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("msg", "填写完成");
		return "success";
	}

	// 我的民意列表
	@Action(value = "messagelist", results = {
			@Result(name = "success", location = "/messagelist.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String messagelist() {
		Map session = ServletActionContext.getContext().getSession();
		User user = (User) session.get("user");
		try {
			if (user.getName() == null || user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(10);// 设置每页页数
		Results result = messageService.messagelistuser(page, user.getId());
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}
	// 组合查询民意列表
	@Action(value = "queryallmessage", results = {
			@Result(name = "success", location = "/querymessagelist.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String queryallmessage() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(20);// 设置每页页数
		Results result = messageService.queryallmessage(page, message);
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		request.put("msg", "查询完成");
		return "success";
	}

	// 管理员已上报民意列表
	@Action(value = "adminmessagelist", results = {
			@Result(name = "success", location = "/admin/messagelist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessagelist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(6);// 设置每页页数
		String mtype = "已上报系统";
		Results result = messageService.messagelistmtype(page, mtype);
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}
	// 管理员已上报民意列表
	@Action(value = "allmessagelist", results = {
			@Result(name = "success", location = "/allmessagelist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String allmessagelist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(6);// 设置每页页数
		String mtype = "已采用";
		Results result = messageService.messagelistmtype(page, mtype);
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}
	
	// 填写民意前查询是否登录
	@Action(value = "querymessageadd", results = {
			@Result(name = "success", location = "/messageadd.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String querymessageadd() {
		Map session = ServletActionContext.getContext().getSession();
		User user = (User) session.get("user");
		try {
			if (user.getName() == null || user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		return "success";
	}

	// 审批民意列表
	@Action(value = "useradminmessagelist", results = {
			@Result(name = "success", location = "/user/messagelist.jsp"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String useradminmessagelist() {
		Map session = ServletActionContext.getContext().getSession();
		User user = (User) session.get("user");
		try {
			if (user.getName() == null || user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(6);// 设置每页页数
		Results result = messageService.messagelistmsendid(page, user.getId());
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}

	//民意删除
	@Action(value = "messagedelete", results = {
			@Result(name = "success", type = "redirect", location = "/mymessage"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		messageService.delete(message);
		return "success";
	}

	// 管理员删除民意
	@Action(value = "adminmessagedelete", results = {
			@Result(name = "success", type = "redirect", location = "/adminmessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessagedelete() {
		messageService.delete(message);
		return "success";
	}

	// 查询民意
	@Action(value = "messageToupdate", results = {
			@Result(name = "success", location = "/messageupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String replyToadd() {
		Message query = messageService.querymessage(message.getMid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("message", query);
		return "success";
	}

	// 管理员查询民意
	@Action(value = "adminmessagedetail", results = {
			@Result(name = "success", location = "/admin/messagedetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessagedetail() {
		Message query = messageService.querymessage(message.getMid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("message", query);
		return "success";
	}
	// 前台查询民意
	@Action(value = "allmessagedetail", results = {
			@Result(name = "success", location = "/messagedetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String allmessagedetail() {
		Message query = messageService.querymessage(message.getMid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("message", query);
		return "success";
	}

	// 审批查询民意
	@Action(value = "useradminmessagedetail", results = {
			@Result(name = "success", location = "/user/messagedetail.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String useradminmessagedetail() {
		Message query = messageService.querymessage(message.getMid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("message", query);
		return "success";
	}

	// 管理员查询民意修改
	@Action(value = "adminmessagetoupdate", results = {
			@Result(name = "success", location = "/admin/messageupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessagetoupdate() {
		Message query = messageService.querymessage(message.getMid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("message", query);
		return "success";
	}

	// 审批民意修改,采用
	@Action(value = "useradminmessagetoupdate", results = {
			@Result(name = "success", type = "redirect", location = "/useradminmessagelist"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String useradminmessagetoupdate() {
		Map session = ServletActionContext.getContext().getSession();
		User user = (User) session.get("user");
		try {
			if (user.getName() == null || user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Message query = messageService.querymessage(message.getMid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		query.setMtype("已采用");
		query.setMpifu(user.getUname());
		System.out.println(query.getMsendrole());
		if (query.getMsendrole().contains("全国政协")) {
			query.setMfenshu("6");
		}
		if (query.getMsendrole().contains("专报省委省政府相关领导")) {
			query.setMfenshu("4");
		}
		if (query.getMsendrole().contains("省级部门")) {
			query.setMfenshu("3");
		}
		if (query.getMsendrole().contains("相关部门")) {
			query.setMfenshu("2");
		}
		query.setMfenshudate(dateString);
		messageService.update(query);
		return "success";
	}

	// 审批民意修改, 不采用
	@Action(value = "useradminmessagetoupdate2", results = {
			@Result(name = "success", type = "redirect", location = "/useradminmessagelist"),
			@Result(name = "error", location = "/user/login.jsp") })
	public String useradminmessagetoupdate2() {
		Map session = ServletActionContext.getContext().getSession();
		User user = (User) session.get("user");
		try {
			if (user.getName() == null || user.getName().equals("")) {
				Map request = (Map) ActionContext.getContext().get("request");
				request.put("nologin", "您还没有登录，请登录");
				return "error";
			}
		} catch (Exception e) {
			Map request = (Map) ActionContext.getContext().get("request");
			request.put("nologin", "您还没有登录，请登录");
			return "error";
		}
		Message query = messageService.querymessage(message.getMid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		query.setMtype("拒接采用");
		query.setMpifu(user.getUname());
		System.out.println(query.getMsendrole());
		query.setMfenshu("0");
		query.setMfenshudate(dateString);
		messageService.update(query);
		return "success";
	}

	// 修改民意
	@Action(value = "messageupdate", results = {
			@Result(name = "success", type = "redirect", location = "/messagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String messageupdate() {
		Catelog queryCatelog = messageService.queryCatelog(message.getCid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		message.setMdate(dateString);
		message.setMcatelog(queryCatelog.getCname());
		message.setMtype("等待上报");
		messageService.update(message);
		return "success";
	}

	// 管理员修改民意
	@Action(value = "adminmessageupdate", results = {
			@Result(name = "success", type = "redirect", location = "/adminmessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessageupdate() {
		Catelog queryCatelog = messageService.queryCatelog(message.getCid());
		User u = messageService.queryUser(message.getMsendid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		message.setMfenshudate(dateString);
		message.setMcatelog(queryCatelog.getCname());
		message.setMsendname(u.getUname());// 上报单位名称
		message.setMsendrole(u.getUrole());// 上报当我权限
		messageService.update(message);
		return "success";
	}

	// 上报民意
	@Action(value = "shangbaoadmin", results = {
			@Result(name = "success", type = "redirect", location = "/messagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String shangbaoadmin() {
		Message query = messageService.querymessage(message.getMid());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		query.setMtype("已上报系统");
		query.setMdate(dateString);
		messageService.update(query);
		return "success";
	}

}
