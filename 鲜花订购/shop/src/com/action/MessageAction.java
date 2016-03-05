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
import com.model.Message;
import com.model.Reply;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.MessageService;
import com.util.Page;
import com.util.Results;

//留言
public class MessageAction extends ActionSupport {
	@Resource
	private MessageService messageService;
	private Message message;
	private Reply reply;
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

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	//添加
	@Action(value = "messageadd", results = {
			@Result(name = "success",type="redirect", location = "/mymessage"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		message.setMdate(dateString);
		messageService.save(message);
		return "success";
	}

	//回复查询
	@Action(value = "replylist", results = {
			@Result(name = "success", location = "/replylist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = messageService.replylist(page,message.getMid());
		page = result.getPage();// 获得页数对象
		List<Reply> replyList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("replyList", replyList);
		request.put("mid", message.getMid());
		request.put("page", page);
		return "success";
	}

	//我的留言列表
	@Action(value = "mymessage", results = {
			@Result(name = "success", location = "/messagelist.jsp"),
			@Result(name = "error", location = "/login.jsp") })
	public String messagelist() {
		Map session= ServletActionContext.getContext().getSession();
		User user = (User)session.get("user");
		try {
			if (user.getName()==null||user.getName().equals("")) {
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
		page.setEveryPage(5);// 设置每页页数
		Results result = messageService.messagelistuser(page,user.getId());
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}
	//管理列表
	@Action(value = "adminmessagelist", results = {
			@Result(name = "success", location = "/admin/messagelist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessagelist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = messageService.messagelist(page);
		page = result.getPage();// 获得页数对象
		List<Message> messageList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("messageList", messageList);
		request.put("page", page);
		return "success";
	}

	//删除
	@Action(value = "messagedelete", results = {
			@Result(name = "success", type = "redirect", location = "/mymessage"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		messageService.delete(message);
		return "success";
	}
	//删除
	@Action(value = "adminmessagedelete", results = {
			@Result(name = "success", type = "redirect", location = "/adminmessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminmessagedelete() {
		messageService.delete(message);
		return "success";
	}
	//回复查询
	@Action(value = "adminreplylist", results = {
			@Result(name = "success", location = "/admin/replylist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String adminreplylist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = messageService.replylist(page,message.getMid());
		page = result.getPage();// 获得页数对象
		List<Reply> replyList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("replyList", replyList);
		request.put("mid", message.getMid());
		request.put("page", page);
		return "success";
	}
	
	//查询留言
	@Action(value = "replyToadd", results = {
			@Result(name = "success",  location = "/admin/replyadd.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String replyToadd() {
		Message query=messageService.querymessage(message.getMid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("message", query);
		return "success";
	}
	
	//回复留言
	@Action(value = "replyadd", results = {
			@Result(name = "success", type = "redirect", location = "/adminmessagelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String replyadd() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		reply.setRdate(dateString);
		messageService.savereply(reply);
		return "success";
	}
	
	
}
