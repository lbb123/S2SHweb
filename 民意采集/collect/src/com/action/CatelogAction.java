package com.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.model.Catelog;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.CatelogService;
import com.util.Page;
import com.util.Results;

//目录类别
public class CatelogAction extends ActionSupport {
	@Resource
	private CatelogService catelogService;
	private Catelog catelog;
	private int currentPage;// page工具类


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public Catelog getCatelog() {
		return catelog;
	}

	public void setCatelog(Catelog catelog) {
		this.catelog = catelog;
	}



	//添加
	@Action(value = "catelogadd", results = {
			@Result(name = "success",type="redirect", location = "/cateloglist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() {
		catelogService.save(catelog);
		return "success";
	}

	//查询
	@Action(value = "catelogToUpdate", results = {
			@Result(name = "success", location = "/admin/catelogupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Catelog query= catelogService.querybyid(catelog.getCid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("catelog", query);
		return "success";
	}

	//修改
	@Action(value = "catelogupdate", results = {
			@Result(name = "success", type="redirect", location = "/cateloglist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
		catelogService.update(catelog);
		return "success";
	}
//
	//列表
	@Action(value = "cateloglist", results = {
			@Result(name = "success", location = "/admin/cateloglist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String cateloglist() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(6);// 设置每页页数
		Results result = catelogService.companylist(page);
		page = result.getPage();// 获得页数对象
		List<Catelog> catelogList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("catelogList", catelogList);
		request.put("page", page);
		return "success";
	}

	//删除
	@Action(value = "catelogdelete", results = {
			@Result(name = "success", type = "redirect", location = "/cateloglist"),
			@Result(name = "error", location = "/404.jsp") })
	public String muserdelete() {
		catelogService.delete(catelog);
		return "success";
	}
	// ajax列表
	@Action(value = "catelogajaxlist")
	public void list2() throws IOException {
		List<Catelog> catelogList = catelogService.List();// 获得列表对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONArray json = JSONArray.fromObject(catelogList);
		System.out.println(json.toString());
		out.println(json.toString());
		out.flush();
		out.close();
	}
}
