package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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

import com.model.Admin;
import com.model.Goods;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
import com.service.GoodsService;
import com.util.Page;
import com.util.Results;

//物品
public class GoodsAction extends ActionSupport {
	@Resource
	private GoodsService goodsService;
	private Goods goods;
	private int currentPage;// page工具类

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	//添加
	@SuppressWarnings("deprecation")
	@Action(value = "goodsadd", results = {
			@Result(name = "success",type="redirect", location = "/goodslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String add() throws Exception {
//		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(goods.getGdate()); 
//		String now = new SimpleDateFormat("yyyy年MM月dd日").format(date);
//		goods.setGdate(now);
		goodsService.save(goods);
		return "success";
	}

	//查询
	@Action(value = "goodsToUpdate", results = {
			@Result(name = "success", location = "/admin/goodsupdate.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String querybyid() {
		Goods query= goodsService.querybyid(goods.getGid());
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goods", query);
		return "success";
	}

	//修改
	@Action(value = "goodsupdate", results = {
			@Result(name = "success", type="redirect", location = "/goodslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String update() {
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
//		String dateString = formatter.format(new Date());
		goodsService.update(goods);
		return "success";
	}
	
	//列表
	@Action(value = "goodslist", results = {
			@Result(name = "success", location = "/admin/goodslist.jsp"),
			@Result(name = "error", location = "/404.jsp") })
	public String list() {
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());// 设置当前页数
		page.setEveryPage(5);// 设置每页页数
		Results result = goodsService.list(page);
		page = result.getPage();// 获得页数对象
		List<Goods> goodsList = result.getList();// 获得列表对象
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		request.put("page", page);
		return "success";
	}

	//删除
	@Action(value = "goodsdelete", results = {
			@Result(name = "success", type = "redirect", location = "/goodslist"),
			@Result(name = "error", location = "/404.jsp") })
	public String delete() {
		goodsService.delete(goods);
		return "success";
	}
}
