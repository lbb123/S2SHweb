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
import com.model.Wuye;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.WuyeService;
import com.util.Page;
import com.util.Results;

//物业费
public class WuyeAction extends ActionSupport {
	@Resource
	private WuyeService wuyeService;
	private Wuye wuye;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public Wuye getWuye() {
		return wuye;
	}

	public void setWuye(Wuye wuye) {
		this.wuye = wuye;
	}

	//物业费添加
	@Action(value = "wuyeadd", results = {
			@Result(name = "success",type="redirect", location = "/wuyelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		wuye.setWdate(dateString);
		wuyeService.save(wuye);
		return "success";
	}
	//查询用户
	@Action(value = "wuyetoadd", results = {
			@Result(name = "success", location = "/admin/wuyeadd.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String wuyetoadd() {
		User query=wuyeService.queryuser(wuye.getUid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", query);
		return "success";
	}


	//查询
	@Action(value = "adminwuyeToUpdate", results = {
			@Result(name = "success", location = "/admin/wuyeupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		User query=wuyeService.queryuser(wuye.getUid());
		Wuye querywuye= wuyeService.querybyid(wuye.getWid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("user", query);
		request.put("wuye", querywuye);
		return "success";
	}

	//修改
	@Action(value = "adminwuyeupdate", results = {
			@Result(name = "success", type="redirect", location = "/wuyelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
		String dateString = formatter.format(new Date());
		wuye.setWdate(dateString);
		wuyeService.update(wuye);
		return "success";
	}
	//用户缴费
	@Action(value = "userwuyeupdate", results = {
			@Result(name = "success", type="redirect", location = "/mywuyelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String userwuyeupdate() {
		Wuye querywuye= wuyeService.querybyid(wuye.getWid());
		querywuye.setWtype("已缴费");
		wuyeService.update(querywuye);
		return "success";
	}
	//物业费列表
	@Action(value = "wuyelist", results = {
			@Result(name = "success", location = "/admin/wuyelist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String wuyelist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = wuyeService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<Wuye> wuyeList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("wuyeList", wuyeList);
		request.put("page", page);
		return "success";
	}
	//用户物业费列表
	@Action(value = "mywuyelist", results = {
			@Result(name = "success", location = "/wuyelist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String mywuyelist() {
		Map session = ServletActionContext.getContext().getSession();
		User user2 = (User) session.get("user");
		try {
			if (user2.getName() == null || user2.getName().equals("")) {
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
		Results result = wuyeService.userwuyelist(page,user2.getId());
		page = result.getPage();// 获得页数对象
		List<Wuye> wuyeList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("wuyeList", wuyeList);
		request.put("page", page);
		return "success";
	}

	// 删除
	@Action(value = "wuyedelete", results = {
			@Result(name = "success", type = "redirect", location = "/wuyelist"),
			@Result(name = "error", location = "/404.jsp") })
	public String wuyedelete() {
		wuyeService.delete(wuye);
		return "success";
	}
}
